Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id C9AE16010E;
	Sun, 25 Aug 2013 15:09:32 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id up15so2484917pbc.12
	for <multiple recipients>; Sun, 25 Aug 2013 08:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Czm5FAmM+VjeKWd33nQh9nGVMx0sU3w+MFio3LfwLaA=;
	b=tWSHin6wDepwH6zrucN6STyAOMz8BcdgWc5FuBmbjS06RpUP+6NoRBlKqo8Lwye/hQ
	CqdAwxTrw1xamF7JMqxrdqCQ/bnKYnSkwo5eWzexlJHH7Frgqoih1M+sHoDc3xl4HOxz
	gZCdvlHEGEgwnFXp2to+rXZksdxUuvHfCpfWdFggZW6FIhHKlcDUb+DNDS4STTqdSKBQ
	4JtnjTZWzWH05R4AMOBiwXjh+pwyLSsxog/R48BsM+XDzAGQOeC7ToTFWJwd+Ss7D2Rc
	hIy7gB5Ox1pVOH+5pa52GZSVIjSsMlcS6slV8pM7L0eKzB7TqZTLaGBeeaxbLWW3gEF/
	v+dQ==
X-Received: by 10.66.254.136 with SMTP id ai8mr9837097pad.86.1377443373124;
	Sun, 25 Aug 2013 08:09:33 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id
	in2sm12367378pbc.37.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 25 Aug 2013 08:09:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <20130825144411.GI3544@jama>
Date: Sun, 25 Aug 2013 19:09:24 +0400
Message-Id: <81FE6495-27A0-4DDE-B626-CC8267E802A1@gmail.com>
References: <8683DB7C-B756-4E61-B5EF-856E288139C4@gmail.com>
	<20130825144411.GI3544@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1498)
Cc: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Aug 2013 15:09:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Martin,

On Aug 25, 2013, at 6:44 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

>> I find that the kernel panics upon boot.=20

Thanks! Any idea why the qemu with hard float configuration has a kernel =
panic with linux-yocto?

Elvis Dowson=

