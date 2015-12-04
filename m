Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2F15260132
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 10:58:20 +0000 (UTC)
Received: by ioc74 with SMTP id 74so111712101ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Dec 2015 02:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1Ck/8uA/ewJ3Kk0C5feXSwVtR/D0FsKhvx16NF2sW2E=;
	b=1IQhl7/8VroyHyLLIUVXIZvulRJawN53mr2ShcLcv/ORVsndXAxTJbW7VUc1CKt+H8
	PDG3ntH3rFA2f8Vnj7+KEZazzH3EwE5sC4EWb3QZqyfe5nuILUl0Fber2OtDzy2LuNfO
	KVwS9iTc7A2BnuDLxm2fOgBbAYI6mkfyFFZFTlsQXrzr9Zfd2Pl/O4wiuriPEsaBOilk
	CiP/I45JeKgSG/t14rylf2K16vtVTHJLWdKBEyxAQWyDK1Y5z1DTpSszEjiI/+hMCMm/
	heAFmOeMYkdN51iUOhHgYJcRViyp4mL7kND7Vk4gvuVHnq0AQ3RSxKw85wf3PGlC/Co6
	Xptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1Ck/8uA/ewJ3Kk0C5feXSwVtR/D0FsKhvx16NF2sW2E=;
	b=jnb44MnqmpX5XTVF3HfFMehymqU0bmW2iNJSVlyQzW6YEsLLFso1SBdqrY3oYpTC0u
	hztWHcH0UX4G6lT9S6JOXC0/CRUmkYCp3ujr+9X3YBe2k99PrmHcIxWbkmh6xXP9Wck+
	pe1GvUAYbQ1fqd5DZFzeN3+0IvqudTf7fVc/cHbaDGt/CSFBEWHNQ05xNUQ0Ecteeab3
	LH7ISolXy8PsgUH9bNh9GIQMpk/GyGPmWSkIF9YG30I+8Lr+fR2ma+x+bVZHJcu3F5wi
	2K1NqfsI+YtBiCiGXEpFS/HCc+7yEUL2jLtHYqA3coK5NMnDhD5JnkQP9USqbmAQ5E76
	Mbhg==
X-Gm-Message-State: ALoCoQnkk4pgVdSasgZDsab9IzAeC5C8E/O8anZqMMZrODbuvMUP2TyVunxtkrtaY5pYnY2wVM9S
X-Received: by 10.107.135.30 with SMTP id j30mr12163778iod.148.1449226700936; 
	Fri, 04 Dec 2015 02:58:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Fri, 4 Dec 2015 02:58:01 -0800 (PST)
In-Reply-To: <20151204060306.GA28070@mbabyjoh-mobl.fi.intel.com>
References: <1449042969-24132-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LZjk_FQBhpm-K95rsO9k2ux-a7x+a4+uGL6GuFi2oj_pA@mail.gmail.com>
	<20151204060306.GA28070@mbabyjoh-mobl.fi.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Dec 2015 10:58:01 +0000
Message-ID: <CAJTo0LaLsgDV_yU131nSCeEF_ZEqoHMwkcU=CCk-HMU8tuvOag@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libjpeg: Replace libjpeg with libjpeg-turbo
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
X-List-Received-Date: Fri, 04 Dec 2015 10:58:22 -0000
Content-Type: multipart/alternative; boundary=001a113ec64ab56c7c052610623d

--001a113ec64ab56c7c052610623d
Content-Type: text/plain; charset=UTF-8

On 4 December 2015 at 06:03, Maxin B. John <maxin.john@intel.com> wrote:

> There was a discussion about supporting x32 support in libjpeg-turbo:
> http://sourceforge.net/p/libjpeg-turbo/patches/35/
>
> Due to some reasons, that ended up in "closed-wont-integrate".
>
> Work-around could be to build with "--without-simd" for x32 or implement
> the x32 assembly SIMD
> routines to support that feature (long and painful).
>

Looks like that was closed because the patch made it compile but failed to
actually work.  --without-simd for x32 is clearly the right thing to do.

Ross

--001a113ec64ab56c7c052610623d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 December 2015 at 06:03, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":9rz" class=3D=
"a3s" style=3D"overflow:hidden">There was a discussion about supporting x32=
 support in libjpeg-turbo:<br>
<a href=3D"http://sourceforge.net/p/libjpeg-turbo/patches/35/" rel=3D"noref=
errer" target=3D"_blank">http://sourceforge.net/p/libjpeg-turbo/patches/35/=
</a><br>
<br>
Due to some reasons, that ended up in &quot;closed-wont-integrate&quot;.<br=
>
<br>
Work-around could be to build with &quot;--without-simd&quot; for x32 or im=
plement the x32 assembly SIMD<br>
routines to support that feature (long and painful).</div></blockquote></di=
v><br>Looks like that was closed because the patch made it compile but fail=
ed to actually work. =C2=A0--without-simd for x32 is clearly the right thin=
g to do.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a113ec64ab56c7c052610623d--
