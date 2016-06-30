Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id BC96C60119
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 18:47:19 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id f6so77202969ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 11:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mUXobEAv731g2dSHCknJenbgsgahUdT8lCueidMFWY8=;
	b=EKCJRHdQYbbYJpDIYNDkWw/xWssSG2crK8SD0k0BF7Q+D9ei3Xq+E3DuPA4K7CiZsj
	IV7VnGUXHO8//Cr2QtbuldVefmOuCwmDzeIulGDCWwr2WoqhIHn9AlKqV3klMS/jKVoG
	ZmaZGkP1E9R1unJjW9prP8++weuR85tlBSK0D+Ov7rNkql2516peHSskAXJYc++hVxsJ
	pXtHt/uot/OKuom4MGUPCimoIqjVuGMUDR3ycCyUDPtY1mTyXKgu2KzKzYz5Xo5KpBWe
	s4AoHEFL/2+k4d7u2GEzNQUgDbPQ0wNsPpjO7c2pJ1L5g1PygGMG/gojyPTCOrfD67en
	1lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mUXobEAv731g2dSHCknJenbgsgahUdT8lCueidMFWY8=;
	b=AeUmgPg8YZ0C1LdKEjzkBD/TFZx4aqS6MJm4oTdKHyftBvtEwXFbkAqn1oXhE5oMfI
	nSUnKnkM4z+yUvvwy7HLRPV9YpCaZCaJ1vH5pkXG4ip4y+pE4S53Az4pxxMYsCV78DKL
	0oDfrYnsqQCFKzMEEBljtSd5U4/4oc1JHuEJfvz25Zcl5UAyI+gX1h3xmqzlwjwPtFHV
	jKcX/V+pQ++ihP9t+YImyBWotJycxZmznl5+zJ7LVZo3POuYh4TJm5q407Zmc3knJhvE
	UNEN0qOGPJouESEFXBvw9gduehiti7kwkgwVfL+JMpsjZj2BhC086BxsClPzNd+UCTAG
	LEMw==
X-Gm-Message-State: ALyK8tJ6L1tt34YTxzDrvZju5dSLdbIHyNOnOaEA85B6PN2iuWv3mEMgBFaMJEtnmWXZCN6upqjM+4+tnp0Taf+p
X-Received: by 10.36.120.71 with SMTP id p68mr28004437itc.22.1467312439974;
	Thu, 30 Jun 2016 11:47:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Thu, 30 Jun 2016 11:47:00 -0700 (PDT)
In-Reply-To: <1467306469-15442-1-git-send-email-michael.davis@essvote.com>
References: <1467306469-15442-1-git-send-email-michael.davis@essvote.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Jun 2016 19:47:00 +0100
Message-ID: <CAJTo0LYPJ8_d2fyPtUqaiFNhGd7RyN9ToQQ5eDBSnpD8g9oU4Q@mail.gmail.com>
To: "Davis, Michael" <michael.davis@essvote.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: do exact match for rootfs type
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
X-List-Received-Date: Thu, 30 Jun 2016 18:47:20 -0000
Content-Type: multipart/alternative; boundary=001a114a9388c27ee90536834c73

--001a114a9388c27ee90536834c73
Content-Type: text/plain; charset=UTF-8

On 30 June 2016 at 18:08, Davis, Michael <michael.davis@essvote.com> wrote:

> Do exact match for rootfs type, instead of pattern match, to avoid
> unexpected build error due to redundant rootfs type build.
>

This is already in oe-core master (as is hinted at my the "from OE-Core"
tags), so was this meant to be a backport request for a particular branch?

Ross

--001a114a9388c27ee90536834c73
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 June 2016 at 18:08, Davis, Michael <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:michael.davis@essvote.com" target=3D"_blank">michael.davis@essvote.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":bno" =
class=3D"a3s aXjCH m155a249941dd32fa">Do exact match for rootfs type, inste=
ad of pattern match, to avoid<br>
unexpected build error due to redundant rootfs type build.<br></div></block=
quote></div><br>This is already in oe-core master (as is hinted at my the &=
quot;from OE-Core&quot; tags), so was this meant to be a backport request f=
or a particular branch?</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a114a9388c27ee90536834c73--
