Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SV2Jc-0005r5-R9
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 17:08:32 +0200
Received: by wgbdr1 with SMTP id dr1so1679739wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 07:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=KnjoFUqBHfzyrZ0I3CCBUE3w7vUK50S+op8UIR7rzAA=;
	b=LxJRnNIVSIIYLoLC5J1ghrg/YkDUU+AouZJqj1c9MQZcldpCLE+pqoTHVJfwKA0GNS
	3xUvw+jz+pkyGq6aqJU3+CpRp+kRaMQxBMlFiwFR6vCzJiyMM1vJ+pnV1LqiN/USepwc
	EnIYf7YPZ2e0w6tJDaANHu59grEOR2Rfi7B+Wb4MwDG7Vv7gLDmpWkmBVBu5sd5JyZmY
	oHjQ33ZYncEwc8arybj5S/RTbwijfz1hvvVsEskwiHbT94wI2qB0TdSlKXMuQ2yOrKa9
	C0yMn9HnWLtFHSWW5sAnCgauG+Df2fjclnQT+35DXgvNOTuJttM2Esgwbr3wdEb533Wb
	A+og==
Received: by 10.180.78.164 with SMTP id c4mr51388257wix.10.1337266710399;
	Thu, 17 May 2012 07:58:30 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fn2sm21769561wib.0.2012.05.17.07.58.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 07:58:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FB50F47.6060207@linux.intel.com>
Date: Thu, 17 May 2012 16:58:23 +0200
Message-Id: <4A22156E-2396-413C-A621-E947330B22D1@dominion.thruhere.net>
References: <1337131523-8176-1-git-send-email-kergoth@gmail.com>
	<4FB50F47.6060207@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkWGVDSdw5cGXbHFHo2o/hA+M5LNjpHVEGWxcDNvnGmUWNCJC/Iu7McIJ+6Jsg+eCVcQ03B
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] kernel.bbclass: add deploy link to KERNEL_IMAGETYPE
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
X-List-Received-Date: Thu, 17 May 2012 15:08:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 mei 2012, om 16:46 heeft Darren Hart het volgende geschreven:

> On 05/15/2012 06:25 PM, Christopher Larson wrote:
>> From: Christopher Larson <chris_larson@mentor.com>
>>=20
>> It's common to provide a non-machine-suffixed link in =
DEPLOY_DIR_IMAGE, so
>> let's be consistent and do so here as well.
>=20
> This of course means that building two machines in the same build dir
> will result in overwriting the latest non-machine-suffixed link
> (provided they are the same image type)

Actually it doesn't. At least not on angstrom, shr and slugos:

koen@dominion:/OE/tentacle/sources/meta-angstrom$ git grep =
DEPLOY_DIR_IMAGE
conf/distro/include/angstrom.inc:DEPLOY_DIR_IMAGE =3D =
"${DEPLOY_DIR}/images/${MACHINE}"

The above was mentioned a few weeks ago, but it looks like no one but =
the distros above and Chris care about proper multimachine builds.=


