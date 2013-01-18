Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TwFix-0006Iz-Pv
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 18:27:41 +0100
Received: by mail-da0-f43.google.com with SMTP id u36so1704749dak.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 09:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=ScnvCdZyxv21iqADlaYHVgvQayrchxz2Ks0OqIqo4y0=;
	b=BZHHcYvddGzdONRy1P0Iv4LW2J6AMygbAv2NJNKqj7jjliAR0qNQzRY/+e4EB2ipPN
	jc7Vkqo4mBEOR0IahJzPvTPD4Ra7b/MVIGqDcKURSfVAsaYpx/xor0B2wFCLEw5prhr6
	zAw/PBTYyBtcJkfv+w40gYh1M4pBmUcy5/81Q+CJtcrAcU6URvEdW3sXKXOZuV0R6qNa
	elJGMyO8hcpEZypfA3l2zchIVcrNmyVwfgVb/O9IQq3qiGDlJ+n0py62NnaPtOcrzi09
	BsCp4MTWbTTm58dpuadh/9L+Rp7PXWsCUVmcKSL7/xNTuRfE/guied14BKTdia3nzQO2
	gFww==
X-Received: by 10.68.224.227 with SMTP id rf3mr7303256pbc.108.1358529122324;
	Fri, 18 Jan 2013 09:12:02 -0800 (PST)
Received: from [172.23.9.30] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id jo6sm3410287pbb.5.2013.01.18.09.12.01
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 09:12:01 -0800 (PST)
Message-ID: <50F98260.40501@gmail.com>
Date: Fri, 18 Jan 2013 09:12:00 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1358345647-13274-1-git-send-email-giuseppe.condorelli@st.com>
In-Reply-To: <1358345647-13274-1-git-send-email-giuseppe.condorelli@st.com>
X-Enigmail-Version: 1.5
Subject: Re: [PATCH] eglibc: fix as and ld check in libc dir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2013 17:27:43 -0000
X-List-Received-Date: Fri, 18 Jan 2013 17:27:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01/16/2013 06:14 AM, Giuseppe CONDORELLI wrote:
> Fix routine to check as and ld version check in the configure, to
> allow system to correctly check for version 2.1x.

Giuseppe

This demotion of letting older binutils will not be accepted since
there is reason to demand 2.20 minimum see

http://sourceware.org/ml/libc-alpha/2012-02/msg00605.html

Now you might have backported needed functionality into your local
copy of binutils but having this patch local to your layer is best
approach here.

- -Khem




-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlD5gmAACgkQuwUzVZGdMxQrBQCggIutiKGvZYlfQimMO+2gEu6S
ZcUAnjQynyJrIQTfIJWw/Jqt7ZyzJ0Xl
=7E9N
-----END PGP SIGNATURE-----


