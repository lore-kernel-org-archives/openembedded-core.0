Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B308FC531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 17:58:26 +0000 (UTC)
Subject: Re: [scarthgap][PATCH v2 6/6] glib-2.0: fix CVE-2026-58015
To: openembedded-core@lists.openembedded.org
From: "Siddharth Doshi" <sdoshi@mvista.com>
X-Originating-Location: Rajkot, Gujarat, IN (157.32.44.155)
X-Originating-Platform: Linux Chrome 150
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 27 Jul 2026 10:58:19 -0700
References: <20260715172330.1149253-6-deeratho@cisco.com> <20260727121444.3158996-1-deeratho@cisco.com>
In-Reply-To: <20260727121444.3158996-1-deeratho@cisco.com>
Message-ID: <1062711.1785175099253932186@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="SukpiZAwtmtBZfc8qrpx"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 17:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242104

--SukpiZAwtmtBZfc8qrpx
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thank-you for sending the v2 promptly but i guess in hurry you copied the w=
rong helper commit.

The main fix is correct which is at -> https://gitlab.gnome.org/GNOME/glib/=
-/commit/db9c8fae398b0c457e660ce63dd5afec8993046a

but the helper commit is here -> https://gitlab.gnome.org/GNOME/glib/-/comm=
it/0919301962291a712067ee0c5d273cc392f33277 (this mentions in git commit of=
 being helper commit to same #3931 bug)

you will need to replace patch CVE-2026-58015_p2 with contents from above c=
ommit.

Regards,
Siddharth

--SukpiZAwtmtBZfc8qrpx
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello,<br /><br />Thank-you for sending the v2 promptly but i guess in=
 hurry you copied the wrong helper commit.<br /><br />The main fix is corre=
ct which is at -&gt; <a href=3D"https://gitlab.gnome.org/GNOME/glib/-/commi=
t/db9c8fae398b0c457e660ce63dd5afec8993046a" target=3D"_blank" rel=3D"noopen=
er">https://gitlab.gnome.org/GNOME/glib/-/commit/db9c8fae398b0c457e660ce63d=
d5afec8993046a</a><br /><br />but the helper commit is here -&gt; <a href=
=3D"https://gitlab.gnome.org/GNOME/glib/-/commit/0919301962291a712067ee0c5d=
273cc392f33277" target=3D"_blank" rel=3D"noopener">https://gitlab.gnome.org=
/GNOME/glib/-/commit/0919301962291a712067ee0c5d273cc392f33277</a> (this men=
tions in git commit of being helper commit to same #3931 bug)<br /><br />yo=
u will need to replace patch <span style=3D"color: #333333; font-family: sy=
stem-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation San=
s', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Sym=
bol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant=
-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spa=
cing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transfo=
rm: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; whi=
te-space: pre-wrap; background-color: #ffffff; text-decoration-thickness: i=
nitial; text-decoration-style: initial; text-decoration-color: initial; dis=
play: inline !important; float: none;">CVE-2026-58015_p2 with contents from=
 above commit. <br /><br /></span>Regards,<br />Siddharth<br /><br /><br />=
</div>

--SukpiZAwtmtBZfc8qrpx--

