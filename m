Return-Path: <gizero@gmail.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8C03877E93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:36:24 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id a12so45859831ywh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 01:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XI/ZCexzmyhMm/Q0l9Ku/PRSjpio12+GpPqg/we+9xE=;
	b=vSBRpDXAEK5B5qh4DbCoY5nQGXib5uM81BgG//gicfQkVlgly4pnkUmGOHUchQmBiR
	Kq02d07rP/ElGGUWFkTs9A+Dtuini0LU5qCXi/jIvnM+LZHl6VnTUfmG7zp0zWiT1oJx
	62u1Vl5xWyezeJnh7UlI8bixOPpJQsLqNz+ijlVjWMUmTocYB5JNcYqFukx7dL+5pi30
	oC6c8Dlp3cRbbQ+7SBBhHRoRq1sNh5Tm/p4Hn+dbKTbO5rfigRovaUA7hx7wJWfValz8
	rm+Q8tZ3hbz6Gfo0TJk+8Y3mNj4LqGkEoacFeeZmohc0RR7Trld70e2wqeRZDHUAllaI
	HLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XI/ZCexzmyhMm/Q0l9Ku/PRSjpio12+GpPqg/we+9xE=;
	b=nWgRCcKh8NnSEaa0jtN6HzQ83Ik8zg1jFb/4XHhA3//AKRbQT4E96ce/vd3repziyT
	Ii3Q7d/fgvK3r3sMEMzW/ZVKO9FuPGZ6gQHqf9A54d34LEwVa7IbpqiiVIL4CymIQfuC
	5firiMpPNZpSK0d3yC7LRU5T6+05KqvBnasvlQZRie1nvVDmiXXaBl4ko7RCqOq6wRn0
	Pbkh7wanYcx15oTcr3+3+Y+s/N80ZaSc0/EwEBR0Or8EKOI4KFmiPQVxgWFKlopd4j16
	rULOuBeSXz1q9Sht5Pvlg5v0Bz1sd+8e0zUh4Xzhj6Wsdq1mDOc1J15DT+0cdA6L9on5
	s+jg==
X-Gm-Message-State: AIVw110XWEF1nPQ4dfh4iloBBTPvEopHG5cSp7d+hcQFucMAb8PLAP7h
	kaeeRC/v2KZGOshDPS0LaiFYw1Zuxw==
X-Received: by 10.13.229.196 with SMTP id o187mr4305042ywe.138.1499762185517; 
	Tue, 11 Jul 2017 01:36:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.200.129 with HTTP; Tue, 11 Jul 2017 01:36:25 -0700 (PDT)
In-Reply-To: <CAHiDW_GVArsb8O_kgsBLyqC=6sLz8c3+ABsCPD_QSkpU6G5aHQ@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
	<CAHiDW_FuM-jB6f+xN1QOcqAvTUvfehfpWjoSL8N+XiFS9kLX-Q@mail.gmail.com>
	<CAHiDW_GVArsb8O_kgsBLyqC=6sLz8c3+ABsCPD_QSkpU6G5aHQ@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Tue, 11 Jul 2017 10:36:25 +0200
Message-ID: <CAC+thW3XNt5HGAOZvZO2bVOpt2RKn_v4E0fRPXWVLKNFNs+zsQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libepoxy: Upgrade 1.4.2 -> 1.4.3
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
X-List-Received-Date: Tue, 11 Jul 2017 08:36:25 -0000
Content-Type: multipart/alternative; boundary="94eb2c08155450d9c805540698d5"

