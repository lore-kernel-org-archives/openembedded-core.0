Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id F2314601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 15:36:53 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id i17so9545591qcy.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 07:36:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GGyUPcRt3MaNfMrinhqR6aT2Vm5KTdqv1D455h68P0M=;
	b=ki6oRoDQgKWr9PLelbrtOx/wjqDPct8+haWfEx50hMfcDjYHcn6zeB38oyYI+hlqBU
	qc/e0cMegXZUMJHoxSM2DdnvpGwvJOIr4jK5sp7tfywSoGP9VFIeEK0DU8LYEAYTR7zw
	PhsTBu7kR1wPhFEu/fwGZO0TeR6q2VkxBMHRtTGTUetkgy01D6to20fF9JbLUWSNWPto
	oboU2mRkD3PeB+gU+drjZvV7RZOTJcvoeDviRJmYK8soBXN4vKdWL3U1O7FIyq/GYnea
	JNiPXRhVqfPJVmwYDMJ0q9sHTV1cr1MjFqySPZcvWGM92U7pFF5aVHn0IqL+otuS+kdo
	+TIg==
X-Gm-Message-State: ALoCoQlHSZjFgg+FttVQv3Ja2tLVOLbG4WR1tzCcnOqzFMNve0jiPAdKGXJ3VbhB3NOdv8fUFPDU
X-Received: by 10.140.96.101 with SMTP id j92mr94633241qge.87.1417534613807;
	Tue, 02 Dec 2014 07:36:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Tue, 2 Dec 2014 07:36:33 -0800 (PST)
In-Reply-To: <547DD1A8.6040006@linux.intel.com>
References: <cover.1417466732.git.anibal.limon@linux.intel.com>
	<434556f7b955c934a5eabbd8125d46aab0ffbde2.1417466738.git.anibal.limon@linux.intel.com>
	<CAP71WjzO2sg-RbY=51Nu89=hcahNqP0NhVYUCCJX3=eTYz87Hg@mail.gmail.com>
	<547DD1A8.6040006@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Dec 2014 15:36:33 +0000
Message-ID: <CAJTo0Lad9KVH6MKcC3kFuGjSm7420hGo_=uaw0u7xnfhviafNg@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] xorg-xserver: Upgrade to 1.16.2
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
X-List-Received-Date: Tue, 02 Dec 2014 15:36:58 -0000
Content-Type: multipart/alternative; boundary=001a113a9d8a1d032205093d7f32

--001a113a9d8a1d032205093d7f32
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2 December 2014 at 14:50, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.int=
el.com>
wrote:

> I don't see this warning, i ran with (log attached),
>
> $ bitbake xserver-xorg -v -D
>

So the warning means that xserver linked against dbus but it isn't in the
build dependencies.  To replicate, you'll need to bitbake dbus and then
cleansstate and rebuild xserver-xorg.

The point here is that xserver-xorg is auto-detecting optional dependencies
which results in non-deterministic builds.  Can you look at what DBus is
used for in xserver-xorg, and determine if we should always require dbus,
never require dbus, or have an option and if we have an option, what do we
default it to.

Ross

--001a113a9d8a1d032205093d7f32
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2014 at 14:50, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<=
a href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.lim=
on@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":57b" class=3D"a3s" style=3D"overflow:hidden">I don&#39;t see th=
is warning, i ran with (log attached),<br>
<br>
$ bitbake xserver-xorg -v -D</div></blockquote><div><br></div><div>So the w=
arning means that xserver linked against dbus but it isn&#39;t in the build=
 dependencies.=C2=A0 To replicate, you&#39;ll need to bitbake dbus and then=
 cleansstate and rebuild xserver-xorg.</div><div><br></div><div>The point h=
ere is that xserver-xorg is auto-detecting optional dependencies which resu=
lts in non-deterministic builds.=C2=A0 Can you look at what DBus is used fo=
r in xserver-xorg, and determine if we should always require dbus, never re=
quire dbus, or have an option and if we have an option, what do we default =
it to.</div><div><br></div><div>Ross</div></div></div></div>

--001a113a9d8a1d032205093d7f32--
