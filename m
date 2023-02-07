Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C76C6379F
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 14:53:11 +0000 (UTC)
Subject: Re: [PATCH] wic/plugins/source/bootimg-efi: Skip installing kernel-image into boot.
To: openembedded-core@lists.openembedded.org
From: "Kareem Zarka" <zarkakareem@gmail.com>
X-Originating-Location: Turin, Piedmont, IT (151.60.13.132)
X-Originating-Platform: Linux Chrome 108
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 07 Feb 2023 06:53:01 -0800
References: <9910648fe8bc6cf03ce56385c038edee6502ea57.camel@linuxfoundation.org>
In-Reply-To: <9910648fe8bc6cf03ce56385c038edee6502ea57.camel@linuxfoundation.org>
Message-ID: <1854.1675781581951378473@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="GAKtXA03j0KklSQBa5P2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 14:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176818

--GAKtXA03j0KklSQBa5P2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear Richard and Luca,

Thank you for your feedback. I will take it into consideration.

I understand that "XXX !=3D False" and "not XXX" have different interpretat=
ions in Python.

The expression "XXX !=3D False" only evaluates to True if XXX is not equal =
to False.

This means that if skip-kernel-install is None, the condition will be False=
.

On the other hand, "not XXX" evaluates to True if XXX is falsy, which inclu=
des None, False, 0, empty string, etc.

This is why I used it in my code, as I wanted to consider the case where sk=
ip-kernel-install is None.

Therefore, if skip-kernel-install is not provided, its value will be None, =
and the condition will be True, which means the kernel image will be instal=
led.

However, if we want to enforce the requirement for the user to always provi=
de the parameter skip-kernel-install with either the value true or false, w=
e can make use (!=3D false , =3D=3D true).

Let me know what suits us best in this case .

Kindest regards .

Kareem Zarka.

--GAKtXA03j0KklSQBa5P2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Dear Richard and Luca,</p>
<p>Thank you for your feedback. I will take it into consideration.</p>
<p>I understand that "XXX !=3D False" and "not XXX" have different interpre=
tations in Python.</p>
<p>The expression "XXX !=3D False" only evaluates to True if XXX is not equ=
al to False.</p>
<p>This means that if skip-kernel-install is None, the condition will be Fa=
lse.</p>
<p>On the other hand, "not XXX" evaluates to True if XXX is falsy, which in=
cludes None, False, 0, empty string, etc.</p>
<p>This is why I used it in my code, as I wanted to consider the case where=
 skip-kernel-install is None.</p>
<p>Therefore, if skip-kernel-install is not provided, its value will be Non=
e, and the condition will be True, which means the kernel image will be ins=
talled.</p>
<p>However, if we want to enforce the requirement for the user to always pr=
ovide the parameter skip-kernel-install with either the value true or false=
, we can make use (!=3D false , =3D=3D true).</p>
<p>Let me know what suits us best in this case .</p>
<p>Kindest regards .</p>
<p>Kareem Zarka.</p>

--GAKtXA03j0KklSQBa5P2--

