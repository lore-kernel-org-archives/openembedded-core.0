Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.8694.1602756107815870614
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 03:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SfkKhbgc;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id t20so2431676edr.11
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UhDPJpqkO6vC9LG1tBAlT+0CJRCP7wy8K3NJTf7CQFI=;
        b=SfkKhbgc4SgsaV/qA/kNSxHYBRiIm5kkf+GCy5aOeQOARGKpQ7QMPbgj4+sEGRmdTg
         bcBoeZKoWigzZqv4qSf1gYpbvW4t0RKskHbqJ0wbckIqbE7pNxTDcEqxcQwtwm03H5gP
         BNrGnXcyqz9pcL7kCKaIoCTewA51yYjTtuZCwPLeRlnSlbuS/UDJBHuRwUf5tKZp9yeR
         tpmj/p7vZl8jZuS6iKT/IfDeaKXmozt45D/5XZsv6OIUBlKkxig3hnYcf6jD89NtjabH
         IpvZpbsMqRib1Iy67ecnl+L5U5SapoK6J5aZ7g6C/aBPFRG9i+iQwb4IM847qjI9OGhI
         jKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UhDPJpqkO6vC9LG1tBAlT+0CJRCP7wy8K3NJTf7CQFI=;
        b=gMwvhACz+R90HYDQIDcTUKCmEPD+/R/4eS3sH9WcfZtmeQnhXLl8QylkAviwFA24kU
         M1UzcfbYtWolnqMXBiLvz2cxFKueCh8QmqYeJHPBwysQmyM4bjAmdXiBsPq2qjTI5lgw
         9+LSG1HN7dqUGhFMYHC1EuEgz2H43pun/E2V7R0uoY5s8B9bOSEAiTs4OYXYntos6A4k
         j+81QZUTtottLD0LJdhArSF0IlrsevYTfCZrjTV3iaWdOt705fqvvsX43Ln21w7DfzPR
         +kUAeWfTp8xr46313fANRtSViwd5a5LPvl4pUS9/nHieqMEtZ8Dqa/MAPi0k6SSxfzgT
         7Z2g==
X-Gm-Message-State: AOAM531EvSxdfMiMet8UGLUILUvFpQGfLjZZWr9BVCyb+vp5eoSRuitA
	kdlWoZbB5v5XrkOo243acbtK6Kqu/DG81a+pp0k=
X-Google-Smtp-Source: ABdhPJz6YydDA81GADjtDI89mv8WpPvmGF+BhMiNqVhpT1sLkhVINetM7JwbuFUWgQ4D/Z8iM8f/ahkR+k0XfinoCfA=
X-Received: by 2002:a50:8106:: with SMTP id 6mr3429938edc.264.1602756106038;
 Thu, 15 Oct 2020 03:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201012213137.15179-1-pkj@axis.com> <CA+chaQf-4692XTUAiguks3ZmGg7mLXDeFbPsn-mjLRRCMcEfQQ@mail.gmail.com>
 <0aec3831d3ff64f9848512740a7621456ac45fb8.camel@linuxfoundation.org>
In-Reply-To: <0aec3831d3ff64f9848512740a7621456ac45fb8.camel@linuxfoundation.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 15 Oct 2020 12:01:34 +0200
Message-ID: <CA+chaQdwtmmW3RkpKf1aJ-itiwxYcL6+8ChVMKas=ZbDKk1ZFw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tune-cortexa65.inc: Correct TUNE_FEATURES_tune-cortexa65
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Jon Mason <jdmason@kudzu.us>
Content-Type: multipart/alternative; boundary="0000000000005cb05f05b1b2bc46"

