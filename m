Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id E99C2745B7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 20:20:30 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id y70-v6so2709363vkc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 13:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=to7g9nmioOArQj4ZEMSXZp7QtSQgf1SIR6JcqZ5s++E=;
	b=Y4VBHY7cSgGRrISHutZHzObGkxUUGe8xCnsqKRbgzKu/5kybXiQKp2GfDd3Y/PmNpY
	p6XiSfzaVQUzMLMr189O5f+gevlNvl+vjdGkw+d7LNt8g++7JoCoRHxHlG5il2Kr+ViA
	P36MSXhSLn8lbHNafS7et8VD+9Al3KSQd/EKTaNvVFiSEIL6/gJzxtmDMhdXhoZEsNeM
	fv+n7phEtbNY5mB/McQzerqsefKN5WNVog3OPtpovg3+U4068IOUSIpVy6GQQqgsOyWr
	HC1ZeimUH0p3/HX5Q/ZnI3ej5ue54icuCV5ShCQq8HzktTTnOZfS9J7kGZg2ZGgjg4d5
	yx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=to7g9nmioOArQj4ZEMSXZp7QtSQgf1SIR6JcqZ5s++E=;
	b=Pv5ke8guMfQkREOtq2iWW0QYCPWOdYpcsIVWU6AppZW28n2u3RLICRLmw0YsS1khmU
	IaBgs5ZR1VXc88qcPTGlWacHzPbltucw7LRGZ7L62FfcISRKkqcPI2d+e8IbgDiqnD0Z
	212MHPu30Nh5DCvBnJAdSKerxVMx1kNNaplX6g+ZUmsjaZK0O52rrxD2V53BaQqSTAm2
	jjt8dTkhERpL2UxWFMy3hrvrJPRYZtn+h3+0iD5R1UvDXkTlxJ4LipUcAtm3QpGsnL6b
	x+osVYVBSAc0Hs8/7KpgG3sAdY0ikvHbtaRR7GYI0s3wajJguDc4krsirQc2CQGQQ4sE
	iSOw==
X-Gm-Message-State: AOUpUlFfJ5mmY5dMlDc901EGh0CFJiu+oEho/WSsn4G3ZigEwjVF62gh
	HGLBHsTe9hncUbszmOC3PC4YGpAoJy1i0VBfyaw=
X-Google-Smtp-Source: AAOMgpcu4wh0JMhKyhC8cS/p9X+ZY+w+X8t9bRkTng8d38ywmnVvNe3C4uvU3FNh1X66Dsa2mrpVgM207EiJqcdnz1o=
X-Received: by 2002:a1f:c252:: with SMTP id
	s79-v6mr11353281vkf.127.1532463631721; 
	Tue, 24 Jul 2018 13:20:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Tue, 24 Jul 2018 13:20:31 -0700 (PDT)
In-Reply-To: <CAFmD+WEhmrCpo-xhaBWanXPPBLxBS+y6YaECxO68SRsy30LnAg@mail.gmail.com>
References: <20180508164658.2935-1-taborskikrzysztof@gmail.com>
	<5af302bc.1c69fb81.44885.4061@mx.google.com>
	<CAJ86T=Wxh3SzsATsvtB8+CWadp=hjEBXTt1XnwYMFJ4zmVaQ1Q@mail.gmail.com>
	<CAFmD+WEeyHwEQs825up0Q=yF4n3gvQU-eav3RZdJ9nt5NLECwQ@mail.gmail.com>
	<CAJ86T=VBxXPmDwg6S7q9vLjubLwDoSHtZiQ6k-Q475BV-az=Ow@mail.gmail.com>
	<CAFmD+WEhmrCpo-xhaBWanXPPBLxBS+y6YaECxO68SRsy30LnAg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 24 Jul 2018 13:20:31 -0700
