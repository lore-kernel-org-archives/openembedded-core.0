Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 99CAA77ABA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 17:52:01 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id w64so57915652wma.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 10:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c13Hzj5RTsXsyjat26fqe90qz7Yynz+8Z8kKmE793PY=;
	b=kyTClzxxBWBBIFodkNpJTZN7O+/6cdV1cdWwQE+DAerkXXkLFqv47y+RWxWJKD96+p
	zmFIpAtqWV1gFRQpJSrQg/w9/71dqwWBDezDCZWUaxhIRgi6Rs2W2JspFYglJPDukJHB
	97QTeGHNXIl5+40kZ4Y2drunWGWarbXIKpRTD2sUZ2wHS783wbXqOI38HM6Njctwj/cu
	SDacMRQlXHk41DFr/qAtXyKeWH59vfoSrMXiYqDZH9J1fqQ1zqVZFQK67RaSKTHvdIqb
	aRGPo4Y+oSZN9Yto9yTcOy73+0dshVnYtkW9As4iAQ7KBz7FrRq93rrFIQuvOYvaWzbJ
	K7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c13Hzj5RTsXsyjat26fqe90qz7Yynz+8Z8kKmE793PY=;
	b=hiwLduD2Vfw5Iz4pCM/AbABCJzKBE86xOk5TUp2lSzv3+LLo/UGyzHaqt/VuEiLNfx
	cj4dd3qzsHy03H6tV+lsW4898hWOg8q6SP7+7cAn/yQ52IaFwjCf5NQx3Ld/kLUzX6Sk
	fjwTb7SZE6Q6fgUNkzvMd9Mn32P2FceEM/53sVeFeeDURKg9VwBuslJby7N2ml6uWn0g
	ZnBBRXyoHNqh98NrHal2Rm+SrF25h9ZOJ0OoQOEcSFzWh/De8xaEmZrA9YLavhhHh3EN
	4hs/B11ermRrDL2d+uH7o3xooJONkOVzm7inZwV3w+4Sc0Gq+cxuXbb7dbAYgLPBNQjR
	YZhA==
X-Gm-Message-State: AN3rC/6XeBHDMKVLBk54sbFRnNreOFdhsZoBtDfj6GEnN60aJ7ODuy4X
	Lf2FTyZDeMYnNAu3jQHWvlfTFpe9+A==
X-Received: by 10.80.136.74 with SMTP id c10mr1816857edc.168.1493229122881;
	Wed, 26 Apr 2017 10:52:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Wed, 26 Apr 2017 10:52:02 -0700 (PDT)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B61194DCC6@ORSMSX112.amr.corp.intel.com>
References: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
	<CA+chaQfX1iYsYwqx4CMKuADmW75_VZStzZpdE-hw=ahtsDvdwg@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B61194BE74@ORSMSX112.amr.corp.intel.com>
	<20170426074212.GB3258@jama>
	<6E51916E4A1F32428260031F4C7CD2B61194DCC6@ORSMSX112.amr.corp.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 26 Apr 2017 19:52:02 +0200
Message-ID: <CA+chaQe4o+LKRV5voXOhoPoWEGjx2cmXedsagmQEgouAP6jMvQ@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Reproducible binaries
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
X-List-Received-Date: Wed, 26 Apr 2017 17:52:04 -0000
Content-Type: multipart/alternative; boundary=f403045c212a7015f4054e157f94

--f403045c212a7015f4054e157f94
Content-Type: text/plain; charset=UTF-8

What about passing the seed value (currently created based on last commit
in repo you're building from - which doesn't need to be oe-core repository
right?) to make it easier for people to pass whatever value works for them?
even some constant value in DISTRO config.

On Wed, Apr 26, 2017 at 6:43 PM, Bystricky, Juro <juro.bystricky@intel.com>
wrote:

>
> > But not for 2 different builds with slightly modified metadata (e.g.
> > just because top commit is different in whatever build repository you're
> > running from even when it doesn't have any effect in your image), right?
> >
>
> This may be addressed in the future. Presently, the goal is to ensure that
> if we
> use identical repositories we get identical results. This should not depend
> on the time/date, build folder or even Linux distro. By identical results
> I mean binary identical comparison of the resulting "deploy" folders.
> (images, packages, licenses). So for example, there should be no binary
> differences
> between the two images of core-image-minimal.rootfs.ext4.
> In your case (slightly different repos), the difference would be presented
> as different time stamps for /etc/version and /etc/timestamp only.
>
>
> > So it doesn't fix the files-in-image.txt differences as described in:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=5866
> >
>
> Eventually it will. There is still ways to go and this patch set is just
> the first
> kick at the can.
>
>
>

--f403045c212a7015f4054e157f94
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What about passing the seed value (currently created based=
 on last commit in repo you&#39;re building from - which doesn&#39;t need t=
o be oe-core repository right?) to make it easier for people to pass whatev=
er value works for them? even some constant value in DISTRO config.</div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Apr 26, 201=
7 at 6:43 PM, Bystricky, Juro <span dir=3D"ltr">&lt;<a href=3D"mailto:juro.=
bystricky@intel.com" target=3D"_blank">juro.bystricky@intel.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
&gt; But not for 2 different builds with slightly modified metadata (e.g.<b=
r>
&gt; just because top commit is different in whatever build repository you&=
#39;re<br>
&gt; running from even when it doesn&#39;t have any effect in your image), =
right?<br>
&gt;<br>
<br>
</span>This may be addressed in the future. Presently, the goal is to ensur=
e that if we<br>
use identical repositories we get identical results. This should not depend=
<br>
on the time/date, build folder or even Linux distro. By identical results<b=
r>
I mean binary identical comparison of the resulting &quot;deploy&quot; fold=
ers.<br>
(images, packages, licenses). So for example, there should be no binary dif=
ferences<br>
between the two images of core-image-minimal.rootfs.<wbr>ext4.<br>
In your case (slightly different repos), the difference would be presented<=
br>
as different time stamps for /etc/version and /etc/timestamp only.<br>
<span class=3D""><br>
<br>
&gt; So it doesn&#39;t fix the files-in-image.txt differences as described =
in:<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5866" r=
el=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.<wbr>org/=
show_bug.cgi?id=3D5866</a><br>
&gt;<br>
<br>
</span>Eventually it will. There is still ways to go and this patch set is =
just the first<br>
kick at the can.<br>
<br>
<br>
</blockquote></div><br></div>

--f403045c212a7015f4054e157f94--
