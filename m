Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id D37F56010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 18:06:11 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so88060251pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 10:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Vs6A7lXCrSJRDF71E7dpKu8WVN+Sse71KIgdDw/Mc80=;
	b=UzI+diMAGX/XmN8bcQ7JZWaLxL0WjNVoNLZhm1dNStbm6iBudEeglVNw8k6SR15w+S
	++jvznd8edqMxt8iTaNGmc3qMzCngTM8hTgROBFKkVWhAO+Or1O14wOEaJnERVD7yKkQ
	8JNB4J9suWHe3Tnfl1/zUpK7MEHQzHEi7XMfg4KyBKyYH9aY8dZynRlHZBwj9B/cJvy8
	VVEBrfL+Mx8bMAG9n5H+PFnhxRdYeqAmbNlo2GfZDad1I1wHquDJFRx8hqStnKb5je8L
	S7VkUMaU0VheCA+mhQuRf1F2bVxOG8ypIJZsOHiB8QPeIgyM0Bs/mQ1c7ADBGWS/4XVA
	nXxg==
X-Received: by 10.67.14.201 with SMTP id fi9mr12538524pad.41.1447956372414;
	Thu, 19 Nov 2015 10:06:12 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:122:73e2:d7b:d0af?
	([2601:646:8802:5d5c:122:73e2:d7b:d0af])
	by smtp.gmail.com with ESMTPSA id
	ag1sm12006170pbc.41.2015.11.19.10.06.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Nov 2015 10:06:10 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1447954750.1472.88.camel@pbcl.net>
Date: Thu, 19 Nov 2015 10:06:06 -0800
Message-Id: <F52E45F1-3AC3-4E59-B635-9215F5BAC9AB@gmail.com>
References: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
	<a84d885d2235edef7159fffa522fe0f41a6d623e.1447952784.git.raj.khem@gmail.com>
	<1447954750.1472.88.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/13] gdb: Fix build with musl
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
X-List-Received-Date: Thu, 19 Nov 2015 18:06:15 -0000
X-Groupsio-MsgNum: 73704
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2C39E6B4-07FA-4C89-A6C3-232309463EFC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2C39E6B4-07FA-4C89-A6C3-232309463EFC
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On Nov 19, 2015, at 9:39 AM, Phil Blundell <pb@pbcl.net> wrote:
> 
> On Thu, 2015-11-19 at 17:10 +0000, Khem Raj wrote:
>> This is a patch that has been submitted upstream as well
> 
> Shouldn't it have an Upstream-Status header saying that?

Yes it should. I will add it and push it to pu branch

> 
> p.
> 
>> 
> index 0000000..1302330
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of
>> -SIGRTMIN.patch
>> @@ -0,0 +1,52 @@
>> +From 2f97e89e9e4e5797d0d973e1d05c1f44c46b4912 Mon Sep 17 00:00:00
>> 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Fri, 5 Jun 2015 20:21:38 -0700
>> +Subject: [PATCH] Use exorted definitions of SIGRTMIN
>> +
>> +Define W_STOPCODE if not defined already
>> +
>> +__SIGRTMIN is internal to glibc and other libcs e.g. musl
>> +may not provide them
>> +
>> +Fixes
>> +https://sourceware.org/bugzilla/show_bug.cgi?id=13012
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> 
> 


--Apple-Mail=_2C39E6B4-07FA-4C89-A6C3-232309463EFC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZOD5EACgkQuwUzVZGdMxQoIQCeOLXQjS+Y4TQ0hYmdBJwZGT3r
YjAAn1/9oLJFmDS6+oXCEINxKwsn4Rbb
=Rp+r
-----END PGP SIGNATURE-----

--Apple-Mail=_2C39E6B4-07FA-4C89-A6C3-232309463EFC--
