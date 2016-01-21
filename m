Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5B8A060621
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 04:39:05 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u188so8295376wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 20:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=LKlwpMBzlzBXFrBx9t2wPlOldUO0zdBDnIOY9KsnwqU=;
	b=k/V3Z+F5cQTlZ+38PK/w5Hym4B5X1uo2Reg7IQfFIB8o73f/TzFrZ39holLCI3qCRd
	grMBPYcVco52Ppp+bq8ciQ/5sDXBfLGnoKo4LuYzTpIt9n47M5jgyZuO25hs6g3F39Eq
	1qq/myoanCq0x4XdOsMKOmMJ3vdCrd1yx2pgnsAwskk54DeuLnHFsIpVNH3qdGX65nAs
	WbgVBDhnxO/pxr/DQXdsUkyrdvsm5/yFpCJrE731xSypnZ59yGdhbL0ATS6fo3ani/WJ
	u7aNMPlxTkSoXH5AvROybsxiZ5+P8WiGzw/yzeXJSO4KnnwttZ5uChcGQCncy9mI0ykb
	DvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=LKlwpMBzlzBXFrBx9t2wPlOldUO0zdBDnIOY9KsnwqU=;
	b=dmlll36e7Yh58ZvRwdE93C7EgZABTRkYB6VZ64ZPOFuJ1Lepu1pzZHOwsaF/aDtX4U
	sM0w727Gv9AEUzVS16R11SPl+UrmzG08Xv76LGDjUkWr8dDq7qHqoUJrFY3O/3ofJMdi
	dvdTcfdkSI+hE8KjCBbHtDKk1k7GLj1L3YmtAzSebrX3ZOnLOm9FzacZtOvuJy1sh+1/
	jTWsaOc4cQZptke8KxqTQx85LBxpfoRUd1CMJeQDjfSrPDizcNqLkopcLcMhNXTB1nA/
	1qtZcDq8oj5ptoZvXAnlcBJlSpDG1tCQOraPy4UWwDD/zw8CWoHTw7pBFtgjYy4RmXne
	iOBQ==
X-Gm-Message-State: AG10YOSWLZjHAjTgNqPQyCSC1arCiQJWPakXPz7zhMFtPMP+tW3SRZPKZmBAYrr+OHBPAEFNbQNk3qrF/2aWYw==
MIME-Version: 1.0
X-Received: by 10.28.53.193 with SMTP id c184mr7492248wma.4.1453351146238;
	Wed, 20 Jan 2016 20:39:06 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Wed, 20 Jan 2016 20:39:06 -0800 (PST)
In-Reply-To: <55B24B65-AD91-4DE4-8BFD-7204F4033862@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
	<1453344203-7118-21-git-send-email-armccurdy@gmail.com>
	<55B24B65-AD91-4DE4-8BFD-7204F4033862@gmail.com>
Date: Wed, 20 Jan 2016 20:39:06 -0800
Message-ID: <CAJ86T=XhXpo5kG1LNMKrbBYFbUAcSoZtdM6k__4KyeL4DkO8ww@mail.gmail.com>
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
X-List-Received-Date: Thu, 21 Jan 2016 04:39:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2016 at 8:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Jan 20, 2016, at 6:43 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>> meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb | 15 ++++++++++---=
--
>> 1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/met=
a/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
>> index f7e2351..4fff533 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
>> @@ -5,14 +5,19 @@ include gstreamer1.0.inc
>> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d928ea=
d0d \
>>                     file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De0=
59138481205ee2c6fc1c079c016d0d"
>>
>> -SRC_URI =3D "git://anongit.freedesktop.org/gstreamer/gstreamer;branch=
=3Dmaster"
>> +SRC_URI =3D " \
>> +    git://anongit.freedesktop.org/gstreamer/gstreamer;name=3Dbase \
>> +    git://anongit.freedesktop.org/gstreamer/common;destsuffix=3Dgit/com=
mon;name=3Dcommon \
>> +"
>>
>> -SRCREV =3D "3b8181a8c550e74acaba4e8c55bdc649fa551dc9"
>> +PV =3D "1.7.1+git${SRCPV}"
>> +
>> +SRCREV_base =3D "2a188848eb2af3c3b357978ff7786a78aad9dd55"
>> +SRCREV_common =3D "86e46630ed8af8d94796859db550a9c3d89c9f65"
>> +SRCREV_FORMAT =3D "base"
>>
>> S =3D "${WORKDIR}/git"
>>
>> do_configure_prepend() {
>> -     cd ${S}
>> -     ./autogen.sh --noconfigure
>> -     cd ${B}
>> +     ${S}/autogen.sh =E2=80=94noconfigure
>
>
> where does it generate the new autoconf files ( configure and friends) af=
ter
> this change ? is it in S or in B

In ${S}. The autogen.sh script takes care of cd'ing to the correct
directory before it does anything, so we don't need to cd on its
behalf any more.

  http://cgit.freedesktop.org/gstreamer/gstreamer/tree/autogen.sh

>> }
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

