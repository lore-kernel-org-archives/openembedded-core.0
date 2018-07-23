Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id B841374C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 17:23:16 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id w7-v6so924357uan.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 10:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pe6lz0T58xDD/Oc46t2IxDE4fjCyTioU2w4i0cLPB7U=;
	b=ol71IBf62/m7SetGV/j+L9EnEmpQKHHXHXTEGrCxZrBSlhW8tNYcUfw+XzafFC9ZsR
	2gFsLd6cr+VPXXFJ+DjuAXcYlJHmxx92rEzonqIJh43MUdGGzOwxwhRV1CoeUWTDSsyz
	lmrhAhiR95WXc+3ybrgwoj6Ax/PpPv0MVKuCZhAEqozUb5ora/oiSoBaqFvHMJTe7gFl
	PJXG5f96/UylSZmQEX0JDqw524nbZNd7IreNkTilQf+VKcNUC61AcH3DBRKguy2Un6TR
	iwn7kzCi7WGnLpbOki1zt19Qp9cO1R6Y+q4AeAXUGvEt5kZ7vvEj9d0n+9OYQMqBS/nU
	Z5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pe6lz0T58xDD/Oc46t2IxDE4fjCyTioU2w4i0cLPB7U=;
	b=p2Ixcbr+Fdqp/wNpr3awaXkrmLWT7VkJ07W54K5OZ7MS9I4poWoHHhAbH/GxcDTvfX
	aUi4VzmenWzJ0IG7jhEAylE8/g0WD8opHGMng56H0YdyT/9YWli8byniLoKuMXH7eh3r
	T1MksOSe61Mln5VgGkakBVyngGK4nCvUBOyaDL66GGmSPQN5zTXa32VlhXlwRu7WgkHY
	bP4I/F83FvOUJzhydvJ2L71rrO2wrhXDfO5Y9ZaLP9mFmN+u7yvVFTHS3tQTNMfjbrob
	vAB0pffROlsx9vzlwslS9Lr9Zte4ZckhuBkbWD/riiTkndR7nftah910pZvrqaqu669v
	aqpA==
X-Gm-Message-State: AOUpUlFMWBBdFZB3CjqQLulmqzHDDKgPa70pw1dTe/jjJmoDufonfZ6a
	uiI5gDx4qLNqksEEa+Dfuf/6BaH+X4SbnaBB980=
X-Google-Smtp-Source: AAOMgpfoJQvaUD3VsQRwIL3XC/lVcorm4B4e9xSNdryQeZrGpsYKR7pSTtNTZvX99537edfFoPhCO9eMMolcwI6gXFI=
X-Received: by 2002:ab0:5c9:: with SMTP id e67-v6mr9330387uae.66.1532366597649;
	Mon, 23 Jul 2018 10:23:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Mon, 23 Jul 2018 10:23:17 -0700 (PDT)
In-Reply-To: <CAFmD+WEeyHwEQs825up0Q=yF4n3gvQU-eav3RZdJ9nt5NLECwQ@mail.gmail.com>
References: <20180508164658.2935-1-taborskikrzysztof@gmail.com>
	<5af302bc.1c69fb81.44885.4061@mx.google.com>
	<CAJ86T=Wxh3SzsATsvtB8+CWadp=hjEBXTt1XnwYMFJ4zmVaQ1Q@mail.gmail.com>
	<CAFmD+WEeyHwEQs825up0Q=yF4n3gvQU-eav3RZdJ9nt5NLECwQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 23 Jul 2018 10:23:17 -0700
Message-ID: <CAJ86T=VBxXPmDwg6S7q9vLjubLwDoSHtZiQ6k-Q475BV-az=Ow@mail.gmail.com>
To: Krzysztof Taborski <taborskikrzysztof@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] perl: native modules will not trigger build perl for target.
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
X-List-Received-Date: Mon, 23 Jul 2018 17:23:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2018 at 5:57 AM, Krzysztof Taborski
<taborskikrzysztof@gmail.com> wrote:
> Change was already merged:
> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtoo=
ls?id=3D7dd9772eca6df52db09b65537fdf689f1aa3fd8f
>
> Is your request still valid?

Yes, although the change was merged, it's not clear that it was correct.

Native recipes aren't split into packages, so there are no -native
versions of the perl modules. If you have a recipe which depends on
"perl-module-XXX-native" it's likely a bug in that recipe - not in
perl-native.

What recipe did you find which depends on a -native version of a perl modul=
e?

> 2018-07-09 21:40 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:
>>
>> On Wed, May 9, 2018 at 7:16 AM, taborskikrzysztof
>> <taborskikrzysztof@gmail.com> wrote:
>> > Can I request review?
>> > -------- Oryginalna wiadomo=C5=9B=C4=87 --------
>> > Od: Krzysztof Taborski <taborskikrzysztof@gmail.com>
>> > Data: 08.05.2018 18:46 (GMT+01:00)
>> > Do: openembedded-core@lists.openembedded.org
>> > DW: Krzysztof Taborski <taborskikrzysztof@gmail.com>
>> > Temat: [meta-oe][PATCH] perl: native modules will not trigger build pe=
rl
>> > for
>> > target.
>> >
>> > Currently building perl-native modules triggers
>> > build perl for target due to PACKAGES_DYNAMIC regex.
>> >
>> > This commit will cause, that perl native modules will
>> > trigger perl-native build.
>>
>> Can you give an example of how to reproduce the problem?
>>
>> > Signed-off-by: Krzysztof Taborski <taborskikrzysztof@gmail.com>
>> > ---
>> > meta/recipes-devtools/perl/perl-native_5.24.1.bb | 2 ++
>> > meta/recipes-devtools/perl/perl_5.24.1.bb        | 2 +-
>> > 2 files changed, 3 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
>> > b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
>> > index a9ab17d16c..71f45890b0 100644
>> > --- a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
>> > +++ b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
>> > @@ -135,3 +135,5 @@ EOF
>> >
>> > # Fix the path in sstate
>> > SSTATE_SCAN_FILES +=3D "*.pm *.pod *.h *.pl *.sh"
>> > +PACKAGES_DYNAMIC_class-native +=3D "^perl-module-.*native$"
>>
>> This usage of +=3D with an over-ride is not correct.
>>
>> However, regardless of that, was this change actually needed?
>>
>> If you know of a -native recipe which depends on a
>> perl-module-XXX-native package then it's probably a bug in the -native
>> recipe. Having perl-native pretend to provide perl-module packages
>> probably isn't the right solution.
>>
>> > diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb
>> > b/meta/recipes-devtools/perl/perl_5.24.1.bb
>> > index 53a426289a..4c6a71082f 100644
>> > --- a/meta/recipes-devtools/perl/perl_5.24.1.bb
>> > +++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
>> > @@ -339,7 +339,7 @@ python split_perl_packages () {
>> >      d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), ' '.join(packages=
))
>> > }
>> >
>> > -PACKAGES_DYNAMIC +=3D "^perl-module-.*"
>> > +PACKAGES_DYNAMIC +=3D "^perl-module-.*(?<!\-native)$"
>> > PACKAGES_DYNAMIC_class-nativesdk +=3D "^nativesdk-perl-module-.*"
>>
>> This usage of +=3D with an over-ride is not correct.
>>
>> > RPROVIDES_perl-lib =3D "perl-lib"
>> > --
>> > 2.13.6
>> >
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
>
>
>
>
> --
> Pozdrawiam,
> Krzysiek Taborski

