Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB9477EDA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 16:30:24 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id c45so54361238qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 09:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=InN+zZBzZr58E0JGyeyzOi4jW9iSsCZt3c9kEZ4hfig=;
	b=at7OQOjXS7hzdqX+Qg5xz6PDQMwaLedAE+txgEqcZxmm84m3FbpV6VP8u2LqNe9dqx
	Wc0EYvGPrsLjslvkF79Jd3cJeBqDdoBI4jmff8QW4mtu92NEEUs64XMWaVlGEK1hqM9l
	CAV2T6ZZc0g/2YXoWNccVHcDmSZRezVv25qihfbW8eHHiMKrxauFZhiSd+oJGhn3wrVD
	vdHdo2L5KRfOF43IDTkalOvQeYJU4MoMW6YSpZU2Tfumn83RnOJLAt40Z59fGDkV0yk0
	S3ZFqYh3zCyVtBLVdJ+WpM52aTCjP7oP3syMKHBmhurGOZQ+vGXc6+F0Nd9bhc8yk+Vj
	bDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=InN+zZBzZr58E0JGyeyzOi4jW9iSsCZt3c9kEZ4hfig=;
	b=YuW6ywuCohHcjnRRZtUKwRDNQ6y3HMFaW5oourFFy0V4A91ar+oitksv+Y91kyfu7B
	Y/nusFY3Wba6dcGs8URaWZ7yhQ03xPQEwdeWYOU8sSDogiijhqotxS/TJ5iSDybhIKgj
	GVSvFHKZp6NKEBrkBNJ/A8ye8hD0a7EII80zAHx2Vlv2cd1NtW2+awT19r4vV9dm0OOU
	hMAfAdKcSPN6gV9PSOBoJs8usqYjgqqgeGzn13CUfjsqYlr28Vnqj8iVsG8QxiVDAjcT
	gRys9Zzk3LH997EZDWotlLwGgQa1GEgr6us7sNkvFrmm0CToxZiG3Qkk+ngi7HE7TGty
	aVXQ==
X-Gm-Message-State: AN3rC/47olNv7mxV/uHTWNic+Ny8mE6GFGeq3RqbQPsNHdCIrbhZcpxY
	PJ96tZw5XPTHoT01Pq11KByGD7C9NEJc
X-Received: by 10.200.56.56 with SMTP id q53mr11677659qtb.105.1493397025560;
	Fri, 28 Apr 2017 09:30:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 28 Apr 2017 09:30:05 -0700 (PDT)
In-Reply-To: <CAJTo0LZsEnqepWkqtEubN04A6+XYzcj+wpATT8jg20pGk1hF4w@mail.gmail.com>
References: <1493307588-14557-1-git-send-email-ferlandm@amotus.ca>
	<1493385304.3156.5.camel@iki.fi>
	<CAJTo0LZsEnqepWkqtEubN04A6+XYzcj+wpATT8jg20pGk1hF4w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Apr 2017 17:30:05 +0100
Message-ID: <CAJTo0LYbd9c=hAPRtQpLEpHPMnO-yoRFvvJ58-K+ZwWmVUiuMg@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] speex: upgrade 1.2rc2 -> 1.2.0
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
X-List-Received-Date: Fri, 28 Apr 2017 16:30:25 -0000
Content-Type: multipart/alternative; boundary=001a1137aca237b35a054e3c9776

--001a1137aca237b35a054e3c9776
Content-Type: text/plain; charset=UTF-8

On 28 April 2017 at 14:58, Burton, Ross <ross.burton@intel.com> wrote:

> dpkg thinks that 1.2rc2 is less than 1.2.0, I suspect the RRS doesn't use
> the same algorithm.  Not sure what opkg and dpkg think of it.
>

I meant opkg and rpm, obviously.

Good news is that RPM says 1.2rc2 < 1.2.0 too.

Ross

--001a1137aca237b35a054e3c9776
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 April 2017 at 14:58, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra"=
>dpkg thinks that 1.2rc2 is less than 1.2.0, I suspect the RRS doesn&#39;t =
use the same algorithm.=C2=A0 Not sure what opkg and dpkg think of it.</div=
><div class=3D"gmail_extra"></div></blockquote></div><br>I meant opkg and r=
pm, obviously.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Good news is that RPM says 1.2rc2 &lt; 1.2.0 too.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1137aca237b35a054e3c9776--
