Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id BF9096AE6C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 09:52:41 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kl13so8681187pab.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 02:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=oVatvn0khDDZprM0sx77wCrvVHvAOE+QKAbVvhNxmdM=;
	b=TabR8xtfZzZN/KwV5cDK1gSjlpJyk6+ycEAsnMXyMh7ivE9YQzuLQUjbAiT7vxALdI
	QUwSYD7XhY53S7HhkJK6q3xTF55blm4i06+b6urt7HvexVrTQYTdmh91NFUSBEfiodh1
	Vn8t1PnW3h+V8+vtckWYX9ohmdVL1Ap078wRAtUNcMB9wzrpqp33VtqdP2DGEmI/DZWQ
	5/JnrG7l0ZDzXkARfl528OHZC1Z1LCd6eNN8QO7nTdNt0VZ0k6hyoLJPn+BD7YFHpNNz
	f1aBFI7NXK43nxPuCuFiAx6++hWr6wRZ4py+aAhZARoaSEdsAft82B5+VeuGxr/MnrMN
	dlsg==
X-Gm-Message-State: ALoCoQlzyF9aROr8YDd6jVZOgjqzoZNX/wn8xS7PP8T1QA3GZ895QKlPN7qykEiqNRnofJw1U+aH
MIME-Version: 1.0
X-Received: by 10.68.12.165 with SMTP id z5mr2070610pbb.172.1376387562397;
	Tue, 13 Aug 2013 02:52:42 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Tue, 13 Aug 2013 02:52:42 -0700 (PDT)
In-Reply-To: <CAJTo0LZJpOhqMVyLyKTHmL_JrPpUG7rY_-rRpd2kQk7TTpTDXw@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<10585858-000F-43F4-80AF-5622D08A91D7@gmail.com>
	<CAOMwXhMPmoFo+bYz9NAijJevWvizNFm0rsbVn1fPNHCS4Kf7yw@mail.gmail.com>
	<CAOMwXhPK5VqtvhSopZb+CFaRcfV=x9FQT9-TuEyEn7gPotCGTw@mail.gmail.com>
	<CAJTo0LZJpOhqMVyLyKTHmL_JrPpUG7rY_-rRpd2kQk7TTpTDXw@mail.gmail.com>
Date: Tue, 13 Aug 2013 10:52:42 +0100
X-Google-Sender-Auth: 61DvPN6u9bnyvX65c0sJqqyoXQg
Message-ID: <CAOMwXhMx5Ky7HQAYxMP7_CyYOLqDPKz6TRsmVvZe0Cu-r-Vvkw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Tue, 13 Aug 2013 09:52:42 -0000
Content-Type: multipart/alternative; boundary=bcaec51f9077baf7c204e3d1337a

--bcaec51f9077baf7c204e3d1337a
Content-Type: text/plain; charset=ISO-8859-1

As we have already discussed that, it is not any clear at all without
example. Yes, the end user does not really care about the internal
implementation of the feature ....

Please provide useful examples and tutorials how to use a feature
especially when a user (and apparently others posting here) is such
clueless.

Oh, by the way, and I have mentioned this in the bug report as well. We
need proper documentation, examples, and tutorials; i.e. I am not ahead of
the day when I first read this post. ;-)


On Tue, Aug 13, 2013 at 10:48 AM, Burton, Ross <ross.burton@intel.com>wrote:

> On 13 August 2013 08:32, Laszlo Papp <lpapp@kde.org> wrote:
> > So, everyone suggested PACKAGECONFIG in here on the mailing list except
> Khem
> > whose reply I did not get.
> >
> > Yet, 4964 got closed by the "team". Could anyone please give a sane
> > description why and what would block the end users other than fork?
>
> Quoting from comment 1 on 4964:
>
> """
> Busybox is a rather complicated beast. PACKAGECONFIG is unfortunately
> not sufficient to manage it's config system. It is very similar to the
> Linux kernel config and we recently added configuration fragment
> support to busybox from the kernel recipes:
>
> commit 56dc1720caa48344238d352c7b6e9b0f0d41aa54
> Author: Chen Qi <Qi.Chen@windriver.com>
> Date:   Tue Feb 5 14:36:40 2013 +0800
>
>     busybox: add config fragments
>
> This allows you to use the default config and include only the delta
> in your layer's bbappend in the form of a config fragment added to the
> SRC_URI.
> """
>
> If this isn't sufficient or is buggy, then fixing this is preferred
> (it works for the kernel, so should work for busybox).
>
> Ross
>

--bcaec51f9077baf7c204e3d1337a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">As we have already discussed that, it is not any clear at =
all without example. Yes, the end user does not really care about the inter=
nal implementation of the feature ....<div><br></div><div>Please provide us=
eful examples and tutorials how to use a feature especially when a user (an=
d apparently others posting here) is such clueless.</div>
<div><br></div><div>Oh, by the way, and I have mentioned this in the bug re=
port as well. We need proper documentation, examples, and tutorials; i.e. I=
 am not ahead of the day when I first read this post. ;-)</div></div><div c=
lass=3D"gmail_extra">
<br><br><div class=3D"gmail_quote">On Tue, Aug 13, 2013 at 10:48 AM, Burton=
, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" targe=
t=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
<div class=3D"im">On 13 August 2013 08:32, Laszlo Papp &lt;<a href=3D"mailt=
o:lpapp@kde.org">lpapp@kde.org</a>&gt; wrote:<br>
&gt; So, everyone suggested PACKAGECONFIG in here on the mailing list excep=
t Khem<br>
&gt; whose reply I did not get.<br>
&gt;<br>
&gt; Yet, 4964 got closed by the &quot;team&quot;. Could anyone please give=
 a sane<br>
&gt; description why and what would block the end users other than fork?<br=
>
<br>
</div>Quoting from comment 1 on 4964:<br>
<br>
&quot;&quot;&quot;<br>
Busybox is a rather complicated beast. PACKAGECONFIG is unfortunately<br>
not sufficient to manage it&#39;s config system. It is very similar to the<=
br>
Linux kernel config and we recently added configuration fragment<br>
support to busybox from the kernel recipes:<br>
<br>
commit 56dc1720caa48344238d352c7b6e9b0f0d41aa54<br>
Author: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windri=
ver.com</a>&gt;<br>
Date: =A0 Tue Feb 5 14:36:40 2013 +0800<br>
<br>
=A0 =A0 busybox: add config fragments<br>
<br>
This allows you to use the default config and include only the delta<br>
in your layer&#39;s bbappend in the form of a config fragment added to the<=
br>
SRC_URI.<br>
&quot;&quot;&quot;<br>
<br>
If this isn&#39;t sufficient or is buggy, then fixing this is preferred<br>
(it works for the kernel, so should work for busybox).<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Ross<br>
</font></span></blockquote></div><br></div>

--bcaec51f9077baf7c204e3d1337a--
