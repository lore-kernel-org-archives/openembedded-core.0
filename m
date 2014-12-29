Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 56B07725FD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 11:46:13 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id i8so9162140qcq.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 03:46:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OPFItaG7+KyJRx7UN0ieZfQhpXITzSzlzNnE+x4TOlU=;
	b=TpeAbv8gX541L5sDpIVAUXl41dzmmR7qyx84ggDZeSXmNaGC6BxptISta+5ngdFv2l
	jxWUn1MkKnqbLXo4kddPF5Ajp/7miS2jDzAbyrvLgGOqZ8rOQmhdRm22NwxlZbtwJAN+
	BHRapVrBJ/29s9SBj1C3DZnEVHi4CvE0RivJ9Cni8VAi1k9U27HSukGpxOW2GQqoNcLD
	9VzOePsRNuT4BZKBs6FgNpZ+7SQQXdvd9PnMqb/WPNnhDcwPpsea5++gNAKNJA/9pPfz
	lg5sO9fHAwMX3IuEQsVG/L8x4oK1DQ/ffpNcKGIPky2ZJcm7xEz7LOCpaNXZPS60ivbB
	ik7Q==
X-Gm-Message-State: ALoCoQk3T4Pg7o3lX7QBv/oC8KLV8MH0zIe/eK3l8QmYuzN9ykcCLhgakRl24YjpJHuHBLZ6Yth1
X-Received: by 10.140.39.167 with SMTP id v36mr15668538qgv.77.1419853574318;
	Mon, 29 Dec 2014 03:46:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 29 Dec 2014 03:45:54 -0800 (PST)
In-Reply-To: <4b642d59f869280dcd66c38d7744a4a822bfa1a7.1419586441.git.Qi.Chen@windriver.com>
References: <cover.1419586441.git.Qi.Chen@windriver.com>
	<4b642d59f869280dcd66c38d7744a4a822bfa1a7.1419586441.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Dec 2014 11:45:54 +0000
Message-ID: <CAJTo0Lay14Pytm5sHVBxqFmC5==abKa3M4o6Oc2Jef5L2FtYvQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] pciutils: add PACKAGECONFIG for 'hwdb'
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
X-List-Received-Date: Mon, 29 Dec 2014 11:46:18 -0000
Content-Type: multipart/alternative; boundary=001a11c12dd2ee4587050b596b49

--001a11c12dd2ee4587050b596b49
Content-Type: text/plain; charset=UTF-8

Hi Chen,

On 26 December 2014 at 09:35, Chen Qi <Qi.Chen@windriver.com> wrote:

> Add PACKAGECONFIG for 'hwdb' to fix the following QA warning.
> WARNING: QA Issue: libpci rdepends on libudev, but it isn't a build
> dependency? [build-deps]
> WARNING: QA Issue: pciutils rdepends on libudev, but it isn't a build
> dependency? [build-deps]
>

Respecting the systemd DISTRO_FEATURE to enable/disable the hwdb
PACKAGECONFIG would make a lot of sense, can you send a patch?

Ross

--001a11c12dd2ee4587050b596b49
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Chen,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 26 December 2014 at 09:35, Chen=
 Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div id=3D":2kk" class=3D"a3s" style=3D"overflow:hidden">Add=
 PACKAGECONFIG for &#39;hwdb&#39; to fix the following QA warning.<br>
WARNING: QA Issue: libpci rdepends on libudev, but it isn&#39;t a build dep=
endency? [build-deps]<br>
WARNING: QA Issue: <span class=3D"il">pciutils</span> rdepends on libudev, =
but it isn&#39;t a build dependency? [build-deps]<br></div></blockquote><di=
v><br></div><div>Respecting the systemd DISTRO_FEATURE to enable/disable th=
e hwdb PACKAGECONFIG would make a lot of sense, can you send a patch?</div>=
<div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a11c12dd2ee4587050b596b49--
