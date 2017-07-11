Return-Path: <gizero@gmail.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8E06B7807C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 22:02:04 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id l21so2391093ywb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 15:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L/htIrl0jIfTNsVd2Jxd1ihxc6msiETW4UWJlX51ENc=;
	b=EIQKBN5URZ9HCKSiFNC8PHbXB7cUZ6umiaLKnW12BClra9pXSxmpJ+pGbTKENVoqUl
	w1OsaufwiI7X9dcWzLYqshctHM2+vAX9MSfOVEZAhhkJsHH8jTR7YOmkHctjVXVRQa68
	/evEIbdhhBpstBqI6Vdki15pyzEUGgpeM5sQgPaB3oypW0CVF/gYIWHE+Dbqxvn0xbhC
	kT2gknMhSbimlopMINIk/8CF7XbCV3w4NB4+0p+3cGhHJIgbaqSBoRrM7h4/eZXTAKXs
	nCHLH3JnsP/zAcmghOK4Hu7wkWrWdFwqGZpF3nLT+Umqm0YeyAjteM0kVWu5lHQkxRBB
	6SHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L/htIrl0jIfTNsVd2Jxd1ihxc6msiETW4UWJlX51ENc=;
	b=SMrgfZwRpYE0XPneRUJMPJqJsQnuSxBKIwOHkAnDZEZY31ROro7hXH5tuNdXCmubs0
	kSTUIjEsEMcLyt8CcgwLtPPa8LSGjReF+Ka9ZxGGXLV6F9mWTBj5RjPfTiV1NsNGBUdR
	RpsErdnTW/OSmUihsT6wKvfdFUepApt3jckuI/MI3arRMujZkoAi+m6U6SfsZfQwSOUk
	m+D9q4pUv1pQ+ThrVBtuXGj6Mp9UIlRdoAUjCHjd0sBc3aUr+KCYhZFtXKf27ZagQxN+
	WvxQfktHAngoQC0NdbnFWHN+kU53H8PumK66mQpJRlBt7z7jAZqwrLenHbzsqydMWVXH
	Cm/A==
X-Gm-Message-State: AIVw112+jM7YtK6S19b/3p7/QmfqkaFTcHS41ka7SCL4urq8M0wwCBD7
	Eb+xY4CqjfnzYM3dBrwEga3BR/mJCg==
X-Received: by 10.13.253.7 with SMTP id n7mr243858ywf.188.1499810525361; Tue,
	11 Jul 2017 15:02:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.200.129 with HTTP; Tue, 11 Jul 2017 15:02:04 -0700 (PDT)
Received: by 10.13.200.129 with HTTP; Tue, 11 Jul 2017 15:02:04 -0700 (PDT)
In-Reply-To: <CAMKF1srwg43QrxOGz7UrqmuQ5ptRNJzYC5p9GAcLN7Ldw0ynuA@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
	<CAHiDW_FuM-jB6f+xN1QOcqAvTUvfehfpWjoSL8N+XiFS9kLX-Q@mail.gmail.com>
	<CAHiDW_GVArsb8O_kgsBLyqC=6sLz8c3+ABsCPD_QSkpU6G5aHQ@mail.gmail.com>
	<CAHiDW_EK4f9PoCnoCzDbNjmKrQeyT-UmJ2jDVqxsmq=CQHLfWg@mail.gmail.com>
	<CAMKF1srwg43QrxOGz7UrqmuQ5ptRNJzYC5p9GAcLN7Ldw0ynuA@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Wed, 12 Jul 2017 00:02:04 +0200
Message-ID: <CAC+thW3DG03wQZ8WCyvyPYk8HcRP1C-Cq3F77HxC3b1_q4RKeA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 11 Jul 2017 22:02:05 -0000
Content-Type: multipart/alternative; boundary="94eb2c06c23a9857e3055411d9bc"

--94eb2c06c23a9857e3055411d9bc
Content-Type: text/plain; charset="UTF-8"

Il 11 lug 2017 8:00 PM, "Khem Raj" <raj.khem@gmail.com> ha scritto:

On Tue, Jul 11, 2017 at 1:34 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> On 11 July 2017 at 11:27, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>
>> On 11 July 2017 at 10:42, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:
>>>>
>>>> Exception: FileExistsError: [Errno 17] File exists:
>>>> '/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/
sysroots-components/raspberrypi3/userland/usr/include/KHR/khrplatform.h'
>>>> ->
>>>> '/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/
cortexa7hf-neon-vfpv4-poky-linux-gnueabi/gtk+3/3.22.16-
r0/recipe-sysroot/usr/include/KHR/khrplatform.h'
>>>
>>>
>>> /usr/include/KHR/khrplatform.h is the egl platform header file, provided
>>> by both mesa and RPI userland. Does mesa end up in your gtk+3
recipe-sysroot
>>> somehow?
>>>
>>> For clarity: this could be a bug but it is unlikely to be related to the
>>> libepoxy change (it does not use or ship the actual header file).
>>>
>>
>>
>> Actually this was maybe fixed by Otavios upgrade to mesa 17.1.4 -- mesa
>> accidentally shipped khrplatform.h even when egl was disabled (which is
what
>> mesa-gl in oe-core does).
>>
>
> Sorry, I've not had enough  coffee. It was the other way round:
> khrplatform.h is the platform header that mesa now thinks is needed
whether
> egl is enabled or not -- so they've started installing it in any case from
> 17.1.4 which means mesa-gl now provides khrplatform.h and thus conflicts
> with userland.
>
> I don't know what the correct fix is yet, just wanted to correct my
original
> wrong info.
>

Post an update to sync this header for userland package.


Will this help solving the gtk+3 issue of mesa-gl and userland now both
providing the same header and causing recipe-sysroot construction to fail?


>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c06c23a9857e3055411d9bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">Il 11 lug 2017 8:00 PM, &quot;Khem Raj&quot; &lt;<a href=3D"mailt=
o:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; ha scritto:<br type=3D"att=
ribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">On Tue, Jul 11, 2017 at 1:34 AM, Jussi K=
ukkonen<br>
<div class=3D"elided-text">&lt;<a href=3D"mailto:jussi.kukkonen@intel.com">=
jussi.kukkonen@intel.com</a>&gt; wrote:<br>
&gt; On 11 July 2017 at 11:27, Jussi Kukkonen &lt;<a href=3D"mailto:jussi.k=
ukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 11 July 2017 at 10:42, Jussi Kukkonen &lt;<a href=3D"mailto:jus=
si.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Exception: FileExistsError: [Errno 17] File exists:<br>
&gt;&gt;&gt;&gt; &#39;/home/gizero/work/<wbr>smartliving/distro/repo-<wbr>m=
aster/build-poky/tmp/<wbr>sysroots-components/<wbr>raspberrypi3/userland/us=
r/<wbr>include/KHR/khrplatform.h&#39;<br>
&gt;&gt;&gt;&gt; -&gt;<br>
&gt;&gt;&gt;&gt; &#39;/home/gizero/work/<wbr>smartliving/distro/repo-<wbr>m=
aster/build-poky/tmp/work/<wbr>cortexa7hf-neon-vfpv4-poky-<wbr>linux-gnueab=
i/gtk+3/3.22.16-<wbr>r0/recipe-sysroot/usr/include/<wbr>KHR/khrplatform.h&#=
39;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /usr/include/KHR/khrplatform.h is the egl platform header file=
, provided<br>
&gt;&gt;&gt; by both mesa and RPI userland. Does mesa end up in your gtk+3 =
recipe-sysroot<br>
&gt;&gt;&gt; somehow?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; For clarity: this could be a bug but it is unlikely to be rela=
ted to the<br>
&gt;&gt;&gt; libepoxy change (it does not use or ship the actual header fil=
e).<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Actually this was maybe fixed by Otavios upgrade to mesa 17.1.4 --=
 mesa<br>
&gt;&gt; accidentally shipped khrplatform.h even when egl was disabled (whi=
ch is what<br>
&gt;&gt; mesa-gl in oe-core does).<br>
&gt;&gt;<br>
&gt;<br>
&gt; Sorry, I&#39;ve not had enough=C2=A0 coffee. It was the other way roun=
d:<br>
&gt; khrplatform.h is the platform header that mesa now thinks is needed wh=
ether<br>
&gt; egl is enabled or not -- so they&#39;ve started installing it in any c=
ase from<br>
&gt; 17.1.4 which means mesa-gl now provides khrplatform.h and thus conflic=
ts<br>
&gt; with userland.<br>
&gt;<br>
&gt; I don&#39;t know what the correct fix is yet, just wanted to correct m=
y original<br>
&gt; wrong info.<br>
&gt;<br>
<br>
</div>Post an update to sync this header for userland package.<br></blockqu=
ote></div></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Will th=
is help solving the gtk+3 issue of mesa-gl and userland now both providing =
the same header and causing recipe-sysroot construction to fail?=C2=A0</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_extra"><=
div class=3D"gmail_quote"><blockquote class=3D"quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"elided-text"><br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
</div></blockquote></div><br></div></div></div>

--94eb2c06c23a9857e3055411d9bc--