--0000000000005cb05f05b1b2bc46
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2020 at 10:44 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2020-10-13 at 00:24 +0200, Martin Jansa wrote:
> > Good catch, maybe we should require tune-test.sh test for all tune
> > modifying changes, it catches the issue as the very first tested
> > case:
> >
> > Testing fake MACHINE fake-cortexa65 for include
> > conf/machine/include/arm/armv8-2a/tune-cortexa65.inc (1/76)
> > ERROR: something wrong in openembedded-core/scripts/tune/log.fake-
> > cortexa65
> >
> > martin@jama:/OE/build/oe-core$ cat openembedded-
> > core/scripts/tune/log.fake-cortexa65
> > NOTE: Started PRServer with DBfile: /OE/build/oe-
> > core/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 44979, PID: 158972
> > ERROR:  OE-core's config sanity checker detected a potential
> > misconfiguration.
> >     Either fix the cause of this error or at your own risk disable
> > the checker (see sanity.conf).
> >     Following is the list of potential problems / advisories:
> >
> >     Toolchain tunings invalid:
> > Tuning 'cortexa65' has the following errors:
> > Feature 'cortexa55' is not defined.
> >
> >
> > Summary: There was 1 ERROR message shown, returning a non-zero exit
> > code.
> >
> > I'll let it finish in master branch and update
> >
> https://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune-test
> > tomorrow.
>
> Could we turn tune-test.sh into something in oe-selftest? That way it
> would be tested on the infrastructure automatically...
>

It would be definitely better, this shell script is quite ugly, old and
slow, It doesn't even use bitbake server which should really help in this
case (it just calls "bitbake -e" for every combination of tune file and
AVAILTUNES for it). It might also be affected by ARM_INSTRUCTION_SET
setting in the distro, so in theory we should run most arm tunes twice.

My previous test was testing only the "neon-vfpv4" tunes, because that was
probably the last thing I've modified few years ago.

Yesterday I've noticed it and removed this filter .. and it's still
running, now at:
Testing DEFAULTTUNE armv7a-vfpv3 (45/145) for fake MACHINE fake-cortexa53
(33/76)

which means 45th DEFAULTTUNE from 145 on 33rd MACHINE from 76.. hopefully
after it finishes all these cortex* variants it will get
significantly faster, because other tune files don't have so many
AVAILTUNES.

Sofar it found following issues (not all of them are from new tune files
from Jon):

scripts/tune/log.fake-cortexa15.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa15) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa17.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa17) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa32.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa32) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa32.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa32) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa34.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa34) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa34.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa34) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa35.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa35) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa35.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa35) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa5.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa5) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa65.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa65) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa65ae.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa65ae) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa65ae.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa65ae) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa65.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa65) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa73.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa73) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa73.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa73) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa73-cortexa35.aarch64_be:    Error, the
PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa73_cortexa35)
for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa73-cortexa35.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa73_cortexa35) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa75.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa75) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa75.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa75) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa75-cortexa55.aarch64_be:    Error, the
PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa75_cortexa55)
for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa75-cortexa55.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa75_cortexa55) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa76.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa76) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa76ae.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa76ae) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa76ae.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76ae) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa76.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa76-cortexa55.aarch64_be:    Error, the
PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa76_cortexa55)
for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa76-cortexa55.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76_cortexa55) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-cortexa77.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_cortexa77) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-cortexa77.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa77) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-ep9312:    Error, the PACKAGE_ARCHS variable (all any
noarch arm armv4 armv4t ep9312 fake_ep9312) for DEFAULTTUNE (ep9312) does
not contain TUNE_PKGARCH (ep9312t).
scripts/tune/log.fake-mips-24k.mips64el-o32:    Error, the PACKAGE_ARCHS
variable contains duplicates. The following archs are listed more than
once: mips64el-o32
scripts/tune/log.fake-mips-74k.mips64el-o32:    Error, the PACKAGE_ARCHS
variable contains duplicates. The following archs are listed more than
once: mips64el-o32
scripts/tune/log.fake-neoversee1.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_neoversee1) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-neoversee1.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_neoversee1) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-neoversen1.aarch64_be:    Error, the PACKAGE_ARCHS
variable (all any noarch aarch64_be fake_neoversen1) for DEFAULTTUNE
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).
scripts/tune/log.fake-neoversen1.armv7atb-vfpv4d16:    Error, the
PACKAGE_ARCHS variable (all any noarch
${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_neoversen1) for
DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH
(armv7at2b-vfpv4d16).
scripts/tune/log.fake-riscv.riscv32nf:    Error, the PACKAGE_ARCHS variable
(all any noarch riscv32nf fake_riscv) for DEFAULTTUNE (riscv32nf) does not
contain TUNE_PKGARCH (riscv32).
scripts/tune/log.fake-riscv.riscv64nf:    Error, the PACKAGE_ARCHS variable
(all any noarch riscv64nf fake_riscv) for DEFAULTTUNE (riscv64nf) does not
contain TUNE_PKGARCH (riscv64).
scripts/tune/log.fake-supersparc:    Error, the PACKAGE_ARCHS variable (all
any noarch ${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}} fake_supersparc) for
DEFAULTTUNE (None) does not contain TUNE_PKGARCH (supersparc).Toolchain
tunings invalid:

