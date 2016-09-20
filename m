Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 50C64601D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 13:36:00 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id 186so18824927itf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U4+S4uJhholbhepuq34U1b8+iE2pawEQrGD9646IeMk=;
	b=bQg75ga1qAzqjRDVWuEI/M0MoYME5AVScFTslIwM6/ybe+zJT1TS7d9kjancMOv3Il
	EQD5Q19LYyfNPlZOZ5OmTp4IfTHKeSTjiq/lPvClIFwQovP0WpWcN/iSZUbuAtCjvebA
	CKooSO0gALVpxcX//Wlc/jwNlPn3+nsJLs0XQljsH9/X8S5dgKdztaF+KFgQ00J/QRFh
	K+PKejw9/iihoARxAwPZaVmy9as1FtHJDOgjmARETN+eIGrDSznOck7V1aJiw42iboTL
	7FjpGWWHF0CFA2sv/ghwlYjtPnFM0hlFTh0Z862Ow4QJer0e+hkrVvBj52pIlbjVFBV2
	EAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U4+S4uJhholbhepuq34U1b8+iE2pawEQrGD9646IeMk=;
	b=h5g9D1ZY0VROVe6ebnJ+dx0Hkll3OpnI4BExKOCSah10HPErdjsN0J9hryYkfDQVin
	Zi1IydLRg1BVMLBRhFxDkZYbIhThgiI+GPpcEsU9+4jIei73KHaorfyyqW4dx/iRBRZY
	jt4MhMtB9fjGhzchQU332JhepVFY9pDC7KZnCmd8nO6bgTP07f78bFSDsypnK7qpb24N
	SkThgGxNVeW5uh/oHgm5yHbe45ozfH2dfijV3JnQkgBZB4z9rz58lL7iZJlEcWRAlIuR
	clUTE+vJ55co+fhY4VVxQnYR1fLGbGueKAQa5MrhgJdxI236jSA6ZvZO428YZlKQBQIU
	IFZQ==
X-Gm-Message-State: AE9vXwNLVCEQjegiZxhBHC9oHyrtVliz0jHB0BeMAL4iS0JlMu2A8XUJhA/RPjkjsU+50CZB8D9ly+jldMlqbJVL
X-Received: by 10.36.112.135 with SMTP id f129mr4253430itc.3.1474378562069;
	Tue, 20 Sep 2016 06:36:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Tue, 20 Sep 2016 06:35:41 -0700 (PDT)
In-Reply-To: <20160920091958.23448-1-Yuanjie.Huang@windriver.com>
References: <20160920091958.23448-1-Yuanjie.Huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Sep 2016 14:35:41 +0100
Message-ID: <CAJTo0LZaBtwGJDHcAQ1Z0oMeqYKHAFD+k0YqbEYX5LjmDEbmDw@mail.gmail.com>
To: Yuanjie Huang <Yuanjie.Huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gcc-sanitizers: Fix libtool library files
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
X-List-Received-Date: Tue, 20 Sep 2016 13:36:03 -0000
Content-Type: multipart/alternative; boundary=001a11441c9e751f0d053cf082f5

--001a11441c9e751f0d053cf082f5
Content-Type: text/plain; charset=UTF-8

On 20 September 2016 at 10:19, Yuanjie Huang <Yuanjie.Huang@windriver.com>
wrote:

> Upstream-Status: Inappropriate [embedded specific]
> (LOCAL REV; NOT UPSTREAM) -- sent to oe-core on 2016-09-20
>

You don't need upstream-status tags in commit messages, only patches that
the recipe is applying.

Also please remove your internal tracking data from the commit message.

Ross

--001a11441c9e751f0d053cf082f5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 September 2016 at 10:19, Yuanjie Huang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Yuanjie.Huang@windriver.com" target=3D"_blank">Yuanjie.Huang@win=
driver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2y7" class=3D"a3s aXjCH m15746e5ea2c5b0fc">Upstream-Status: Inappropri=
ate [embedded specific]<br>
(LOCAL REV; NOT UPSTREAM) -- sent to oe-core on 2016-09-20</div></blockquot=
e></div><br>You don&#39;t need upstream-status tags in commit messages, onl=
y patches that the recipe is applying.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Also please remove your internal tracking =
data from the commit message.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a11441c9e751f0d053cf082f5--
