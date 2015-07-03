Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id E814F6AB9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 09:13:52 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so69150070qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jul 2015 02:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=139Lz3e+XWPdcMDEl4jAFaKlafVoSszpNRTOe+teFPk=;
	b=iUtXyqj7u9oKIA2XbW1nU4drKHpdlVu89GHrMPBklk8j0mzBGm5K5b4/jNLa1FE7hY
	UHPSVANG/5PAq7IwTC5ePMzUDM3f90fAT7uNw3n56whVsHKa+uSjmCwFLMeKFA0Z0t4L
	xyCbsVidjay4GoY7YC4hKilCUDQb4qtSvbkLHd13xBf/1y1XiyPgu5nT0rpwL0gmr1Qg
	EC1UGNb6ZDE+YseQGnnBviIRETateck7283f5SE7qKcFOnp783IlPTBy3ghGGG8JKupA
	8tfD2ty2DcMAYk6/PWp0+bYIifiNPYiE69QK09sfo5VHHl067gp4cbXtOJDZuVpNZm0P
	YndQ==
X-Gm-Message-State: ALoCoQnkh9en0Y4j2wC2zdXHhNg/7CCqoTWNwYCYFzA5xZLOFqfcHMwf60ISQsQpKHJsnTflD1Jh
X-Received: by 10.55.18.197 with SMTP id 66mr53132291qks.13.1435914832344;
	Fri, 03 Jul 2015 02:13:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 3 Jul 2015 02:13:32 -0700 (PDT)
In-Reply-To: <20150703090405.GA2436@jama>
References: <1435737141-31961-1-git-send-email-jackie.huang@windriver.com>
	<CAJTo0LacneDbjFJR+uPQs__cqx+FVwXEuyCXe5zVui+Gu9tbpg@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAF11F6D32@ALA-MBB.corp.ad.wrs.com>
	<20150703090405.GA2436@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 Jul 2015 10:13:32 +0100
Message-ID: <CAJTo0Lbdq1=ZgX5VQApdvhDfX1uF3MkT0sD_MXfQr3coN18t1A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xorg-proto-common: allow the empty package
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
X-List-Received-Date: Fri, 03 Jul 2015 09:13:54 -0000
Content-Type: multipart/alternative; boundary=001a11474faa828c920519f4f9ec

--001a11474faa828c920519f4f9ec
Content-Type: text/plain; charset=UTF-8

On 3 July 2015 at 10:04, Martin Jansa <martin.jansa@gmail.com> wrote:

> I as a customer would definitely prefer error message even later in the
> build then getting completely useless empty package installed in my
> image and blame you for installing it when I was expecting to find
> bigreqsproto in my rootfs.
>

Agreed.  Installing bigreqsproto and not getting anything is far more
annoying than the error and following epiphany that if you want the
development headers for bigreqsproto you should install bigreqsproto-dev.

Ross

--001a11474faa828c920519f4f9ec
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 July 2015 at 10:04, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mail=
to:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":fg" class=3D"a=
3s" style=3D"overflow:hidden">I as a customer would definitely prefer error=
 message even later in the<br>
build then getting completely useless empty package installed in my<br>
image and blame you for installing it when I was expecting to find<br>
bigreqsproto in my rootfs.</div></blockquote></div><br>Agreed.=C2=A0 Instal=
ling bigreqsproto and not getting anything is far more annoying than the er=
ror and following epiphany that if you want the development headers for big=
reqsproto you should install bigreqsproto-dev.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11474faa828c920519f4f9ec--
