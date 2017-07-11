Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id D3D0C77E9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:35:04 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id k192so12588108ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 01:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bFVSjgSH2O1SCEmWuqYIrkdCWQsupxi6rYhkafZNqK0=;
	b=oR/0Sroj0plFCjj/pmClIpyrBihmJp6FiIvBXXiLtk5w+VCanLIulVUFfgIQZJiz0c
	Z/5vZ21UUrkllMJdgxzdqJjsEZImaHp2SKQW/lGy3psZHJS+dx1qbme7Nxx4zwA4VD8M
	O33yR8IgW9Vikxp3ehY1CUhLXH2JLHT8Z3biLDgGd73U8W8Lkw7kao5VvRbCzd1wbkxb
	8QcciEfwYsfMQxi1d4ol6ro5eyd2yN1Ll5nEn1FncXJxsR7mOetGe7Bkzq/OZp/+XkZF
	USqzSaQP0eWWpVqibKX8kER0mr+6oFxvwHuPiDmrZ9WNqW0PQIR1v6rLIV7ZxlqFsz8y
	1Q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bFVSjgSH2O1SCEmWuqYIrkdCWQsupxi6rYhkafZNqK0=;
	b=WfRbkHUVJXvw/zKQKybxqlO+GzGQ0VC4S4fW8sJ/0QOOmtovDKYw/L6PXK4H1pAqqs
	xAtSAQLlEpxJzQiSkL3xtq9suV56A7Rq1Zsqg+tN9xQhTnrfm/BaJFx/Dbw38DYAR2x6
	+cfmQaAd86J3a5EjUCOZmdicvmre7pf/19fz2M5Vj6stEQerch6iAEMKjFFjrTukXITx
	yGHsRWF+XGeBtwp+WHchOTj4ED0QZ6of8bEOshAqB0ENfVYBo+Gc2cBYgtDBj7EZFnnY
	3OD5GiYdvlPWzXoXOgR8wLYHYcR5yoC+aBomu0eeEI/Y13PB27D5Bj3CgO8llxcP3CMZ
	STng==
X-Gm-Message-State: AIVw1113wOELJJk4Pm/4jR3347Jyr7lA1HkrF/xYm15usPQXUGdcPyv3
	f3k56vVXlSJIX+8p7CcJJjWYJeshUXIU
X-Received: by 10.107.170.212 with SMTP id g81mr6888465ioj.19.1499762105743;
	Tue, 11 Jul 2017 01:35:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.44.87 with HTTP; Tue, 11 Jul 2017 01:34:35 -0700 (PDT)
In-Reply-To: <CAHiDW_GVArsb8O_kgsBLyqC=6sLz8c3+ABsCPD_QSkpU6G5aHQ@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
	<CAHiDW_FuM-jB6f+xN1QOcqAvTUvfehfpWjoSL8N+XiFS9kLX-Q@mail.gmail.com>
	<CAHiDW_GVArsb8O_kgsBLyqC=6sLz8c3+ABsCPD_QSkpU6G5aHQ@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 11 Jul 2017 11:34:35 +0300
Message-ID: <CAHiDW_EK4f9PoCnoCzDbNjmKrQeyT-UmJ2jDVqxsmq=CQHLfWg@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Jul 2017 08:35:05 -0000
Content-Type: multipart/alternative; boundary="001a11425b708f93bb05540693b7"

--001a11425b708f93bb05540693b7
Content-Type: text/plain; charset="UTF-8"

On 11 July 2017 at 11:27, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

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
>
Sorry, I've not had enough  coffee. It was the other way round:
khrplatform.h is the platform header that mesa now thinks is needed whether
egl is enabled or not -- so they've started installing it in any case from
17.1.4 which means mesa-gl now provides khrplatform.h and thus conflicts
with userland.

I don't know what the correct fix is yet, just wanted to correct my
original wrong info.

--001a11425b708f93bb05540693b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
1 July 2017 at 11:27, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D"">On 11 July=
 2017 at 10:42, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mailto:juss=
i.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;</s=
pan> wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div><div class=3D=
"m_4575222263530032324gmail-m_7715571185077541754gmail-h5"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extr=
a">Exception: FileExistsError: [Errno 17] File exists: &#39;/home/gizero/wo=
rk/smartliving<wbr>/distro/repo-master/build-poky<wbr>/tmp/sysroots-compone=
nts/raspb<wbr>errypi3/userland/usr/include/K<wbr>HR/khrplatform.h&#39; -&gt=
; &#39;/home/gizero/work/smartliving<wbr>/distro/repo-master/build-poky<wbr=
>/tmp/work/cortexa7hf-neon-vfpv<wbr>4-poky-linux-gnueabi/gtk+3/3.2<wbr>2.16=
-r0/recipe-sysroot/usr/inc<wbr>lude/KHR/khrplatform.h&#39;<br></div></div><=
/blockquote><div><br></div></div></div><div>/usr/include/KHR/khrplatform.h =
is the egl platform header file, provided by both mesa and RPI userland. Do=
es mesa end up in your gtk+3 recipe-sysroot somehow?<br></div><div><br></di=
v><div>For clarity: this could be a bug but it is unlikely to be related to=
 the libepoxy change (it does not use or ship the actual header file).</div=
><span class=3D"m_4575222263530032324gmail-m_7715571185077541754gmail-HOEnZ=
b"><font color=3D"#888888"><div>=C2=A0</div></font></span></div></div></div=
></blockquote><div><br></div></span><div>Actually this was maybe fixed by O=
tavios upgrade to mesa 17.1.4 -- mesa accidentally shipped khrplatform.h ev=
en when egl was disabled (which is what mesa-gl in oe-core does).</div><div=
><br></div></div></div></div></blockquote><div><br></div><div>Sorry, I&#39;=
ve not had enough =C2=A0coffee. It was the other way round: khrplatform.h i=
s the platform header that mesa now thinks is needed whether egl is enabled=
 or not -- so they&#39;ve started installing it in any case from 17.1.4 whi=
ch means mesa-gl now provides khrplatform.h and thus conflicts with userlan=
d.</div><div><br></div><div>I don&#39;t know what the correct fix is yet, j=
ust wanted to correct my original wrong info.</div><div><br></div></div></d=
iv></div>

--001a11425b708f93bb05540693b7--
