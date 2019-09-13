Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id CE1047EC56
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 19:26:13 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id b11so19394702vsq.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 12:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XPef1vq254d0q+mQk0ESvl1bRCjNb0aELuHCP738PNw=;
	b=F4TMuckEubSWPtHSIGXdYPZB9nSNIhfLeWgw8tOeqlEqDQS4GgvCYjDxpxlQ6+PbUD
	r8K+ujmQSwSDM7ZcgU+jYs8Wi9XbBfoVkFeg63fF/7ejFVvqvaB7lMxyoDrJLxZAZMp1
	DAMo2Scy/rYWeAmlmuVcNJvTINZgzNbLrRts0mx5OHCstP8hC4hSX3GJzRH6z8hhwiYH
	Wf7UsuhFXgu1LXpPn4M8B3jJkmPyTrSW4T69gU2p8uCJX3WiAizc0c7or9YdDCNLCIzB
	mNipwYu/M98JGSDZHZ6fVJixB82VWzWGkReKnoHHUUli/I3ZbBkEiiXb1zoe5vPVv36s
	Bl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XPef1vq254d0q+mQk0ESvl1bRCjNb0aELuHCP738PNw=;
	b=B6dqy+GXc9DdjVUFEcCRCkUyrlYnSTBzMe8yFBUDIsd9xHhx13Uc0Xs5Z9qclpzHlF
	bcBZcvY+03v7B7rSQrmHAxURcdJ6ouNGPskhrRhpg9OmfDp1PO12aICgscRkZWh6i8Hi
	A3DLWcA7+H+Yv0g3G9gFEcvUmTMCy4UPQG8l5H/yJWpYJm4Jrhaiwv+k32xJ4s8sdKKr
	BeFGZkqWW0CV4AOhu9zo5NjLQl2qqPUaO36NY700QR4CDQ5aS45vRMTdQ6EqNH4KQ2uM
	DnvbKCAEw9Wa9enzLQaKfo87w7qtk7oNV67tVVX72yLmP4WBAX5dllYvYUdxqbxFcUny
	OXrw==
X-Gm-Message-State: APjAAAXNb/vjY+Tob7hjnNwYNWD2Tdaa3rWSnEkc/OBcuu0NTw790UJL
	abW6AHxMpzIWkriFkkLtwTTFOho535IQQujYGR4=
X-Google-Smtp-Source: APXvYqzL1QjBPKxIiTeujpp4YGBoVaGj8wdCfV4ZdEB/DQS+mKDDP6dZatxvxnPn+yl9CXliCpeLCof3i8eeasqQSoU=
X-Received: by 2002:a67:784:: with SMTP id 126mr18008482vsh.35.1568402774696; 
	Fri, 13 Sep 2019 12:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190912153644.19473-1-alex.kanavin@gmail.com>
	<20190912153644.19473-3-alex.kanavin@gmail.com>
	<d4f3db04-7102-ee23-8bee-f8b3c3f42af1@intel.com>
In-Reply-To: <d4f3db04-7102-ee23-8bee-f8b3c3f42af1@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Sep 2019 21:26:03 +0200
Message-ID: <CANNYZj--K5j69cA4Sm6EG2FBngV3ROUWTn70wc7zU1FT_BPt-g@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Fri, 13 Sep 2019 19:26:14 -0000
Content-Type: multipart/alternative; boundary="000000000000402b020592743ac9"

--000000000000402b020592743ac9
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Sep 2019 at 21:15, Ross Burton <ross.burton@intel.com> wrote:

> On 12/09/2019 16:36, Alexander Kanavin wrote:
> > -    def test_testimage_virgl_gtk(self):
> > +    def test_testimage_virgl_gtk_sdl(self):
>
> Failing on the autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/707/steps/8/logs/step2d
>

Can I see the following two please?

WARNING: core-image-minimal-1.0-r0 do_testimage: Check full boot log:
/home/pokybuild/yocto-worker/oe-selftest/build/build-st-31169/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemu_boot_log.20190913155532
ERROR: Logfile of failure stored in:
/home/pokybuild/yocto-worker/oe-selftest/build/build-st-31169/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/log.do_testimage.45597

Alex

--000000000000402b020592743ac9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 13 Sep 2019 at 21:15, Ross Burton=
 &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 12/09/2019 16:36, Alexander Kanavin wrote:<br>
&gt; -=C2=A0 =C2=A0 def test_testimage_virgl_gtk(self):<br>
&gt; +=C2=A0 =C2=A0 def test_testimage_virgl_gtk_sdl(self):<br>
<br>
Failing on the autobuilder: <br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/56/build=
s/707/steps/8/logs/step2d" rel=3D"noreferrer" target=3D"_blank">https://aut=
obuilder.yoctoproject.org/typhoon/#/builders/56/builds/707/steps/8/logs/ste=
p2d</a><br></blockquote><div><br></div><div>Can I see the following two ple=
ase?</div><div><br></div><div>WARNING: core-image-minimal-1.0-r0 do_testima=
ge: Check full boot log: /home/pokybuild/yocto-worker/oe-selftest/build/bui=
ld-st-31169/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testim=
age/qemu_boot_log.20190913155532</div><div>ERROR: Logfile of failure stored=
 in: /home/pokybuild/yocto-worker/oe-selftest/build/build-st-31169/tmp/work=
/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/log.do_testimage.4559=
7</div><div><br></div><div>Alex<br></div></div></div>

--000000000000402b020592743ac9--
