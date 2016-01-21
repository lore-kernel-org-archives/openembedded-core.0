Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD3B731C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 04:41:16 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id h5so26010924igh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 20:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=oQcl1l3BzHAP8Z39hk/OzW9X1UJx/4zqsvyvkVbDRoo=;
	b=XJKApD4O3eSciFEkMrL3elTz38wIiR3++PKAdBXwmNHlDZa/GejIpIcKsKFXdSkkzT
	wwle0rhqwBwoeI/E3sRNztKhFQqip/vbUYrhMsrWXEeLZGbHLiGYeCzca7LlueIs6cxW
	gLKxkTR7gH5xH8vL34BxlqzIp41yvpLmVZ5n5Pks7xlaJbbq19wk0zpJ7zaAU340tDcn
	blGiK16/NkapZ7izj9bUju0QGjc6lNwX2mDvwh8qpZW3oHsIJ8Q76RiOkY6pm4+9TDhA
	Izi9HGApOJdPG1YgTC/fu0XFuSlv4flISWOAHUWNbHC8rMSSs7N58Ou8TnBpNgqb2Duv
	Bi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=oQcl1l3BzHAP8Z39hk/OzW9X1UJx/4zqsvyvkVbDRoo=;
	b=UNJFX70G88ANPhR3NmV6PQqVC9AV1aDRbXubNQrBN198dfr+y8U0vCbuE7/7ygpO55
	bGV72Y+cBsZYypY5vgj4pOypyr7IGIEn4WR7rMGVDqqXDWdVqkImDgC7od6WN62ELuEJ
	8VKn3t1QLwbjWRLzTk5uqn0Oqmn5gakzrIgF2+ejDujD3NTo/WC0osZvDQV1EpZnN27b
	dlmeVYH+i0+wrh88h1bjLdMZWdEgsTakXbHH1M1vHIhJkB2eqC4RgI3gPmDltz9S4VFE
	R98o+B8XA/XDUO0Kbg23XXLCwK/Dn2nxrwSU8F2XlTnyqlo5xLwoqnK42VkNK2pFzSVk
	h0rw==
X-Gm-Message-State: AG10YOTyi1STuADQW9qQRTfzuwlqTeUxavpnS1DBtS5qoM4eCzRkpi91ZhYa7kKCYFW6hbIBBvBru0VEDJ1QPg==
X-Received: by 10.50.13.102 with SMTP id g6mr7666170igc.77.1453351277710; Wed,
	20 Jan 2016 20:41:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Wed, 20 Jan 2016 20:40:48 -0800 (PST)
In-Reply-To: <CAJ86T=XhXpo5kG1LNMKrbBYFbUAcSoZtdM6k__4KyeL4DkO8ww@mail.gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
	<1453344203-7118-21-git-send-email-armccurdy@gmail.com>
	<55B24B65-AD91-4DE4-8BFD-7204F4033862@gmail.com>
	<CAJ86T=XhXpo5kG1LNMKrbBYFbUAcSoZtdM6k__4KyeL4DkO8ww@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Jan 2016 20:40:48 -0800
Message-ID: <CAMKF1sroScsM4qY5fpAyjhT=ZorhkgYVfwZmpyD3Dg=A6Eumtw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/25] gstreamer1.0: update git recipe to 1.7.1
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
X-List-Received-Date: Thu, 21 Jan 2016 04:41:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2016 at 8:39 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Jan 20, 2016 at 8:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> On Jan 20, 2016, at 6:43 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>> meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb | 15 ++++++++++--=
---
>>> 1 file changed, 10 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/me=
ta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
>>> index f7e2351..4fff533 100644
>>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
>>> @@ -5,14 +5,19 @@ include gstreamer1.0.inc
>>> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d928e=
ad0d \
>>>                     file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De=
059138481205ee2c6fc1c079c016d0d"
>>>
>>> -SRC_URI =3D "git://anongit.freedesktop.org/gstreamer/gstreamer;branch=
=3Dmaster"
>>> +SRC_URI =3D " \
>>> +    git://anongit.freedesktop.org/gstreamer/gstreamer;name=3Dbase \
>>> +    git://anongit.freedesktop.org/gstreamer/common;destsuffix=3Dgit/co=
mmon;name=3Dcommon \
>>> +"
>>>
>>> -SRCREV =3D "3b8181a8c550e74acaba4e8c55bdc649fa551dc9"
>>> +PV =3D "1.7.1+git${SRCPV}"
>>> +
>>> +SRCREV_base =3D "2a188848eb2af3c3b357978ff7786a78aad9dd55"
>>> +SRCREV_common =3D "86e46630ed8af8d94796859db550a9c3d89c9f65"
>>> +SRCREV_FORMAT =3D "base"
>>>
>>> S =3D "${WORKDIR}/git"
>>>
>>> do_configure_prepend() {
>>> -     cd ${S}
>>> -     ./autogen.sh --noconfigure
>>> -     cd ${B}
>>> +     ${S}/autogen.sh =E2=80=94noconfigure
>>
>>
>> where does it generate the new autoconf files ( configure and friends) a=
fter
>> this change ? is it in S or in B
>
> In ${S}. The autogen.sh script takes care of cd'ing to the correct
> directory before it does anything, so we don't need to cd on its
> behalf any more.
>
>   http://cgit.freedesktop.org/gstreamer/gstreamer/tree/autogen.sh

right. Lets add this to commit message

