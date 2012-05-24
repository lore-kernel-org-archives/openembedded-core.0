Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1SXeAm-0006r2-OU
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 21:58:12 +0200
Received: from mail-vb0-f52.google.com ([209.85.212.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 24 May 2012 12:46:56 -0700
Received: by vbzb23 with SMTP id b23so128227vbz.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 12:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=OIwZivqySGuZ+nbzgUqLO/1jC4NQkW30JGzZkDshaKI=;
	b=kMeAzmtJ6dJmr/dcNzaNR2H7Od8c7GmSoswCii2fsB/zIVVgLvqKUDcqN7MhBrl07N
	zwxgHV1yz5MqYl+olqRU49+DEPrtQMkmw+LYmXtjd9nM6BRYSWySW/g0RBGHFGoFQqXb
	foYvD+Cm9HtDk6cAYihsQPWpiaO1kPXbpoHDPninlSjacZOk/1U8czF/8QvHzleJyuXz
	d4iGuM1v7ba4Qfh/ydE3D2EjjXAfCLSP2MchXPX42jBg+9uCKiZwUlXvnFzm0GFwDUpi
	+FdaIGrHGNWtHS7GDR/8j9w71aH0hBrlqls0b67Y8H/7AhpMWGcBcMcF2Zyscok2wDNK
	WimA==
Received: by 10.52.26.240 with SMTP id o16mr653888vdg.20.1337888815295; Thu,
	24 May 2012 12:46:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.169.200 with HTTP; Thu, 24 May 2012 12:46:34 -0700 (PDT)
In-Reply-To: <4FBDAD2C.6030707@linux.intel.com>
References: <1337682025-9531-1-git-send-email-bogdan.a.marinescu@intel.com>
	<4FBDAD2C.6030707@linux.intel.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Thu, 24 May 2012 22:46:34 +0300
Message-ID: <CAMZjud1dYWMRfZva2B7iXWUOE-64YeDM5VC9C6L2MrpWiGpCEA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQm+kYlQIsigwnwhhR8EhN2Rq8IJ5r0cS51Q7M2B2dFJWmfFWyfVks+3cFvoJJgNrbX7weDp
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng2-ust: updated to version 2.0.2
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
X-List-Received-Date: Thu, 24 May 2012 19:58:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 24, 2012 at 6:38 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 05/22/2012 03:20 AM, Bogdan Marinescu wrote:
>>
>> Tested with 'lttv' on core-image-lsb.
>>
>> Signed-off-by: Bogdan Marinescu<bogdan.a.marinescu@intel.com>
>> ---
>> =A0.../{lttng2-ust_1.9.4.bb =3D> =A0lttng2-ust_2.0.2.bb} =A0 | =A0 =A08 =
++++----
>> =A01 files changed, 4 insertions(+), 4 deletions(-)
>> =A0rename meta/recipes-kernel/lttng-2.0/{lttng2-ust_1.9.4.bb =3D>
>> =A0lttng2-ust_2.0.2.bb} (81%)
>>
> This update seems to have broken lttng-tools, which may share an API with
> this package. Is there an update for lttng-tools also?

Please disregards this, I will send a new series of patches that also
have an update for lltng-tools.

Thanks,
Bogdan

>
> Sau!
>
>> diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_1.9.4.bb
>> b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
>> similarity index 81%
>> rename from meta/recipes-kernel/lttng-2.0/lttng2-ust_1.9.4.bb
>> rename to meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
>> index 87d866e..8f650a4 100644
>> --- a/meta/recipes-kernel/lttng-2.0/lttng2-ust_1.9.4.bb
>> +++ b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
>> @@ -3,8 +3,8 @@ DESCRIPTION =3D "The LTTng UST 2.0 package contains the
>> userspace tracer library t
>> =A0HOMEPAGE =3D "http://lttng.org/lttng2.0"
>> =A0BUGTRACKER =3D "n/a"
>>
>> -LICENSE =3D "LGPLv2.1+& =A0BSD"
>>
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De647752e045a8c45b6f583771bd5=
61ef \
>> +LICENSE =3D "LGPLv2.1+& =A0BSD& =A0GPLv2"
>>
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc963eb366b781252b0bf0fdf1624=
d9e9 \
>>
>> =A0file://snprintf/snprintf.c;endline=3D32;md5=3Dd3d544959d8a3782b2e0745=
1be0a903c
>> \
>>
>> =A0file://snprintf/various.h;endline=3D31;md5=3D89f2509b6b4682c4fc95255e=
ec4abe44"
>>
>> @@ -12,8 +12,8 @@ inherit autotools
>>
>> =A0DEPENDS =3D "liburcu util-linux"
>>
>> -SRCREV =3D "eeee05f35f014a8c068e0d29b18629cafbfdfc1d"
>> -PV =3D "1.9.4+git${SRCPV}"
>> +SRCREV =3D "a367ee66aad3ffd21ef64d1b24efc6f862e09562"
>> +PV =3D "2.0.2+git${SRCPV}"
>> =A0PR =3D "r0"
>>
>> =A0SRC_URI =3D "git://git.lttng.org/lttng-ust.git;protocol=3Dgit"


