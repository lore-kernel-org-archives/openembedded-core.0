Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7F860DE3
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Feb 2020 19:04:39 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id w1so12338301ljh.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2020 11:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9h07Uh+IzAlPy99+EcqnufcPFQotWi5ucLwF+Y4L6l8=;
	b=vYrDpLejrdppwRlHoJrNl1sIHTngnal4LdAfuGCb8RLW+i6qghqbmWbgw6wWYNhEwz
	R7NuG7wDjFzdJ9Y7dwCoQX7QfsPQq+4ZXCuMzU0+Hxqs2wwZ/Fzy/sFi4YrA9P0a8BIe
	Lq+QkBDsy32Wd1anvN7HC3LRyk05TBqu2vWiZenZyeYQxSaO6g6p7Es7bryJzw5s3DSA
	a5MyS8yfT97FWxKEXWBzrvaRDXRs4AZIONIEeQM2le0Wa0nquL/hdFg00MKcHiCKw5U6
	Ed0/jOiPIhnWuvXgahaW47Gj2XQUbC+ZMFrQfHVn+hMjnizLFdJt7ZgyzLabfmurIyM3
	OgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9h07Uh+IzAlPy99+EcqnufcPFQotWi5ucLwF+Y4L6l8=;
	b=iylWk4w1VLltRJN/Bo/W8f7qCzZ9f3kzKt7duOY0dtFIle+fIOy3OpwMnjQJUitIFh
	I0nA/j1/xq7iqFX3TjWdl584+WxLn4O2qViSwF2+M/BuxTRtY616rDnU90pEsg66bKJr
	RMfA79plTtY1TLb+z4SAPL4x8LtyxsgUeAtkLPHDB6qbxLnQakidZErcIXgl9CJZE5kg
	xwQqM3OiSNTuxJm2oUhHBdLI8B57pbvNnmlnpEnANg4z3z4LXqajPd2MK0vppM/6riL8
	rzUp2XgjCT3w2Vxwp2JTA2VGDVnnowIN3tqCK2gaPJ7Z8WrySyjm9KJccC9hzPANHTJY
	mnGg==
X-Gm-Message-State: APjAAAV0Xus2Y3OPCBi6MMLhxeDWY9662C2xyeAboLON4GjlPywjsR+0
	hGiOq44DtQxNZ0gCAK+ImAf2NfUNi3iuGrdydZw=
X-Google-Smtp-Source: APXvYqyRf7cW8EN28wb6vct4+nz+bB8/zW01fZ6z4E0lktKGaR4R8zVd1Udl+NExpE/lnAIEX34vgYKMRUN7+XxdjnA=
X-Received: by 2002:a2e:b0db:: with SMTP id g27mr11423341ljl.74.1580670279497; 
	Sun, 02 Feb 2020 11:04:39 -0800 (PST)
MIME-Version: 1.0
References: <20200202020323.23609-1-alistair@alistair23.me>
	<CANx9H-Cf3zEAibK18UwB_pVfMuCXQR_chhhTFFZgAiWBv4zDWA@mail.gmail.com>
In-Reply-To: <CANx9H-Cf3zEAibK18UwB_pVfMuCXQR_chhhTFFZgAiWBv4zDWA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 2 Feb 2020 11:04:11 -0800
Message-ID: <CAKmqyKPmjOnRxQPpOv3Cy7WYrNnip7o+9dTWLLKGwgLcFGn23g@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libchamplain: Add support for building libchamplain
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
X-List-Received-Date: Sun, 02 Feb 2020 19:04:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 1, 2020 at 6:43 PM Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Sat, Feb 1, 2020 at 6:11 PM Alistair Francis <alistair@alistair23.me> wrote:
>
> Maybe some explanation of what is for and why we want it in core would be helpful here.

On second thought it probably should go into meta-openembeded. I'll
send a patch there.

Alistair

>
>> Signed-off-by: Alistair Francis <alistair@alistair23.me>
>> ---
>>  .../libchamplain/libchamplain_0.12.20.bb             | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>  create mode 100644 meta/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
>>
>> diff --git a/meta/recipes-gnome/libchamplain/libchamplain_0.12.20.bb b/meta/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
>> new file mode 100644
>> index 0000000000..90e5533015
>> --- /dev/null
>> +++ b/meta/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
>> @@ -0,0 +1,12 @@
>> +SUMMARY = "libchamplain is a Gtk widget displaying zoomable and pannable maps"
>> +LICENSE = "LGPLv2.1"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
>> +DEPENDS = "glib-2.0 gtk+3 gdk-pixbuf clutter-1.0 clutter-gtk-1.0 libsoup-2.4"
>> +
>> +inherit meson gobject-introspection
>> +
>> +SRCREV = "145e417f32e507b63c21ad4e915b808a6174099e"
>> +SRC_URI = "git://github.com/gnome/libchamplain.git"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> --
>> 2.25.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

