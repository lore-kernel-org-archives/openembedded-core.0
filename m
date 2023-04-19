Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92F8C77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 08:54:28 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.32901.1681894459981434485
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 01:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DP/QdkCM;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: yashinde145@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1a5197f00e9so29529355ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 01:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681894459; x=1684486459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rQ1OzE7QBFtnuxDgOB9YPi3m/0gGVkzYcd2f7czByYI=;
        b=DP/QdkCMu0DCrVHX9dajED8LUOgfIZlfivuYS9m8MJJqpdGY6E81k+6fLdJWBHZjIY
         zrzO0rEh2L+qDTzyGHwvbOWQQDRSz/F0BC09AUhLATpwk49OdDIBndYuHKLnu9pTfvAK
         MRMQP8XeHIEvYfMjxqYeXC+r73CgrppGohXiM3vfl7ElEWPuF+0OFj32UFa+8dVIXNiA
         AolbZPtf3zPb2NIX2eARWNgqp5r6fXPH+BmzT9L6e2uDr/MeMPOmyRzKRyAY6ZrzM7wG
         scMJOLnOHDAVFSAH6DqZiUEbnwg8MKdJ+poNHubR7hceTL4Rz2PfO0ob3emAVNDE3PLm
         /Pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681894459; x=1684486459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQ1OzE7QBFtnuxDgOB9YPi3m/0gGVkzYcd2f7czByYI=;
        b=CsTexCZu3FOzJSCt4rndQ4B5Rx/bj6vuyLY4EBl86XGGZySXT0kDS9kv4NOM1KRXWP
         kr2h2BNrOKqnfNGumf3zOLqHgsNnBN9JSZNXsOvaRWbRZCL1MpEK2TXMrqa3uuf5kl0l
         kvHaPlyKOCW2aVCoadqmA8eRastGlMkIUachZwR2cYtZg6pGSFNQMBYtSJaLhRROhTFe
         hLQ/onK22f3WOKp4EUlY7Bn/46ZlqWR/cF1WK8SzOszynYEM2pYeiiu1NdYMFip7xTae
         1QGAWPSUkLQyFye619TIG2sj+WvgKg8fS7b1rVE1kjd8wYE7xhJNZBRItJlEaSyRR7In
         lDGg==
X-Gm-Message-State: AAQBX9f4WRt5Aou/+o7GDzaeJrNF5BDuCh1oOrnhPRq+OZh1sGcRxOyi
	RJ12T6WsrBizAYQj5JALjFbEuftZCyjUF5z2APA=
X-Google-Smtp-Source: AKy350Zo1/TEwiE2aUzh4cVq8L3QayW/qP4IAZHc6QY+mnTWd/coTTbXlbHIxiJ9kVJrt+ZkmkFyJCvYre91WmNH3ZA=
X-Received: by 2002:a17:903:41c9:b0:19a:7f4b:3ef6 with SMTP id
 u9-20020a17090341c900b0019a7f4b3ef6mr5391261ple.3.1681894459189; Wed, 19 Apr
 2023 01:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230418091013.858279-1-yashinde145@gmail.com> <20230419094424.50f76431@booty>
In-Reply-To: <20230419094424.50f76431@booty>
From: Yash Shinde <yashinde145@gmail.com>
Date: Wed, 19 Apr 2023 14:24:06 +0530
Message-ID: <CALDccsG1RLNYTeWaauQATpabv2FJzShTgaejHhhPZV==pazp4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v13] Rust Oe-Selftest implementation
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, Umesh.Kallapa@windriver.com, 
	"Gowda, Naveen" <Naveen.Gowda@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, Shivaprasad.Moodalappa@windriver.com, 
	Yash.Shinde@windriver.com
Content-Type: multipart/alternative; boundary="000000000000ca305305f9ac9199"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 08:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180214

--000000000000ca305305f9ac9199
Content-Type: text/plain; charset="UTF-8"

Thanks for sharing the logs. I will check the failures.

Regards,
Yash

On Wed, 19 Apr 2023, 1:14 pm Luca Ceresoli, <luca.ceresoli@bootlin.com>
wrote:

