Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4F92777E93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:27:46 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id m68so56699651ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 01:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=98o/Uy6qt9pvcK1xsgSAuW9rwramJx+YOCYRlYvIANc=;
	b=NLEhUqnF++48oWxZ67cJa3DSZ/LayKFiq46I/V/CAEMXlwI8Zqy5j46lNbQmo/ivBw
	9x1yJKflq7gwq88RomDryiVUTja+1aPe8D7ZISAultiJpY3VyyGRoWxoYEyZRsn8sFRd
	DzLBIXAV8mNWOvXQtsVcJKBY/vEajj8ZcLW0guPMkZ30FGcGuSBZrSvyc3UcygmIoWnV
	tqiwmTtaDLhf+JjTorMUrdawJdbfT6k/YgjZGg43uuUkcTQNs2SKpuRTtUQpy7HHC6h3
	Uj0VLdDpRrSCT+PrknWF68A+cAduMKoFHsYJeQdawcKzbsmMVlisxvtMfQmjkZUzBkWH
	AiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=98o/Uy6qt9pvcK1xsgSAuW9rwramJx+YOCYRlYvIANc=;
	b=p/CjkpRD1NfuMtZegGJ8zKmNQM2oOaKTwxOAK7fEj1LHQ1AW7rW2Aece5FXKp26tzw
	/XdxYBCJcPTZNvkCTF56+mJZzCbSA1LwvA+DSMqcOCIMllnCkiNrCji6mr/qh5QogayB
	MuVE4Yr+9dQqzGdaYk5/loaYkWGtbsEkPr3xcinBncb/u9N+74MlkGyUPektzQseH8wJ
	VEM0G8wUEbrmNZBmBQhLynmzBEHdnNQ9/0sLspejdWgZEJqD73P+8krbs3mW4S9JKoKb
	m/sUO9ldkQHmXTlk6uy0y2254Q4Cgo4tLVMsm8jRG2EJlQ902jBdnUCITj1YjXvsPXHt
	4Mog==
X-Gm-Message-State: AIVw110ybTz6DAvyOv3/G0ZeM9EJrF5PlWMqty0kn0FOSR6CzdhGuZn8
	9VE4h0LR1t/HJYUB6E9nvBiQZ8sgzCs8
X-Received: by 10.107.37.141 with SMTP id l135mr7102136iol.146.1499761667533; 
	Tue, 11 Jul 2017 01:27:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.44.87 with HTTP; Tue, 11 Jul 2017 01:27:17 -0700 (PDT)
In-Reply-To: <CAHiDW_FuM-jB6f+xN1QOcqAvTUvfehfpWjoSL8N+XiFS9kLX-Q@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
	<CAHiDW_FuM-jB6f+xN1QOcqAvTUvfehfpWjoSL8N+XiFS9kLX-Q@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 11 Jul 2017 11:27:17 +0300
Message-ID: <CAHiDW_GVArsb8O_kgsBLyqC=6sLz8c3+ABsCPD_QSkpU6G5aHQ@mail.gmail.com>
To: Andrea Galbusera <gizero@gmail.com>
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
X-List-Received-Date: Tue, 11 Jul 2017 08:27:47 -0000
Content-Type: multipart/alternative; boundary="001a114031ea70fab005540679e1"

--001a114031ea70fab005540679e1
Content-Type: text/plain; charset="UTF-8"

On 11 July 2017 at 10:42, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>
> Exception: FileExistsError: [Errno 17] File exists:
>> '/home/gizero/work/smartliving/distro/repo-master/build-poky
>> /tmp/sysroots-components/raspberrypi3/userland/usr/include/KHR/khrplatform.h'
>> -> '/home/gizero/work/smartliving/distro/repo-master/build-poky
>> /tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/gtk+3/3.2
>> 2.16-r0/recipe-sysroot/usr/include/KHR/khrplatform.h'
>>
>
> /usr/include/KHR/khrplatform.h is the egl platform header file, provided
> by both mesa and RPI userland. Does mesa end up in your gtk+3
> recipe-sysroot somehow?
>
> For clarity: this could be a bug but it is unlikely to be related to the
> libepoxy change (it does not use or ship the actual header file).
>
>

Actually this was maybe fixed by Otavios upgrade to mesa 17.1.4 -- mesa
accidentally shipped khrplatform.h even when egl was disabled (which is
what mesa-gl in oe-core does).

Make sure you have oe-core commit f0762f5bad3 (poky: 773d10873).

Jussi

--001a114031ea70fab005540679e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
1 July 2017 at 10:42, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&=
gt;</span> wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div><div cl=
ass=3D"gmail-m_7715571185077541754gmail-h5"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra">Exception: F=
ileExistsError: [Errno 17] File exists: &#39;/home/gizero/work/smartliving<=
wbr>/distro/repo-master/build-poky<wbr>/tmp/sysroots-components/raspb<wbr>e=
rrypi3/userland/usr/include/K<wbr>HR/khrplatform.h&#39; -&gt; &#39;/home/gi=
zero/work/smartliving<wbr>/distro/repo-master/build-poky<wbr>/tmp/work/cort=
exa7hf-neon-vfpv<wbr>4-poky-linux-gnueabi/gtk+3/3.2<wbr>2.16-r0/recipe-sysr=
oot/usr/inc<wbr>lude/KHR/khrplatform.h&#39;<br></div></div></blockquote><di=
v><br></div></div></div><div>/usr/include/KHR/khrplatform.h is the egl plat=
form header file, provided by both mesa and RPI userland. Does mesa end up =
in your gtk+3 recipe-sysroot somehow?<br></div><div><br></div><div>For clar=
ity: this could be a bug but it is unlikely to be related to the libepoxy c=
hange (it does not use or ship the actual header file).</div><span class=3D=
"gmail-m_7715571185077541754gmail-HOEnZb"><font color=3D"#888888"><div>=C2=
=A0</div></font></span></div></div></div></blockquote><div><br></div><div>A=
ctually this was maybe fixed by Otavios upgrade to mesa 17.1.4 -- mesa acci=
dentally shipped khrplatform.h even when egl was disabled (which is what me=
sa-gl in oe-core does).</div><div><br></div><div>Make sure you have oe-core=
 commit f0762f5bad3 (poky: 773d10873).</div><div><br></div><div>Jussi</div>=
</div></div></div>

--001a114031ea70fab005540679e1--
