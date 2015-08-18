Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE0260043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 17:02:29 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so60298749qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 10:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lDrQYxIZCUXU9Jb8sEOQ6rIWXgBPlWwgpvf09Ja58c4=;
	b=aLkZkT9IJY54kcm7jFyFwP03z0xvrP7LHpbVB0utpeTVkpcmM0wP/1y+284L0HCSkx
	WS1Rcatt3HKLncsIns/1wofMgOeRT4g9g9s3pPIXQfDjGPyyRUbBrRRGqUSsl4xXNvL/
	JewL+dEcKOEn3tnKx7aiUGcNxEy/XXCl3YfSoniyXMPCuZlc5p3C+9Fx/+CKttlSvUfg
	i40/E5RTx/Z/cRW5m0i4sOPCo/QfGpJQdsK9zZpt3EbQoEL/EmZYzInHYDXQV6VewVYn
	WSbcA56O3YNH1Zidds0Nw/8NfAG4l8rhvXfrseIc+cOpzFRE37/mb0BZKHkv4j+Xwr0l
	V42Q==
X-Gm-Message-State: ALoCoQnja690no8H4fXqirDKpof/te7OZDOHHiQyGGzF/aqieRdnZWNZvEwhbhXo/u4sImtUrPtd
X-Received: by 10.55.23.224 with SMTP id 93mr11015580qkx.13.1439917349773;
	Tue, 18 Aug 2015 10:02:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 18 Aug 2015 10:02:10 -0700 (PDT)
In-Reply-To: <CAJTo0La9x-ZtY=+FrFL1FPCkg86XGGeL=+FJ+ZARpcN-y58Pww@mail.gmail.com>
References: <cover.1436781736.git.liezhi.yang@windriver.com>
	<7c7e76c69064f59ae5b4c6ac44235bee4332d494.1436781736.git.liezhi.yang@windriver.com>
	<CAMKF1sqVDngrV0zZEzZcCScM+HyV+LC++VzpFtVV9ZBW0M8jSQ@mail.gmail.com>
	<CAJTo0La9x-ZtY=+FrFL1FPCkg86XGGeL=+FJ+ZARpcN-y58Pww@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Aug 2015 18:02:10 +0100
Message-ID: <CAJTo0LY6EovxS=ACBen-Wp9xvx112J1EHMDE+OBxuf3ooi4b2A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] glibc: print PN when bbwarn
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
X-List-Received-Date: Tue, 18 Aug 2015 17:02:33 -0000
Content-Type: multipart/alternative; boundary=001a1147a0be23b8aa051d98e22c

--001a1147a0be23b8aa051d98e22c
Content-Type: text/plain; charset=UTF-8

On 17 August 2015 at 13:33, Burton, Ross <ross.burton@intel.com> wrote:

> There's been a related report on the yocto@ list where it was noticed
> that we're executing the host rpcgen during glibc builds, so consider
> this is a ping. :)
>

Filed #8181 so this doesn't get lost.

Ross

--001a1147a0be23b8aa051d98e22c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 August 2015 at 13:33, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div>There&#39;s been a r=
elated report on the yocto@ list where it was noticed that we&#39;re execut=
ing the host <span class=3D"il">rpcgen</span> during glibc builds, so consi=
der this is a ping. :)</div></blockquote><div><br></div><div>Filed #8181 so=
 this doesn&#39;t get lost.</div><div><br></div><div>Ross=C2=A0</div></div>=
</div></div>

--001a1147a0be23b8aa051d98e22c--
