Return-Path: <skrishnakar@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0F89E6078E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 05:39:00 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b4so3819919wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 22:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=h0sPcXW+mV1D2BKYeCYsPUUddA+FjltIuk5FVIJdJPo=;
	b=vtZycZTdI7Uwnu8yyEtIeBdJbVogU/+q8GIIYJLmgWjnlDHw99GJgwlcgKQ8HOMxJG
	qXYJBOJ8sYRw/Pc5qKUUOkml08MfKfxP7LA2FzH8SHC682SZ1laRLRM+gfCAZqAzS06k
	2659anTRAFiETuFypau3LofPTD+vvmYDZ/CMR8BZO5aOlYctCsuYCOrXC5x5dGe4v40P
	yBrK87qc/7O2iYAPZeX+kYfe60nnBoUWwmez5d5YiONZvgJ23bCN1syRYrhpCwALbRei
	zYKfC4GksnaQLe8ecc3+Ylwm3J7Jn6tmN5QTvRg/9Zc0mf+lPmFzG4GTFcHixH/UCXdM
	WWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=h0sPcXW+mV1D2BKYeCYsPUUddA+FjltIuk5FVIJdJPo=;
	b=T72YMdURhXPLtezlJOQJ6LDrLg/ZlaM0XFHMq4pKBWzlD8jio81vBlB7JWWEAyNRa8
	+iNsM2icxPjPxFqHJn7twqgi66MGIH7AD2Z57pAMByAl0RoBgliURnGjMATMUczBS0/Y
	DnnPvGrfkRwjUszOQGjQxKRi9IWAo3M+ZJptUvmhqBxRqnc+IdHLji+5a56IBJ15ChQQ
	xTzi1UmJDyJaeqjH7n/6lqHreGZGoGVWcEn5I95sCSy6f6JAcpm0ZnP5eUEbaVFjItxO
	10LWUG4bHdlm5no6FdhDhU0yqnalkex7EbsKI18OHf8ATM231yQ8as9aQ7QpcpUSy9hw
	teEA==
X-Gm-Message-State: AA6/9Rmm3tX2/oH/C/3d9iEUf8Pyqv0I0npJYtE8+LkeZsxTHJ80WHjz3M21kPCrQUDnBQpMQMNgiiGduIJAPg==
X-Received: by 10.28.141.6 with SMTP id p6mr898659wmd.110.1475127541185; Wed,
	28 Sep 2016 22:39:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.34.212 with HTTP; Wed, 28 Sep 2016 22:38:20 -0700 (PDT)
From: srikanth krishnakar <skrishnakar@gmail.com>
Date: Thu, 29 Sep 2016 11:08:20 +0530
Message-ID: <CALDxG5jveoshv5wXMZFFJOgprMOAOwARG4xXwQ+gNO8kFmvzuA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Psplash on Systemd with progress bar
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
X-List-Received-Date: Thu, 29 Sep 2016 05:39:01 -0000
Content-Type: multipart/alternative; boundary=001a1146e11e174614053d9ee52f

--001a1146e11e174614053d9ee52f
Content-Type: text/plain; charset=UTF-8

Hi All,

Yocto version: yocto-2.1
Target: ARM imx6
Graphics: X11 (core-image-sato)

I am trying to use psplash with systemd and have come across the service
files prepared by Eric:

http://lists.busybox.net/pipermail/buildroot/2014-May/097233.html

Although the splash comes up for a split second and vanishes on my imx6
target it never stays till desktop appears nor it displays any progress
bar. I read Eric mention about patch to systemd (src/core/manager.c) to
write progress data to psplash socket but I couldn't find the patch. Can
anyone point me to the patch for systemd that writes progress data to
psplash socket so that I can see progress bar and while keeping splash
alive till desktop shows up ?

Thanks in Advance!!

--001a1146e11e174614053d9ee52f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>Yocto version: yocto-2.1</div><=
div>Target: ARM imx6</div><div>Graphics: X11 (core-image-sato)</div><div><b=
r></div><div>I am trying to use psplash with systemd and have come across t=
he service files prepared by Eric:</div><div><br></div><div><a href=3D"http=
://lists.busybox.net/pipermail/buildroot/2014-May/097233.html">http://lists=
.busybox.net/pipermail/buildroot/2014-May/097233.html</a><br></div><div><br=
></div><div>Although the splash comes up for a split second and vanishes on=
 my imx6 target it never stays till desktop appears nor it displays any pro=
gress bar. I read Eric mention about patch to systemd (src/core/manager.c) =
to write progress data to psplash socket but I couldn&#39;t find the patch.=
 Can anyone point me to the patch for systemd that writes progress data to =
psplash socket so that I can see progress bar and while keeping splash aliv=
e till desktop shows up ?</div><div><br></div><div>Thanks in Advance!!</div=
></div>

--001a1146e11e174614053d9ee52f--
