Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0EB65C87
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 09:28:48 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id m8so2300124obr.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 01:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=WXlDRhoujOmTM6xqNFnwv0TnOqEShdSB+f/dDQfdbjI=;
	b=wil2YqlFX3Cl5tJHGzTtpo41uwjwWForckYhltXyxI3+tc04QCf1AnkKYZZKPjIGdG
	WqfID9tGPs4m2OguGUEHfKCSQ3JOsfdXVeplq0nN05bF3TrIjzE6g967rbZhBlqP565R
	E6DUU1Mcjm6a+GMIAwsg99C2Xa0GoBNkfwSc5lsZaZNv8xl5v0PDn3TZLl9Ov5IaSBzV
	S/MqLla3Fk5y1yciaeNc2FQHX84ECs0TMf8DLU9cIZ2J1/x3wYsrcSlty8dIsdWzgmpC
	HzqHIyfZ0p9Mdb3yMrVfx3Hb72ZFXKUhd0lPURaps24C+npyyH+pAhjCtF2i44CrjXvo
	msGA==
MIME-Version: 1.0
X-Received: by 10.60.69.66 with SMTP id c2mr1029910oeu.60.1415352528757; Fri,
	07 Nov 2014 01:28:48 -0800 (PST)
Received: by 10.202.67.84 with HTTP; Fri, 7 Nov 2014 01:28:48 -0800 (PST)
In-Reply-To: <545C826F.6050002@windriver.com>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
	<ffb3182791179eda0edc491dcc3b4ce98e90695f.1415346812.git.hongxu.jia@windriver.com>
	<CALbNGRTsV6udERwG8XBoxuoFVqeyexwM46-u1Ot__AFBD_TAUg@mail.gmail.com>
	<545C826F.6050002@windriver.com>
Date: Fri, 7 Nov 2014 10:28:48 +0100
Message-ID: <CALbNGRQjDt_KLgWfAjETUXTT8+eUg1YvBwWQKrw7RXU6h=Ncuw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] postinst-intercept: rename recipe for nativesdk only
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
X-List-Received-Date: Fri, 07 Nov 2014 09:28:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2014 at 9:27 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote=
:
> On 11/07/2014 04:18 PM, Andreas M=C3=BCller wrote:
>>
>> On Fri, Nov 7, 2014 at 8:57 AM, Hongxu Jia <hongxu.jia@windriver.com>
>> wrote:
>>>
>>> The recipe postinst-intercept is only used for nativesdk, so we rename
>>> it from postinst-intercept to nativesdk-postinst-intercept.
>>>
>>> It avoids unnecessary build of postinst-intercept.
>>>
>>> [YOCTO #6937]
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>   ...ostinst-intercept_1.0.bb =3D> nativesdk-postinst-intercept_1.0.bb}=
 | 6
>>> +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>   rename
>>> meta/recipes-devtools/postinst-intercept/{postinst-intercept_1.0.bb =3D=
>
>>> nativesdk-postinst-intercept_1.0.bb} (83%)
>>>
>>> diff --git
>>> a/meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb
>>> b/meta/recipes-devtools/postinst-intercept/nativesdk-postinst-intercept=
_1.0.bb
>>> similarity index 83%
>>> rename from
>>> meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb
>>> rename to
>>> meta/recipes-devtools/postinst-intercept/nativesdk-postinst-intercept_1=
.0.bb
>>> index 41b9a6e..7dc45c6 100644
>>> --- a/meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.b=
b
>>> +++
>>> b/meta/recipes-devtools/postinst-intercept/nativesdk-postinst-intercept=
_1.0.bb
>>> @@ -2,12 +2,12 @@ SUMMARY =3D "Postinstall scriptlets"
>>>   LICENSE =3D "MIT"
>>>   LIC_FILES_CHKSUM =3D
>>> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de2=
0420"
>>>
>>> -FILES_${PN}_append_class-nativesdk =3D " ${datadir}/postinst-intercept=
s/*"
>>> +FILES_${PN}_append =3D " ${datadir}/postinst-intercepts/*"
>>>
>>>   do_configure[noexec] =3D "1"
>>>   do_compile[noexec] =3D "1"
>>>
>>> -do_install_append_class-nativesdk() {
>>> +do_install() {
>>>          install -d ${D}${datadir}/postinst-intercepts
>>>          install -m 755
>>> ${COREBASE}/scripts/postinst-intercepts/postinst_intercept
>>> ${D}${datadir}/postinst-intercepts/
>>>          install -m 755
>>> ${COREBASE}/scripts/postinst-intercepts/update_font_cache
>>> ${D}${datadir}/postinst-intercepts/
>>> @@ -15,5 +15,5 @@ do_install_append_class-nativesdk() {
>>>          install -m 755
>>> ${COREBASE}/scripts/postinst-intercepts/update_pixbuf_cache
>>> ${D}${datadir}/postinst-intercepts/
>>>   }
>>>
>>> -BBCLASSEXTEND =3D "nativesdk"
>>> +inherit nativesdk
>>>   INHIBIT_DEFAULT_DEPS =3D "1"
>>> --
>>> 1.9.1
>>>
>> is it possible that the commit message does not match to the patch?
>
>
> You mean the patch doesn't match with cover letter or the patch's commit
> message?
>
> Rename it is to avoid to install postinst-intercept, that will let build
> postinst-intercept
> invalid at parsing time rather than failed at image's do_root.
>
> //Hongxu
>
>
Aargh - I did not read the patch properly - should learn not to write
coffee-less comments

Andreas

