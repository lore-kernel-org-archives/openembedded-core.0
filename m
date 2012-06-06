Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ScKYB-0002kb-6t
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 20:01:43 +0200
Received: by eekd49 with SMTP id d49so2382676eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2012 10:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=dTnjQS2H0rQ/3UbWmEFiFoE4H4cOC/BoatUzrcX9LIg=;
	b=apdp1yJRXr9hDKZeW/GMDQCOa8xhHGLnDM78FdWxq0DuNT9SRU/PC5dVfUV0N9tETO
	5BxwDo30TviElHrpMl78PG+DZuUq63Cr3X0IecbwAMmPJ+wP8k59kFon3yuoXuP2tOjn
	0aJUa7VAAt69M7UQOmTniepHBSGGqxfb84/e0ao9MjKhHnT1hpdPWoNQGp5o9DbVxZGp
	WVy0m0V1ir0lJJyBXTVOW7Wq30p3MIdX4tLYFNkpPI61nMffL7DTCKb6kBeq9YNGMhfA
	gjdzs8jEyvAKydeyAyTyjIopcuMBC9yDsaHF33PVBNik3mp27xh1zO73SvRlaU9onFEE
	mL9w==
Received: by 10.14.189.14 with SMTP id b14mr10421821een.141.1339005075825;
	Wed, 06 Jun 2012 10:51:15 -0700 (PDT)
Received: from ?IPv6:2001:610:612::115:83f2:b12b:fa11?
	([2001:610:612:0:115:83f2:b12b:fa11])
	by mx.google.com with ESMTPS id m5sm1755281eeh.17.2012.06.06.10.51.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jun 2012 10:51:14 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FCF7959.3070102@linux.intel.com>
Date: Wed, 6 Jun 2012 19:51:12 +0200
Message-Id: <CB9D6A1A-7072-4448-8C8D-BD5840102797@dominion.thruhere.net>
References: <1338960862-17401-1-git-send-email-sgw@linux.intel.com>
	<CAJTo0LY0QBDM5O8t9tvyMxnCnFWBSM3ct7AZZU8W4YZd7Ke-Pw@mail.gmail.com>
	<4FCF7959.3070102@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlRBvuutkAVb0WgJLFiE4CsEGf7d6QWslYICLymDLE86Vf9K8P6i+4dQAOb4affd3n4bK1O
Subject: Re: [PATCH] gnomebase: add GNOME_COMPRESS_TYPE variable
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
X-List-Received-Date: Wed, 06 Jun 2012 18:01:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 jun. 2012, om 17:38 heeft Saul Wold het volgende geschreven:

> On 06/06/2012 03:46 AM, Burton, Ross wrote:
>> On 6 June 2012 06:34, Saul Wold<sgw@linux.intel.com>  wrote:
>>> Upstream Gnome projects are starting to migrate to the .xz compress =
format,
>>> so we need to add this to allow recipes to override the default of =
.bz2 as
>>> the upstreams make the transition.
>>=20
>> Considering all future tarballs are going to be .xz, would it make
>> sense to default to .xz and fix the recipes where there isn't a .xz?
>>=20
> I think until we get a predominant number of the gnome packages =
updated there is not much point in doing that as it would require extra =
recipe edits.  I think if we can do a batch update and then switch the =
default that would make more sense.  I will leave that up to the new =
gnome recipe maintainer Valentin.

When are the gnome recipes going to move out of OE-core?=


