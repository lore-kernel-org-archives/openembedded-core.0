Return-Path: <gizero@gmail.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7801777E93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:38:22 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id a12so45876753ywh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 01:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=swBZFjB6HsEcHOrukLmKn/vHUdWYuLUn6YfpOn2ArYM=;
	b=cVAOx7hGw3UyC1DEyGxnrkWV1tLXLuqsvYpP0SFSRoM1NTNjTnqOCtHdN43kg+Dkgq
	HT5A5+oPRHibnXQaOLFJqblZld686jPogYj5pHH1LS0jpbdqJP4UcpfX0HUCmy9zcYno
	t/hjmG3b47aCNbmwHRFRN7qshGx/9wEff+ZPVB9RN1qIlJLUliA87kG1v3TuVKmV/PwW
	SAca2jK4gs3LPzBmQuxp+D1yLcIG7ZvezhPFlFGtOELZkrRYTV0qHP3Gs0eL8vPGNkhT
	suXjOSq3W2acfYL8mcr6TQ9mCLVkoxBQ0T4JB5T3meIqSMzQPuAsnVX45VMRoo7yqGp5
	i1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=swBZFjB6HsEcHOrukLmKn/vHUdWYuLUn6YfpOn2ArYM=;
	b=SwSgmGRpXwVEqQF0tPUKQSUJuftGVxC/GVMC+147wamz2rQn2IYDXvRvq8nfONW15H
	KOk18FSml4k9o7U/apN8iLhwbJPGz7dwnmTHeGdQhWg7LCyJcIiCxrmkk5D5HhbGLCwM
	8JWTXFB7iLc3/sC5CCNsqm2yiTw58jq4CCTHiMkSd8vF25Kck2TIukyAcsqv8KXcwI15
	JwqNUV50JlD9OhF3Uy712b0J0VpxmQP/QbQKVq1fuRhDWAX5sx2zGYpfWkqRQ0qObiHc
	SnjbHBgLUR7Q2mboH2Dfk0NEnX9+3W8lK3gBvpHYqlellkuhbCEL5khB6lAXICqWTc3s
	kv6g==
X-Gm-Message-State: AIVw112lzwqm/4bhvbYwRYY3rWAgjqbkmyD741Lcrq0ttgN4sK3tW3RD
	PV1FoolM8rF5FqsLy+DZxlSzMD4UeH/F
X-Received: by 10.13.253.7 with SMTP id n7mr3640220ywf.188.1499762303328; Tue,
	11 Jul 2017 01:38:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.200.129 with HTTP; Tue, 11 Jul 2017 01:38:22 -0700 (PDT)
In-Reply-To: <CAHiDW_EK4f9PoCnoCzDbNjmKrQeyT-UmJ2jDVqxsmq=CQHLfWg@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
	<CAHiDW_FuM-jB6f+xN1QOcqAvTUvfehfpWjoSL8N+XiFS9kLX-Q@mail.gmail.com>
	<CAHiDW_GVArsb8O_kgsBLyqC=6sLz8c3+ABsCPD_QSkpU6G5aHQ@mail.gmail.com>
	<CAHiDW_EK4f9PoCnoCzDbNjmKrQeyT-UmJ2jDVqxsmq=CQHLfWg@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Tue, 11 Jul 2017 10:38:22 +0200
Message-ID: <CAC+thW3cM6WNMtVzgrOEyGaZbb-8bpPoUm0XDTJ+pvc8xYY5dQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Jul 2017 08:38:22 -0000
Content-Type: multipart/alternative; boundary="94eb2c06c23a566f250554069f59"

--94eb2c06c23a566f250554069f59
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 11, 2017 at 10:34 AM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> On 11 July 2017 at 11:27, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>
>> On 11 July 2017 at 10:42, Jussi Kukkonen <jussi.kukkonen@intel.com>
>> wrote:
>>>
>>> Exception: FileExistsError: [Errno 17] File exists:
>>>> '/home/gizero/work/smartliving/distro/repo-master/build-poky
>>>> /tmp/sysroots-components/raspberrypi3/userland/usr/include/KHR/khrplatform.h'
>>>> -> '/home/gizero/work/smartliving/distro/repo-master/build-poky
>>>> /tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/gtk+3/3.2
>>>> 2.16-r0/recipe-sysroot/usr/include/KHR/khrplatform.h'
>>>>
>>>
>>> /usr/include/KHR/khrplatform.h is the egl platform header file, provided
>>> by both mesa and RPI userland. Does mesa end up in your gtk+3
>>> recipe-sysroot somehow?
>>>
>>> For clarity: this could be a bug but it is unlikely to be related to the
>>> libepoxy change (it does not use or ship the actual header file).
>>>
>>>
>>
>> Actually this was maybe fixed by Otavios upgrade to mesa 17.1.4 -- mesa
>> accidentally shipped khrplatform.h even when egl was disabled (which is
>> what mesa-gl in oe-core does).
>>
>>
> Sorry, I've not had enough  coffee. It was the other way round:
> khrplatform.h is the platform header that mesa now thinks is needed whether
> egl is enabled or not -- so they've started installing it in any case from
> 17.1.4 which means mesa-gl now provides khrplatform.h and thus conflicts
> with userland.
>
> I don't know what the correct fix is yet, just wanted to correct my
> original wrong info.
>