--0000000000005cb05f05b1b2bc46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Oct 13, 2020 at 10:44 AM Richard =
Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pu=
rdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2020-10-13 at 00=
:24 +0200, Martin Jansa wrote:<br>
&gt; Good catch, maybe we should require tune-test.sh test for all tune<br>
&gt; modifying changes, it catches the issue as the very first tested<br>
&gt; case:<br>
&gt; <br>
&gt; Testing fake MACHINE fake-cortexa65 for include<br>
&gt; conf/machine/include/arm/armv8-2a/tune-cortexa65.inc (1/76)<br>
&gt; ERROR: something wrong in openembedded-core/scripts/tune/log.fake-<br>
&gt; cortexa65<br>
&gt; <br>
&gt; martin@jama:/OE/build/oe-core$ cat openembedded-<br>
&gt; core/scripts/tune/log.fake-cortexa65 <br>
&gt; NOTE: Started PRServer with DBfile: /OE/build/oe-<br>
&gt; core/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 44979, PID: 158972<br>
&gt; ERROR:=C2=A0 OE-core&#39;s config sanity checker detected a potential<=
br>
&gt; misconfiguration.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Either fix the cause of this error or at your own r=
isk disable<br>
&gt; the checker (see sanity.conf).<br>
&gt;=C2=A0 =C2=A0 =C2=A0Following is the list of potential problems / advis=
ories:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Toolchain tunings invalid:<br>
&gt; Tuning &#39;cortexa65&#39; has the following errors:<br>
&gt; Feature &#39;cortexa55&#39; is not defined.<br>
&gt; <br>
&gt; <br>
&gt; Summary: There was 1 ERROR message shown, returning a non-zero exit<br=
>
&gt; code.<br>
&gt; <br>
&gt; I&#39;ll let it finish in master branch and update<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core-contrib/log/=
?h=3Djansa/tune-test" rel=3D"noreferrer" target=3D"_blank">https://git.open=
embedded.org/openembedded-core-contrib/log/?h=3Djansa/tune-test</a><br>
&gt; tomorrow.<br>
<br>
Could we turn tune-test.sh into something in oe-selftest? That way it<br>
would be tested on the infrastructure automatically...<br></blockquote><div=
><br></div><div>It would be definitely better, this shell script is quite u=
gly, old and slow, It doesn&#39;t even use bitbake server which should real=
ly help in this case (it just calls &quot;bitbake -e&quot; for every combin=
ation of tune file and AVAILTUNES for it). It might also be affected by=C2=
=A0ARM_INSTRUCTION_SET setting in the distro, so in theory we should run mo=
st arm tunes twice.</div><div><br></div><div>My previous test was testing o=
nly the &quot;neon-vfpv4&quot; tunes, because that was probably the last th=
ing I&#39;ve modified few years ago.</div><div><br></div><div>Yesterday I&#=
39;ve noticed it and removed this filter .. and it&#39;s still running, now=
 at:</div><div>Testing DEFAULTTUNE armv7a-vfpv3 (45/145) for fake MACHINE f=
