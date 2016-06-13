Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id C53FA60851
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 12:33:33 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id a5so47561530ita.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pnMF8YsH30U3rqjjIMy1DrqLl4XHvbRm2lvFSi2J5GE=;
	b=z40WO8Ua6HbjCfyuTHfjv2+VglkJTCau5YJT0wahmd1lG4cDx7BJ/k92Z3ZOLrzYVG
	7FSgoYd2qgD87/VuEZbjTKc632XXs/0bD1gi9NFBMYLBisnasdzH2UuIoAfRLkS56wur
	cgpnvCPYzpCxNQWzHOW26Pxh/kXqVLRvAg2g/rCBgEAToESvjAUUz5PtivTAR5RWT3k5
	S7xOR7LhoMFTIsUu6aOTuX8xT798EV8qI5OQsacyyQ53VTB/398SsZ4swWrmwiqWXesJ
	Ibog5M1FNQmwTG+ChNvaCuhoQU5hLaj1EJLj53a9TsAPS9tYRdKB6MlTJwkTgWNHi6Fp
	Pe8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pnMF8YsH30U3rqjjIMy1DrqLl4XHvbRm2lvFSi2J5GE=;
	b=hZhrDUJlJPNDavMu73RCXaKaaKtyj7rg6qflICG7xE84QB+wF1eCW7Qhcsnzq4+GzW
	OoyiiIu7K1tMDT9WCLPPpu6+Faan/W3S47exti+ZMNh+r18fgd64ZmWNV31y0+J8VtYa
	NK9J10zrphKa57OftniBgp5ucfPfXH5KGZRVHtDCpqEroOqT+8EbZpWMP05W3SmOPfFz
	yVqPJRxJ3dKVxow/lfBjWp/s1RR82MHXo7RFLJ7ctTzSabX+JP8FaB9JNGBghsWBEVZC
	2bFOOzB/Hn1IIKLGnZKnWkfj7zMH2zf002Di6+eQJ7EKDxgwE35pWB8kyC2iu70rbtAS
	4fgQ==
X-Gm-Message-State: ALyK8tIy5cgOr1CAl0Ivo5Yd1DgBl99h4ehLTYd89wLNX6NPp3IVRvUQ/eFVpodt0u0Oms3fyrdHhKtD0kCFE6Kx
X-Received: by 10.36.217.68 with SMTP id p65mr18040132itg.38.1465821213900;
	Mon, 13 Jun 2016 05:33:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Mon, 13 Jun 2016 05:33:14 -0700 (PDT)
In-Reply-To: <575B32BB.6010608@collabora.co.uk>
References: <1464357493-8652-1-git-send-email-andrew.shadura@collabora.co.uk>
	<CAP9ODKrhu4+XFZY5BeghTstiq4F2FeW52Yox0VqUusuq+p6tuA@mail.gmail.com>
	<575683F2.2050200@collabora.co.uk>
	<CAJTo0LZoFWfxU8D4bGW3gmXtQDT1hMCbhjcCBaYtrwzgDS0JYg@mail.gmail.com>
	<575B32BB.6010608@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Jun 2016 13:33:14 +0100
Message-ID: <CAJTo0LYt98HiQoLoMpnjXRkwTJBh0e9cOBgQH2g4zdhn8Y4GEA@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: Update to 2016.05 release
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
X-List-Received-Date: Mon, 13 Jun 2016 12:33:34 -0000
Content-Type: multipart/alternative; boundary=001a114631b6c2b59c0535281870

--001a114631b6c2b59c0535281870
Content-Type: text/plain; charset=UTF-8

On 10 June 2016 at 22:35, Andrew Shadura <andrew.shadura@collabora.co.uk>
wrote:

> Is it something new in this version or is that something that's also
> been broken for a while now?
>

It worked previously so it must be in the new version.

Ross

--001a114631b6c2b59c0535281870
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 June 2016 at 22:35, Andrew Shadura <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:andrew.shadura@collabora.co.uk" target=3D"_blank">andrew.shadura@coll=
abora.co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2tf" class=3D"a3s aXjCH m1553c3e93d814497">Is it something new in this=
 version or is that something that&#39;s also<br>
been broken for a while now?<br></div></blockquote><div><br></div><div>It w=
orked previously so it must be in the new version.</div><div><br></div><div=
>Ross=C2=A0</div></div><br></div></div>

--001a114631b6c2b59c0535281870--
