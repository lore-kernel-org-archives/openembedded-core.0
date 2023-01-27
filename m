Return-Path: <adinath.mhatre@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD054C38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 11:19:09 +0000 (UTC)
Subject: Re: Proposal to add recipe for varlink library #poky
To: openembedded-core@lists.openembedded.org
From: adinath.mhatre@philips.com
X-Originating-Location: Melbourne, Victoria, AU (155.190.53.7)
X-Originating-Platform: Windows Chrome 109
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 27 Jan 2023 03:19:05 -0800
References: <CANNYZj82XYYS6b_iEo1SiyBNckAskZuFHfjF_0beLansgO+pAA@mail.gmail.com>
In-Reply-To: <CANNYZj82XYYS6b_iEo1SiyBNckAskZuFHfjF_0beLansgO+pAA@mail.gmail.com>
Message-ID: <20057.1674818345646306595@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="7ysWgoWDnnrzDQebJRMW"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 11:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176439

--7ysWgoWDnnrzDQebJRMW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Since Varlink is an IPC alternative to dbus and its doesn=E2=80=99t have de=
pendency on wayland .

So, we don=E2=80=99t want to include meta-wayland as we don=E2=80=99t need.

We have asked meta-wayland author regarding same and he is ok with moving v=
arlink outside of meta-wayland.
Upstream libvarlink recipe to poky/meta-oe =C2=B7 Issue #4 =C2=B7 MarkusVol=
k/meta-wayland (github.com) ( https://github.com/MarkusVolk/meta-wayland/is=
sues/4 )

Regards,
Adinath

--7ysWgoWDnnrzDQebJRMW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p style=3D"margin-bottom: 1em;">Since Varlink is an IPC alternative to dbu=
s and its doesn&rsquo;t have dependency on wayland .</p>
<p style=3D"margin-bottom: 1em;">So, we don&rsquo;t want to include meta-wa=
yland as we don&rsquo;t need.<br /><br />We have asked meta-wayland author =
regarding same and he is ok with moving varlink outside of meta-wayland.<br=
 /><a href=3D"https://github.com/MarkusVolk/meta-wayland/issues/4">Upstream=
 libvarlink recipe to poky/meta-oe &middot; Issue #4 &middot; MarkusVolk/me=
ta-wayland (github.com)</a><br /><br />Regards,<br />Adinath</p>

--7ysWgoWDnnrzDQebJRMW--

