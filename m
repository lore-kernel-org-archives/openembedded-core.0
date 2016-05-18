Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 222FA700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:09:52 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id i75so71398842ioa.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uuMvHg9brviWlvhmqtLV7nl8zw8wCyVFFW3Mg/2iFZQ=;
	b=gth3GPLY+WrMgRGpO8q9x/NrI9rzU6DtIJ/dd5eOXNZie9GWbT5DmzJqGulXBLjq2k
	QBZDFAiTaAQjnc0ySHQLud3e/ccqCrB79Cjz7r4RM6HhDblolPMSYo6GzmDoV4yhHyay
	9pzRdqmQiGzoszsFMzfbJiJbfRBVHwA6UE6IauoB0kRWZrOQGADQjyKCFR8Vvm8kk4p8
	UrNpFJ/2Q07HxluFRrhgwO8vxmKoPZl/MewjEE1cvp9piMSFh2Fa3mXJC1BXKyIBpzGI
	1/ce/mdqTjeJuqysZtWGZyi7MnWGZYMQ4gXn/7zvJXGv34ke+o2b83q0IYt7p8sruybK
	i8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uuMvHg9brviWlvhmqtLV7nl8zw8wCyVFFW3Mg/2iFZQ=;
	b=EGWq+aicFkWD9shHddFqxYvasNZ50k3nF4XGjnrx6855hoRLcXjtPXRt/dXUlhR3/y
	0E9VD2Xp67i+Yus/zUYq/1JPvGlai0v8LjA3O7qlCk2PJKmMmXbHjY4niwENlYjZG96M
	yjS4C1p09i9g5ZLiR5H6vU1eaQcC3yH8bBwE86G+HV3X6mhF3dLuXxoZIM7Y+G+nTZeX
	Wi8mF7/l8w6ofaVQLUSZve6tLmnhHVgaxhLlwrZwF/pMpOt73yd4IM4Ip2zWCO5pK52p
	kiLjqmBbJtZxUfFrOtHmNI7v90GEI3pjz02fSKUwvdrjj+OATrbTWezfuGPGDA2eJWvh
	dm1Q==
X-Gm-Message-State: AOPr4FVZjciCZmHBC53lKw0FBMo/lEOT+AxgzMRLIdyMhkJJjdqJsjVjOv1/sw9Dkx8EQvKJOznNLn+EGviulJA3
X-Received: by 10.36.246.197 with SMTP id u188mr18530254ith.22.1463587793191; 
	Wed, 18 May 2016 09:09:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 18 May 2016 09:09:33 -0700 (PDT)
In-Reply-To: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
References: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 May 2016 17:09:33 +0100
Message-ID: <CAJTo0LYH--q9_OpnP=jUveQ2GiNP_3sHQ6czYQeG=AxmH=nF3w@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: prabhu.sundararaj@nxp.com,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: Re: [oe-core PATCH v7 00/13] Improve Weston and Xwayland integration
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
X-List-Received-Date: Wed, 18 May 2016 16:09:53 -0000
Content-Type: multipart/alternative; boundary=94eb2c04732082d6180533201627

--94eb2c04732082d6180533201627
Content-Type: text/plain; charset=UTF-8

On 17 May 2016 at 17:36, Otavio Salvador <otavio@ossystems.com.br> wrote:

>   weston: Add Xwayland initialization support using weston-start
>   weston-init: Error out if loading a nested instance
>   weston-init: Add module support for the weston-start helper
>

Ordering here is wrong :)

Ross

--94eb2c04732082d6180533201627
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 May 2016 at 17:36, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":byw" clas=
s=3D"a3s aXjCH">=C2=A0 weston: Add Xwayland initialization support using we=
ston-start<br>
=C2=A0 weston-init: Error out if loading a nested instance<br>
=C2=A0 weston-init: Add module support for the weston-start helper</div></b=
lockquote></div><br>Ordering here is wrong :)</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c04732082d6180533201627--
