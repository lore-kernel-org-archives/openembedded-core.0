Return-Path: <raltherr@google.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 55C18605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 17:41:56 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id j13so43325401iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 09:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KKoiFvAjROP053S/i9EIu6ueGlVYADfZrwMoAxcR7F8=;
	b=lsgVJqcA1QXyPAlZQWLui4HBT5jVU3lpVuNptqLTojp67ete9o5eRR1cNImRc3cSD5
	qhwbumXA94Rte32fu6sHZvjefYjqLtb4xwP8bFURRCPccfI9bdKXHQZ8Jo++teet8ngf
	EVK9pnLZGsfADRY/HgaoUnnYQuQe5NpVmKxYroCLruJZFBBG+aLYniBPf0MiOq7yNV78
	5OG90OsEY2fEohsBRBG7AvKVjZJj+qd3aqtkZkA6D8D75lwRyHe/mXyq+BU73118RcQd
	y5UVosoN7zz1CxWUx2bS+k6/Gpy791kplDrCH+FeyF15W+Nudm/0JksAwvso7pEXTiED
	mRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KKoiFvAjROP053S/i9EIu6ueGlVYADfZrwMoAxcR7F8=;
	b=ldF7/xmxDOZuo341Oza71FR5G6r1uzpaOrbU1vtCPuPYWkFeCDhxScMj8b3yQn2PUF
	mpAK+YphllJoMM7SRsQlDJlBaTAg2ON2yF56qYBHVJkUCVZPFrK2x0jBea5DFhBvgpDa
	/PMyjw2CkT7aqN7Kv8qlO4J2xv9IuKjJd7hnIH4Sj3EQSRu0YtvPQ3/QC1AlV1p/A//0
	5apNk8WcduBkweGBIG980ExR23yvkarq7q1Gyyc03Gif5eepZX1QT6Zfb6bg1avYnnHp
	Bb9Qrc90mc+coYN1rrnsjrc28tayaUaDfpBtg16H29TBXtHeqACWo4Do749HPWzUgYDq
	2TQw==
X-Gm-Message-State: AIkVDXJc51eYm9rLw9/Ckv3uFFDwwl+OSSOpVG2NIoWD0UxPm3StbWqAp1lKIL8GNnDrsF95N9WvzT6Y8SaC/BU7
X-Received: by 10.107.53.13 with SMTP id c13mr9690543ioa.55.1484847716900;
	Thu, 19 Jan 2017 09:41:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.130.106 with HTTP; Thu, 19 Jan 2017 09:41:56 -0800 (PST)
In-Reply-To: <CAJTo0LY8Nr_3qpqn6W6NKGcau80KP1JYGH0N60MS42t5eLPVZw@mail.gmail.com>
References: <20170119165803.22583-1-raltherr@google.com>
	<20170119173700.GX15833@denix.org>
	<CAJTo0LY8Nr_3qpqn6W6NKGcau80KP1JYGH0N60MS42t5eLPVZw@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 19 Jan 2017 09:41:56 -0800
Message-ID: <CAPLgG==KvX7dDapUsrmnk3yRq0x-oOv3fE76TfxdpBaPiK=vXQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: Let U-Boot select ramdisk load/entry address
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
X-List-Received-Date: Thu, 19 Jan 2017 17:41:57 -0000
Content-Type: multipart/alternative; boundary=001a11449e90b672400546760c66

--001a11449e90b672400546760c66
Content-Type: text/plain; charset=UTF-8

Ross and I were discussing that Nathan's patches in
http://lists.openembedded.org/pipermail/openembedded-core/2017-January/131012.html
are equivalent and were introduced first.

On Thu, Jan 19, 2017 at 9:40 AM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 19 January 2017 at 17:37, Denys Dmytriyenko <denis@denix.org> wrote:
>
>> Sometimes it's useful to load ramdisk in a specific location. Your patch
>> unconditionally removes this support, which is not a desired change. I
>> have
>> a patch queued up to do it conditionally, which I'll try to submit
>> shortly.
>>
>
> Would that be the same as Nathan's "kernel-fitimage.bbclass: Allow unset
> load/entry addresses for ramdisks"?
>
> Ross
>
>

--001a11449e90b672400546760c66
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ross and I were discussing that Nathan&#39;s patches in=C2=
=A0<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/201=
7-January/131012.html">http://lists.openembedded.org/pipermail/openembedded=
-core/2017-January/131012.html</a> are equivalent and were introduced first=
.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Ja=
n 19, 2017 at 9:40 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto=
:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D"">On 19 January=
 2017 at 17:37, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:d=
enis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D"m_-6168700665141939843gmail-:1tg" class=3D"m_-6=
168700665141939843gmail-a3s m_-6168700665141939843gmail-aXjCH m_-6168700665=
141939843gmail-m159b7cfb5b346700">Sometimes it&#39;s useful to load ramdisk=
 in a specific location. Your patch<br>
unconditionally removes this support, which is not a desired change. I have=
<br>
a patch queued up to do it conditionally, which I&#39;ll try to submit shor=
tly.<br></div></blockquote><div><br></div></span><div>Would that be the sam=
e as Nathan&#39;s &quot;kernel-fitimage.bbclass: Allow unset load/entry add=
resses for ramdisks&quot;?</div><span class=3D"HOEnZb"><font color=3D"#8888=
88"><div><br></div><div>Ross=C2=A0</div></font></span></div><br></div></div=
>
</blockquote></div><br></div>

--001a11449e90b672400546760c66--
