Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 65D41601E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 14:27:56 +0000 (UTC)
Received: by qcblr10 with SMTP id lr10so7280963qcb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 07:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tVgUidZfQNAgnW3axUY5/1DTctXVUcwMp+RIWJzYijc=;
	b=fKaL/ssSk00ya3n3R7ydc1LzEoDdxSz2KAp7sknAVsPeD0jhZZKV5PGdDIawD6iIBR
	md9jq+r9heFlmAmd915p/+nAbAhhxAVOkFcfxmtRdemGSUo6g/9niO91QI1RT2hEe03m
	2wPc4EakRvKqXDRlrKyew9pXTjcrb/p7M0mt9fouWtXQHWOms/AmpC4SL7LK2rJ4sm0P
	sgwPEFHGsQS3xxN+vREzG4JA5sbpCAqZWR8m41gKL4T6d0PAzvyRsqN4bebBx3nWcFg7
	tWsoyGVp/OhNxJCtcZcgWddwppRMytWR8PXuDqBxw1jTrvOhAVZra0DqjwpmPQfhuCro
	d2Uw==
X-Gm-Message-State: ALoCoQm4wRz74oXZDiyNTIF/Ylsqk2bzi+fADYUFlzc0s7a9op/NdC9hEt6HYlgeaBxC49rtuK1s
X-Received: by 10.55.40.18 with SMTP id o18mr508160qkh.58.1432045677967; Tue,
	19 May 2015 07:27:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 19 May 2015 07:27:36 -0700 (PDT)
In-Reply-To: <1431952843-25139-2-git-send-email-tanu.kaskinen@linux.intel.com>
References: <1431952843-25139-1-git-send-email-tanu.kaskinen@linux.intel.com>
	<1431952843-25139-2-git-send-email-tanu.kaskinen@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 May 2015 15:27:36 +0100
Message-ID: <CAJTo0LacJyy9q9NOH5UAW3gihD-uDpAWRiru5mkbpNLrUCPepg@mail.gmail.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] alsa-plugins: initial recipe
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
X-List-Received-Date: Tue, 19 May 2015 14:27:58 -0000
Content-Type: multipart/alternative; boundary=001a11440fb8f013e60516701d59

--001a11440fb8f013e60516701d59
Content-Type: text/plain; charset=UTF-8

On 18 May 2015 at 13:40, Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
wrote:

> When PulseAudio is installed, alsa-plugins is needed to provide
> compatibility for ALSA applications.
>
> The dependencies are set up so that pulseaudio-server depends on
> alsa-plugins-pulseaudio-conf, and alsa-plugins-pulseaudio-conf depends
> on the PulseAudio plugins. This should make the ALSA->PulseAudio
> compatibility configuration work out of the box, while leaving the
> PulseAudio specific configuration out on systems that don't have
> pulseaudio-server installed.
>

What layer did this recipe originally come from?

Ross

--001a11440fb8f013e60516701d59
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2015 at 13:40, Tanu Kaskinen <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:tanu.kaskinen@linux.intel.com" target=3D"_blank">tanu.kaskinen@linux.in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:9in" class=3D"a3s" style=3D"overflow:hidden">When PulseAudio is installed,=
 alsa-plugins is needed to provide<br>
compatibility for ALSA applications.<br>
<br>
The dependencies are set up so that pulseaudio-server depends on<br>
alsa-plugins-pulseaudio-conf, and alsa-plugins-pulseaudio-conf depends<br>
on the PulseAudio plugins. This should make the ALSA-&gt;PulseAudio<br>
compatibility configuration work out of the box, while leaving the<br>
PulseAudio specific configuration out on systems that don&#39;t have<br>
pulseaudio-server installed.</div></blockquote></div><br>What layer did thi=
s recipe originally come from?</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a11440fb8f013e60516701d59--
