Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UaM0H-00047v-Vh
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 10:15:06 +0200
Received: by mail-pa0-f53.google.com with SMTP id kq12so1937409pab.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 00:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=1iMDJZM/MaslKOuc/jYYxzPOOb+rDV6kGJ8WxU3eoL8=;
	b=wGYFtS1xBd1kXAp0kzTqssS2R/ZxH8KLIUV1yaB0TF/Wb8mMmX8O9ZmRU8PONSSz+L
	AUrp2Y/oG7vOzGjh4V/XVYs4tVRXSG8/M1nsK32i48WaSafYoi9f7ht7vncJdWRRkAiN
	60CDCN9UxR2NeyFNGysWz+tzPNMyA48cU5afQ4pPQ1cqeK848W4698fSCTTIienolNb6
	mfqbvtrKZWEACg4edBlqDKxR5jxVUUui/c4H5LY4bhzz4HXpWbOO5KWKSbgljpXnfdyv
	/MlCr/wBslWS7K52iQ3seLZp3QIflb92JkC1syUqPs1H6XPtaS5Vh8mtzkejzUS+NeQY
	kgtg==
X-Received: by 10.68.164.163 with SMTP id yr3mr11182759pbb.27.1368086221883;
	Thu, 09 May 2013 00:57:01 -0700 (PDT)
Received: from stafford-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id aa8sm2627583pad.14.2013.05.09.00.56.59
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 May 2013 00:56:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1368085353.27116.95.camel@ted>
Date: Thu, 9 May 2013 00:56:57 -0700
Message-Id: <BA2EEF61-5CC9-479F-8E0B-19BD08C9A6C2@gmail.com>
References: <1368013438-15107-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1368013438-15107-3-git-send-email-marcin.juszkiewicz@linaro.org>
	<57346B3A-FB30-46F4-8160-CDC69F206243@gmail.com>
	<1368085353.27116.95.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] gdb: move checksums to versioned include
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
X-List-Received-Date: Thu, 09 May 2013 08:15:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 9, 2013, at 12:42 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> In principle they do belong in the .bb file rather than the
> general .inc/. People can then do things in other layers if desired.
>=20

yes true=


