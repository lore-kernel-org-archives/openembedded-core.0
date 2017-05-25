Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 628A277E31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 11:53:15 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id t26so177840599qtg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 04:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=881/1C/m5t334Yh9mV2AqHm4L/1MgVpGXXqpCe5UGkM=;
	b=xf01zalmtb45eZsX/6egOD9nkpv4gmAQlBeEDmJqUmBYXlYx4KUjope2E1eyT5GwY1
	OZGHxRrt4QtIso6oLI9+NTmJZUyv2Bl2E9wwz90yWy2DmkExOAqeLuKnK92Z5KZjVp3T
	jU9IJoah1ExA07nhwyXMKvmyLC5XqKpk1ZdVvVMusq4zn6m0lw6ZzNHSiiGWv6B5fUNG
	K2oF34osrl3+SWGve36uBqwW+nYWqQHPiaPxaY9emwmcC4MJY6q3OPRoPJ5/EV/HlC5h
	EMg0awFix+KHG9JYaoHLEHwwMGLtuw/FyjHcXMtXM2e/VROJRRWvjVTttp0ntuSFpn5d
	YAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=881/1C/m5t334Yh9mV2AqHm4L/1MgVpGXXqpCe5UGkM=;
	b=Yd2gy9KLW82W3lXnE/25OfWD/tEa2hd8v8YZ7+iPoKL1MASc5JTU35jYfMujzg8W5q
	JN2kwza0rjbgcXhc+j2rbB5cW0xtpg0nZ53mkLfhJQmmNlp0wnYsewCmdthVA4U3KkbC
	HpyQHCurdiProYFn9YN4jiJMxHKPjmGAHPBxuK6yQRTV8WGIwqCwBJri8IK2wYct0uUW
	USbmNA1kUibU9llvtN9mIAzhi47WsVdZ5GDJktFPJnxsXKRj88Vp46+Qzd6m9u1hSU45
	Om7S/4vIX6bd0iuhF9kqa1HcZ9x75AlefrpiOidgmDkqX1NucYOUEy3o0REEt/sxGMf6
	Px8Q==
X-Gm-Message-State: AODbwcCIre1MknJXm4csB73GmoPUu0fDoBkDEePooyLZYxSV8WUJGtLB
	rJNTC9iN2HYFQTUtxKUxgoumCPoGSLf1
X-Received: by 10.237.36.101 with SMTP id s34mr41168621qtc.137.1495713196362; 
	Thu, 25 May 2017 04:53:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 25 May 2017 04:52:55 -0700 (PDT)
In-Reply-To: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
References: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 May 2017 12:52:55 +0100
Message-ID: <CAJTo0LYms47eMVfYR8cfFn0+j6UhV_ODNdjzb-HqJ6gC=MNY2w@mail.gmail.com>
To: Yuqing Zhu <carol.zhu@nxp.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH 0/6] Add some gstreamer1.0-plugins-bad patches for pyro
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
X-List-Received-Date: Thu, 25 May 2017 11:53:15 -0000
Content-Type: multipart/alternative; boundary="001a1145bee8c18e91055057dd2c"

--001a1145bee8c18e91055057dd2c
Content-Type: text/plain; charset="UTF-8"

On 23 May 2017 at 15:08, Yuqing Zhu <carol.zhu@nxp.com> wrote:

> -Add some enhancements for qmlglsrc
>  Some common features for qmlglsrc are added to make app development much
> easier.
>
> -Add some enhancements for gstplayer
>  Some gstplayer API enhancements are added to make it much easier for
> users to use.
>  Without these API enhancements, some features may not be realized
>  (like accurate seek, video sink configuration) when using gstplayer API.
>  So it would be better if they can be picked.
>
> -Fix a memory leak issue in glupload, which is common
>

Why are these for Pyro only?

Ross

--001a1145bee8c18e91055057dd2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 May 2017 at 15:08, Yuqing Zhu <span dir=3D"ltr">&lt;<a href=3D"mailto=
:carol.zhu@nxp.com" target=3D"_blank">carol.zhu@nxp.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":2po" class=3D"a3s aXjCH m1=
5c35a4bf6671219">-Add some enhancements for qmlglsrc<br>
=C2=A0Some common features for qmlglsrc are added to make app development m=
uch easier.<br>
<br>
-Add some enhancements for gstplayer<br>
=C2=A0Some gstplayer API enhancements are added to make it much easier for =
users to use.<br>
=C2=A0Without these API enhancements, some features may not be realized<br>
=C2=A0(like accurate seek, video sink configuration) when using gstplayer A=
PI.<br>
=C2=A0So it would be better if they can be picked.<br>
<br>
-Fix a memory leak issue in glupload, which is common</div></blockquote></d=
iv><br>Why are these for Pyro only?</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a1145bee8c18e91055057dd2c--