ake-cortexa53 (33/76)<br></div><div><br></div><div>which means 45th=C2=A0DE=
FAULTTUNE from 145 on 33rd MACHINE from 76.. hopefully after it finishes al=
l these cortex* variants it will get significantly=C2=A0faster, because oth=
er tune files don&#39;t have so many AVAILTUNES.</div><div><br></div><div>S=
ofar it found following issues (not all of them are from new tune files fro=
m Jon):</div><div><br></div><div>scripts/tune/log.fake-cortexa15.armv7atb-v=
fpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${P=
ACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa15) for DEFAULTTUNE =
(armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>=
scripts/tune/log.fake-cortexa17.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the =
PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-=
vfpv4d16} fake_cortexa17) for DEFAULTTUNE (armv7atb-vfpv4d16) does not cont=
ain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa32.a=
arch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch a=
arch64_be fake_cortexa32) for DEFAULTTUNE (aarch64_be) does not contain TUN=
E_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake-cortexa32.armv7atb-vfpv=
4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACK=
AGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa32) for DEFAULTTUNE (ar=
mv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scr=
ipts/tune/log.fake-cortexa34.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_AR=
CHS variable (all any noarch aarch64_be fake_cortexa34) for DEFAULTTUNE (aa=
rch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune/lo=
g.fake-cortexa34.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS v=
ariable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_=
cortexa34) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARC=
H (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa35.aarch64_be: =C2=
=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake=
_cortexa35) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aar=
ch64_be_be).<br>scripts/tune/log.fake-cortexa35.armv7atb-vfpv4d16: =C2=A0 =
=C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARC=
HS_tune-armv7atb-vfpv4d16} fake_cortexa35) for DEFAULTTUNE (armv7atb-vfpv4d=
16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log=
.fake-cortexa5.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS var=
iable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_co=
rtexa5) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (=
armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa65.aarch64_be: =C2=A0 =
=C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cor=
texa65) for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64=
_be_be).<br>scripts/tune/log.fake-cortexa65ae.aarch64_be: =C2=A0 =C2=A0Erro=
r, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa65ae) =
for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).=
<br>scripts/tune/log.fake-cortexa65ae.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error=
, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-arm=
v7atb-vfpv4d16} fake_cortexa65ae) for DEFAULTTUNE (armv7atb-vfpv4d16) does =
not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cor=
texa65.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (a=
ll any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa65)=
 for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at=
2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa73.aarch64_be: =C2=A0 =C2=A0E=
rror, the PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa73)=
 for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be)=
.<br>scripts/tune/log.fake-cortexa73.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error,=
 the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv=
7atb-vfpv4d16} fake_cortexa73) for DEFAULTTUNE (armv7atb-vfpv4d16) does not=
 contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortex=
a73-cortexa35.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (a=
ll any noarch aarch64_be fake_cortexa73_cortexa35) for DEFAULTTUNE (aarch64=
_be) does not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fak=
e-cortexa73-cortexa35.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_AR=
CHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} =
fake_cortexa73_cortexa35) for DEFAULTTUNE (armv7atb-vfpv4d16) does not cont=
ain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa75.a=
arch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch a=
arch64_be fake_cortexa75) for DEFAULTTUNE (aarch64_be) does not contain TUN=
E_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake-cortexa75.armv7atb-vfpv=
4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACK=
AGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa75) for DEFAULTTUNE (ar=
mv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scr=
ipts/tune/log.fake-cortexa75-cortexa55.aarch64_be: =C2=A0 =C2=A0Error, the =
PACKAGE_ARCHS variable (all any noarch aarch64_be fake_cortexa75_cortexa55)=
 for DEFAULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be)=
