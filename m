Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6666C6F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 10:43:14 +0000 (UTC)
Received: by qkx62 with SMTP id 62so3134455qkx.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 03:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=isqqHbMhXLIxlHGPpFZNK1quBnft2cW+YSP8pQWe3QQ=;
	b=VycY4vFQJF5uvecuNpRpkRuhBLVm918gzUiP4URZks9NrIfkV96BLXok/C5UTuIfMR
	p9/LmgeuXCaE9QEK7+IieU11B0xb7QePrvEUTLrCa0kqGMuQWYEsoJ3Iww1XOHLw1RpL
	K5kAGklcQ4GgP8she6r/0PD0XHkpHlJlrx8tL1RxRVWKAWy0lQJtlLw6yPcKpxBwbZdg
	Fp3bOkR2Kj5swIzGPAANErkTTVli9sgdtMede5AsBE76HwdaCC3Jj8JPvN2porlPzvrv
	AFSjpnrpc7P1uCGGT8G+w35J2R2KQrK8vohl/YZ0U/OeAKCPNiNcrWmkQ60z1SrW1ux6
	KIKQ==
X-Gm-Message-State: ALoCoQkHK4ihweUceZAqW4rgv6r1tKm4x7zDt680ZNNxpnmVjkCnqZOZfj/X411O2Hwf8P4xxiHX
X-Received: by 10.140.89.104 with SMTP id u95mr2574109qgd.15.1432204995814;
	Thu, 21 May 2015 03:43:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 21 May 2015 03:42:55 -0700 (PDT)
In-Reply-To: <CAJTo0LbHVrLM=Wt++3ue-VQ3KFB42tGaJUwFRW_UHfBDXuqc_w@mail.gmail.com>
References: <CAJTo0LbHVrLM=Wt++3ue-VQ3KFB42tGaJUwFRW_UHfBDXuqc_w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 May 2015 11:42:55 +0100
Message-ID: <CAJTo0Lbwf9KYYTxtAJCNbQ9=YU-PdBoYShg32ThL_GgkoGMobg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: Moving GStreamer 0.10 to meta-multimedia
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
X-List-Received-Date: Thu, 21 May 2015 10:43:15 -0000
Content-Type: multipart/alternative; boundary=001a11c135f6057e3505169536e6

--001a11c135f6057e3505169536e6
Content-Type: text/plain; charset=UTF-8

On 28 April 2015 at 20:54, Burton, Ross <ross.burton@intel.com> wrote:

> This is basically a heads-up that we're working on moving GStreamer 0.10
> out of oe-core[1] and into meta-multimedia, where anyone who still needs
> 0.10 can use and maintain them.
>

FYI, they've now been removed from oe-core.

Ross

--001a11c135f6057e3505169536e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 April 2015 at 20:54, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div>This is basically a h=
eads-up that we&#39;re working on moving <span class=3D"il">GStreamer</span=
> 0.10 out of oe-core[1] and into meta-multimedia, where anyone who still n=
eeds 0.10 can use and maintain them.</div><div></div></blockquote></div><br=
>FYI, they&#39;ve now been removed from oe-core.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c135f6057e3505169536e6--
