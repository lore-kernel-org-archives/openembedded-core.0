Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SuQHM-0003h4-Ng
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 17:47:08 +0200
Received: by obcva7 with SMTP id va7so2812617obc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 08:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=4zo5GNLGPWyOunI8Qey+7s5Ufih2J8DA0QYcicOV0GQ=;
	b=ZA7S8GT/A+XVYcvPG7E1ps5OMeouwlRZa/Ii+7A93fdDNBfaBDSebQGMKYL66sPVIT
	YbtVsukjDGvd7rf5zDbiZPiq5FKlfwMqI9hIOKNl6/weBCcM1vW8OdF6Q9iKA+cUGMEg
	3y/mD+o/d2LYnI+HHEy0XFpmXHBubTL615VOQCZSSOpoe8H7lY5N+3YS9qOA2slGJPi0
	u32G494RwmIAbp7eXB7uV/ot7sgrXQ6LATYg6FBWjDUB+V7bfGNw7fbcDSmHcYeQR3sV
	nQwoELORwlTAf2Qyk/PWmwg3mzKLHmdnn1q4QdDpGEWm9wIBh8K8xVrSm1y93mqEkOXl
	30dA==
MIME-Version: 1.0
Received: by 10.182.88.9 with SMTP id bc9mr42360706obb.4.1343316937465; Thu,
	26 Jul 2012 08:35:37 -0700 (PDT)
Received: by 10.76.91.170 with HTTP; Thu, 26 Jul 2012 08:35:37 -0700 (PDT)
In-Reply-To: <CAJTo0La41DbcZMFm-T5dH-_u52ZA4rL7i2LsHs-NLfZX8Nz6nQ@mail.gmail.com>
References: <1343315761-6314-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0La41DbcZMFm-T5dH-_u52ZA4rL7i2LsHs-NLfZX8Nz6nQ@mail.gmail.com>
Date: Thu, 26 Jul 2012 17:35:37 +0200
Message-ID: <CALbNGRSJJ-SB10g676LDTNf1L97WXrCZTNZ79oFoAVGmovSOYg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-doc.bbclass: unbreak dependency-chain for native recipes
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
X-List-Received-Date: Thu, 26 Jul 2012 15:47:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2012 at 5:19 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
> On 26 July 2012 16:16, Andreas M=FCller <schnitzeltony@googlemail.com> wr=
ote:
>> -DEPENDS_virtclass-native_append =3D " gtk-doc-stub-native"
>> +DEPENDS_append_virtclass-native =3D " gtk-doc-stub-native"
>
> Was this a typo on my part, or is there a semantic difference between tho=
se?
>
> Ross
>
It is not an answer to your question but

I grepped for DEPENDS_virtclass-native_append in oe-core and did find
one occurrence in gtk-doc.bbclass. DEPENDS_append_virtclass-native I
found in xcb-proto.inc so I gave it a try by

bitbake -e atk-native | grep ^DEPENDS

A correct answer to your question is up to experts :)

Andreas


