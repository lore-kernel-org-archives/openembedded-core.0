Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RnV3a-00020h-BH
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 13:56:02 +0100
Received: by dadw11 with SMTP id w11so1565159dad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2012 04:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=VJ4zEU1vVe3EIRRZpgddzy0E1rkZ7IVPKXhJ4C58D5s=;
	b=G5Im9DVk6GVvOy/u1mcDJVswsFv4ZLettAXqTrgzaCN2rDFxczPBW2wjCXlyriVhkG
	i/9jAPt4wfE/1rw9gGXEAMUfJQmbJKcUCgT1hQzmTXKMlT37+jTXpeqN7P8Nm3UqeiUn
	2q8IpMe5e4eefam7FpRGlNBK3zOylLk1NiAS4=
MIME-Version: 1.0
Received: by 10.68.213.234 with SMTP id nv10mr43533226pbc.7.1326890443848;
	Wed, 18 Jan 2012 04:40:43 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Wed, 18 Jan 2012 04:40:43 -0800 (PST)
In-Reply-To: <4E95A0DD-C978-4621-A624-8313A743CE56@dominion.thruhere.net>
References: <1326841411-6369-1-git-send-email-andrea.adami@gmail.com>
	<4E95A0DD-C978-4621-A624-8313A743CE56@dominion.thruhere.net>
Date: Wed, 18 Jan 2012 13:40:43 +0100
Message-ID: <CAAQYJAvA40tv+9Avwxo736itjGM6yL4EZA98YnKYvw_XtZR-9A@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xinput: add utility for configuring and testing XInput devices.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jan 2012 12:56:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2012 at 2:46 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
>
> Op 18 jan. 2012 om 00:03 heeft Andrea Adami <andrea.adami@gmail.com> het =
volgende geschreven:
>
>> * from meta-openembedded with minor editings
>> * added PE
>
> why?

Just because most oe-core's recipes in xorg-app set PE.
I quickly inspected some and edited trying to normalize (fields order,
summary, ...).

>
>> and reset PR
>
> why?

Because this revised version is committed for the first time in this layer.
I see now this can break package management of distros using meta-oe
and the recipe with higher PR...
and I don't want to force another PE bump.Sorry.

Would it be acceptable for you if I update the patch with PR =3D "r7" ?
What about PE?

Regards

Andrea
>
>
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>> meta/recipes-graphics/xorg-app/xinput_1.5.3.bb | =A0 15 +++++++++++++++
>> 1 files changed, 15 insertions(+), 0 deletions(-)
>> create mode 100644 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
>>
>> diff --git a/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb b/meta/recip=
es-graphics/xorg-app/xinput_1.5.3.bb
>> new file mode 100644
>> index 0000000..c9925f1
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
>> @@ -0,0 +1,15 @@
>> +require xorg-app-common.inc
>> +
>> +SUMMARY =3D "Runtime configuration and test of XInput devices"
>> +
>> +DESCRIPTION =3D "Xinput is an utility for configuring and testing XInpu=
t devices"
>> +
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D22c34ea36136407a77702a8b784f=
9bd0"
>> +
>> +DEPENDS +=3D " libxi"
>> +
>> +PR =3D "r0"
>> +PE =3D "1"
>> +
>> +SRC_URI[md5sum] =3D "1e2f0ad4f3fa833b65c568907f171d28"
>> +SRC_URI[sha256sum] =3D "6aade131cecddaeefc39ddce1dd5e8473f6039c2e4efbfd=
9fbb5ee2a75885c76"
>> --
>> 1.7.3.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


