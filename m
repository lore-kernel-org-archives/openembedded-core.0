Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4799B6FF5D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:03:37 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l65so8387550wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=4QiaQaGfWtsBJ4G4Le4/GNbolZco4XwLSKetbO2vFvw=;
	b=mNz41Vq67rEZz9/2zuxF1tfaFBsxFy8jYGsZ4QJLqZncN80nZCT6lElen/B8f4EjhT
	rqJlbHOv/h+l+Zs8sNbu6FquB/5EngAAt8ISnApUikEEgCw5eOsHXLUobtZtPCFvlXgU
	lRnzN3MDOXUwFl6BQ4ta7XosMJn9YgGT35DM2KfQeRHyK0zdCXxOYyG/iaqHXg/uKu6w
	s5FKtFwIbY00i1qbVJBnM7MsgyAmlLFGM1Iu1iG2cURf5bjjdicnIbawELSfFGbuzCQH
	skacOeMA7acrK0JtW04lRk7bLpcEHz73p1AfMwjWZI4aCo/CVVJWiSN3JdE6w+K2DQPg
	X4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=4QiaQaGfWtsBJ4G4Le4/GNbolZco4XwLSKetbO2vFvw=;
	b=CXSZRgLG86CqPPDAXgbds8WmoRVpQ0rY+EhloQp1NNH08tHf/sJdI0OwelOVgPxc9N
	C5io++1m1+R2FsJG+F5T6ttfwcF0KUwteAz6UYRsOzZqHKH2n1GwqT0ia0wkHQnlK/rG
	L8C+CzxNe2BHnIRvfrAyRdhlWTes/nWUSfrxsoJV7dzFGZ9+HUZinBHcN7sZHO91wgOg
	CoYyuP83AfRdSXnXiUBSANAN2KSBxJD0sF/s6Bf+FXNl+FqGLjgVdvuK1GoM/naiz+CX
	DQiUdjizC4eE2dnO6Qe6TIB9vzWePX1AG007b6RPxDftOK1XLK3jPWpmnFZK83pU+eBT
	JWIQ==
X-Gm-Message-State: AG10YOROyC3KuVOeBKdfGmyNI07UcWC83HvCviz3D1N/ZBy/+62pg7jghqXDBoVRANB8g3qn/s13msBnZf5a4g==
MIME-Version: 1.0
X-Received: by 10.28.182.133 with SMTP id g127mr7510119wmf.61.1453352617983;
	Wed, 20 Jan 2016 21:03:37 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Wed, 20 Jan 2016 21:03:37 -0800 (PST)
In-Reply-To: <CAMKF1sroScsM4qY5fpAyjhT=ZorhkgYVfwZmpyD3Dg=A6Eumtw@mail.gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
	<1453344203-7118-21-git-send-email-armccurdy@gmail.com>
	<55B24B65-AD91-4DE4-8BFD-7204F4033862@gmail.com>
	<CAJ86T=XhXpo5kG1LNMKrbBYFbUAcSoZtdM6k__4KyeL4DkO8ww@mail.gmail.com>
	<CAMKF1sroScsM4qY5fpAyjhT=ZorhkgYVfwZmpyD3Dg=A6Eumtw@mail.gmail.com>
Date: Wed, 20 Jan 2016 21:03:37 -0800
Message-ID: <CAJ86T=Wus1+924yKPFMg23T92DSLTskvRxJdLdD=wfw=rogq9A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 21 Jan 2016 05:03:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2016 at 8:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Jan 20, 2016 at 8:39 PM, Andre McCurdy <armccurdy@gmail.com> wrot=
e:
>> On Wed, Jan 20, 2016 at 8:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>> On Jan 20, 2016, at 6:43 PM, Andre McCurdy <armccurdy@gmail.com> wrote=
:
>>>>
>>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>>> ---
>>>> meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb | 15 ++++++++++-=
----
>>>> 1 file changed, 10 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/m=
eta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
>>>> index f7e2351..4fff533 100644
>>>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
>>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
>>>> @@ -5,14 +5,19 @@ include gstreamer1.0.inc
>>>> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d928=
ead0d \
>>>>                     file://gst/gst.h;beginline=3D1;endline=3D21;md5=3D=
e059138481205ee2c6fc1c079c016d0d"
>>>>
>>>> -SRC_URI =3D "git://anongit.freedesktop.org/gstreamer/gstreamer;branch=
=3Dmaster"
>>>> +SRC_URI =3D " \
>>>> +    git://anongit.freedesktop.org/gstreamer/gstreamer;name=3Dbase \
>>>> +    git://anongit.freedesktop.org/gstreamer/common;destsuffix=3Dgit/c=
ommon;name=3Dcommon \
>>>> +"
>>>>
>>>> -SRCREV =3D "3b8181a8c550e74acaba4e8c55bdc649fa551dc9"
>>>> +PV =3D "1.7.1+git${SRCPV}"
>>>> +
>>>> +SRCREV_base =3D "2a188848eb2af3c3b357978ff7786a78aad9dd55"
>>>> +SRCREV_common =3D "86e46630ed8af8d94796859db550a9c3d89c9f65"
>>>> +SRCREV_FORMAT =3D "base"
>>>>
>>>> S =3D "${WORKDIR}/git"
>>>>
>>>> do_configure_prepend() {
>>>> -     cd ${S}
>>>> -     ./autogen.sh --noconfigure
>>>> -     cd ${B}
>>>> +     ${S}/autogen.sh =E2=80=94noconfigure
>>>
>>>
>>> where does it generate the new autoconf files ( configure and friends) =
after
>>> this change ? is it in S or in B
>>
>> In ${S}. The autogen.sh script takes care of cd'ing to the correct
>> directory before it does anything, so we don't need to cd on its
>> behalf any more.
>>
>>   http://cgit.freedesktop.org/gstreamer/gstreamer/tree/autogen.sh
>
> right. Lets add this to commit message

OK. I'm preparing a v2, which will include the updated commit
messages, plus some more dependency fixes and also update the main
recipes from 1.6.2 -> 1.6.3.

