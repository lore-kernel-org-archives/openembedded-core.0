Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 469B16E627
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 13:00:41 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id w8so33631582qac.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Feb 2015 05:00:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=O8waF653wlPai2MStrmNt1wmDuTSubUuqouBp5W/Nx4=;
	b=mEpfS0sPPJCzuPIy9xQXNKFTfqGQ5CYO1bJtsJPuNmu77LayDmU3822zHdIyfdAkZf
	S5KYxK5bgLSB/TPVXo/TXG2QIoBZxPOIGLk6ytOC+B1YUOKuGb97znCju5skOewOnFNL
	mi+/bZKcBKyuGrusiVUrHyjaN/ZnqDihn+N4LIHncAn7Myj2TUCVbapvu1fCXTCB/qc2
	mEjaItqRhuCmaXq/gheS/xJ9g6+yZhymIucPvG2RHWGi8pgkLQo/BGzCbs6ObeqDL78s
	VAf3xG+TclcY+j+HY6ka8nCI3kXh+lgdlBVSPvu3ZdTxUygoJfo2miK0eIsxgMR1prsk
	6j8Q==
X-Gm-Message-State: ALoCoQlHR/HdArdx9gCdJ9aBcALJh0n+rNFL7MkfjJIYfuOv4i/WpRoI77RaG3AzftnkPdajeQYW
X-Received: by 10.224.24.132 with SMTP id v4mr53191146qab.17.1422968434833;
	Tue, 03 Feb 2015 05:00:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 3 Feb 2015 05:00:13 -0800 (PST)
In-Reply-To: <CAP9ODKorL58Y=bAxv39bz+CFBmJqxbtxtgZbA92=8q8nHL2Mow@mail.gmail.com>
References: <1422873041-19803-1-git-send-email-florian.boor@kernelconcepts.de>
	<CAP9ODKrSVAaspV7pv+s-eVuhjf3ptFuO-+qc+johEYQbpGaPFg@mail.gmail.com>
	<54D0C0B1.1090500@kernelconcepts.de>
	<CAJTo0LZxw5LV55fi9QA6X=vgM4UrZ-LtHXqp2KuMEVmGffgNiA@mail.gmail.com>
	<54D0C433.50705@kernelconcepts.de>
	<CAP9ODKorL58Y=bAxv39bz+CFBmJqxbtxtgZbA92=8q8nHL2Mow@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Feb 2015 13:00:13 +0000
Message-ID: <CAJTo0Lb+NmyRvMw=CH0TKF-EfCeen3khOut3iSEvsckmrQV8nw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Use bb.warn instead of bb.error for deprecation notification.
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
X-List-Received-Date: Tue, 03 Feb 2015 13:00:47 -0000
Content-Type: multipart/alternative; boundary=001a11c2b49e15d81d050e2ea8a6

--001a11c2b49e15d81d050e2ea8a6
Content-Type: text/plain; charset=UTF-8

On 3 February 2015 at 12:53, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> > last time I checked (some days ago) it was not necessarily fatal. I was
> able to
> > build complete image collecting a pile of PR_INC errors. That's what
> confused me...
> > I'll check if I still have the log on another machine later.
>
> Florian has a point here. We should use 'bb.fatal' and abort all build
> as soon as possible.
>

Its an error in a specific recipe, so why should that abandon the build
immediately?

Ross

--001a11c2b49e15d81d050e2ea8a6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 February 2015 at 12:53, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.=
br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""=
>&gt; last time I checked (some days ago) it was not necessarily fatal. I w=
as able to<br>
&gt; build complete image collecting a pile of PR_INC errors. That&#39;s wh=
at confused me...<br>
&gt; I&#39;ll check if I still have the log on another machine later.<br>
<br>
</span>Florian has a point here. We should use &#39;bb.fatal&#39; and abort=
 all build<br>
as soon as possible.<br></blockquote><div><br></div><div>Its an error in a =
specific recipe, so why should that abandon the build immediately? =C2=A0=
=C2=A0</div><div><br></div><div>Ross</div></div></div></div>

--001a11c2b49e15d81d050e2ea8a6--
