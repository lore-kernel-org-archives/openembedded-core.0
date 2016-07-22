Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 29AD9606BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 11:08:51 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id j124so43744676ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 04:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o4PE6jabQFC0CrDkHHvCoYgtaYWql7G+hdB/CGK1XPE=;
	b=Rra64un0tgrZ3Zzezy63neVTZBCqkk7x3fUlpZolX9622uh8w1VPXyt6S1EzWQiYxw
	mXvdExFl3M2UXgdYrBrXMNDoPbC5xKJ96qdyQwTiKKXOeqDn41I19LkDU0ND2eK0lwcr
	9JP8IH6c0Oq7wvq6F2exReMQTowM3GUFIdyJ2DKW/VK6jS3I78UIWWtbwuSFR3ZNpwLq
	0m1642elEucY17SnXm+sZTCzxsXyiLUX23/VRXfrtXmWou8pvuGNAyfWxEbw6YU6NXQC
	M2OUyd3sorjrgvKFEFsUQ4O9pTqBSHcSCeFLUB/YOJFQlivC/Hj8nXpB9WaQnNA7wqT9
	SfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o4PE6jabQFC0CrDkHHvCoYgtaYWql7G+hdB/CGK1XPE=;
	b=euFDKOcTuDICzZpOvg3dv7BedMAhRrOiLE2cJ64x9Ld8OgNy/PASHiwJUTDABfw5Ne
	t1libSoRhJx6HmA4AyDSDWMm1b071XmZ17TSyo1HD+yMoFlok7YomLIrSTkaretUS2eO
	tQ8jsj/T6esrGBFb6v36ueSHUGZTUxxX13T7UoTaMatZK/K1kdi1x/L0xr9neAcHGfCQ
	CXyalx06aXp6TkWUbi4/4vo9Lfqqkh41QG/0h3wEAG9qbFjbVbNankfB9B0TGBPVgbs4
	7YX46AJ0regJOYpgTgS1BBZkQUuI6xCFmFMjppGtoZPPE+g100vyR5e4voBa6zvzJY2V
	lN3w==
X-Gm-Message-State: AEkoousUHlvv+2POoiWj/Uk6PIb1rSoWsz1FNZuV1aWNKaS2YU8dov0a8n4Q/45wRpqQzvBZ7eTnty9nhilUII/M
X-Received: by 10.36.87.140 with SMTP id u134mr3773071ita.38.1469185732493;
	Fri, 22 Jul 2016 04:08:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 22 Jul 2016 04:08:33 -0700 (PDT)
In-Reply-To: <1469167768-9827-1-git-send-email-maxin.john@intel.com>
References: <1469167768-9827-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jul 2016 12:08:33 +0100
Message-ID: <CAJTo0LYEB+iGcHnVn32jiJ9o7ry0gLTEUhS8+v70prrsMOCE7A@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] sysprof: fix floating dependency on polkit
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
X-List-Received-Date: Fri, 22 Jul 2016 11:08:52 -0000
Content-Type: multipart/alternative; boundary=001a1135018cb1dadf0538377594

--001a1135018cb1dadf0538377594
Content-Type: text/plain; charset=UTF-8

On 22 July 2016 at 07:09, Maxin B. John <maxin.john@intel.com> wrote:

> +FILES_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit',
> '${datadir}/dbus-1/', '', d)}"
>

No need to do conditionals in FILES as it's fine for files to not exist.

Ross

--001a1135018cb1dadf0538377594
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 July 2016 at 07:09, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2k8" class=3D"a3=
s aXjCH m156124828f8578e0">+FILES_${PN} +=3D &quot;${@bb.utils.contains(&#3=
9;PACKAGECONFIG&#39;, &#39;polkit&#39;, &#39;${datadir}/dbus-1/&#39;, &#39;=
&#39;, d)}&quot;<br></div></blockquote></div><br>No need to do conditionals=
 in FILES as it&#39;s fine for files to not exist.</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1135018cb1dadf0538377594--