> Hello Yash,
>
> On Tue, 18 Apr 2023 14:40:13 +0530
> "Yash Shinde" <yashinde145@gmail.com> wrote:
>
> > The patch implements Rust testing framework similar to other selftest,
> > specifically the gcc selftest in OE. It uses the client and server
> > based method to test the binaries for cross-target on the image.
> > The test framework is a wrapper around the Rust build system as ./x.py
> > test. It tests many functionalities of Rust distribution like tools,
> > documentation, libraries, packages, tools, Cargo, Crater etc.
> > Please refer the following link for detailed description of Rust
> > testing:-
> > https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests
> >
> > To support the rust tests in oe-core, the following functions were
> > added:-
> > setup_cargo_environment(): Build bootstrap and some early stage tools.
> > do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
> > do_configure(): To generate config.toml
> > do_compile(): To build "remote-test-server" for qemu target image.
> >
> > Approximate Number of Tests Run in the Rust Testsuite :- 18000
> > Approximate Number of Tests that FAIL in bitbake environment :- 100-150
> > Normally majority of the testcases are present in major folder "test/"
> > It contributes to more than 80% of the testcases present in Rust test
> > framework. These tests pass as expected on any Rust versions without
> > much fuss. The tests that fail are of less important and contribute to
> > less than 2% of the total testcases. These minor tests are observed to
> > work on some versions and fail on others. They have to be added, ignored
> > or excluded for different versions as per the behavior.
> > These tests have been ignored or excluded in the Rust selftest
> > environment to generate success of completing the testsuite.
> >
> > These tests work in parallel mode even in the skipped test mode as
> > expected. Although the patch to disable tests is large, it is very simple
> > in that it only disables tests. When updating to a newer version of Rust,
> > the patch can usually be ported in a day.
> >
> > Tested for X86, X86-64, ARM, ARM64 and MIPS64 on CentOS release 6.10
> >
> > Signed-off-by: pgowda <pgowda.cve@gmail.com>
> > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > Signed-off-by: Yash Shinde <yashinde145@gmail.com>
>
> Testing with this patch is causing a lot of failures. Here are some
> logs:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/6944/steps/12/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/6344/steps/16/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/4337/steps/12/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/6998/steps/11/logs/stdio
>
> And here's the entire a-full build in case you need more info:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5194
>
> Best regards,
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000ca305305f9ac9199
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for sharing the logs. I will check the failures.<d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Regards,</div><div dir=3D"auto"=
>Yash=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Wed, 19 Apr 2023, 1:14 pm Luca Ceresoli, &lt;<a href=3D=
"mailto:luca.ceresoli@bootlin.com">luca.ceresoli@bootlin.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Hello Yash,<br>
<br>
On Tue, 18 Apr 2023 14:40:13 +0530<br>
&quot;Yash Shinde&quot; &lt;<a href=3D"mailto:yashinde145@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">yashinde145@gmail.com</a>&gt; wrote:<br>
<br>
&gt; The patch implements Rust testing framework similar to other selftest,=
<br>
&gt; specifically the gcc selftest in OE. It uses the client and server<br>
&gt; based method to test the binaries for cross-target on the image.<br>
&gt; The test framework is a wrapper around the Rust build system as ./x.py=
<br>
&gt; test. It tests many functionalities of Rust distribution like tools,<b=
r>
&gt; documentation, libraries, packages, tools, Cargo, Crater etc.<br>
&gt; Please refer the following link for detailed description of Rust<br>
&gt; testing:-<br>
&gt; <a href=3D"https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool=
-tests" rel=3D"noreferrer noreferrer" target=3D"_blank">https://rustc-dev-g=
uide.rust-lang.org/tests/intro.html#tool-tests</a><br>
&gt; <br>
&gt; To support the rust tests in oe-core, the following functions were<br>
&gt; added:-<br>
&gt; setup_cargo_environment(): Build bootstrap and some early stage tools.=
<br>
&gt; do_rust_setup_snapshot(): Install the snapshot version of rust binarie=
s.<br>
&gt; do_configure(): To generate config.toml<br>
&gt; do_compile(): To build &quot;remote-test-server&quot; for qemu target =
image.<br>
&gt; <br>
&gt; Approximate Number of Tests Run in the Rust Testsuite :- 18000<br>
&gt; Approximate Number of Tests that FAIL in bitbake environment :- 100-15=
0<br>
&gt; Normally majority of the testcases are present in major folder &quot;t=
est/&quot;<br>
&gt; It contributes to more than 80% of the testcases present in Rust test<=
br>
&gt; framework. These tests pass as expected on any Rust versions without<b=
r>
&gt; much fuss. The tests that fail are of less important and contribute to=
<br>
&gt; less than 2% of the total testcases. These minor tests are observed to=
<br>
&gt; work on some versions and fail on others. They have to be added, ignor=
ed<br>
&gt; or excluded for different versions as per the behavior.<br>
&gt; These tests have been ignored or excluded in the Rust selftest<br>
&gt; environment to generate success of completing the testsuite.<br>
&gt; <br>
&gt; These tests work in parallel mode even in the skipped test mode as<br>
&gt; expected. Although the patch to disable tests is large, it is very sim=
ple<br>
&gt; in that it only disables tests. When updating to a newer version of Ru=
st,<br>
&gt; the patch can usually be ported in a day.<br>
&gt; <br>
&gt; Tested for X86, X86-64, ARM, ARM64 and MIPS64 on CentOS release 6.10<b=
r>
&gt; <br>
&gt; Signed-off-by: pgowda &lt;<a href=3D"mailto:pgowda.cve@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">pgowda.cve@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Vinay Kumar &lt;<a href=3D"mailto:vinay.m.engg@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">vinay.m.engg@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Yash Shinde &lt;<a href=3D"mailto:yashinde145@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">yashinde145@gmail.com</a>&gt;<br>
<br>
Testing with this patch is causing a lot of failures. Here are some<br>
logs:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/76/build=
s/6944/steps/12/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/6944/ste=
ps/12/logs/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/97/build=
s/6344/steps/16/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/6344/ste=
ps/16/logs/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/100/buil=
ds/4337/steps/12/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/4337/s=
teps/12/logs/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/37/build=
s/6998/steps/11/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/6998/ste=
ps/11/logs/stdio</a><br>
<br>
And here&#39;s the entire a-full build in case you need more info:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/5194" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/typhoon/#/builders/83/builds/5194</a><br>
<br>
Best regards,<br>
Luca<br>
<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div>

--000000000000ca305305f9ac9199--

