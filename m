Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED29D0E6C8
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 11:13:59 +0000 (UTC)
Subject: Re: [PATCH v4] udev-extraconf: Split automount and autonet into seperate packages
To: openembedded-core@lists.openembedded.org
From: "Vivek Puar" <vpuar@qti.qualcomm.com>
X-Originating-Location: Hyderabad, Telangana, IN (163.116.219.94)
X-Originating-Platform: Windows Chrome 142
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 25 Nov 2025 03:13:57 -0800
References: <20251125090722.2240655-1-vpuar@qti.qualcomm.com> <CANNYZj85=33xxwT0hffW=4PeR99crUiTcWRtyTv2qYVLubY6ow@mail.gmail.com>
In-Reply-To: <CANNYZj85=33xxwT0hffW=4PeR99crUiTcWRtyTv2qYVLubY6ow@mail.gmail.com>
Message-ID: <702331.1764069237193795417@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Lh3Gv9ejHebgYpARU6OQ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 11:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226763

--Lh3Gv9ejHebgYpARU6OQ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 04:01 PM, Alexander Kanavin wrote:

>=20
> This still needs an answer to the question asked previously: how was
> this patch tested? Given that previous iterations of the patch made
> serious runtime dependency omissions, I'm somewhat nervous that the
> patch hasn't been actually verified on the target.
>=20
> Alex

With this latest change, I've verified on the target that it meets all
the dependencies when we install packages individually and also
verified that all the dependencies are met when udev-extraconf is
added to the image. So I've covered all the possibilities and verified on
the target.

Vivek

--Lh3Gv9ejHebgYpARU6OQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Nov 25, 2025 at 04:01 PM, Alexander Kanavin wrote:</div>
<div>
<blockquote>This still needs an answer to the question asked previously: ho=
w was<br />this patch tested? Given that previous iterations of the patch m=
ade<br />serious runtime dependency omissions, I'm somewhat nervous that th=
e<br />patch hasn't been actually verified on the target.<br /><br />Alex</=
blockquote>
With this latest change, I've verified on the target that it meets all</div=
>
<div>the dependencies when we install packages individually and also</div>
<div>verified that all the dependencies are met when udev-extraconf is&nbsp=
;</div>
<div>added to the image. So I've covered all the possibilities and verified=
 on</div>
<div>the target.</div>
<div>&nbsp;</div>
<div>Vivek</div>

--Lh3Gv9ejHebgYpARU6OQ--

