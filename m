Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id EECF46ABB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 14:54:21 +0000 (UTC)
Received: by qgfa63 with SMTP id a63so5105384qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 07:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TtzyRX+HygOtbLKnwQvLW1F5j3MulqjdU9kZO/wJD4g=;
	b=PlmNkBhZtbuL0sthL6MyeYcv6YHhFM7uLt6+GimnyRrWALTLM02kh9GdQe/aaabpm3
	n1M6bG/zSfxPQ/yxPGrF0Cw6VJpgwWBw2tUg7tWz/1YQbS4jsdakmN7m3wr8nVP6yNeu
	8DfLcVNlA6PKPagyAMmp/mpXYjCuFRtoHrd9mNsG7InSB/FcUdxTE5R4rvOP4YO5HGc6
	NbRoXuq8NzUdP3CP1PrVrQS5tpSskMZG+Kpzjs/6PpkmmcUsjolc00nTlGqA0EllR8lC
	6HvOjrdh1jP456H0MHFTQ5GKD87VaGcycUgWuHS+Kw+/vsPBB6RBdWG1+VvnONbdSyXv
	g6xg==
X-Gm-Message-State: ALoCoQkFZQMoOqIfYssPBc7R0mre+4kYfcBwqup4Ein0LTIp3ajRw74SN/q6kOi3Ou99iOJfbJ10
X-Received: by 10.55.40.18 with SMTP id o18mr13055422qkh.58.1432133662168;
	Wed, 20 May 2015 07:54:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 20 May 2015 07:54:01 -0700 (PDT)
In-Reply-To: <CAOMwXhP-fdD2SjRrOFNR-aS7Caa30sxiC-Js_Jr8B5_+Q8uHow@mail.gmail.com>
References: <CAOMwXhNUPtaJfKHDuHPWoioyD2Sp8Abb_++Tdp3NAYN7-TGUcg@mail.gmail.com>
	<CAC1BbcQ0L1ujZA_NvXx1hmUBq1gt9gC7tMHRwNLkNvmPGYZWaA@mail.gmail.com>
	<CAC1BbcTOPBRO_3GjhSQdzQ35Y=BGAh1ntYdqK2tk8E09Hvni7g@mail.gmail.com>
	<CAOMwXhNB-5w2ywAe6anARY0Kp+osPRmu6KnoiOpfTJ6G0WCCnQ@mail.gmail.com>
	<CAJTo0La5BpGRQEnNb34ZtV5-Po2dELjcN2mcy_Dn_e-c7=SWXg@mail.gmail.com>
	<CAOMwXhP-fdD2SjRrOFNR-aS7Caa30sxiC-Js_Jr8B5_+Q8uHow@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 May 2015 15:54:01 +0100
Message-ID: <CAJTo0Lb5owzy0iq6xojbr6a20_VKm4JidZO=H48hLdqnSx5Udw@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: busybox: passwd: applet not found
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
X-List-Received-Date: Wed, 20 May 2015 14:54:26 -0000
Content-Type: multipart/alternative; boundary=001a11440fb8346a670516849ac2

--001a11440fb8346a670516849ac2
Content-Type: text/plain; charset=UTF-8

On 20 May 2015 at 15:50, Laszlo Papp <lpapp@kde.org> wrote:

> Currently, I do not see any simple way without #ifdef jungle in the
> code around to it. It is not nice.
>

Looking at the busybox recipe reveals this:

# Whether to split the suid apps into a seperate binary
BUSYBOX_SPLIT_SUID ?= "1"

Just remember that the suid apps were being split out for good security
reasons.  There's no need for sed to have suid rights!

Ross

--001a11440fb8346a670516849ac2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 May 2015 at 15:50, Laszlo Papp <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;pa=
dding-left:1ex"><div id=3D":r3" class=3D"" style=3D"overflow:hidden">Curren=
tly, I do not see any simple way without #ifdef jungle in the<br>
code around to it. It is not nice.<br></div></blockquote></div><br>Looking =
at the busybox recipe reveals this:</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra"><div class=3D"gmail_extra"># Whether to split=
 the suid apps into a seperate binary</div><div class=3D"gmail_extra">BUSYB=
OX_SPLIT_SUID ?=3D &quot;1&quot;</div><div><br></div><div>Just remember tha=
t the suid apps were being split out for good security reasons.=C2=A0 There=
&#39;s no need for sed to have suid rights!</div><div><br></div><div>Ross</=
div></div></div>

--001a11440fb8346a670516849ac2--
