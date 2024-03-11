Return-Path: <Nisha.M.Parrakat@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9057C5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 12:15:10 +0000 (UTC)
Subject: Re: [master][PATCH v2] librsvg: Fix do_package_qa error for librsvg
To: openembedded-core@lists.openembedded.org
From: Nisha.M.Parrakat@bmw.de
X-Originating-Location: =?UTF-8?B?RG9ybnN0YWR0LCBCYWRlbi1Xw7xydHRlbWJlcmcsIERF?= (212.118.206.70)
X-Originating-Platform: Linux Firefox 123
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 11 Mar 2024 05:15:02 -0700
References: <CANNYZj9v5FE6z552opyk_LsZpUx0nGpvGBiJ-wfUfA_YYGRhhQ@mail.gmail.com>
In-Reply-To: <CANNYZj9v5FE6z552opyk_LsZpUx0nGpvGBiJ-wfUfA_YYGRhhQ@mail.gmail.com>
Message-ID: <27822.1710159302267588894@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="X0sOHv2kTmhVKzKV9C9r"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 12:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196933

--X0sOHv2kTmhVKzKV9C9r
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks Alex for the reply.
So till now we are using meta-rust master along with the kirkstone yocto la=
yers and are trying to understand if it makes sense to use it further.
We had a few questions for the maintainence of Rust.

1. Can we say, that oe-core will support Rust in future after Kirkstone=C2=
=A0 as a standalone (without any external dependency )?
2. We assume that kirkstone will stay with 1.59 and those who want later ve=
rsions (1.68+)can use meta-lts-mixins
3. We have the following assumptions for meta-lts-mixins

a) We see kirkstone/rust-1.68, kirkstone/rust-1.70 branches.
A new branch will be created for a newer and stable rust version for exampl=
e kirkstone/rust-1.75 .
b)=C2=A0 If *1* is not correct then we assume meta-lts-mixins will cater to=
 all the LTS layers in future. That means we may see branches like scarthga=
p/rust-***

Thanks in advance for your reply !

regards,
Nisha Parrakat

--X0sOHv2kTmhVKzKV9C9r
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks Alex for the reply.<br />So till now we are using meta-rust master a=
long with the kirkstone yocto layers and are trying to understand if it mak=
es sense to use it further.<br />We had a few questions for the maintainenc=
e of Rust.<br /><br />
<div style=3D"box-sizing: border-box; font-family: -apple-system, BlinkMacS=
ystemFont, 'Segoe UI', system-ui, 'Apple Color Emoji', 'Segoe UI Emoji', 'S=
egoe UI Web', sans-serif; font-size: 14px; font-style: normal; font-variant=
-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spa=
cing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; widows: 2; word-spacing: 0px;">
<div>1. Can we say, that oe-core will support Rust in future after Kirkston=
e&nbsp; as a standalone (without any external dependency )? <br />2. We ass=
ume that kirkstone will stay with 1.59 and those who want later versions (1=
.68+)can use meta-lts-mixins<br />3. We have the following assumptions for =
meta-lts-mixins</div>
<div>
<div>&nbsp;</div>
<div>
<div>&nbsp;&nbsp;&nbsp;&nbsp; a) We see kirkstone/rust-1.68, kirkstone/rust=
-1.70 branches. <br />&nbsp;&nbsp;&nbsp;&nbsp; A new branch will be created=
 for a newer and stable rust version for example kirkstone/rust-1.75 .<br /=
>&nbsp;&nbsp;&nbsp;&nbsp; b)&nbsp; If <strong>1</strong> is not correct the=
n we assume meta-lts-mixins will cater to all the LTS layers in future. Tha=
t means we may see branches like scarthgap/rust-*** <br /><br />Thanks in a=
dvance for your reply !<br /><br />regards,<br />Nisha Parrakat<br /><br />=
</div>
</div>
</div>
</div>

--X0sOHv2kTmhVKzKV9C9r--

