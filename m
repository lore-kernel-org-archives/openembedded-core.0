Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0DDA160017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 11:14:57 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id i17-v6so5697821otl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 04:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=/aLn9wIX7IsMN8XHzaddsJxrjZoiGDl0zbk/Tr9lM9I=;
	b=H9pzqX03iqwgGhfGYUVmCNhBxYQKtxUnGQ9WTOOB5avZMNpSzvL8kGf9xCOXiz7str
	5JqSAxfDi2xlSfC9ZOC3StriE93plq0sZrTMaxmfhHWG41dSHnSMZk0zxZAar5IQtoug
	VdGhbBmIZuWYf00bRk/P8/m/6N7Btfj7QN/mnJT/JHbbI+8Tg69S8RvmHE8Sw0AL1zR4
	v0sV9MAqi933yhKp/2sH5FmcJOoK0FP374HPFoxUL/GQ7aP+k/sQknND1dvcRGl0To0z
	BOIUkVnxef0L1ankZ4nu6VpRzl89Nl7n9pGN+7vMIaL+BpKng+6fXJRBEszD9Fj8KP6L
	NWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=/aLn9wIX7IsMN8XHzaddsJxrjZoiGDl0zbk/Tr9lM9I=;
	b=ZcMGHk/DE34xzlyGXLUe304ADWVUnG+hXEU/IN4rejVyBQrUFutgTk0iH58rpb9K2L
	3E4uBanQ+GBFMMTWCANst41XaxJJkCM39q5i2/FZo6hcunLNOmp1DgnH04+pfGiSPTdg
	G/NKnzZ5nGMHSrRAbEWskugE3aQvYWS99VGCuvejkH5KeMUSHuKh7V9msHd0UTb2C3kD
	ebrtYSze/5XVu9qH5HACkiMn88v+ugUKaRBWDesGFicUpOqxgsdvn091DGBLnibEu4vc
	01RI6z8HQ+wFIABndWVl5vlEB+JIp7GxSKZ0FcEZWJG56IlWDGP5xCpGR+tu+Q8RDINr
	LLwQ==
X-Gm-Message-State: APt69E3+T5zZ3+KeGQI4BoSF0qf4WFpOQLoLu8Euz191jhR5gpnOCE6t
	RHqZmXkcM652bn4G5d+w8HS2PAYW7sQI+N5wXSU=
X-Google-Smtp-Source: AAOMgpfiNl/1aUv0e/STVJpdrBAhoYFthnFx/dkV6et+lzniiiEm0DN2Jnq1EKqPGy+rg7y/qHmNT4Gz2xhk+Yza5H8=
X-Received: by 2002:a9d:3010:: with SMTP id
	d16-v6mr5263558otc.23.1530184499106; 
	Thu, 28 Jun 2018 04:14:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Thu, 28 Jun 2018 04:14:58
	-0700 (PDT)
In-Reply-To: <8cf18c72-e899-b425-dc28-9ad2f853ff18@igalia.com>
References: <CALXw4G6YVNhzjEkz1e9WNW7b-8u0CkRu_6Z2DwjOyp_BQimwwg@mail.gmail.com>
	<CANNYZj8zmttXP7o_fZF6hfYF4MOwyNTNh1csnHp1c9aV-FTCZQ@mail.gmail.com>
	<CALXw4G5TfogpXY27rrnaWvLyrj2HW6F6f450J3GHuM9q=GpOEA@mail.gmail.com>
	<8cf18c72-e899-b425-dc28-9ad2f853ff18@igalia.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Jun 2018 13:14:58 +0200
Message-ID: <CANNYZj-NmvChRNb5EaUFYUDqX_QGRfNy0Yj+3Lda-t=uzLUwMA@mail.gmail.com>
To: Michael Gloff <mgloff@emacinc.com>,
	OE Core <openembedded-core@lists.openembedded.org>, clopez@igalia.com
Subject: Re: Sumo webkitgtk fails to compile
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
X-List-Received-Date: Thu, 28 Jun 2018 11:14:58 -0000
Content-Type: text/plain; charset="UTF-8"

TBH, I'm not sure why Michael is seeing this failure either. Sumo does
get built on the AB against several qemu targets, and the failure does
not happen there.

Alex

2018-06-28 4:28 GMT+02:00 Carlos Alberto Lopez Perez <clopez@igalia.com>:
> On 27/06/18 19:27, Michael Gloff wrote:
>> # GL/GLES header clash: both define the same thing, differently, on 32 bit
>> x86
>> EXTRA_OECMAKE_append_x86 = " -DUSE_GSTREAMER_GL=OFF "
>> EXTRA_OECMAKE_append_x86-x32 = " -DUSE_GSTREAMER_GL=OFF "
>>
>> I think the best thing to do it to turn off USE_GSTREAMER_GL for all
>> architectures. Would a patch doing so be acceptable? I've verified that it
>> will build with the _armv5 case.
>
> USE_GSTREAMER_GL is a feature of WebKitGTK+ that allows it to leverage
> hardware-accelerated video decoding (for example: on i.MX6).
>
> I think is acceptable to disable this for ARMv5 (because, AFAIK, there
> isn't any ARMv5 hardware that can leverage this in any case), but this
> should remain enabled for other architectures.
>
>

