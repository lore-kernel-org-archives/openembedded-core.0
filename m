Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 89F0E791A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 15:20:11 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id v17-v6so992987qkb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 08:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=6TGXuGCYp9x0StfXanVo8eEmbYBKcZkAwonkBQn0+To=;
	b=T9XkyYYUAooVLyg/xWIiplNlFqHAPLqSjUDmx8QM4dUPgJ3BIsDy/Imptq0Lbh53SL
	+d23ZM+TLHE3uUGk7TVo8dVHanmw/6yOpUovZ5+nVeNpImVsfXNpUgBtIfwc51Mra27B
	ZRQFXNOatAR/RMc6hqFYv5JMAA0poAsnwQTZ5YmGPeKZREKohIFhRE01gBi3nETt+NBr
	zyPgHI51xl7YRhKl8AMbPb9WXnuVoulKbhiguWx+TeFMuZviOA4FJ1HtkwBfW3T4uCDb
	VxQyyX7h+9ErFaiVN82KuXsU7FtmzSzvyRHwO7NkrM3NvyccYuB3zZ77ZZykdHukIHBK
	ZzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=6TGXuGCYp9x0StfXanVo8eEmbYBKcZkAwonkBQn0+To=;
	b=rz0mpghYHHMrTff7Z2aMtLQt3eAqbCJf77TeDiprDfyNDvH75uJpS5klKFcl7TuvP0
	5pEiLgjPIEGI4U5ll7CFwF/lUNmMSMfepSpV2uuWwy06gDEfF7HfQxc4567Yz/Pg9G6e
	EvhteYMW272izzTKhI/SRIOnWcFLoV74jFRbwpw/16ZfFjpFR2s0soJpDagrS97g5OT1
	sBNF15lbGfGEW8yVPe1pJpbSJjRHJl/kMNV6ziFvhaxYWWd/B4LFRJV2iHOVppeY99z8
	zu7OQjxS6JRU4wJ9cCDFWQdj/ICKswGG4SqeS+iJexJ7YEl4+slway045WafjUN3yWFH
	thIA==
X-Gm-Message-State: AOUpUlGAOFjIpBD5aCzMKDfI0wHjLxTMaVEYBDBGckPpSLB3OcZelfrt
	EQ3RXh0Ym8fiAOKI05ab2zPkokVdChkxKesFPnf9VDBil3E=
X-Google-Smtp-Source: AA+uWPyUbikpqeoNCaQWX7JM6g04R8o4akwe/r1Dt2OVv4REhW6DEwU11z/E8kB7Hyn/xlA62IfVLyx1UwnHznvXJII=
X-Received: by 2002:a37:c65c:: with SMTP id
	b89-v6mr23934273qkj.421.1534346412382; 
	Wed, 15 Aug 2018 08:20:12 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Wed, 15 Aug 2018 17:20:01 +0200
Message-ID: <CAGCTLNQnjVfwZi71npxavTHPLbxRi04DsLB-SK+kNr5ovEYe_A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: running qt5 apps on wayland image without x11
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
X-List-Received-Date: Wed, 15 Aug 2018 15:20:11 -0000
Content-Type: multipart/alternative; boundary="000000000000df5ec205737adcf7"

--000000000000df5ec205737adcf7
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to run qt5 application "Qt5-cinematicexperience" on my custom
image
I faced the following error :
----------
This application failed to start because it couldnt find or load the
Qt pltform plugin "xcb".
Available platform plugins are : eglfs, minimal, minimalegl, offscreen.
----------
I removed x11 from the image and added wayland & weston instead.
I found that "xcb" is one of the features that should be added to
PACKAGESCONFIG in case of using x11.
so the Error is logical but how I makes qt5 app work with wayland ?

Thank you,
-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

--000000000000df5ec205737adcf7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I am trying to run qt5 a=
pplication &quot;Qt5-cinematicexperience&quot; on my custom image</div><div=
>I faced the following error :</div><div>----------<br></div><div>This appl=
ication failed to start because it couldnt find or load the <br>Qt pltform =
plugin &quot;xcb&quot;.<br></div><div>Available platform plugins are : eglf=
s, minimal, minimalegl, offscreen.</div><div>----------<br></div><div>I rem=
oved x11 from the image and added wayland &amp; weston instead.<br></div><d=
iv>I found that &quot;xcb&quot; is one of the features that should be added=
 to PACKAGESCONFIG in case of using x11.<br></div><div>so the Error is logi=
cal but how I makes qt5 app work with wayland ?</div><div><br></div><div>Th=
ank you,<br></div><div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>=C2=A0<br>Mohamed Dawod<br></div><div>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div></div></div>

--000000000000df5ec205737adcf7--
