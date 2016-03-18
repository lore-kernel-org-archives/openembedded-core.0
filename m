Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 05D9F6FF97
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 01:02:05 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id n5so143285779pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 18:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=AVUYOtvxd3yyH8jpt60DIRJ7J0a/8kZSQoTYDhfmEck=;
	b=i6GAP1eACRqO56f0zoSvLiL38WS56rACK+txJVvUmVON8awqJnXMsHA8gVfdhPg2+6
	u4jKDbC9a2thXzUoOkuJ1V2uTsrHhBhqOZxlfIFcMUu4g53Hb8zrpVzha4UqqUuydiA6
	uLP4O4X2mDxHYhJut9oAkng+oOqm5FlMe78x4rpKsvQ5XtDA/ifF2qeG8YO8ed+sFhLv
	64kjZ0WFCPfrRcrMNTsku/Fb9vaYCcpz8ZmNmlmt0CqvFVumgeOcgv2+fMhu0Nw4Dyha
	5qCsEjjMffqrwRPALfF5y+XK47fBHzZZumYUmiHTAxvdUm8JPtlBMJUBTU7GBZG+m9qV
	x/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=AVUYOtvxd3yyH8jpt60DIRJ7J0a/8kZSQoTYDhfmEck=;
	b=jDkXl1KAWYlbTxqeiaBSNcpcGRilB5/ttOFGmVYvUiivGnao05tthfDKMl5KbhRwcs
	vNG0UdIKunI3Z2xVUBiyWgfSzPhu/DE4+DE9sMeN/TEYed5NcPNLMdKBq6Ec/7DxLN5g
	jfwq6Vgjx0eA2oRi2WMn3l5z22yRfc81pJbvWsoRMUs7tkITPCSfZGQ0T278r57OlKHd
	EUUj/lIhDtlaKCnfcAtgiYQUyokxcGV9w5ZHhSYvo9EjzVh3fFacO6ukAXFxcRbyuAXA
	l3W1vWOD4V778g3nHmcN6c8U2mFHGy8TbcPhloq3CuvlS8AGker/n6Ng6DFSys1xy6o/
	EP3g==
X-Gm-Message-State: AD7BkJK6YeT5rC5SURNkMBLyntM4QDh02I2PucXZ1Xn9o7bW7JLYE+A6E4rMPNGrFCiJcA==
X-Received: by 10.98.44.70 with SMTP id s67mr7105243pfs.59.1458262926291;
	Thu, 17 Mar 2016 18:02:06 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:7c39:5b21:5bbc:5fa7?
	([2601:646:8800:5a9a:7c39:5b21:5bbc:5fa7])
	by smtp.gmail.com with ESMTPSA id
	r68sm16134017pfa.33.2016.03.17.18.02.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2016 18:02:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1456777067.11498.180.camel@linuxfoundation.org>
Date: Thu, 17 Mar 2016 18:01:54 -0700
Message-Id: <0F4B30B5-F34E-46E7-83F5-19BEED9455CD@gmail.com>
References: <1456757580-31669-1-git-send-email-adrian.ratiu@ni.com>
	<1456777067.11498.180.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] site: enable pthread support for x86_64 APR builds
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
X-List-Received-Date: Fri, 18 Mar 2016 01:02:07 -0000
X-Groupsio-MsgNum: 79766
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C3E2B685-51D9-4D69-A33A-D16A4A64FF83";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C3E2B685-51D9-4D69-A33A-D16A4A64FF83
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Feb 29, 2016, at 12:17 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Mon, 2016-02-29 at 16:53 +0200, Ioan-Adrian Ratiu wrote:
>> The apache2 package is missing key pieces of pthread support (notably
>> pthread_kill) on x86_64 platforms. Fix this by setting cached
>> variable
>> apr_cv_pthreads_cflags=3D-pthread which will trickle down into =
apache2
>> as
>> well. powerpc32-linux currently sets this option.
>>=20
>> Suggested-by: Jacob Champion <jacob.champion@ni.com>
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> ---
>> meta/site/x86_64-linux | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
>> index 573a907..5b37211 100644
>> --- a/meta/site/x86_64-linux
>> +++ b/meta/site/x86_64-linux
>> @@ -104,6 +104,7 @@
>> nfsd_cv_func_statfs=3D${nfsd_cv_func_statfs=3Dstatfs2_bsize}
>> nfsd_cv_bsd_signals=3D${nfsd_cv_bsd_signals=3Dyes}
>>=20
>> #apr
>> +apr_cv_pthreads_cflags=3D${apr_cv_pthreads_cflags=3D-pthread}
>> apr_cv_tcp_nodelay_with_cork=3D${apr_cv_tcp_nodelay_with_cork=3Dyes}
>=20
> Autobuilder doesn't look happy after this change:
>=20
> =
https://autobuilder.yoctoproject.org/main/builders/build-appliance/buil
> ds/662/steps/BuildImages_1/logs/stdio
>=20
> This was the only change to apr in there so its looking like the most
> likely suspect=E2=80=A6


IMO caching config variables in site files should only be applied to
target packages.

>=20
> Cheers,
>=20
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_C3E2B685-51D9-4D69-A33A-D16A4A64FF83
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlbrU4sACgkQuwUzVZGdMxQ6NwCfT5gDp8AXE5FFLIfv3ZwpHN7n
TWgAnjCqnBS6wctqE32dFHRZGt0m0EHP
=tw3o
-----END PGP SIGNATURE-----

--Apple-Mail=_C3E2B685-51D9-4D69-A33A-D16A4A64FF83--
