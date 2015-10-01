Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id A180E77027
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 07:15:29 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so15263815wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 00:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iIYoGiaWqmFYfAP4FpoKVAH6mddmHyoEov9j8Ubfnwo=;
	b=jP4sPZkmp5dO7mSzAsCSMR/xXuSyOFQCmzuMz8fHnrbe/vDfMveJtgkaumXHjQdL9M
	4GogYesJ2pwBVmdYh0C4TofKOY5RzMxHJDIPQ6AYsXpb0smhpj/tVuaC0ik8dDRYwMyZ
	ErvPlnIxXbwA1yO8x/JVJMW9z9VPCuiAanJKUPH60rGV9yQBRcT8O2gZmQunKGuQttRp
	HpKfRVuLkUoHqPF0AgmTQ5y2DreCTjr0Op89DmEm9+Jk8qQ6i9UD6DKrNKol4JMPt+b4
	sD9wOnQGxtidoQB7XpkF7wPv7udNQuNMKHNUKy8goyVVMgsj5COgkGps1bQVVVhyeCUn
	ZJtQ==
X-Gm-Message-State: ALoCoQkb2FE3HXNUKun+w66VSN3z/Vc03e3eY/gYHL34EnsbSTI16+zJyPlwim22e6YRLP0i21rx
X-Received: by 10.180.105.135 with SMTP id gm7mr1502544wib.18.1443683729641;
	Thu, 01 Oct 2015 00:15:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Thu, 1 Oct 2015 00:15:00 -0700 (PDT)
In-Reply-To: <cover.1443624731.git.jussi.kukkonen@intel.com>
References: <cover.1443624731.git.jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 1 Oct 2015 10:15:00 +0300
Message-ID: <CAHiDW_Fo-_f7YMUk15kCwr3EVt2P1-YtFzQRh4DCjncJQqqTww@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, joshua.lock@collabora.co.uk, 
	Armin Kuster <akuster808@gmail.com>
Subject: Re: [PATCH 0/3][fido][dizzy] D-Bus policy fixes
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
X-List-Received-Date: Thu, 01 Oct 2015 07:15:31 -0000
Content-Type: multipart/alternative; boundary=14dae9cc9c92dfad74052105cf08

--14dae9cc9c92dfad74052105cf08
Content-Type: text/plain; charset=UTF-8

On 30 September 2015 at 18:33, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

>   bluez5: Use upstream D-Bus policy
>   dbus: Use the xuser policy file
>   xuser-account: Take over xuser specific D-Bus policy
>

Please don't take the last two patches yet: I believe dbus itself does not
actually have to be modified and the xuser policy file can just be a normal
file in /etc/dbus-1/system.d/. I originally thought the default context
policies in the services files could override the xuser user policy but
this seems to not be the case: user policy always overrides default context
policy.



>  meta/recipes-connectivity/bluez5/bluez5.inc        |  5 +--
>  .../bluez5/bluez5/bluetooth.conf                   | 17 ---------
>  meta/recipes-connectivity/connman/connman.inc      |  1 -
>  .../connman/add_xuser_dbus_permission.patch        | 43
> ----------------------
>  meta/recipes-connectivity/connman/connman_1.30.bb  |  1 -
>  meta/recipes-core/dbus/dbus.inc                    |  1 +
>  ...-Apply-xuser-specific-policies-if-present.patch | 33 +++++++++++++++++
>  .../user-creation/files/system-xuser.conf          | 15 ++++++++
>  .../user-creation/xuser-account_0.1.bb             |  6 ++-
>  9 files changed, 55 insertions(+), 67 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
>  delete mode 100644
> meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
>  create mode 100644
> meta/recipes-core/dbus/dbus/0001-Apply-xuser-specific-policies-if-present.patch
>  create mode 100644
> meta/recipes-support/user-creation/files/system-xuser.conf
>
> --
> 2.1.4
>
>

--14dae9cc9c92dfad74052105cf08
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 3=
0 September 2015 at 18:33, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"=
mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=A0 bluez5: Use=
 upstream D-Bus policy<br>
=C2=A0 dbus: Use the xuser policy file<br>
=C2=A0 xuser-account: Take over xuser specific D-Bus policy<br></blockquote=
><div><br></div><div>Please don&#39;t take the last two patches yet: I beli=
eve dbus itself does not actually have to be modified and the xuser policy =
file can just be a normal file in /etc/dbus-1/system.d/. I originally thoug=
ht the default context policies in the services files could override the xu=
ser user policy but this seems to not be the case: user policy always overr=
ides default context policy.</div><div><br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
=C2=A0meta/recipes-connectivity/bluez5/bluez5.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 5 +--<br>
=C2=A0.../bluez5/bluez5/bluetooth.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 ---------<br>
=C2=A0meta/recipes-connectivity/connman/connman.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 -<br>
=C2=A0.../connman/add_xuser_dbus_permission.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 43 ----------------------<br>
=C2=A0meta/recipes-connectivity/connman/<a href=3D"http://connman_1.30.bb" =
rel=3D"noreferrer" target=3D"_blank">connman_1.30.bb</a>=C2=A0 |=C2=A0 1 -<=
br>
=C2=A0meta/recipes-core/dbus/dbus.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0...-Apply-xuser-specific-policies-if-present.patch | 33 +++++++++++++=
++++<br>
=C2=A0.../user-creation/files/system-xuser.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 15 ++++++++<br>
=C2=A0.../user-creation/<a href=3D"http://xuser-account_0.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">xuser-account_0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++-<br>
=C2=A09 files changed, 55 insertions(+), 67 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/bluetooth.=
conf<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/connman/connman/add_xuse=
r_dbus_permission.patch<br>
=C2=A0create mode 100644 meta/recipes-core/dbus/dbus/0001-Apply-xuser-speci=
fic-policies-if-present.patch<br>
=C2=A0create mode 100644 meta/recipes-support/user-creation/files/system-xu=
ser.conf<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br></div></div>

--14dae9cc9c92dfad74052105cf08--
