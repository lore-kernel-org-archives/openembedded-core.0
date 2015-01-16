Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4179372858
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 11:18:25 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id l89so7095651qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 03:18:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/vxHW86awOSzSCgeE8buxGK5+tqZRhOzOcCmO/0g4ZU=;
	b=iBvqsNa6W41esJ5Lksk8bZLMFLdsZB8Y9yh/LECKh0HTfKaI1szExM8DpTtIbtKims
	uX/ir2BlLWXOScKKy2DOUKNRSvD9TgIGrpEpP130oiGGzlGevkxfq6ZdXRepdV7A8uTi
	KSUzj3CSeiWqPdUGod5XzQO60BfS/5M7qxNJjNNGEFO8dtvjbW9x6+2bdZB909RsolI8
	8INANYHni1Pa0WsmMeZd1gDJyxU0qGbomblvbh8wOfXutFzvk1+42C6bVcxudAKnT47v
	hCtOmzlDV+0jHpfUXtvdJdSFwvdE3wTwhP3/W9oHSSSIR5pN3b2BB213AJFn9GdD1Qfy
	bQjg==
X-Gm-Message-State: ALoCoQmBIvcTK6QUmzWsjytyz4XjQ9vZz+o5vnP9wuXCrK/obtH5AU/SqXFy9Z+z08ApS3yqOSr9
X-Received: by 10.140.39.167 with SMTP id v36mr22845201qgv.77.1421407105822;
	Fri, 16 Jan 2015 03:18:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 16 Jan 2015 03:18:05 -0800 (PST)
In-Reply-To: <20150115153328.GA2482@jama>
References: <1420737078-24121-1-git-send-email-Martin.Jansa@gmail.com>
	<20150115153328.GA2482@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Jan 2015 11:18:05 +0000
Message-ID: <CAJTo0LbLROGAtMsQ39X_12j7ujdnoOXFxK_U4OAx6k4xu7BC9g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: Fix support for private libs
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
X-List-Received-Date: Fri, 16 Jan 2015 11:18:28 -0000
Content-Type: multipart/alternative; boundary=001a11c12dd29fcbe5050cc3210b

--001a11c12dd29fcbe5050cc3210b
Content-Type: text/plain; charset=UTF-8

On 15 January 2015 at 15:33, Martin Jansa <martin.jansa@gmail.com> wrote:

> ping, please merge this to dizzy as well.
>

This is in my MUT but we've been stalling on merging anything into master
until the kernel builds are fixed.

Ross

--001a11c12dd29fcbe5050cc3210b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 January 2015 at 15:33, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":421" class=
=3D"a3s" style=3D"overflow:hidden">ping, please merge this to dizzy as well=
.<br></div></blockquote></div><br>This is in my MUT but we&#39;ve been stal=
ling on merging anything into master until the kernel builds are fixed.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a11c12dd29fcbe5050cc3210b--
