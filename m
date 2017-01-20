Return-Path: <ross.burton@intel.com>
Received: from mail-yb0-f182.google.com (mail-yb0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id EDC39719AA
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:30:44 +0000 (UTC)
Received: by mail-yb0-f182.google.com with SMTP id j82so53526637ybg.1
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 05:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z5X/A/1QzXUYDRLIBrFRt0XIkawn2kwzHJBWeFpSPe4=;
	b=xLi35FT1CfWTjIgDuqExPXP469g/UV5vCaBs8Ag4hHjEMzh40/YPMgUSduK5VksKOO
	dA8C45OZ6jCe9TsYlh3KDYSfRO0Sy0PpMMwPuMAeR8K7ph8JrQ2ifYQkaDXRe1GIlDze
	wdrePTGOSwgd0+oKZDfE5FmZi9C/JM3BHp5Uk5cKOrRJsKk7OFVLv8DYb5M+nS0doo4i
	JjySCcVw2jx13h1ofUTgZpgYPf2xvkUXZ9s4bV9J3kOF0mjn+/uU68iUMx9J542pBP53
	9uG/88/mG4J+SbZAna4MH7j4V1fdp4dzccGLDXzZuKNS+bfyGynnA7l/iPy2Gu7BqqXY
	QNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z5X/A/1QzXUYDRLIBrFRt0XIkawn2kwzHJBWeFpSPe4=;
	b=Q0sWdiaxrrQi21ygWbTJuQSfydEAF/ZsAgCPCbEOCipeReOyGbcIi40Lb/wx5sh9DW
	tijmWb4fzKL3gM13hMMRfdlyt7YtFnqYiZUAnKt5izuWAKwunVFL/oo0Ns7rl7NvQpf1
	Vfu7REenQ8DhqMg0Yd/yqfOmTW41jUnnw6GK8GhIx9pEy9A0Ga6ZeOkJODcdi1sYliLs
	uk7os5sAoqFqzfChfNbRNDxq4esSaOPLHVf8PaoREgOu2L9S86HKzmLK/v2qIlnqJIAR
	8y0MyT+knr4tbVbLrlFSkZF58ZWYxQft2SCebu88wz6E+qyyziv1WnbuM+3griahtvUP
	sOqQ==
X-Gm-Message-State: AIkVDXJ1vzldTAU7zD3c/COq2r63BvqVAwGZGVuQUQxKW9auHwUKwrKMMYK0uTcGy3gtVJI3UNRTIEFKl9+oJ5M0
X-Received: by 10.55.31.24 with SMTP id f24mr11881939qkf.221.1484919044894;
	Fri, 20 Jan 2017 05:30:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 20 Jan 2017 05:30:24 -0800 (PST)
In-Reply-To: <20170120132920.GA8341@mbabyjoh-desk.ger.corp.intel.com>
References: <20170119211441.126457-1-jason.wessel@windriver.com>
	<20170119211441.126457-2-jason.wessel@windriver.com>
	<f97e0ddf-dd9d-06d3-831c-fa47349a1e66@windriver.com>
	<20170120132920.GA8341@mbabyjoh-desk.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Jan 2017 13:30:24 +0000
Message-ID: <CAJTo0LaFMD3cFHR2d_1W4pM3cy7ekhM21UpBRz_Ec+C4tYigQQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Revert "kernel: Modify kernel modules installation path."
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
X-List-Received-Date: Fri, 20 Jan 2017 13:30:45 -0000
Content-Type: multipart/alternative; boundary=001a1147e2ba310adf054686a843

--001a1147e2ba310adf054686a843
Content-Type: text/plain; charset=UTF-8

On 20 January 2017 at 13:29, Maxin B. John <maxin.john@intel.com> wrote:

> > The issue here is that in a multilib build the ${base_libdir} is
> resolving to /lib64 which completely breaks some tools that fully expect
> /lib/modules to be a fixed location regardless if the target is 32/64 or
> something else.
> >
>
> I would expect the kernel to be ok with this change if we provide the
> kernel command
> line parameter: "firmware_class.path=${base_libdir}" or similar.
>

I believe that using nonarch_base_libdir is the proper fix here, we need to
understand why this didn't just work.

Ross

--001a1147e2ba310adf054686a843
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 January 2017 at 13:29, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; The=
 issue here is that in a multilib build the ${base_libdir} is resolving to =
/lib64 which completely breaks some tools that fully expect /lib/modules to=
 be a fixed location regardless if the target is 32/64 or something else.<b=
r>
&gt;<br>
<br>
</span>I would expect the kernel to be ok with this change if we provide th=
e kernel command<br>
line parameter: &quot;firmware_class.path=3D${base_<wbr>libdir}&quot; or si=
milar.<br></blockquote></div><br>I believe that using nonarch_base_libdir i=
s the proper fix here, we need to understand why this didn&#39;t just work.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a1147e2ba310adf054686a843--