--94eb2c08155450d9c805540698d5
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 11, 2017 at 10:27 AM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> On 11 July 2017 at 10:42, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>
>> Exception: FileExistsError: [Errno 17] File exists:
>>> '/home/gizero/work/smartliving/distro/repo-master/build-poky
>>> /tmp/sysroots-components/raspberrypi3/userland/usr/include/KHR/khrplatform.h'
>>> -> '/home/gizero/work/smartliving/distro/repo-master/build-poky
>>> /tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/gtk+3/3.2
>>> 2.16-r0/recipe-sysroot/usr/include/KHR/khrplatform.h'
>>>
>>
>> /usr/include/KHR/khrplatform.h is the egl platform header file, provided
>> by both mesa and RPI userland. Does mesa end up in your gtk+3
>> recipe-sysroot somehow?
>>
>> For clarity: this could be a bug but it is unlikely to be related to the
>> libepoxy change (it does not use or ship the actual header file).
>>
>>
>
> Actually this was maybe fixed by Otavios upgrade to mesa 17.1.4 -- mesa
> accidentally shipped khrplatform.h even when egl was disabled (which is
> what mesa-gl in oe-core does).
>
> Make sure you have oe-core commit f0762f5bad3 (poky: 773d10873).
>

Yes I have it, and the cleansstate mentioned above makes me think it got
used as expected. Indeed the commit you mention is part of the bunch of
commits after pulling which I got my builds broken... I'm confused! Any
idea how to figure out which recipe get considered first in gtk+3's
do_prepare_recipe_sysroot and effectively deliver khrplatform.h to the
recipe-sysroot?

--94eb2c08155450d9c805540698d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jul 11, 2017 at 10:27 AM, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"=
><span class=3D"gmail-">On 11 July 2017 at 10:42, Jussi Kukkonen <span dir=
=3D"ltr">&lt;<a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">=
jussi.kukkonen@intel.com</a>&gt;</span> wrote:<blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><div><div class=3D"gmail-m_-8185593225310596229gmail-m_771=
5571185077541754gmail-h5"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div class=3D"gmail_extra">Exception: FileExistsError: [E=
rrno 17] File exists: &#39;/home/gizero/work/smartliving<wbr>/distro/repo-m=
aster/build-poky<wbr>/tmp/sysroots-components/raspb<wbr>errypi3/userland/us=
r/include/K<wbr>HR/khrplatform.h&#39; -&gt; &#39;/home/gizero/work/smartliv=
ing<wbr>/distro/repo-master/build-poky<wbr>/tmp/work/cortexa7hf-neon-vfpv<w=
br>4-poky-linux-gnueabi/gtk+3/3.2<wbr>2.16-r0/recipe-sysroot/usr/inc<wbr>lu=
de/KHR/khrplatform.h&#39;<br></div></div></blockquote><div><br></div></div>=
</div><div>/usr/include/KHR/khrplatform.h is the egl platform header file, =
provided by both mesa and RPI userland. Does mesa end up in your gtk+3 reci=
pe-sysroot somehow?<br></div><div><br></div><div>For clarity: this could be=
 a bug but it is unlikely to be related to the libepoxy change (it does not=
 use or ship the actual header file).</div><span class=3D"gmail-m_-81855932=
25310596229gmail-m_7715571185077541754gmail-HOEnZb"><font color=3D"#888888"=
><div>=C2=A0</div></font></span></div></div></div></blockquote><div><br></d=
iv></span><div>Actually this was maybe fixed by Otavios upgrade to mesa 17.=
1.4 -- mesa accidentally shipped khrplatform.h even when egl was disabled (=
which is what mesa-gl in oe-core does).</div><div><br></div><div>Make sure =
you have oe-core commit f0762f5bad3 (poky: 773d10873).<br></div></div></div=
></div></blockquote></div><br></div><div class=3D"gmail_extra">Yes I have i=
t, and the cleansstate mentioned above makes me think it got used as expect=
ed. Indeed the commit you mention is part of the bunch of commits after pul=
ling which I got my builds broken... I&#39;m confused! Any idea how to figu=
re out which recipe get considered first in gtk+3&#39;s do_prepare_recipe_s=
ysroot and effectively deliver khrplatform.h to the recipe-sysroot?<br></di=
v></div>

--94eb2c08155450d9c805540698d5--
