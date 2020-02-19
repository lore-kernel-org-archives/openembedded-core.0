Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id DDC80613DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 17:21:08 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id b7so827932qkl.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 09:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bRhp1cmeitmsAvhiLQP7EG5Qe166aVU7ulNF6MlZBYY=;
	b=rTjfbqd74HgsroNyfoQm2XDaxxSl2b9aAViCyo8jpWzPl2KoD4O99VCVIVCgbEWJ0t
	FAk9mtjaPL3TaTEjwhE97UnuBz2mryXt+tYTcb6wZgrcE0Gb453CMqwU87TQD8UgZFHZ
	VgzByqDqYZsQJJtZh1/koyvEVN//m2Ke0ivdwfAqD8utZYWoK9YC+XK1YNdI2W8lzC+w
	/lQdUzWOUUmjaXp9cp3+qkcnq6zkgJ4HS6b45ntrBuxLDIVzLfHsxn9YFnltPTqBaVlE
	wB/x5tfSE5d/gDpTxGo8+3RyfpInJZovYRGYOFZ/jxR2jFTxKY/NxOqWU6+4mOhhUdyJ
	rsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bRhp1cmeitmsAvhiLQP7EG5Qe166aVU7ulNF6MlZBYY=;
	b=sa5/7MWO1FK7amQdvtYAomGOgV90sXSbNSYCpbR4zQPLo3eUD3lIcIutC6VHm1r3pj
	M0w4z3xdcJRB7PxcopVoo8jmWAQAHQZI94DvcFO342T9WNljAumRPFDDXCKGi8aGNOg7
	jc7jw0Z+WyqmPtMUgSZNWbcC6m/hJ+eyaApnZqv+42Dduf+zQynyXYrPxb0FAwcekTDK
	YYIt2MXU7t4HmZjrLFjpE3sYCY6F/KPLp4MW9ubD+1DDPX8GlGl+0tCx1xKC2QcrZdn9
	WsRpohQ6syrK0TkHrU0r9K/211x02Lq+URqAZ+bGX5seozf/y4SLV09BmgwQZB8QO4QI
	nZIg==
X-Gm-Message-State: APjAAAWcbBrEddDmo2scr4inZcUkjsYZkNUHCoNRTbSre4RRQJ1zc1S0
	IW4+sGEKgIiDxvXkObY9pG3g9uSdEy8yMEOiz6Q=
X-Google-Smtp-Source: APXvYqyyKdAXNFKiOFYSSbtIf8hpo0I+AoVS5cwCBPRC8OTUS/RsXWtfqxB4Pd1uVCAQkqPWv+TK3Gh2rpoQA2uhdWM=
X-Received: by 2002:a37:e47:: with SMTP id 68mr1870257qko.17.1582132869408;
	Wed, 19 Feb 2020 09:21:09 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-5-alex.kanavin@gmail.com>
	<CAMKF1sppws+PSjDojzi7+=p_UjEkEafGa1_WtRLCpqO_73nhGA@mail.gmail.com>
	<CANNYZj8W0A12inq_K3kiShN7dsU3tsTuOgh4LZAtP-QcUVDaXQ@mail.gmail.com>
	<CAMKF1so86RKsiAXC=vzpT0wu8E=jiFMzJsVBdGb7SQ2TKxBo6Q@mail.gmail.com>
	<CANNYZj_k+iXWB_V3PQOv8eE8Pvwt8B-q4=x_F4e4hzisW-NXaA@mail.gmail.com>
	<CAMKF1spO36x=P-ts28+BEg+Pvw5FcEWNpyNyJGXcFB_jXSohUA@mail.gmail.com>
	<CANNYZj8ZC_pVkSHTisPryOJE7GfMqot5a=5uP5LUm3fB0nVMYw@mail.gmail.com>
	<CANNYZj9u8f+qD_3RTb+9O9cbNBk0UgteBcV_d7X2ffpCkg4UxA@mail.gmail.com>
	<CAMKF1srMfa-0ADdKErgwXhQa6ypDL7RGznsBQ0ET7cZ29ErzXA@mail.gmail.com>
	<CANNYZj_ktJg=JF=nTPvHWBajA+7t2zMPwZmbUFLOKRWD1uP4_A@mail.gmail.com>
	<CAMKF1sqKV7+uMtvZEOCApvkiBV=cnFhsKJ=e9gx_gcY4iE-kvw@mail.gmail.com>
	<CANNYZj93fYQY6rDVz5t2aaOfn=Vwz88OzZwZVcdwf3pfgWx1NQ@mail.gmail.com>
In-Reply-To: <CANNYZj93fYQY6rDVz5t2aaOfn=Vwz88OzZwZVcdwf3pfgWx1NQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Feb 2020 09:20:42 -0800
Message-ID: <CAMKF1sp1EzMcb0Tndn-rJ02MOccd4J5AJFJ58Lv+0BsceP4gXg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] weston-init: use the drm backend rather than fbdev one
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
X-List-Received-Date: Wed, 19 Feb 2020 17:21:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 1:45 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 18 Feb 2020 at 02:56, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>> but I'll get to it, or you are welcome to try and report.
>>> Mips can be either fixed like suggested, or be a specific exception.
>>>
>>> For the rest of the targets, I see that you have extended the fbdev fal=
lback to qemuall only on Jan 9 this year. So it's very unlikely anyone is u=
sing them to run weston (not to mention how painfully slow that would be), =
and so it would just be wasteful to test or fix them.
>>
>>
>> We should be only applying tested part debugging these breakages is very=
 hard so when we know it will break we should be careful as with this patch
>
>
> I have tested these things now:
>
> 1. Switching mips from cirrus to std vga works fine, as long as xorg.conf=
 is also deleted (it's written specifically for cirrus and isn't working or=
 needed with std vga). Both weston and sato boot and look right. I'll send =
a patch for it.
>
> 2. Switching weston to kms backend degrades performance to unusable level=
, as neither kvm nor virtio/virgl are available for non-x86 qemu, and kms b=
ackend is using software renderer in mesa. So fbdev is the only realistic o=
ption there. But for x86 qemu kms is still viable. I'm not sure how to best=
 configure it though.

copy qemuall/weston.ini new folders qemux86 and qemux86-64 and point
to backend it should be using.

>
> Alex