Ok, got it.... That was also my initial interpretation of mentioned commit
message which states:

    mesa: Upgrade to 17.1.4 release

    This includes following upstream bug fixes:

    Bug 77240 - khrplatform.h not installed if EGL is disabled

--94eb2c06c23a566f250554069f59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jul 11, 2017 at 10:34 AM, Jussi Kukkonen <span dir=3D"ltr">&lt;=
<a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkone=
n@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail=
_quote"><span class=3D"gmail-">On 11 July 2017 at 11:27, Jussi Kukkonen <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"_b=
lank">jussi.kukkonen@intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra=
"><div class=3D"gmail_quote"><span>On 11 July 2017 at 10:42, Jussi Kukkonen=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:jussi.kukkonen@intel.com" target=
=3D"_blank">jussi.kukkonen@intel.com</a>&gt;</span> wrote:<blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra=
"><div class=3D"gmail_quote"><div><div class=3D"gmail-m_3955806948064031915=
m_4575222263530032324gmail-m_7715571185077541754gmail-h5"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra=
">Exception: FileExistsError: [Errno 17] File exists: &#39;/home/gizero/wor=
k/smartliving<wbr>/distro/repo-master/build-poky<wbr>/tmp/sysroots-componen=
ts/raspb<wbr>errypi3/userland/usr/include/K<wbr>HR/khrplatform.h&#39; -&gt;=
 &#39;/home/gizero/work/smartliving<wbr>/distro/repo-master/build-poky<wbr>=
/tmp/work/cortexa7hf-neon-vfpv<wbr>4-poky-linux-gnueabi/gtk+3/3.2<wbr>2.16-=
r0/recipe-sysroot/usr/inc<wbr>lude/KHR/khrplatform.h&#39;<br></div></div></=
blockquote><div><br></div></div></div><div>/usr/include/KHR/khrplatform.h i=
s the egl platform header file, provided by both mesa and RPI userland. Doe=
s mesa end up in your gtk+3 recipe-sysroot somehow?<br></div><div><br></div=
><div>For clarity: this could be a bug but it is unlikely to be related to =
the libepoxy change (it does not use or ship the actual header file).</div>=
<span class=3D"gmail-m_3955806948064031915m_4575222263530032324gmail-m_7715=
571185077541754gmail-HOEnZb"><font color=3D"#888888"><div>=C2=A0</div></fon=
t></span></div></div></div></blockquote><div><br></div></span><div>Actually=
 this was maybe fixed by Otavios upgrade to mesa 17.1.4 -- mesa accidentall=
y shipped khrplatform.h even when egl was disabled (which is what mesa-gl i=
n oe-core does).</div><div><br></div></div></div></div></blockquote><div><b=
r></div></span><div>Sorry, I&#39;ve not had enough =C2=A0coffee. It was the=
 other way round: khrplatform.h is the platform header that mesa now thinks=
 is needed whether egl is enabled or not -- so they&#39;ve started installi=
ng it in any case from 17.1.4 which means mesa-gl now provides khrplatform.=
h and thus conflicts with userland.</div><div><br></div><div>I don&#39;t kn=
ow what the correct fix is yet, just wanted to correct my original wrong in=
fo.</div></div></div></div></blockquote><div><br></div><div>Ok, got it.... =
That was also my initial interpretation of mentioned commit message which s=
tates:<br><br></div></div>=C2=A0=C2=A0=C2=A0 mesa: Upgrade to 17.1.4 releas=
e<br>=C2=A0=C2=A0=C2=A0 <br>=C2=A0=C2=A0=C2=A0 This includes following upst=
ream bug fixes:<br>=C2=A0=C2=A0=C2=A0 <br>=C2=A0=C2=A0=C2=A0 Bug 77240 - kh=
rplatform.h not installed if EGL is disabled<br></div></div>

--94eb2c06c23a566f250554069f59--
