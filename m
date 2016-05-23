Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5B75E601A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 18:36:42 +0000 (UTC)
Received: by mail-ig0-f195.google.com with SMTP id c3so5856294igl.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 11:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=BuHFKF9san3/wVoZysFL6kTO+A0lBN4QrrqZUO8Je6o=;
	b=v6n1L40/7Cy33Ga6oBASWF2a3llNdE9gEnXmGczotCd6jm6FM8L/M/av/mC8Hoe+1h
	bIgqCOjqeKy4nH3uFxXfW253ZbA6Y4dgynSp6VrQELefWC1UCMl3tsHEK1scbcqi114f
	tgQEYla3Ch9BxHVhHSofyi3FLaS+k/bHZcQ0iFOcMqTN84/MwpKf6gpOiDRSVcJly9uM
	sKEWuu2tL5bmNYLiZtZEUtInXmEWU87rrRXbl7DbhKcsI1DuSuG6KVQchsY8VRZHDlTV
	VgVbZxn10NxI6Ov4krqiYajuA3E7lGR/xuXggqlmRkYAT0aBfIgwxmO7hCnKskbX6WvM
	hvcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=BuHFKF9san3/wVoZysFL6kTO+A0lBN4QrrqZUO8Je6o=;
	b=HFBca4w3og88q0EpLTSikx9knV5RnlNaGaatfYK23T6g1IJXeGrn7PhR5azcKeZu0G
	AUURgNUbdPZ8ZTcKmaEn4wGbn4B/Mj/hLoyhAQO62C7c/rXgUZq48aWuZUEdjKDT4P/s
	6HypgrWm1In1IqBQCvMdGrOpepTs7e6mUgrUBDYLER0FZcgixw1b380OZl564g3XXNFQ
	aThpbxOK9G/ESNYRyxF1lXhevUw27+YPlxME0XckrvY+BHU5bGMO0PrkgEK3C+JsnTSi
	d2Qt6NPjEo7aHtaWtOQFWm497/xXTiIdLoQ2nZYX68EMa22wvjO3qaZLsANvBH50cSFE
	K09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=BuHFKF9san3/wVoZysFL6kTO+A0lBN4QrrqZUO8Je6o=;
	b=DDNKCZzfvVaNH/Rd4k11gD5fS/E+ZMbyS2fkolTc8Y6gClShWoJhW7vwZXst8fSoq7
	0kNJmRjRqy8D8m8muaEObtR5c+dg1akkeL+5Itwi9l11pYASRN0iQdE+pjGyQtGVYMIu
	TPAoQLc5gVYB++WAC3JqICbp+vyws+FbwWeYkFIZzfd84rj7PjH/jh9CSMLrLVXtXW0p
	uYEVJ7g6RrXrWgeheMwbQm8CXs4oCPl165XTnw962D3RditR8MigrYcKj1DCc8lPIHQh
	xdIa0ELXYwfGhDa2YSCwX/lF5YgjW61rTyrSlP1yS5a8UYxdoqqzhe6czwMYIDHUa4Lp
	z7JQ==
X-Gm-Message-State: ALyK8tIPnPp+D2nY5ShVlBOQz31olAQJRsztDsRO+8H7lPemGdgRyhwx+ppMKkwymRFWXBJJ4SohBrhODLOFGw==
X-Received: by 10.50.111.36 with SMTP id if4mr8869586igb.20.1464028602418;
	Mon, 23 May 2016 11:36:42 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Mon, 23 May 2016 11:36:23 -0700 (PDT)
In-Reply-To: <1461870393-3545-5-git-send-email-dv@pseudoterminal.org>
References: <1461870393-3545-1-git-send-email-dv@pseudoterminal.org>
	<1461870393-3545-5-git-send-email-dv@pseudoterminal.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 23 May 2016 11:36:23 -0700
X-Google-Sender-Auth: dN1PTj9ZdeoyNTKVzxRhOwPGUY8
Message-ID: <CABcZANm+312ETxgrpkuO9OcAubc7UC6AwoXvVcUDu7_5TbLdPw@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 5/8] gstreamer1.0-plugins-bad: upgrade to version 1.8.1
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
X-List-Received-Date: Mon, 23 May 2016 18:36:44 -0000
Content-Type: multipart/alternative; boundary=089e01494e7cc9d2fb053386b886

--089e01494e7cc9d2fb053386b886
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 28, 2016 at 12:06 PM, Carlos Rafael Giani <dv@pseudoterminal.org
> wrote:

> 0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch is a
> backport, and is no longer needed.
>
> configure-allow-to-disable-libssh2.patch got replaced by a patch that does
> the same thing but has been submitted.
>
> Vulkan is disabled for now since libxcb alone is not enough - the Vulkan
> headers and libraries are needed as well.
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>

It seems this series was applied to oe-core, but incompletely. This patch
specifically wasn't applied, so gstreamer1.0-plugins-bad is still 1.6.3 in
oe-core. Would you mind checking to see which patches in this series were
actually applied? Thanks!
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01494e7cc9d2fb053386b886
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Apr 28, 2016 at 12:06 PM, Carlos Rafael Giani <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:dv@pseudoterminal.org" target=3D"_blank">dv@pseudote=
rminal.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div cla=
ss=3D"HOEnZb"><div class=3D"h5">0002-glplugin-glwindow-fix-memory-leak-of-n=
avigation-thre.patch is a<br>
backport, and is no longer needed.<br>
<br>
configure-allow-to-disable-libssh2.patch got replaced by a patch that does<=
br>
the same thing but has been submitted.<br>
<br>
Vulkan is disabled for now since libxcb alone is not enough - the Vulkan<br=
>
headers and libraries are needed as well.<br>
<br>
Signed-off-by: Carlos Rafael Giani &lt;<a href=3D"mailto:dv@pseudoterminal.=
org">dv@pseudoterminal.org</a>&gt;<br></div></div></blockquote><div><br></d=
iv><div>It seems this series was applied to oe-core, but incompletely. This=
 patch specifically wasn&#39;t applied, so gstreamer1.0-plugins-bad is stil=
l 1.6.3 in oe-core. Would you mind checking to see which patches in this se=
ries were actually applied? Thanks!</div></div>-- <br><div class=3D"gmail_s=
ignature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - Bit=
Bake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Eng=
ineer, Mentor Graphics</div>
</div></div>

--089e01494e7cc9d2fb053386b886--
