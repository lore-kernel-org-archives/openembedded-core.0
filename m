Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9E36AC01
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 15:49:36 +0000 (UTC)
Received: by qgew3 with SMTP id w3so25566208qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 08:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=m4eRgJOIfjjEAsqCo9fiHD42ofxfxuGwkTAn0S391yE=;
	b=EFl3blgepp+qA25pWTlv9WLbgDfIA4VYoV5vIu4Y+7aSQUBJJg0D2OJDZ8GUEPr688
	c2gy+jc+QLKjaWy93yD6YG0Oxr3JIuaRPb9XrlEHkdqii+TOgIefwcTajNgq1jhoXCpC
	iPOWaTN0yQqXYPVLnYoqKG3NNVvFY0U9CwFDjx2A2O3+DPp5RbdLNfq2YfPzlBn+OhZ8
	Ut4Wg5o+f20/5pjjlTGJhFOl3ZQfYuRD3MoCwzJl8r7PsdppurZldtHaU+4xWj1f6ZNP
	WSyPligGV2xQvFfXDSR77D3PtFzLrVvz2Z4EaUi9z+9jM/pz2sS4StKkgWqOHLldIiFm
	Mjeg==
X-Gm-Message-State: ALoCoQnSXoppbGFcTivb4Yna1DSDn/JiYA0Q2GUGfbS4I3xwUSUV8klzLRriookIFioPTkxlIqLK
X-Received: by 10.140.235.77 with SMTP id g74mr46915367qhc.64.1432136977890;
	Wed, 20 May 2015 08:49:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 20 May 2015 08:49:17 -0700 (PDT)
In-Reply-To: <1431928102-18551-1-git-send-email-soren.brinkmann@xilinx.com>
References: <1431928102-18551-1-git-send-email-soren.brinkmann@xilinx.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 May 2015 16:49:17 +0100
Message-ID: <CAJTo0Lbg+th4B=K1C-oaLH9jO5qzbQKgzU3dVO5Lg0m3Vhx=Sg@mail.gmail.com>
To: Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soeren.brinkmann@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] dosfstools: Bump to version 3.0.28
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
X-List-Received-Date: Wed, 20 May 2015 15:49:37 -0000
Content-Type: multipart/alternative; boundary=001a11354a00d654f60516855f81

--001a11354a00d654f60516855f81
Content-Type: text/plain; charset=UTF-8

On 18 May 2015 at 06:48, Soren Brinkmann <soren.brinkmann@xilinx.com> wrote:

> I suspected the big version jump probably obsoleted the patches carried in
> OE.
> Hence, I just removed them.
>

That's a very big assumption, you should verify that is the fact instead of
hoping for the best.


> I'm not sure whether the license change is the reason for OE only
> providing the
> old version. In that case, I guess, just disregard this patch.
>

As Khem said we try to have GPLv2 forms of all GPLv3 recipes, so both are
welcome but the patch dropping without verification is a problem right now.

Ross

--001a11354a00d654f60516855f81
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2015 at 06:48, Soren Brinkmann <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:soren.brinkmann@xilinx.com" target=3D"_blank">soren.brinkmann@xilinx.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1xf=
" class=3D"a3s" style=3D"overflow:hidden">I suspected the big version jump =
probably obsoleted the patches carried in OE.<br>
Hence, I just removed them.<br></div></blockquote><div><br></div><div>That&=
#39;s a very big assumption, you should verify that is the fact instead of =
hoping for the best.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":1xf" class=3D"a3s" style=3D"overflow:hidden">
I&#39;m not sure whether the license change is the reason for OE only provi=
ding the<br>
old version. In that case, I guess, just disregard this patch.</div></block=
quote></div><br>As Khem said we try to have GPLv2 forms of all GPLv3 recipe=
s, so both are welcome but the patch dropping without verification is a pro=
blem right now.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a11354a00d654f60516855f81--
