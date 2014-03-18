Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 56BD96F926
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 17:07:32 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id rp18so7506403iec.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 10:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=byeSFdCLHzJolx1Ri0PoQGnesGYr8+V/dXBcDR4dOQ0=;
	b=O9+pD434c7PwzkJKl+4jG8UFHlGPgH5fNFDVr74l3Mv4LmWUplYsBXhmok3LGmxFui
	wpeT4gBUVrF1UpBryjXHKMS2Ef4I+6XhoQTm/Ky8JbdEIfmKAU9OzclO5hMKpa49q9vU
	UKbenaNMfAeo+B/8QQ2B/5flO1hNDYaCFqOsRzgHHNsIJUInVj+pjWYE8zVpINJxf0SO
	4gu1nDxXNNOSfrDRGaivTX/WZJAxhFb+mx18NYb1X2I4bl1MJGO5OBPaYFag+zC2goGu
	ZWGEyqDM9F7o1/AGoZJsfamAnf7pz4cDbTNXbmMvH2s1laxYV+/mhbeQiTZ26y0HZU/u
	R0yg==
X-Received: by 10.50.43.170 with SMTP id x10mr20135195igl.20.1395162454190;
	Tue, 18 Mar 2014 10:07:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Tue, 18 Mar 2014 10:07:04 -0700 (PDT)
In-Reply-To: <CAJTo0LY4_XK3-KCTON_tnzhqTnOgH4UfKVTBcBfzYGrXy-wi3A@mail.gmail.com>
References: <1394559360-27718-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LY4_XK3-KCTON_tnzhqTnOgH4UfKVTBcBfzYGrXy-wi3A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Mar 2014 10:07:04 -0700
Message-ID: <CAMKF1srprf=54e_nh2+j5fCCRCkrTGxNxM7DgVVgqRxSDMRNCA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: Upgrade 4.0 -> 5.0
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
X-List-Received-Date: Tue, 18 Mar 2014 17:07:33 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 18, 2014 at 8:51 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 11 March 2014 17:36, Khem Raj <raj.khem@gmail.com> wrote:
>> bluetooth-proximity has been removed in 5.0
>
> This brings in a new QA warning:
>
> WARNING: QA Issue: pulseaudio: configure was passed unrecognised
> options: --enable-bluez

yeah now it differentiates between bluez4 and bluez5 so the options
are also renamed
accordingly. I have sent a v2

>
> Ross

