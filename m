Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 734B96B478
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 18:54:17 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id fp13so5129084lab.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 11:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=EXggBxcDI1/R+EJPQKEyESpEBoSSyI5HXSa8Zu8XKjg=;
	b=lBPTMn7fpq4QiMRAhkAjMIOPUZHfq2Pb7zDL2hCJu+Tjhw563RA4cr+5w7eQEpEhCt
	QaWXMNKFcCMwdgT6Bm+2g9b8fSesLW/PouqqTQfpDkFTojP75dw7Q1OTIH7ju6q26Iyp
	5NaA0vLfN5jlx5xdfYhcr4MxdJrzxu/a4nJlz+OBOMh3bANHOC66UZ5sXyTKxv0DJEhk
	mhY/aQ2XqlMzoSG3vtmwhJq6j4vJ6oNdHOUk1feFDh2vLxjIGWpY5pUO4JX+g2OCe72M
	hEVR6M8v+WE04w4Dj5uQqxn4DEsFdPGe1MNqlZ/PtBwjsqS8NZM5mI1T5xfkqinOjqdT
	6TtQ==
X-Received: by 10.112.140.231 with SMTP id rj7mr28968267lbb.16.1375210457159; 
	Tue, 30 Jul 2013 11:54:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.17.67 with HTTP; Tue, 30 Jul 2013 11:53:57 -0700 (PDT)
In-Reply-To: <51F092C5.3060906@windriver.com>
References: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
	<51F092C5.3060906@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 30 Jul 2013 11:53:57 -0700
X-Google-Sender-Auth: VDtR-M26IRHTFvgGpuAVg77dS7c
Message-ID: <CABcZANk_XvT3uHDQQmqsm-4dTVZYd-D3RRsW+wz=2cdE-xkbmA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: meta-ro-rootfs approach and volatiles vs tmpfiles.d
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
X-List-Received-Date: Tue, 30 Jul 2013 18:54:18 -0000
Content-Type: multipart/alternative; boundary=001a11c26a30ca5e9c04e2bf225f

--001a11c26a30ca5e9c04e2bf225f
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 24, 2013 at 7:51 PM, ChenQi <Qi.Chen@windriver.com> wrote:

> You can get more information from the bug link below. The related bugs are
> listed in the blocks list of this bug.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4103
> You can also review the patchset for these bugs on
>
> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images
>
>
I'll start playing around with this locally, to see how well it'd work
(with adjustments to support systemd) for our use cases, and will go from
there on our end. Up next for me:

- see if your r/o bits will be suitable for us with systemd rather than
using our tmpfiles override mechanism. we need to support this on much more
than just live images, and we need systemd :)
- pursue systemd support for services missing that support in oe-core
- pursue improved sysvinit / systemd feature parity, and potential
volatiles -> tmpfiles migration / consolidation
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c26a30ca5e9c04e2bf225f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Jul 24, 2013 at 7:51 PM, ChenQi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</sp=
an> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>You can get more information from the b=
ug link below. The related
      bugs are listed in the blocks list of this bug.<br>
      <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4103" =
target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4103<=
/a><br>
      You can also review the patchset for these bugs on <br>
      <pre><a href=3D"http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=
=3DChenQi/read-only-rootfs-in-live-images" target=3D"_blank">http://git.pok=
ylinux.org/cgit.cgi/poky-contrib/log/?h=3DChenQi/read-only-rootfs-in-live-i=
mages</a></pre>

</div></blockquote></div><br>I&#39;ll start playing around with this locall=
y, to see how well it&#39;d work (with adjustments to support systemd) for =
our use cases, and will go from there on our end. Up next for me:</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">- see if yo=
ur r/o bits will be suitable for us with systemd rather than using our tmpf=
iles override mechanism. we need to support this on much more than just liv=
e images, and we need systemd :)</div>

<div class=3D"gmail_extra">- pursue systemd support for services missing th=
at support in oe-core</div><div class=3D"gmail_extra">- pursue improved sys=
vinit / systemd feature parity, and potential volatiles -&gt; tmpfiles migr=
ation / consolidation<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c26a30ca5e9c04e2bf225f--
