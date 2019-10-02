Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 03E987C873
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 18:28:06 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id v10so12602283vsc.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 11:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0GgXe4GTIE65d+m8hAtanE+jEk0s26Z6r/Pgsmy0L+s=;
	b=BTk26zkQMwzEBe0RIf2uXeakK5Hy6PbVXKbBUlfLMPECUdWXKcKNWH0GDDqECc8Nug
	MZ8FCHCMdvtLdwXvyKyrPd+lT6m88Zdb8g9bWa7dCoRaWec/T3xwaYh1nGUrFiBNz4MT
	3QR++ieOSSkyGcyplllczdu+TWcOGDXv4k20axJz3kd4CBu0x8G7RdkEjj8oYWDdovKA
	svxS0uUrAEYqHkr4ZHCORtGagHaMNUSy0sEHSkxBMRlRg8WDkcfptKqpY7hVPuCuaDQU
	L/NhMUHKXR30tDqCFErCyK/NM6QkmJqGKDMtQk7sGFWPPZ64OoKOy6iFkmrGZwXF9n2q
	n+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0GgXe4GTIE65d+m8hAtanE+jEk0s26Z6r/Pgsmy0L+s=;
	b=gPGR1Q5eFbIrK1STb0C20YhLoYoDGpwDxo+e/hhJA3Jr9Bwgs2v2EBNUbjJ9LnhES0
	69e33ubD3x0Zl7FP7lS3UCUALrGpk6CUWdzCW1F2g9ZVOXzI6CtSklVRth4DaQ+snoup
	Gk6TLtg1zzaSlVtRDRrCO/x0+cNlpsPtogkZRPNA2JlnOeBorqIW12HZVaUGj7r5705T
	pCPs++fZXnFM/2e+ImeLhUYLjm3cN4oXvLVYnwA7eT2hekdDZpKe+jRPXaqcurxs9ZFk
	Cm9S8t63oTISKJO3ntcOztIxFnbrD2o7MjhBV5idX/32D0GCYY2v/XsMacz+gbntMemz
	YSXQ==
X-Gm-Message-State: APjAAAXUxPAchk/rOKscX0EKQRfnkQGYKmybfahIcB+E7LZKOrsmlCQ4
	8gwJU/thJz0OBsu3HUq5gY5aoT2snlTQjHOf2y7UoYN5
X-Google-Smtp-Source: APXvYqwf9mcsR+uj96ptbPmCCmW2avMC+jVyVsUeDBMQGBPqBSYRqLb+v2WJEM57uOo8uaBAM2QjP719jJoGfydTViI=
X-Received: by 2002:a67:7087:: with SMTP id l129mr2838792vsc.83.1570040887823; 
	Wed, 02 Oct 2019 11:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120027.109242-1-alex.kanavin@gmail.com>
	<20191002120027.109242-2-alex.kanavin@gmail.com>
	<20191002175152.GA14877@localhost>
	<CANNYZj89n07FE7UEo5DdwCs_q2xUePEh_MZgwZ=uYX1hyRqDnA@mail.gmail.com>
	<20191002181821.GB14877@localhost>
In-Reply-To: <20191002181821.GB14877@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Oct 2019 20:27:55 +0200
Message-ID: <CANNYZj8W=Ugu8sRctN3aO1mwSrijDBWLONhFiT4aYrMjRygabw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ethtool, libcap: fix upstream version check
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
X-List-Received-Date: Wed, 02 Oct 2019 18:28:07 -0000
Content-Type: multipart/alternative; boundary="00000000000066d17e0593f1a190"

--00000000000066d17e0593f1a190
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Oct 2019 at 20:18, Adrian Bunk <bunk@stusta.de> wrote:

> On Wed, Oct 02, 2019 at 08:08:08PM +0200, Alexander Kanavin wrote:
> > On Wed, 2 Oct 2019 at 19:51, Adrian Bunk <bunk@stusta.de> wrote:
> >
> > > Works for me without your patch:
> >
> > I am not sure what this may mean; but for me the patch definitely solve=
s
> > the problem.
>
> It means that even without your patch devtool is able to tell me that
> there is a new upstream version of ethtool available.
>
> I was originally wondering whether there is a problem that also affects
> other users of KERNELORG_MIRROR, and was then surprised that it worked
> for me without the change the way I tried.
>
> How are you reproducing the problem?
>

The same way. I am getting the following on my home computer and on both of
my work computers (which are on two different networks). Note the IP
address is different, and the file size is smaller, as it's gzip-compressed=
:

