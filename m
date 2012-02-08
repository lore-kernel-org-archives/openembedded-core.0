Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RvBtw-00058m-Nt
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 19:05:52 +0100
Received: by pbcum15 with SMTP id um15so545602pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 09:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=9KCifH4ORFbaHdelUQNU841SnasGNfxtw8wauIV9f1g=;
	b=MpFv828j8F+hzSluItq+atIj5i6fbPUHbBxWLZtgwTyj0ZLXHUAjCdbCVJ9YUoy84a
	tC7i1krkm7fUYUGo6n16uGmbGCcyqhsF0Oeayo4KLrEC0yZcGI9khQ5iwyZckkR+h788
	maTRWGqNENWyEpO86DlcSILz0dMQIGSVecNco=
MIME-Version: 1.0
Received: by 10.68.211.198 with SMTP id ne6mr71578888pbc.83.1328723867642;
	Wed, 08 Feb 2012 09:57:47 -0800 (PST)
Received: by 10.142.237.1 with HTTP; Wed, 8 Feb 2012 09:57:47 -0800 (PST)
In-Reply-To: <1328310400.4220.60.camel@mattotaupa>
References: <1328309610-12397-1-git-send-email-tom.rini@gmail.com>
	<1328310400.4220.60.camel@mattotaupa>
Date: Wed, 8 Feb 2012 10:57:47 -0700
Message-ID: <CA+M6bX=X-A8r6---NbBHTsH23CQ2A3fnt-kvitr8V06ijBEoZA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-fw-utils: Initial version
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
X-List-Received-Date: Wed, 08 Feb 2012 18:05:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 3, 2012 at 4:06 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Tom,
>
>
> Am Freitag, den 03.02.2012, 15:53 -0700 schrieb Tom Rini:
>> From: Tom Rini <trini@ti.com>
>
> please add the version in the commit summary.

OK.

>> This provides the 'fw_setenv' and 'fw_getenv' programs for the target
>> so that the U-Boot environment can be modified from Linux. =A0These
>> programs are system-agnostic and rely on a config file that a given BSP
>> will provide (and RRECOMMEND this be installed).
>
> I do not understand the addition in the parentheses.

OK.

>> Signed-off-by: Tom Rini <trini@ti.com>
>> ---
>> =A0meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb | =A0 26 +++++++++=
+++++++++++
>> =A01 files changed, 26 insertions(+), 0 deletions(-)
>> =A0create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb b/meta/r=
ecipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>> new file mode 100644
>> index 0000000..3185cbd
>> --- /dev/null
>> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>> @@ -0,0 +1,26 @@
>> +DESCRIPTION =3D "U-boot bootloader fw_printenv/setenv utils"
>> +LICENSE =3D "GPLv2+"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://README;beginline=3D1;end=
line=3D22;md5=3D5ba4218ac89af7846802d0348df3fb90"
>> +SECTION =3D "bootloader"
>
> Is this the standard ordering? Is there also a homepage for theses
> utils?

This is just the u-boot recipe stripped out of building U-Boot and
only building the bundled utilities.

--=20
Tom


