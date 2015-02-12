Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 57935606E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 16:08:58 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id s11so9184617qcv.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 08:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FnfoZ6G8xUdpAWMZ3vmOqtBgWsAAdwnw9Bj27d5hDyU=;
	b=X0CCzpENsYj9sEo3jTOhTSszHMyTWhR8SVNCABwdl8LgVRZ6BsP5FXO8FypAOx0YJh
	t4A8EUGBUwoo3JDNYIYzpB36IOi7vUwrKzs4+sHuyJo0is6tV01CaENTiVOGqHKmS6zq
	QYTbA61jjZ0fyO/y5rznbGp5ck22AI87+XQEcuvUZVXQljICYIPRgfoYFR/2HyC3feFR
	++tVPZDyuc8xRCqQ5c1U4NZ1Ta6fXe8EVY9lI9hNWeKHBKbI122I7GYmyJBa98RMPGiW
	EQq35SevuAWLvFdhQk9rPQEmW5832k7uCfHCjykF5jA63PFj05DyqhLDpFk8UE+w1YEN
	BGQg==
X-Gm-Message-State: ALoCoQmdMQG4usf6sVaVr3afZVUb+0Qmlusz5kys2HhjfCFTV2/pfIPzS0nPtC/KJ5dyXgqLjRd+
X-Received: by 10.140.150.87 with SMTP id 84mr157492qhw.64.1423757339769; Thu,
	12 Feb 2015 08:08:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 12 Feb 2015 08:08:39 -0800 (PST)
In-Reply-To: <20150212160337.GA7233@bshelton-desktop>
References: <1423500745-2142-1-git-send-email-ben.shelton@ni.com>
	<1423500745-2142-2-git-send-email-ben.shelton@ni.com>
	<CAJTo0LbvkV1kVy3f_Qy95FCCAuZcJkqwRR_3v2FdoYrha6B51Q@mail.gmail.com>
	<CAJTo0LbLPSVjKi-m085=HnkVTTkKaUozVTpJBc2qzOJ-wqSL0Q@mail.gmail.com>
	<20150212160337.GA7233@bshelton-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Feb 2015 16:08:39 +0000
Message-ID: <CAJTo0LZ7raGC-eXL6OCzvrHX01a4H721vTiqK+akF2Oy+M0z4A@mail.gmail.com>
To: Ben Shelton <ben.shelton@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernelshark: Update to version 2.5.2
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
X-List-Received-Date: Thu, 12 Feb 2015 16:09:00 -0000
Content-Type: multipart/alternative; boundary=001a1135492e7bf2b6050ee65690

--001a1135492e7bf2b6050ee65690
Content-Type: text/plain; charset=UTF-8

On 12 February 2015 at 16:03, Ben Shelton <ben.shelton@ni.com> wrote:

> This is already done in the EXTRA_OEMAKE in the trace-cmd recipe, but
> not for the kernel-shark recipe -- I guess I didn't hit the error in my
> local build.
>
> Should I submit a patch to fix it?
>

A revised patch would be awesome.  If both kernel-shark and trace-cmd
disable Python, why does trace-cmd.inc inherit python-dir and pythonnative?

Ross

--001a1135492e7bf2b6050ee65690
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
2 February 2015 at 16:03, Ben Shelton <span dir=3D"ltr">&lt;<a href=3D"mail=
to:ben.shelton@ni.com" target=3D"_blank">ben.shelton@ni.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":gg7" class=3D"a3s" sty=
le=3D"overflow:hidden">This is already done in the EXTRA_OEMAKE in the trac=
e-cmd recipe, but<br>
not for the kernel-shark recipe -- I guess I didn&#39;t hit the error in my=
<br>
local build.<br>
<br>
Should I submit a patch to fix it?</div></blockquote><div><br></div><div>A =
revised patch would be awesome.=C2=A0 If both kernel-shark and trace-cmd di=
sable Python, why does trace-cmd.inc inherit python-dir and pythonnative?</=
div><div><br></div><div>Ross</div></div></div></div>

--001a1135492e7bf2b6050ee65690--