Message-ID: <CAJ86T=WvP9X1zNJD-tqyqSkg4w5QRBde5m4dx728MLsqsGAC-w@mail.gmail.com>
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
X-List-Received-Date: Tue, 24 Jul 2018 20:20:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 24, 2018 at 12:22 AM, Krzysztof Taborski
<taborskikrzysztof@gmail.com> wrote:
> Hello,
> Example recipe (recipe.bb for example):
> """
> LICENSE=3D"CLOSED"
>
> RDEPENDS_${PN} =3D "perl-module-file-glob"
>
> BBCLASSEXTEND =3D "native nativesdk"
> do_install() {
>     install -d ${D}/${bindir}
>     echo "my perl script" > ${D}/${bindir}/recipe.pl
> }
> inherit perlnative
> ""
>
> When my patch is removed and I will call: "'bitbake recipe-native".
> Then I have dependency:
> recipe-native -> perl (target version)
> This is not correct, that native recipe has dependency to target recipe.

There are two parts to this issue.

First, the dependency between recipe-native and perl is certainly a
bug and your fix for that in the perl recipe looks good, ie setting

  PACKAGES_DYNAMIC +=3D "^perl-module-.*(?<!\-native)$"

However, after making that first fix, although the recipe-native ->
perl dependency will be gone, trying to build your recipe-native
should now generate a build failure - bitbake will correctly report
that nothing provides a package called "perl-module-file-glob-native".

The question is really how to fix that new build failure.

One approach (the approach you took - the second part of your patch)
is to update the perl-native recipe so that pretends to provide
packages named "perl-module-XXX-native".

The alternative approach is to explicitly set RDEPENDS for the -native
build of your recipe to over-ride the false dependency added by the
native class dependency renaming e.g.

  RDEPENDS_${PN}_class-native =3D "perl-native"

That second approach is basically what the autoconf recipe does to
solve a similar problem:

  http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/=
autoconf/autoconf.inc?h=3Dsumo

As to which is the more "correct" approach, I'm not really sure.
Opinions welcome...

> When I called (bitbake recipe-native -g) I can find:
> "recipe-native" -> "perl"
> in recipe-depends.dot
>
> This was my original problem. Please correct me, if missed something.
>
> usage of +=3D with an over-ride - I've just copied it from nativesdk
> over-ride, which was already in perl recipe.
>
>
> Best regards,
> Krzysztof Taborski
>
> 2018-07-23 19:23 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:
>>
>> On Mon, Jul 23, 2018 at 5:57 AM, Krzysztof Taborski
>> <taborskikrzysztof@gmail.com> wrote:
>> > Change was already merged:
>> >
>> > http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-dev=
tools?id=3D7dd9772eca6df52db09b65537fdf689f1aa3fd8f
>> >
>> > Is your request still valid?
>>
>> Yes, although the change was merged, it's not clear that it was correct.
>>
>> Native recipes aren't split into packages, so there are no -native
>> versions of the perl modules. If you have a recipe which depends on
>> "perl-module-XXX-native" it's likely a bug in that recipe - not in
>> perl-native.
>>
>> What recipe did you find which depends on a -native version of a perl
>> module?
>>
>> > 2018-07-09 21:40 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:
>> >>
>> >> On Wed, May 9, 2018 at 7:16 AM, taborskikrzysztof
>> >> <taborskikrzysztof@gmail.com> wrote:
>> >> > Can I request review?
>> >> > -------- Oryginalna wiadomo=C5=9B=C4=87 --------
>> >> > Od: Krzysztof Taborski <taborskikrzysztof@gmail.com>
>> >> > Data: 08.05.2018 18:46 (GMT+01:00)
>> >> > Do: openembedded-core@lists.openembedded.org
>> >> > DW: Krzysztof Taborski <taborskikrzysztof@gmail.com>
>> >> > Temat: [meta-oe][PATCH] perl: native modules will not trigger build
>> >> > perl
>> >> > for
>> >> > target.
>> >> >
>> >> > Currently building perl-native modules triggers
>> >> > build perl for target due to PACKAGES_DYNAMIC regex.
>> >> >
>> >> > This commit will cause, that perl native modules will
>> >> > trigger perl-native build.
>> >>
>> >> Can you give an example of how to reproduce the problem?
>> >>
>> >> > Signed-off-by: Krzysztof Taborski <taborskikrzysztof@gmail.com>
>> >> > ---
>> >> > meta/recipes-devtools/perl/perl-native_5.24.1.bb | 2 ++
>> >> > meta/recipes-devtools/perl/perl_5.24.1.bb        | 2 +-
>> >> > 2 files changed, 3 insertions(+), 1 deletion(-)
>> >> >
>> >> > diff --git a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
>> >> > b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
>> >> > index a9ab17d16c..71f45890b0 100644
>> >> > --- a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
>> >> > +++ b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
>> >> > @@ -135,3 +135,5 @@ EOF
>> >> >
>> >> > # Fix the path in sstate
>> >> > SSTATE_SCAN_FILES +=3D "*.pm *.pod *.h *.pl *.sh"
>> >> > +PACKAGES_DYNAMIC_class-native +=3D "^perl-module-.*native$"
>> >>
>> >> This usage of +=3D with an over-ride is not correct.
>> >>
>> >> However, regardless of that, was this change actually needed?
>> >>
>> >> If you know of a -native recipe which depends on a
>> >> perl-module-XXX-native package then it's probably a bug in the -nativ=
e
>> >> recipe. Having perl-native pretend to provide perl-module packages
>> >> probably isn't the right solution.
>> >>
>> >> > diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb
>> >> > b/meta/recipes-devtools/perl/perl_5.24.1.bb
>> >> > index 53a426289a..4c6a71082f 100644
>> >> > --- a/meta/recipes-devtools/perl/perl_5.24.1.bb
>> >> > +++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
>> >> > @@ -339,7 +339,7 @@ python split_perl_packages () {
>> >> >      d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), '
>> >> > '.join(packages))
>> >> > }
>> >> >
>> >> > -PACKAGES_DYNAMIC +=3D "^perl-module-.*"
>> >> > +PACKAGES_DYNAMIC +=3D "^perl-module-.*(?<!\-native)$"
>> >> > PACKAGES_DYNAMIC_class-nativesdk +=3D "^nativesdk-perl-module-.*"
>> >>
>> >> This usage of +=3D with an over-ride is not correct.
>> >>
>> >> > RPROVIDES_perl-lib =3D "perl-lib"
>> >> > --
>> >> > 2.13.6
>> >> >
>> >> >
>> >> > --
>> >> > _______________________________________________
>> >> > Openembedded-core mailing list
>> >> > Openembedded-core@lists.openembedded.org
>> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >> >
>> >
>> >
>> >
>> >
>> > --
>> > Pozdrawiam,
>> > Krzysiek Taborski
>
>
>
>
> --
> Pozdrawiam,
> Krzysiek Taborski

