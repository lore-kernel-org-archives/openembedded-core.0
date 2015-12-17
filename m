Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id C4F03601D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 20:42:52 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id m11so20751290igk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 12:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hWeZwhKtePg1sHf2/+I6ZTsMYUhNf66+lKmlTwIhxkE=;
	b=RE+m+huAh9agmwbyovW6cJIdcwK852Ft2l10wOzOf1icWlhbvpsseBPnsrW1qiWsnh
	Z1EVj5F9EdnIvZFos6evXGxpjqbCbTm04HRr9p656Bqvml/WbgAWbBmDjfkWAiT7Zqh6
	IzyR/c2123dTffiCfb2sxXZQLmpZj7DBnCjTEqQVQCrjC625ewVVnDk6BqD30d/Kh5co
	Rd0Ms1cvwXNSXwMNcDg5IVTpY7t/l/OIV6KGZce3MvCuaqW08g5AHuCsYaVurbfBx5DQ
	hzgsO0zzMYi7lSqVVZ7NMdCX+bCUeiCEDx0VkW69FP7nmc4QlmfI/9tq0YQTJyJiQSSS
	pHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hWeZwhKtePg1sHf2/+I6ZTsMYUhNf66+lKmlTwIhxkE=;
	b=dfsbdMSApiau6z16w/kxfKeKaqGdCHnD6zGkw6jLB6/UmnmkN3uX8dJt3fKF241pDo
	dnw7LuL9EivW3HUJmV9C35aieRsHVtuedb7lcUxRBpRjxr6Kmaoa5gO4RyKYEaoGGoEI
	spBZNA6C0SbkW74vKFuUaKJ7NpYAP+LZbceaPJCl5XnRWygZ96WRdgVBEbaX9LWKX3JZ
	WWyqjspiKp21WL7vGx4zUeGkn2FO+6OsI7hNVRsZOQm6qw5LZoujm0hjSyXUZvFDKa3q
	aCB0tJBpBZXW+30gfNZ008J5Knf/wpegrX5XD24wecY+qMfgUzCvVPst+WGWVXWKhmo0
	POSQ==
X-Gm-Message-State: ALoCoQkY3T9SHqUve9ZDHjFN+s049zSErYjhz9pfe1w5F8l4SjPz1lhXh+TKupdL7xYWesOjGGLNRGme+3fy7s3hUYpWDCI/QS8jYWErJYTC4QKNbJ54hLw=
X-Received: by 10.50.225.1 with SMTP id rg1mr6065920igc.78.1450384973301; Thu,
	17 Dec 2015 12:42:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 17 Dec 2015 12:42:33 -0800 (PST)
In-Reply-To: <CAJ86T=WgFsVHRxvC70+xDr_N-=jUu9ircbdvXZNYz37U16+uzg@mail.gmail.com>
References: <cover.1450073907.git.raj.khem@gmail.com>
	<a2dd5384b2607cf7e507cf280addd31ee6df2391.1450073907.git.raj.khem@gmail.com>
	<6c5db9084bed25c8ae9fb93cfe2e3d0ba76121d2.1450073907.git.raj.khem@gmail.com>
	<CAJ86T=WgFsVHRxvC70+xDr_N-=jUu9ircbdvXZNYz37U16+uzg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Dec 2015 20:42:33 +0000
Message-ID: <CAJTo0LZX5P6X77HQvCrbnEJutJLkMqK9xJMbgC45PaQfmxibLQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] systemd: Upgrade to 228
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
X-List-Received-Date: Thu, 17 Dec 2015 20:42:55 -0000
Content-Type: multipart/alternative; boundary=001a1132f15e1f268705271e115b

--001a1132f15e1f268705271e115b
Content-Type: text/plain; charset=UTF-8

On 17 December 2015 at 20:30, Andre McCurdy <armccurdy@gmail.com> wrote:

> It looks like you have some unresolved merge conflict markers in
> 0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch ?
>
0016, but yes, well spotted.   Clearly nobody - myself included - reads the
logs. This just made it into master so I'll send a fix shortly.

Ross

--001a1132f15e1f268705271e115b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 December 2015 at 20:30, Andre McCurdy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2wh" class=
=3D"a3s" style=3D"overflow:hidden">It looks like you have some unresolved m=
erge conflict markers in<br>
0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch ?<div class=
=3D"yj6qo ajU"><div id=3D":2y9" class=3D"ajR" tabindex=3D"0"></div></div></=
div></blockquote></div>0016, but yes, well spotted. =C2=A0 Clearly nobody -=
 myself included - reads the logs. This just made it into master so I&#39;l=
l send a fix shortly.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a1132f15e1f268705271e115b--
