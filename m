Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8658478692
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 20:11:23 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id w23so1438579vkw.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 13:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VhL04QKqHW+tnJ14dcJ3aoD1uPeeIjrlYQLs7vEgqqo=;
	b=D731xaIXYKgv1irac4nZmhPPAD00HiAoHCpEP9SQ6lCF/8oUhJX/WzCmnNYBrQUCwo
	zJmHpttU233wi8DtzJxu5B9/vEGr0FwtVSlwnwpcJssEfxDuD+01/PcQezfjzCrMDPRq
	vpbrp4OLNDgNtKWD4C1rMErvp6jC0rrzRc5lgY+XhDtU3sgYgHhKS2B1S8Z+hFAB+Y/f
	p55o9C9KA2ZT2G4tK5S7mI/PMyurUI45Xb4NBMhCIs7rczXj+UXeGrA4m1XdDzu22kIn
	VJSOMn3+4ABcbqI4rmN0lxZF6OXHm55FKFhlVBQzAsaXDUUZaRVvsI1V+HyKFFGeJIjL
	u2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VhL04QKqHW+tnJ14dcJ3aoD1uPeeIjrlYQLs7vEgqqo=;
	b=tVuwYTC5CoMyIGZF0ZnjsUkfecB2MEGWdMOJAL/wGgdg4vMyg88d96oCWx1l2nPXkK
	3ThH5VA1Z0f3B9/rAiWVne1He2uda2ynDzpmbc5l2mU0z1+wh/DgOEBI2+fiItZcVNjn
	MObpcp49m9Hj0rEnvMQcuAwwxtnonQCGPfy8E39IJI4X67wtn+kW7Y/NVKzhyQgJhNOl
	62io1ojtgEpYEmQtHCI08mITucY4UnrH9UA8kHe6aO7WuUpWiTIjmgJ2ao8Y1UCJF/+m
	LpTnU0c5E5hW5fOjgyQ/Pz5QporZvrk+OX1VQeBUPv5X8olUgcMEY1ZMaNsyoXw2Xpmo
	xi5w==
X-Gm-Message-State: AHPjjUgDPrqx7sISKuaphhoCeFmSmnHocBlj2j6cqASZdDoXcAjMoDMR
	EHWJ/TjHxfULhJfVGa0wIu1Nqj9mZ+OWmmJxmnQ=
X-Google-Smtp-Source: AOwi7QBOMxime9WqQVR326ypZRDL+7n6FWF+K11sspYJI4JyDUzsWPka/Xra5bykLCd2/c7rB8bBRIQv7wEIMAtWMCc=
X-Received: by 10.31.9.197 with SMTP id 188mr12578604vkj.23.1505333484584;
	Wed, 13 Sep 2017 13:11:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Wed, 13 Sep 2017 13:11:23 -0700 (PDT)
In-Reply-To: <CAJTo0LZCPU5spNk6h=E1CvU+uOQCxi0hbDZPj94QV53caVmCaw@mail.gmail.com>
References: <1504215229-79715-1-git-send-email-juro.bystricky@intel.com>
	<CA+chaQfbZAM+mjNvZ-HYe=XZnNJz+H7Wq9z1vcEsMgDY=CUksg@mail.gmail.com>
	<CAJTo0LYArQkU-OtvmiSwsfa7DaxkiMNPYYTvr_kChi9RvpgC=w@mail.gmail.com>
	<CA+chaQdAuijLCAM8UzwMh1DO-7gc5tD3Ek3DYc-9rUNBY=85cg@mail.gmail.com>
	<20170913141259.GB3288@jama>
	<CAJTo0LZCPU5spNk6h=E1CvU+uOQCxi0hbDZPj94QV53caVmCaw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Sep 2017 22:11:23 +0200
Message-ID: <CA+chaQfgQZAA-tYFrHSnGhTRVi6GT5XcripNsjnntmONAQZJFA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: upgrade to version 2.10.0
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
X-List-Received-Date: Wed, 13 Sep 2017 20:11:23 -0000
Content-Type: multipart/alternative; boundary="001a11440f2c9e1d0c055917c3d8"

--001a11440f2c9e1d0c055917c3d8
Content-Type: text/plain; charset="UTF-8"

BTW: I've just noticed that this upgrade goes backwards again as QA
warnings show:

qemu-2.10.0: Package version for package qemu-dbg went backwards which
would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-dbg went backwards which
would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-dev went backwards which
would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-dev went backwards which
would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-doc went backwards which
would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-doc went backwards which
would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-locale went backwards
which would break package feeds from (0:2.10.0-rc2-r0.0 to
0:2.10.0-r0.0) [version-going-backwards]
qemu-2.10.0: Package version for package qemu-locale went backwards
which would break package feeds from (0:2.10.0-rc2-r0.1 to
0:2.10.0-r0.0) [version-going-backwards]
qemu-2.10.0: Package version for package qemu-ptest went backwards
which would break package feeds from (0:2.10.0-rc2-r0.0 to
0:2.10.0-r0.0) [version-going-backwards]
qemu-2.10.0: Package version for package qemu-ptest went backwards
which would break package feeds from (0:2.10.0-rc2-r0.1 to
0:2.10.0-r0.0) [version-going-backwards]
qemu-2.10.0: Package version for package qemu-staticdev went backwards
which would break package feeds from (0:2.10.0-rc2-r0.0 to
0:2.10.0-r0.0) [version-going-backwards]
qemu-2.10.0: Package version for package qemu-staticdev went backwards
which would break package feeds from (0:2.10.0-rc2-r0.1 to
0:2.10.0-r0.0) [version-going-backwards]
qemu-2.10.0: Package version for package qemu went backwards which
would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu went backwards which
would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]



