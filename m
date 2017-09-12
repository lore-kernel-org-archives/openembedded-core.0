Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7431B783FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 09:58:06 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id t10so12368683vke.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 02:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BZDgtElzfYiXffrVnwjMEgMD1GAyjUwUcKp7S7V0dAg=;
	b=ue86Pnpuiw06M4W8nvvAiBib2H4Nrc3gMlRfDRX77W+Dkg6IvByx9uDiEko6TF/KIC
	vv0zYM4VSsCv2MjzNbbdGjsek+Je9s7cnP0psyu7zZ0iHMkxCu0PyG8APvTeSPRkb6d/
	oUJgZGmTd+SSVOWPGZPLTJtdY9jhVjhxP3eJTMtm4nnsHywm7jXgSbiI8Vvz0qcUWbwk
	vV1Jxm0yRioPxRRq/424ULj1x8c1gfTGI6OtSGMQc+GkJkCkQ1dDyeKpWjOqaOM8Uu6D
	90uf6ZhRsj2udscLHF8aK94FIlwjzLQyU0ctXi0nmEogXAnFo+lnfdCNeN4n9PfkKvk0
	wjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BZDgtElzfYiXffrVnwjMEgMD1GAyjUwUcKp7S7V0dAg=;
	b=m4pkIRak3eKi3G3BPwxWqDiteylv/98/pnxZ1YbkJH7qpI0yqIVfvv0B/zWygQUmyY
	Beoyfx5WqxmHoQ5Y4IgFPBvF/0oJdjcITqrb2nIIP+UuztExGWdCuWSZG4XPWvuqudKK
	4u0UYJccvW7COVCJ93D1XC/mtXcx1fKCv/2gFjD+BExI6fguCfTrDmSmRzL3ezFUBJyT
	OxuQp9AsNglm8M1LqfyyczJdOixpi788OnEEX2q2UHMJge1sDvwnxffoLKx5/TblOEQY
	tmKayh3nfUZ0a4arqrD1FhHGsSaoKbR5YUHzOIvRyG73ipV+D+g9SZtPcCVrG6td1ycI
	U+Dw==
X-Gm-Message-State: AHPjjUhf7EZEfzmwObKneJIRdhg+RtsDyanDlvrIHOt5NIgMKmVzT6KM
	+P3+eBFcvHcW/T2mPd+HPFvHjKJ8lA==
X-Google-Smtp-Source: AOwi7QBNl3NGUBLcQjg4N5cITnHnQlawWUhlozcIk/EQAFFsvmuKpxaHGM1Ca8VGZb2257lN41m/Dq/SuYgVwjI86WA=
X-Received: by 10.31.231.1 with SMTP id e1mr10595951vkh.90.1505210287367; Tue,
	12 Sep 2017 02:58:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Tue, 12 Sep 2017 02:58:06 -0700 (PDT)
In-Reply-To: <1505209529.18640.15.camel@linuxfoundation.org>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
	<1505209529.18640.15.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 12 Sep 2017 11:58:06 +0200
Message-ID: <CA+chaQcH+Sk7G24o3SGSn=Yw=cvStUHXdU+LtC7A0wts0p9Uhw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v7 00/12] Revamp the Go support
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
X-List-Received-Date: Tue, 12 Sep 2017 09:58:06 -0000
Content-Type: multipart/alternative; boundary="94eb2c092d4e7dac000558fb14ca"

--94eb2c092d4e7dac000558fb14ca
Content-Type: text/plain; charset="UTF-8"

Interesting I've seen this issue only for PN-staticdev package
ERROR: QA Issue: go-dep-staticdev rdepends on bash, but it isn't a build
dependency, missing bash in DEPENDS or PACKAGECONFIG? [build-deps]

and the bash is already in RDEPENDS (the warning is shown in our builds,
because we use busybox as RPROVIDER for bash).

So maybe this file isn't always included? Or something else might be
non-deterministic.

On Tue, Sep 12, 2017 at 11:45 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2017-09-11 at 15:28 -0300, Otavio Salvador wrote:
> > This improves the Go support on OE-Core.
> >
> > We are trying to port as much as possible work done by Matt on
> > meta-golang back to OE-Core and also to avoid carrying old releases
> > as
> > there is no need to support more versions of Go toolchain.
> >
> > This fixes issues in existing support as well as add support for SDK
> > generation which supports Go.
>
> https://autobuilder.yocto.io/builders/nightly-no-x11/
> builds/471/steps/BuildImages/logs/stdio
>
> ERROR: go-dep-0.3.0-r0 do_package_qa: QA Issue: /usr/lib/go/src/
> github.com/golang/dep/vendor/github.com/pelletier/go-toml/test.sh
> contained in package go-dep-dev requires /bin/bash, but no providers found
> in RDEPENDS_go-dep-dev? [file-rdeps]
> ERROR: go-dep-0.3.0-r0 do_package_qa: QA run found fatal errors. Please
> consider fixing them.
> ERROR: go-dep-0.3.0-r0 do_package_qa: Function failed: do_package_qa
>
> Should be easy to fix hopefully!
>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c092d4e7dac000558fb14ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Interesting I&#39;ve seen this issue only for PN-staticdev=
 package<div>ERROR: QA Issue: go-dep-staticdev rdepends on bash, but it isn=
&#39;t a build dependency, missing bash in DEPENDS or PACKAGECONFIG? [build=
-deps]<br></div><div><br></div><div>and the bash is already in RDEPENDS (th=
e warning is shown in our builds, because we use busybox as RPROVIDER for b=
ash).</div><div><br></div><div>So maybe this file isn&#39;t always included=
? Or something else might be non-deterministic.</div></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Tue, Sep 12, 2017 at 11:45 AM,=
 Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linu=
xfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, 2017-09-11 at 15=
:28 -0300, Otavio Salvador wrote:<br>
&gt; This improves the Go support on OE-Core.<br>
&gt;<br>
&gt; We are trying to port as much as possible work done by Matt on<br>
&gt; meta-golang back to OE-Core and also to avoid carrying old releases<br=
>
&gt; as<br>
&gt; there is no need to support more versions of Go toolchain.<br>
&gt;<br>
&gt; This fixes issues in existing support as well as add support for SDK<b=
r>
&gt; generation which supports Go.<br>
<br>
<a href=3D"https://autobuilder.yocto.io/builders/nightly-no-x11/builds/471/=
steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://=
autobuilder.yocto.io/<wbr>builders/nightly-no-x11/<wbr>builds/471/steps/Bui=
ldImages/<wbr>logs/stdio</a><br>
<br>
ERROR: go-dep-0.3.0-r0 do_package_qa: QA Issue: /usr/lib/go/src/<a href=3D"=
http://github.com/golang/dep/vendor/github.com/pelletier/go-toml/test.sh" r=
el=3D"noreferrer" target=3D"_blank">github.com/<wbr>golang/dep/vendor/githu=
b.com/<wbr>pelletier/go-toml/test.sh</a> contained in package go-dep-dev re=
quires /bin/bash, but no providers found in RDEPENDS_go-dep-dev? [file-rdep=
s]<br>
ERROR: go-dep-0.3.0-r0 do_package_qa: QA run found fatal errors. Please con=
sider fixing them.<br>
ERROR: go-dep-0.3.0-r0 do_package_qa: Function failed: do_package_qa<br>
<br>
Should be easy to fix hopefully!<br>
<br>
Cheers,<br>
<br>
Richard<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c092d4e7dac000558fb14ca--
