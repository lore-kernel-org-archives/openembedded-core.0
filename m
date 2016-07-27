Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF33606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 09:37:56 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id m101so65044556ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 02:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hfVs3mT3zgtRWh6OwGJJxQyy8vhiuP7FS6z5rw3ij7I=;
	b=B82mzMjJTuD1+TGFq06A+EqMQXoHPgefSF1Ro4UwzzYsKmGk0h3W3C7B07F+/nqDhW
	7asKBMgc+QBfgK3AMHzk4YhWFLTQ8Jyul5OX8Lhu81Zz9d24lDZTvqUFKnr5c3DfsN5h
	wJvLonDIeit/rD3Bs2rcPYDDNQlnbb/9JeeoXDdY2jViXCzmWs/gYK/TLqmaB4qA/Uqb
	amoFY8XDYjf0Eo/7YZ6C3LQT7rBVoBzNvq8LWVgxed207CL98lWWy31RtTE1tcy1PVyl
	8CDFDh/QrO3e0C7ZIGP+gv8Lpf/TbCu4+lg7bi5KytxhUTzD6XmfqZPzh/hpKhA69cnk
	gHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hfVs3mT3zgtRWh6OwGJJxQyy8vhiuP7FS6z5rw3ij7I=;
	b=gRcaDvI21PUsWd9kf04piR7QaGWpn1fCOmtqP/tOaWlyWZZZiw/7EpbFFd2jiaxQFX
	SG37FsyS92GA73FR+279Vbo5Uyvqg1zopakFScQAj/JX5zcPx49JhhNNpFl5FbbK8cmF
	5z35aJrnVpjlCaPIiW4GwoCo5Lx0kDrzo4P1lwQpr4+U5l1s4Tv0o6jPuQRICRnaNRlP
	rS89ibKA+RRooBuMf1E6GVLRR7QWH2fMZQa+94WtzZ8WZhr3tuk98plzL8141c58DKbC
	8OE/iF5usoVXBCBxVWa+bvGyI2TSOysudzspiFwgMqo9EW2O0VqWn4vlhz7/vxkvPYZo
	y/Ow==
X-Gm-Message-State: AEkoouue46D2G3pz2EgXvt9AZMV66ZF5DriU5RogffbJ8xhNRnJC9AqNY5596aW+L2FOe9Zz6j3tJ72u7K/ApP5l
X-Received: by 10.107.138.212 with SMTP id c81mr30432474ioj.148.1469612277507; 
	Wed, 27 Jul 2016 02:37:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 27 Jul 2016 02:37:38 -0700 (PDT)
In-Reply-To: <BF50BCD4-DC5E-478D-9AF3-24C9E99C36A7@gmail.com>
References: <cover.1469337362.git.liezhi.yang@windriver.com>
	<07cae7b73779e89d5e038bf48fbfa204d51b4b68.1469337362.git.liezhi.yang@windriver.com>
	<CAJTo0LYCEP1nkeZ9-1i+K3YsK0OMAt+axx-4ezQsbxu+VwvyVA@mail.gmail.com>
	<57980BC4.80208@windriver.com>
	<BF50BCD4-DC5E-478D-9AF3-24C9E99C36A7@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Jul 2016 10:37:38 +0100
Message-ID: <CAJTo0LZr33=zdCAaVDqCM2+z6apj21pnBowF8FRcAeP+5O5mwg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] epiphany: inherit perlnative
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
X-List-Received-Date: Wed, 27 Jul 2016 09:37:58 -0000
Content-Type: multipart/alternative; boundary=001a113ed932c23c1405389ac5b0

--001a113ed932c23c1405389ac5b0
Content-Type: text/plain; charset=UTF-8

On 27 July 2016 at 10:34, Khem Raj <raj.khem@gmail.com> wrote:

> > I still get the same error after your patch applied:
> >
> > configure:16513: checking for perl
> > configure:16531: found /usr/bin/perl
> > configure:16543: result: /usr/bin/perl
> > configure:16554: checking for perl >= 5.8.1
> > configure:16561: result: 5.18.2
> > configure:16565: checking for XML::Parser
> > configure:16571: error: XML::Parser perl module is required for intltool
>
> same here
>
> http://errors.yoctoproject.org/Errors/Details/73330/


[shakes fist at intltool]

So intltool is basically deprecated and I'm seriously considering spending
the time porting to modern gettext instead of battling intltool.

Ross

--001a113ed932c23c1405389ac5b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 27 July 2016 at 10:34, Khem Raj <span dir=3D"ltr">&lt;<=
a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</=
a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; I still get the sam=
e error after your patch applied:<br>
&gt;<br>
&gt; configure:16513: checking for perl<br>
&gt; configure:16531: found /usr/bin/perl<br>
&gt; configure:16543: result: /usr/bin/perl<br>
&gt; configure:16554: checking for perl &gt;=3D 5.8.1<br>
&gt; configure:16561: result: 5.18.2<br>
&gt; configure:16565: checking for XML::Parser<br>
&gt; configure:16571: error: XML::Parser perl module is required for intlto=
ol<br>
<br>
</span>same here<br>
<br>
<a href=3D"http://errors.yoctoproject.org/Errors/Details/73330/" rel=3D"nor=
eferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Details/73=
330/</a></blockquote><div><br></div><div>[shakes fist at intltool]</div><di=
v><br></div><div>So intltool is basically deprecated and I&#39;m seriously =
considering spending the time porting to modern gettext instead of battling=
 intltool.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113ed932c23c1405389ac5b0--
