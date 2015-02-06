Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7C0D76AC12
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 13:00:45 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id b13so11560072qcw.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Feb 2015 05:00:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QxxN4F4Qfjs+tAXQ/U9svcdz9yAcKz2lffqtIUIibuY=;
	b=DtKfFdhy9WR6Qmfk90DWct6M496EDtYkmZHlQZ7JlrlHSEzgmM5dg8oBMA9OUGeuH4
	+VrozbOTBROiyS9SjROlYPYOVqSLxp/LswWO0GrlzsTmBwZRzrcYbAOey6g75rvEZWzj
	lAmcESR8kT+kO19u7v/xJ8OH6po7FyPemyikmaL7cohEwH9CJA6v/KWPw94vwPLJNmRM
	2b+qkHZEGcU1DyND83D8ejmAALdNsluHUgHAi/mw41XClE/4Wg/71noaQHeByhsDGAGL
	2EUXMtzvhwsDVQc17SypCwqITHI7nOTKnvqkvM64y6VM0uZ5hVOos3A0ktZPko4yuJlK
	ehbQ==
X-Gm-Message-State: ALoCoQlUbJ5akPKkvjV63qmdTtfd5xfTctMnLxGaKEywMbzaCBqyh9LBM6wDo3OZ5Xkxr3KVd4gq
X-Received: by 10.140.92.161 with SMTP id b30mr7417622qge.59.1423227646074;
	Fri, 06 Feb 2015 05:00:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 6 Feb 2015 05:00:25 -0800 (PST)
In-Reply-To: <1422850757-1371-2-git-send-email-raj.khem@gmail.com>
References: <1422850757-1371-1-git-send-email-raj.khem@gmail.com>
	<1422850757-1371-2-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Feb 2015 13:00:25 +0000
Message-ID: <CAJTo0Lb=GQ+pdDJcTMo7UPSy_mv89yHD=k=UG2F7At1oXSQuHQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: Upgrade 216 -> 218
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
X-List-Received-Date: Fri, 06 Feb 2015 13:00:52 -0000
Content-Type: multipart/alternative; boundary=001a1139baf04788ef050e6b02bc

--001a1139baf04788ef050e6b02bc
Content-Type: text/plain; charset=UTF-8

On 2 February 2015 at 04:19, Khem Raj <raj.khem@gmail.com> wrote:

> Remove upstreamed patches as well as patches which arent needed anymore
> since features are dropped from systemd e.g. userspace firmware download
> Tested on qemux86
>

I just tested this on my NUC and noticed that journalctl isn't reporting
any logs *at all* (core-image-sato, intel-corei7-64 BSP).  Do you see this
too?

Ross

--001a1139baf04788ef050e6b02bc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 February 2015 at 04:19, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":6cu" class=3D"a3s" sty=
le=3D"overflow:hidden">Remove upstreamed patches as well as patches which a=
rent needed anymore<br>
since features are dropped from <span class=3D"il">systemd</span> e.g. user=
space firmware download<br>
Tested on qemux86</div></blockquote></div><br>I just tested this on my NUC =
and noticed that journalctl isn&#39;t reporting any logs *at all* (core-ima=
ge-sato, intel-corei7-64 BSP).=C2=A0 Do you see this too?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1139baf04788ef050e6b02bc--