ak@linux-f9zs:~/development/poky/build> devtool check-upgrade-status ethtoo=
l
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry...
NOTE: Retrying server connection (#2)...
Loading cache: 100%
|##########################################################################=
###########################################################################=
################################################|
Time: 0:00:00
Loaded 1301 entries from dependency cache.
--2019-10-02 20:25:30--
https://cdn.kernel.org/pub/software/network/ethtool/
Resolving cdn.kernel.org (cdn.kernel.org)... 151.101.113.176
Connecting to cdn.kernel.org (cdn.kernel.org)|151.101.113.176|:443...
connected.
HTTP request sent, awaiting response... 200 OK
Length: 2155 (2.1K) [text/html]
Saving to: =E2=80=98/tmp/wget-index-l2jg_z9r/wget-listing-mo7c995y=E2=80=99


2019-10-02 20:25:30 (89.5 MB/s) -
=E2=80=98/tmp/wget-index-l2jg_z9r/wget-listing-mo7c995y=E2=80=99 saved [215=
5/2155]

WARNING:root:Some characters could not be decoded, and were replaced with
REPLACEMENT CHARACTER.
INFO: ethtool                   5.2             UNKNOWN_BROKEN  Changhyeok
Bae <changhyeok.bae@gmail.com>

Alex

--00000000000066d17e0593f1a190
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 2 Oct 2019 at 20:18, Adrian Bunk =
&lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></di=
v><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Wed, Oct 02, 2019 at 08:08:08PM +0200, Alexander Kanavin wrote:<br>
&gt; On Wed, 2 Oct 2019 at 19:51, Adrian Bunk &lt;<a href=3D"mailto:bunk@st=
usta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Works for me without your patch:<br>
&gt; <br>
&gt; I am not sure what this may mean; but for me the patch definitely solv=
es<br>
&gt; the problem.<br>
<br>
It means that even without your patch devtool is able to tell me that <br>
there is a new upstream version of ethtool available.<br>
<br>
I was originally wondering whether there is a problem that also affects <br=
>
other users of KERNELORG_MIRROR, and was then surprised that it worked <br>
for me without the change the way I tried.<br>
<br>
How are you reproducing the problem?<br></blockquote><div>=C2=A0<br></div><=
div>The same way. I am getting the following on my home computer and on bot=
h of my work computers (which are on two different networks). Note the IP a=
ddress is different, and the file size is smaller, as it&#39;s gzip-compres=
sed:<br></div><div><br></div><div>ak@linux-f9zs:~/development/poky/build&gt=
; devtool check-upgrade-status ethtool<br>NOTE: Starting bitbake server...<=
br>NOTE: Reconnecting to bitbake server...<br>NOTE: Retrying server connect=
ion (#1)...<br>NOTE: Reconnecting to bitbake server...<br>NOTE: Previous bi=
tbake instance shutting down?, waiting to retry...<br>NOTE: Retrying server=
 connection (#2)...<br>Loading cache: 100% |###############################=
###########################################################################=
###########################################################################=
################| Time: 0:00:00<br>Loaded 1301 entries from dependency cach=
e.<br>--2019-10-02 20:25:30-- =C2=A0<a href=3D"https://cdn.kernel.org/pub/s=
oftware/network/ethtool/">https://cdn.kernel.org/pub/software/network/ethto=
ol/</a><br>Resolving <a href=3D"http://cdn.kernel.org">cdn.kernel.org</a> (=
<a href=3D"http://cdn.kernel.org">cdn.kernel.org</a>)... 151.101.113.176<br=
>Connecting to <a href=3D"http://cdn.kernel.org">cdn.kernel.org</a> (<a hre=
f=3D"http://cdn.kernel.org">cdn.kernel.org</a>)|151.101.113.176|:443... con=
nected.<br>HTTP request sent, awaiting response... 200 OK<br>Length: 2155 (=
2.1K) [text/html]<br>Saving to: =E2=80=98/tmp/wget-index-l2jg_z9r/wget-list=
ing-mo7c995y=E2=80=99<br><br><br>2019-10-02 20:25:30 (89.5 MB/s) - =E2=80=
=98/tmp/wget-index-l2jg_z9r/wget-listing-mo7c995y=E2=80=99 saved [2155/2155=
]<br><br>WARNING:root:Some characters could not be decoded, and were replac=
ed with REPLACEMENT CHARACTER.<br>INFO: ethtool =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5.2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 UNKNOWN_BROKEN =C2=A0Changhyeok Bae &lt;<a href=3D"mailto:changhyeok=
.bae@gmail.com">changhyeok.bae@gmail.com</a>&gt;=C2=A0 <br></div><div><br><=
/div><div>Alex<br></div><div><br></div><div><br> </div></div></div>

--00000000000066d17e0593f1a190--
