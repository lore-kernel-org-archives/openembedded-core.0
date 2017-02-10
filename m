Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id DD2C8771D4;
	Fri, 10 Feb 2017 20:20:02 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id y9so36867348uae.2;
	Fri, 10 Feb 2017 12:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Q2Mj440SPDC2zboavs1lzWKinxtSAB3D3wphy5KTwQo=;
	b=FMvAZIHWqpAjPP5PbuS5pCKSIDMl1EZm+RQjtm471v2rAtWAb5HmxfOAb/N7WE7Mtc
	jZ3k/cL9CDlkb78QwKtg2W3TJqp46iGpOaYREXIZ7Is/hst/GfGl+UhKBCtkED4y7rl1
	OVmfQmrrnvW4XgL3vHYcihgg6znyLfu5zzpIuHvTaRewM0FUbBykKLi6OzUnnV+B8E60
	CmyGXeFavb0bYq9rmfdAGbaFEjojL3qQw02nc3ptjyXbuhQjJo87QF6SnFoMmw/kqzha
	JtTjFHFSCCar2HdWVNvV425/uc9gHJh4cfcd/KKSH59jgnKEbABgP+KuNO4gnBnn83S3
	UUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Q2Mj440SPDC2zboavs1lzWKinxtSAB3D3wphy5KTwQo=;
	b=DwqYBXs5XXWJX5c0aBeFyMnRhairpTF04inoKkz0ptfVoO9oCeSyOvkMNQLZvpAOCY
	/wZ6Vz4pXp4FqTbJO/ncTUP9Zfq0IHDe9JdyltMOv1spXnd2xtBKkEKGAyklb/04UyiP
	VCTsy+79eNUp6RDsGqjJNQk6Y7WAokzfoTLiV5wULf5+7Yof/nA6EeyiA4F1YE8be+Ib
	e2Mdl2MomC9ZwdOy9oujKIBIYE4G21Vh4SSjX3CxWcSi0JEHOoP9rmq/PKeYBa/Zl45y
	GGLxSmwhwvl7I7O81f/VJkTD6n+dnBpoUE+B9nmm5v5jcZSoSwTKqU2Cmp1Gj6RV7yi4
	9ugw==
X-Gm-Message-State: AMke39n/w6BgqAMm5Lf104PsQqdNS8lcTjWM+B2ikUIIaUcj3e1mSYN0n6b3KSkJvvbQt+d/tgOlv/i8MwZ2/Q==
X-Received: by 10.176.0.149 with SMTP id 21mr5545373uaj.81.1486758002962; Fri,
	10 Feb 2017 12:20:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Fri, 10 Feb 2017 12:20:02 -0800 (PST)
In-Reply-To: <20170210162637.GB3021@jama>
References: <20170210082811.GA3021@jama> <20170210162637.GB3021@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 10 Feb 2017 21:20:02 +0100
Message-ID: <CALbNGRTfzBgfDRuwNk93KYMNgWWio6X+kmYdg71+M+MdCkMZuA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-02-08
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
X-List-Received-Date: Fri, 10 Feb 2017 20:20:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2017 at 5:26 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Feb 10, 2017 at 09:28:11AM +0100, Martin Jansa wrote:
>> =3D=3D Number of issues - stats =3D=3D
>> {| class=3D'wikitable'
>> !|Date                     !!colspan=3D'3'|Failed tasks                 =
    !!colspan=3D'6'|Failed depencencies                    !!|Signatures   =
         !!colspan=3D'12'|QA !!Comment
>> |-
>> ||            ||qemuarm       ||qemux86       ||qemux86_64    ||qemuarm|=
|max||min     ||qemux86||max||min     ||all   ||already-stripped      ||lib=
dir        ||textrel       ||build-deps    ||file-rdeps    ||version-going-=
backwards       ||host-user-contaminated        ||installed-vs-shipped  ||u=
nknown-configure-option      ||symlink-to-sysroot    ||invalid-pkgconfig   =
  ||pkgname       ||
>> |-
>> ||2017-02-08  ||96    ||100   ||100   ||N/A   ||N/A   ||N/A   ||N/A   ||=
N/A   ||N/A   ||0     ||0             ||0             ||2             ||0  =
           ||6             ||36            ||0             ||0             =
||0             ||0             ||0             ||0             ||
>> |}
>
> During this weekend I plan to start adding PNBLACKLISTs to failed recipes=
.
>
> With this number of failures the builds don't help to spot new issues.
>
> If you care about some of the listed recipes, please send patches or at
> least send e-mail saying that you plan to fix them soonish.
>
> Many of these failures aren't hard to fix, I have already fixed all
> recipes I care about (which are included in some images I'm building),
> but I don't want to spend more time fixing (or even building) recipes
> nobody uses (or cares about).
>
> If you don't send the fixes before Sunday evening, than no big deal,
> you will just need to update commit with the fix to also remove the
> PNBLACKLIST from the recipe before sending it to ML.
>
OK I'll give my images a try this weekend.

Andreas

