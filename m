Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id B2ED2748A0;
	Thu, 17 May 2018 10:46:41 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id v15-v6so5159668wrm.10;
	Thu, 17 May 2018 03:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=W3vWPWxfyESEg8JDgocLOvz1juLivHHUvwhdBqNGWOY=;
	b=KT65E3y/CcMES6pGIHJ9e+5VYga8T6WXIFmRLwT/zF5TehRSio5r/e69qPmebeeKd+
	wXg6XGvdd1mcamfPtMDxLV+RPzHl51xX0gYGoYnDjJol98XzaLQKdsjtfqHoPq39wxTz
	nj/xlR39qcLIwboHzK1vsrk863T2BNzX8Y37AyYNmxfHgDUMmiq/cumCzAOKyw8MFGU+
	hP//dTt7OJsqdyZ420VwlgOxxnXxks+JDvRKz5j3CfJURfl2kIS7e5lO5hI105eD01MW
	vyS9AVQPYMNAA0Hm+NnLa/Vbc9NK041iTUZiSvf+PPHvvw8J9AinGpKmBhSHx2ehrGUE
	zxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=W3vWPWxfyESEg8JDgocLOvz1juLivHHUvwhdBqNGWOY=;
	b=QSNAg9DV73dKnLd6skqJvyOO2c4yLHpzEQyQJMojhJy0o6pl5gBnnLJvZJkuuFlMnp
	ykZeYyDotJ7vf8aNgHi9iguRkw5XZA9LnyJR1CBcTy4Q5D748aSb1iaVsmNFPl3LaBop
	0LtBa9lFKyJQ+V+M2+Rb8Jgf9sLpEApjbN10KE6a6THqPObyTlQTGQTS/4cD9v0nPcZm
	i23VjKMSBehWQGv4jeGZnbtojuNmM9721A6YcuHsUPeSQjpdAHVLcSj99fgDKIDi8fgf
	pbk3qUGqOo6yggpB5i6BIxvKwHod7Z5/C+T/funiX62rSULICh/k3EIIq2CdkwxfbbWz
	MMWg==
X-Gm-Message-State: ALKqPwdov+fN9cunWBWsw1O3xFZFxu7L5Gth9RVK0dX5JPBnIIhYKDCs
	r8jTtJfklNV8hH/4ZaKRwqo=
X-Google-Smtp-Source: AB8JxZoMK1aLsZ9vTLQA24UrKOLP86pycz+plHhfLm4AzVfsIroM2mI/+aLEXdK39VO15+qCs0RrcQ==
X-Received: by 2002:adf:a294:: with SMTP id
	s20-v6mr3625471wra.114.1526554002270; 
	Thu, 17 May 2018 03:46:42 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k126-v6sm6491701wmg.6.2018.05.17.03.46.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 17 May 2018 03:46:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 May 2018 12:46:40 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180517104640.GA1398@jama>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<8d962430-ac63-5e97-fd32-2c0464c62acb@gmail.com>
	<20180510191145.GA1954@jama>
MIME-Version: 1.0
In-Reply-To: <20180510191145.GA1954@jama>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 17 May 2018 10:46:43 -0000
X-Groupsio-MsgNum: 111460
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2018 at 09:11:45PM +0200, Martin Jansa wrote:
> > > 5) nativesdk-libxcrypt fails to build (not sure which change caused=
=20
> > > this, it build OK with sumo since the=A0-std=3Dgnu99 addition.
> > > ../git/crypt-sunmd5.c:189:13: error: 'snprintf' output may be truncat=
ed=20
> > > before the last format character [-Werror=3Dformat-truncation=3D]
> > >  =A0 =A0 =A0 =A0 =A0 =A0 =A0"$" CRYPT_ALGNAME "," ROUNDS "%u$%s$",
> > >  =A0 =A0 =A0 =A0 =A0 =A0 =A0^~~
> > >=20
> >=20
> > something new, I will look into reproducing this.

The fix from you worked for me, thanks!

> > > I didn't get very far in testing, because our old kernel fails to bui=
ld=20
> > > with gcc8 and there are some other issues caused by other master=20
> > > changes. But it doesn't look too bad (in my small test, lets see what=
=20
> > > bitbake world will show), thanks a lot for new gcc.
> > >=20
> >=20
> > yes, older kernel needs fixes, especially to disable new warnings.
> > the mips/ppc fixes that I put out there might be helpful to cook up=20
> > fixes for older kernels if running into same issues.
>=20
> In this case it fails with Error: .err encountered for many drivers. It's=
 not the same case as in:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-February/32561=