.<br>scripts/tune/log.fake-cortexa75-cortexa55.armv7atb-vfpv4d16: =C2=A0 =
=C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARC=
HS_tune-armv7atb-vfpv4d16} fake_cortexa75_cortexa55) for DEFAULTTUNE (armv7=
atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>script=
s/tune/log.fake-cortexa76.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS=
 variable (all any noarch aarch64_be fake_cortexa76) for DEFAULTTUNE (aarch=
64_be) does not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune/log.f=
ake-cortexa76ae.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable =
(all any noarch aarch64_be fake_cortexa76ae) for DEFAULTTUNE (aarch64_be) d=
oes not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake-cort=
exa76ae.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (=
all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76=
ae) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv=
7at2b-vfpv4d16).<br>scripts/tune/log.fake-cortexa76.armv7atb-vfpv4d16: =C2=
=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA=
_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa76) for DEFAULTTUNE (armv7atb-vf=
pv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune=
/log.fake-cortexa76-cortexa55.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_A=
RCHS variable (all any noarch aarch64_be fake_cortexa76_cortexa55) for DEFA=
ULTTUNE (aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).<br>scri=
pts/tune/log.fake-cortexa76-cortexa55.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error=
, the PACKAGE_ARCHS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-arm=
v7atb-vfpv4d16} fake_cortexa76_cortexa55) for DEFAULTTUNE (armv7atb-vfpv4d1=
6) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.=
fake-cortexa77.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (=
all any noarch aarch64_be fake_cortexa77) for DEFAULTTUNE (aarch64_be) does=
 not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake-cortexa=
77.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all a=
ny noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_cortexa77) for=
 DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-v=
fpv4d16).<br>scripts/tune/log.fake-ep9312: =C2=A0 =C2=A0Error, the PACKAGE_=
ARCHS variable (all any noarch arm armv4 armv4t ep9312 fake_ep9312) for DEF=
AULTTUNE (ep9312) does not contain TUNE_PKGARCH (ep9312t).<br>scripts/tune/=
log.fake-mips-24k.mips64el-o32: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS varia=
ble contains duplicates. The following archs are listed more than once: mip=
s64el-o32<br>scripts/tune/log.fake-mips-74k.mips64el-o32: =C2=A0 =C2=A0Erro=
r, the PACKAGE_ARCHS variable contains duplicates. The following archs are =
listed more than once: mips64el-o32<br>scripts/tune/log.fake-neoversee1.aar=
ch64_be: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch aar=
ch64_be fake_neoversee1) for DEFAULTTUNE (aarch64_be) does not contain TUNE=
_PKGARCH (aarch64_be_be).<br>scripts/tune/log.fake-neoversee1.armv7atb-vfpv=
4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${PACK=
AGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} fake_neoversee1) for DEFAULTTUNE (a=
rmv7atb-vfpv4d16) does not contain TUNE_PKGARCH (armv7at2b-vfpv4d16).<br>sc=
ripts/tune/log.fake-neoversen1.aarch64_be: =C2=A0 =C2=A0Error, the PACKAGE_=
ARCHS variable (all any noarch aarch64_be fake_neoversen1) for DEFAULTTUNE =
(aarch64_be) does not contain TUNE_PKGARCH (aarch64_be_be).<br>scripts/tune=
/log.fake-neoversen1.armv7atb-vfpv4d16: =C2=A0 =C2=A0Error, the PACKAGE_ARC=
HS variable (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv4d16} f=
ake_neoversen1) for DEFAULTTUNE (armv7atb-vfpv4d16) does not contain TUNE_P=
KGARCH (armv7at2b-vfpv4d16).<br>scripts/tune/log.fake-riscv.riscv32nf: =C2=
=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch riscv32nf fake_=
riscv) for DEFAULTTUNE (riscv32nf) does not contain TUNE_PKGARCH (riscv32).=
<br>scripts/tune/log.fake-riscv.riscv64nf: =C2=A0 =C2=A0Error, the PACKAGE_=
ARCHS variable (all any noarch riscv64nf fake_riscv) for DEFAULTTUNE (riscv=
64nf) does not contain TUNE_PKGARCH (riscv64).<br>scripts/tune/log.fake-sup=
ersparc: =C2=A0 =C2=A0Error, the PACKAGE_ARCHS variable (all any noarch ${P=
ACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}} fake_supersparc) for DEFAULTTUNE (N=
one) does not contain TUNE_PKGARCH (supersparc).Toolchain tunings invalid:<=
br></div><div><br></div></div></div>

--0000000000005cb05f05b1b2bc46--