On Wed, Sep 13, 2017 at 4:15 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 13 September 2017 at 15:12, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> On Fri, Sep 01, 2017 at 01:44:56PM +0200, Martin Jansa wrote:
>> > I don't know how accelerated GL will be in the end, but this commit:
>> > https://git.qemu.org/?p=qemu.git;a=commitdiff;h=474114b7305c
>> c1be7c2ee8ba5267be159a9d56e3
>> > made it possible.
>> >
>> > I've built qemu with my Gentoo host with virgl and spice support, and I
>> > plan to try how fast it goes.
>>
>> I've some WIP changes to build qemu-native with virglrenderer enabled in:
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/qemu
>>
>> and few more to enable spice as well in:
>> http://git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/spice
>
>
> Awesome. Can't wait to see how it performs.
>
> Ross
>

--001a11440f2c9e1d0c055917c3d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">BTW: I&#39;ve just noticed that this upgrade goes backward=
s again as QA warnings show:<div><br></div><div><pre style=3D"color:rgb(0,0=
,0);word-wrap:break-word;white-space:pre-wrap">qemu-2.10.0: Package version=
 for package qemu-dbg went backwards which would break package feeds from (=
0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0) [version-going-backwards]
qemu-2.10.0: Package version for package qemu-dbg went backwards which woul=
d break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0) [version-go=
ing-backwards]
qemu-2.10.0: Package version for package qemu-dev went backwards which woul=
d break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0) [version-go=
ing-backwards]
qemu-2.10.0: Package version for package qemu-dev went backwards which woul=
d break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0) [version-go=
ing-backwards]
qemu-2.10.0: Package version for package qemu-doc went backwards which woul=
d break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0) [version-go=
ing-backwards]
qemu-2.10.0: Package version for package qemu-doc went backwards which woul=
d break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0) [version-go=
ing-backwards]
qemu-2.10.0: Package version for package qemu-locale went backwards which w=
ould break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0) [version=
-going-backwards]
qemu-2.10.0: Package version for package qemu-locale went backwards which w=
ould break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0) [version=
-going-backwards]
qemu-2.10.0: Package version for package qemu-ptest went backwards which wo=
uld break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0) [version-=
going-backwards]
qemu-2.10.0: Package version for package qemu-ptest went backwards which wo=
uld break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0) [version-=
going-backwards]
qemu-2.10.0: Package version for package qemu-staticdev went backwards whic=
h would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0) [vers=
ion-going-backwards]
qemu-2.10.0: Package version for package qemu-staticdev went backwards whic=
h would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0) [vers=
ion-going-backwards]
qemu-2.10.0: Package version for package qemu went backwards which would br=
eak package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0) [version-going-=
backwards]
qemu-2.10.0: Package version for package qemu went backwards which would br=
eak package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0) [version-going-=
backwards]
</pre></div><div><br></div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Wed, Sep 13, 2017 at 4:15 PM, Burton, Ross <span dir=3D=
"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.b=
urton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v dir=3D"ltr"><span class=3D"">On 13 September 2017 at 15:12, Martin Jansa =
<span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_=
blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br></span><div class=3D=
"gmail_extra"><div class=3D"gmail_quote"><span class=3D""><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span>On Fri, Sep 01, 2017 at 01:44:56PM +0200, Martin Jansa =
wrote:<br>
&gt; I don&#39;t know how accelerated GL will be in the end, but this commi=
t:<br>
&gt; <a href=3D"https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D47411=
4b7305cc1be7c2ee8ba5267be159a9d56e3" rel=3D"noreferrer" target=3D"_blank">h=
ttps://git.qemu.org/?p=3Dqemu.g<wbr>it;a=3Dcommitdiff;h=3D474114b7305c<wbr>=
c1be7c2ee8ba5267be159a9d56e3</a><br>
&gt; made it possible.<br>
&gt;<br>
&gt; I&#39;ve built qemu with my Gentoo host with virgl and spice support, =
and I<br>
&gt; plan to try how fast it goes.<br>
<br>
</span>I&#39;ve some WIP changes to build qemu-native with virglrenderer en=
abled in:<br>
<a href=3D"http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dj=
ansa/qemu" rel=3D"noreferrer" target=3D"_blank">http://git.openembedded.org=
/op<wbr>enembedded-core-contrib/log/?<wbr>h=3Djansa/qemu</a><br>
<br>
and few more to enable spice as well in:<br>
<a href=3D"http://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dj=
ansa/spice" rel=3D"noreferrer" target=3D"_blank">http://git.openembedded.or=
g/me<wbr>ta-openembedded-contrib/log/?<wbr>h=3Djansa/spice</a></blockquote>=
<div><br></div></span><div>Awesome. Can&#39;t wait to see how it performs.<=
/div><span class=3D"HOEnZb"><font color=3D"#888888"><div><br></div><div>Ros=
s</div></font></span></div></div></div>
</blockquote></div><br></div>

--001a11440f2c9e1d0c055917c3d8--