5.html
> nor arm version of this change, both are already applied in our
> 4.4.3 based kernel.
>=20
> I've tried to reproduce with vanilla 4.4.143 and it doesn't fail like thi=
s, vanilla 4.4.3 doesn't
> fail, so it's caused by one of our 10000 commits on top of 4.4.3 or the c=
onfig, need to dig a bit more.

Just FYI if someone needs similar fix, backporting this:
https://patchwork.kernel.org/patch/9170055/

fixed the issue for me, now I have successful kernel build.

The failing code was always in put_user calls, e.g. kernel/exit.s was showi=
ng:
@ 1581 "kernel-source/kernel/exit.c" 1
        .ifnc r0,r0; .ifnc r0r0,fpr11; .ifnc r0r0,r11fp; .ifnc r0r0,ipr12; =
=2Eifnc r0r0,r12ip; .err; .endif; .endif; .endif; .endif; .endif
        .ifnc r5,r2; .ifnc r5r2,fpr11; .ifnc r5r2,r11fp; .ifnc r5r2,ipr12; =
=2Eifnc r5r2,r12ip; .err; .endif; .endif; .endif; .endif; .endif
        .ifnc r1,r1; .ifnc r1r1,fpr11; .ifnc r1r1,r11fp; .ifnc r1r1,ipr12; =
=2Eifnc r1r1,r12ip; .err; .endif; .endif; .endif; .endif; .endif
        bl      __put_user_4
@ 0 "" 2

with the error triggered on the middle line.
/tmp/ccHq8ugv.s: Assembler messages:
/tmp/ccHq8ugv.s:1179: Error: .err encountered
/tmp/ccHq8ugv.s:1331: Error: .err encountered
/tmp/ccHq8ugv.s:4617: Error: .err encountered
/tmp/ccHq8ugv.s:6222: Error: .err encountered
/tmp/ccHq8ugv.s:8705: Error: .err encountered
/tmp/ccHq8ugv.s:14486: Error: .err encountered
/tmp/ccHq8ugv.s:14646: Error: .err encountered
/tmp/ccHq8ugv.s:14806: Error: .err encountered
/tmp/ccHq8ugv.s:14966: Error: .err encountered
/tmp/ccHq8ugv.s:15126: Error: .err encountered
/tmp/ccHq8ugv.s:15286: Error: .err encountered

That leaves only few issues in our internal components and strange failure =
with perf which fails to include various header files:
perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal er=
ror: ../../../../include/uapi/linux/swab.h: No such file or directory
perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal er=
ror: ../../../../include/uapi/linux/swab.h: No such file or directory
perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal er=
ror: ../../../../include/uapi/linux/swab.h: No such file or directory
perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.h:=
1:28: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.h:=
2:26: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.h:=
3:25: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.h:=
5:41: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal er=
ror: ../../../../include/uapi/linux/swab.h: No such file or directory
perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal er=
ror: ../../../../include/uapi/linux/swab.h: No such file or directory
perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.h:=
1:28: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.h:=
2:26: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.h:=
3:25: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.h:=
5:41: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.h:=
1:28: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.h:=
2:26: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.h:=
3:25: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.h:=
5:41: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal er=
ror: ../../../../include/uapi/linux/swab.h: No such file or directory
perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal er=
ror: ../../../../include/uapi/linux/swab.h: No such file or directory
perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal er=
ror: ../../../../include/uapi/linux/swab.h: No such file or directory
perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal er=
ror: ../../../../include/uapi/linux/swab.h: No such file or directory
perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.h:=
1:28: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.h:=
2:26: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.h:=
3:25: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.h:=
5:41: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal er=
ror: ../../../../include/uapi/linux/swab.h: No such file or directory
perf/1.0-r9/perf-1.0/tools/perf/arch/arm/include/../../../../include/asm-ge=
neric/bitops/fls.h:1:56: error: #include nested too deeply
perf/1.0-r9/perf-1.0/tools/perf/arch/arm/include/../../../../include/asm-ge=
neric/bitops/fls.h:1:56: error: #include nested too deeply
=2E..

Cheers,

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWv1djAAKCRA3VSO3ZXaA
HGYZAJ9wYUnDMxjzPAuNppzIyDGYIJEYvACfbBUhdCp6EBpv1+EUczxS8PFLMis=
=EVOp
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
