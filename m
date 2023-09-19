Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6C8CD5BB9
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 13:06:54 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.7868.1695128811770701740
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 06:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout08.t-online.de (Postfix) with SMTP id 951F927E4F;
	Tue, 19 Sep 2023 15:06:49 +0200 (CEST)
Received: from [192.168.178.62] ([79.219.233.37]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiaRE-0u8S1I0; Tue, 19 Sep 2023 15:06:48 +0200
Date: Tue, 19 Sep 2023 15:06:45 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] vte: upgrade 2.72.2 -> 2.74.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <9RH81S.9NI7WQZ7L6QX@t-online.de>
In-Reply-To: <CANNYZj_+k_AjWNXMK-uPFpH3uNL_aYFeCkXw=+3UCUKnmnGMcg@mail.gmail.com>
References: <20230919114941.1819808-1-f_l_k@t-online.de>
	<CANNYZj_+k_AjWNXMK-uPFpH3uNL_aYFeCkXw=+3UCUKnmnGMcg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-/DiGclJGbbs2iowafAua"
X-TOI-EXPURGATEID: 150726::1695128808-6E7EF4B7-0BEA6BDC/0/0 CLEAN NORMAL
X-TOI-MSGID: 97684b1a-91e5-44d4-992b-b7c2ab7cd036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 13:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187864

--=-/DiGclJGbbs2iowafAua
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Sep 19 2023 at 02:02:48 PM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> we need to find a
> different terminal (rxvt or indeed gnome-terminal).

gnome-console is a simple thing. but it is necessary to build vte with 
gtk4 support (by the way, the default of vte is to build gtk3 and gtk4 
support). Maybe the problem with both gnome-console and gnome-terminal 
is that they are GPL-3.0-only.

SUMMARY = "GNOME Console"
LICENSE = "GPL-3.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a 
<file://copying;md5=8f0e2cd40e05189ec81232da84bd6e1a/>"

GNOMEBASEBUILDCLASS = "meson"
inherit gtk-icon-cache gnomebase pkgconfig meson gsettings gnome-help 
upstream-version-is-even

DEPENDS = " \
    desktop-file-utils-native \
    gtk4-native \
    gtk4 \
    libadwaita \
    vte \
    libgtop \
    pcre2 \
    gsettings-desktop-schemas \
"

SRC_URI[archive.sha256sum] = 
"24cbd5680e525c2c0c57ad8d8c1ad199ef5b45b1ff1c80be22a37848e46e93ac"

FILES:${PN} += "${datadir}"

RRECOMMENDS:${PN} += "gsettings-desktop-schemas hicolor-icon-theme"


--=-/DiGclJGbbs2iowafAua
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Tue, Sep 19 2023 at 02:02:48 PM +02:=
00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquo=
te type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-space=
s;">we need to find a
different terminal (rxvt or indeed gnome-terminal).</div></blockquote><div>=
<br></div><div>gnome-console is a simple thing. but it is necessary to buil=
d vte with gtk4 support (by the way, the default of vte is to build gtk3 an=
d gtk4 support). Maybe the problem with both gnome-console and gnome-termin=
al is that they are GPL-3.0-only.</div><div><br></div><div><div>SUMMARY =3D=
 "GNOME Console"</div><div>LICENSE =3D "GPL-3.0-only"</div><div>LIC_FILES_C=
HKSUM =3D "<a href=3D"file://COPYING;md5=3D8f0e2cd40e05189ec81232da84bd6e1a=
">file://COPYING;md5=3D8f0e2cd40e05189ec81232da84bd6e1a</a>"</div><div><br>=
</div><div>GNOMEBASEBUILDCLASS =3D "meson"</div><div>inherit gtk-icon-cache=
 gnomebase pkgconfig meson gsettings gnome-help upstream-version-is-even</d=
iv><div><br></div><div>DEPENDS =3D " \</div><div>&nbsp; &nbsp; desktop-file=
-utils-native \</div><div>&nbsp; &nbsp; gtk4-native \</div><div>&nbsp; &nbs=
p; gtk4 \</div><div>&nbsp; &nbsp; libadwaita \</div><div>&nbsp; &nbsp; vte =
\</div><div>&nbsp; &nbsp; libgtop \</div><div>&nbsp; &nbsp; pcre2 \</div><d=
iv>&nbsp; &nbsp; gsettings-desktop-schemas \</div><div>"</div><div><br></di=
v><div>SRC_URI[archive.sha256sum] =3D "24cbd5680e525c2c0c57ad8d8c1ad199ef5b=
45b1ff1c80be22a37848e46e93ac"</div><div><br></div><div>FILES:${PN} +=3D "${=
datadir}"</div><div><br></div><div>RRECOMMENDS:${PN} +=3D "gsettings-deskto=
p-schemas hicolor-icon-theme"</div></div></div>
--=-/DiGclJGbbs2iowafAua--


