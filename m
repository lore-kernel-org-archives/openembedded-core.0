Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 10A8176E5E;
	Mon, 14 May 2018 17:09:40 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l1-v6so16640525wmb.2;
	Mon, 14 May 2018 10:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=j1KCL2B6FQbL37mGUpJxZM9aiR2CPb+RWGRJHxITWTg=;
	b=jtkCv17YMsjagUHLodPo9hH4opDoptrigzlavO4Y7ce7ZxChVyeNTSxsy2mnJFhxIF
	2SMKOkYonKHi3XoKLy6Pqx6qa7dZNBSHRjxmsP1bz9j6wh+LdTn4o7mQH39ay0Od+S0T
	Zarw2/3vaLpZfIfJ9Tspekp+snj+eyLcmwcmOHyFgBwuDFLc9lATYdEOQiYD1aGzBjHt
	DjuHYWFffycJiK27K7aHzXFqs+HERax3SNZZLSnZG70yxxB9kMbYOoGdjspwibY4ic1I
	UucmeG/nIWxq8rl1nU+3DzEPB0MmlpLnxk6+/EAvbjX73q9n3snmi9aSS31vI9bHp04b
	xyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=j1KCL2B6FQbL37mGUpJxZM9aiR2CPb+RWGRJHxITWTg=;
	b=pC14aavVU/8EvZqRGGsNQVeRzJijrdj5i8sQa20itcDFz01SLdzif/BTvmzfkWAh2B
	jBkFbKkyBV3/llw4bS4ObhgR0eE8bNMPTLxsZrUq29n0m/63r6dhWSvOEFa09uSdAbXY
	/t/uqx9PFaVo1beAod+Hkyb40RZ2T3yryoNi7i/M5rMACytv3ooM1+P2WE3j084Y8d2C
	KLKfNo1tpRrsPJCBVkDMhh0CaO3NjV1ht68hSGzwJWXItPPYc5IAIurgciy//tV1QFTe
	5yk1zNzLTAnosrLNKOEi3O9hdeqHMgThp83IQRTOgVeLwk05rAylYxjZHLQSUZdy7Je4
	oLfg==
X-Gm-Message-State: ALKqPwehCE7Zmb52n9OjvLMAo8HBP5uc9dTxE7hbRCoit92txiOSdDye
	RdFr9sF71YYztR87wpZug2g=
X-Google-Smtp-Source: AB8JxZq1oUZVKulmFloXunTa+AOHfnDdpg3s/V5s9oOyuHxOUUFvwL0aSPoulOSA32wgVDCaAUBsJQ==
X-Received: by 2002:a1c:8d8a:: with SMTP id
	p132-v6mr5604703wmd.49.1526317781464; 
	Mon, 14 May 2018 10:09:41 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	f6-v6sm12314398wrj.66.2018.05.14.10.09.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 14 May 2018 10:09:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 14 May 2018 19:09:41 +0200
To: Dan McGregor <danismostlikely@gmail.com>
Message-ID: <20180514170941.GC2840@jama>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CACS+7ZR6F1PgKxQxxh=iJzTQNmrrMVOQ01EuhcnotSAhB=AiEA@mail.gmail.com>
	<1ceb098b-1836-4693-d03f-8801ac354c25@gmail.com>
	<CACS+7ZRs_zB_c-Wg8K=JEtWyHH7DG-W8ER4Ky1Yg6v1C8xtsyw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACS+7ZRs_zB_c-Wg8K=JEtWyHH7DG-W8ER4Ky1Yg6v1C8xtsyw@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: Yocto Project <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [RFT] GCC 8.1
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
X-List-Received-Date: Mon, 14 May 2018 17:09:41 -0000
X-Groupsio-MsgNum: 111360
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ALfTUftag+2gvp1h"
Content-Disposition: inline

--ALfTUftag+2gvp1h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 14, 2018 at 10:33:41AM -0600, Dan McGregor wrote:
> On 10 May 2018 at 12:53, Khem Raj <raj.khem@gmail.com> wrote:
> > Hi Dan,
> >
> > Thanks for testing
> >
> > On 5/10/18 7:34 AM, Dan McGregor wrote:
> >>
> >> On 4 May 2018 at 18:26, Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>> Hi All
> >>>
> >>> As you might have noticed that gcc 8.1 was released this week, I am
> >>> calling out for some testing help on testing branch so we can weed out
> >>> issues you might see in your setups. so if you have your
> >>> builders idling over weekend, then you know what they can do this wee=
kend
> >>> :)
> >>>
> >>
> >> Thanks for this. The only two issues I noticed are that the
> >> Wandboard's kernel doesn't compile with gcc 8.1,
> >
> >
> >
> > what errors do you see ?
>=20
> I expect the standard "Linux 4.1" errors. A bunch of ignored
> attributes and incompatible type aliases:
>=20
> tmp-glibc/work-shared/wandboard/kernel-source/include/linux/log2.h:22:1:
> warning: ignoring attribute 'noreturn' because it conflicts with
> attribute 'const' [-Wattributes]
>  int ____ilog2_NaN(void)

Try backporting this change:
https://github.com/torvalds/linux/commit/474c90156c8dcc2fa815e6716cc9394d79=
30cb9c

> tmp-glibc/work-shared/wandboard/kernel-source/include/linux/syscalls.h:19=
5:18:
> warning: 'sys_clone' alias between functions of incompatible types
> 'long int(long unsigned int,  long unsigned int,  int *, int,  int *)'
> and 'long int(long int,  long int,  long int,  long int,  long int)'
> [-Wattribute-alias]
>   asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)) \
>=20
> I can give you the full compile log if you'd like, but I think others
> want it kept off the list.
>=20
> >
> >  and gcc-sanitizers
> >>
> >> now throws a packaging error on (at least) x86_64.
> >> ${libdir}/liblsan_preinit.o is a new file that should go into
> >> liblsan-dev.
> >
> >
> > That seems to be the case, I wonder why my world build for qemux86_64 d=
id
> > not find this error. I would like to reproduce this and the fix is then
> > simple.
>=20
> My x86_64 build was multilib enabled. I doubt that had anything to do
> with it, but I suppose it's possible.
>=20
> >
> >
> >>
> >>> Highlighted changes are
> >>>
> >>> https://gcc.gnu.org/gcc-8/changes.html
> >>>
> >>> and porting doc is
> >>>
> >>> https://gcc.gnu.org/gcc-8/porting_to.html
> >>>
> >>> The branch is here
> >>>
> >>> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/g=
cc-8
> >>>
> >>> Its uptodate on top of current master oe-core
> >>>
> >>> May fourth be with you !!
> >>>
> >>> Cheers!
> >>>
> >>> -Khem
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ALfTUftag+2gvp1h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWvnC1AAKCRA3VSO3ZXaA
HJtNAJ9hCNj2hM6jk36I1zRYy/ed5nsoigCgo6XjRZUyPZrCrGIXxbSR3T7CD8M=
=zK+i
-----END PGP SIGNATURE-----

--ALfTUftag+2gvp1h--
