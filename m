Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id DE5326FFF7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 10:11:02 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id n127so4805303iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jun 2016 03:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oa1Kridg+N/LxTBsrysKbZJ7x1uciX3RbzFQvYly05s=;
	b=ZAVansVpQ8hbqyA8Ej/RHoVa1Ojc9A3l65WyR0PrIpOiTZXyUarus1ZrMKAcQ6k4Uh
	Ak7A3W7efqN7P4cKra4qBJh9LLpUqLfW8WdAIeVW7nhhR5GX4ApVu2GRu5wRUEb9ULU+
	I+3IuAf6PUPzSAOmwRLRlFi3u9alr7MyXMqWyQRn1BLlVYP0Pv+Y2YQFDd+aqyu+Y0ZI
	67UknQUHm3T5+2K0Pqs2lpgVECObAdN99ZevkP70/bi2dRM6Duj3jaBv8sqeFiT+FYAv
	6OtB0SiB07IRWyU5szNZZ8OrXsJJF67LzNWh6cAIdnlaljPfancln7JyWZ1OKfDTqEzn
	TdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oa1Kridg+N/LxTBsrysKbZJ7x1uciX3RbzFQvYly05s=;
	b=Jjnd7JhK+/QlW33Jg/fnzEFVq0WzZcgOKUJmlQAKz9d+PXrdLKrRHC/ImLHG3t/kLW
	laWlCkiGjdmr06gYtEI8i+IY7siyAAJj18UHpF6Etm8WCLPPEKL/HyKH/P1jJpv3zi2y
	D/+xtBRJHvOvBHL+6Bg99tpgmYfTo05ytwK0QEiljeuusfAl6lBe62qzF16/ZMvRu4kv
	iwCqtvFAOp/MrcKWpX+q0S/3ZhXm6ITdmbcJCpt4WihloPMhaA3ZbLhHaidZoQiD94ej
	BtWq5LVeR1vnJsUXo3TrigZwn4GFylYCZs3R/d8thjZi04WD07E4Cxtrzbj+gS8kZ6Y+
	7BVA==
X-Gm-Message-State: ALyK8tJiy3bt/y/U+zKX/tpZ3+XkGMqf3+qQhNXPknIiB5bLmC/0MwBGFUFFdrsSdjcwm8JkP1bdNsHCFxL+RDlO
X-Received: by 10.107.179.9 with SMTP id c9mr6409563iof.99.1465380663241; Wed,
	08 Jun 2016 03:11:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 8 Jun 2016 03:10:43 -0700 (PDT)
In-Reply-To: <1465344033-21973-1-git-send-email-sarnold@vctlabs.com>
References: <1465344033-21973-1-git-send-email-sarnold@vctlabs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Jun 2016 11:10:43 +0100
Message-ID: <CAJTo0LY0qHUWukjCDyaWjbXewr10yJfkOnz502bMHGMJ_WtR4Q@mail.gmail.com>
To: Stephen Arnold <sarnold@vctlabs.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some environment vars
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
X-List-Received-Date: Wed, 08 Jun 2016 10:11:04 -0000
Content-Type: multipart/alternative; boundary=001a11485762e4c0940534c18580

--001a11485762e4c0940534c18580
Content-Type: text/plain; charset=UTF-8

On 8 June 2016 at 01:00, Stephen Arnold <sarnold@vctlabs.com> wrote:

>  meta/recipes-devtools/qemu/qemu.inc                     | 13 +++++++++++--
>  meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch | 13 +++++++++++++
>  meta/recipes-devtools/qemu/qemu_2.5.0.bb                |  1 +
>

qemu was upgraded to 2.6.0 in master a few weeks ago, can you rebase?

Cheers,
Ross

--001a11485762e4c0940534c18580
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 June 2016 at 01:00, Stephen Arnold <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:sarnold@vctlabs.com" target=3D"_blank">sarnold@vctlabs.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":25" class=3D"a3s a=
XjCH m1552d5d3c7e8101a">=C2=A0meta/recipes-devtools/qemu/qemu.inc=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 ++++=
+++++++--<br>
=C2=A0meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch | 13 ++++++++=
+++++<br>
=C2=A0meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.5.0.bb" rel=3D"no=
referrer" target=3D"_blank">qemu_2.5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +</div></blockquote></div><br>qemu wa=
s upgraded to 2.6.0 in master a few weeks ago, can you rebase?</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Cheers,</div><div =
class=3D"gmail_extra">Ross</div></div>

--001a11485762e4c0940534c18580--
