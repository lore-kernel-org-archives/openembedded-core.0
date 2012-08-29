Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6qLb-00058F-HY
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 00:02:51 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 14:50:33 -0700
Received: by obblz20 with SMTP id lz20so2112897obb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 14:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=dp5WYm041cTqt+tM838VLXXQSRzZwvy+hDTA6Q9UzSg=;
	b=oOcBt0EaWQIirJCtFsjK6OYWRa8qjnG7IBdhX0T4IlEwlhVkx7mydZCK9i44U2pMn2
	lllNZxwo/HvIdDiaKIvdRZ8bkY0H5QednkfkF93cXyQc6Rweypas+TINKDAU8AknptkE
	y+j6vvdPK4FbU4y3qdSPQVb9G23Fe9sILfXDi6teO1Uc+Bp6W/XigIO2411Hl7Sw3NoJ
	9fw8G3nIRtXNXEt2oXM3dfuO6kn8nsWBoIEr7FhJEbJ2U0jktS53WMxHULAWHYbFDeHn
	uD+mCUJyTNgTPaGCMbKnOqpGZjemBLNH9dM4sy0myel80D6VJm8/CtuTfEzwquJhkkre
	7cGQ==
Received: by 10.182.44.7 with SMTP id a7mr2618053obm.80.1346277035132; Wed, 29
	Aug 2012 14:50:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 29 Aug 2012 14:50:14 -0700 (PDT)
In-Reply-To: <CAMKF1srQO53m2zv91LLs8WFjEt=UKNA=w4OqxdVfJpyWPHG8jg@mail.gmail.com>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
	<CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
	<4976204.OdG2Ohk3KU@helios>
	<CAJTo0LbGH3HV1yQOMyoYDVR_z=34qy3riZnASGYdFtkK_XkOmw@mail.gmail.com>
	<1346267538.4396.38.camel@x121e.pbcl.net>
	<CAJTo0La-tMW+LVLqRGBTSE36x0BYXBJkiwh2B5_8_-SjaAzR5Q@mail.gmail.com>
	<CAMKF1srQO53m2zv91LLs8WFjEt=UKNA=w4OqxdVfJpyWPHG8jg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Aug 2012 22:50:14 +0100
Message-ID: <CAJTo0LZGcZHwM5cZgjFrQ9tuhw6RLN_g732wBitVgHKo8UigNQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQk/pi36ptRaK8rwz6AwFp88MI4UjVUCZCCmuO06x+e4Wqdj1EN72vRCxxHm2LwhSh80pgFW
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Phil Blundell <philb@gnu.org>, Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2012 22:02:51 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2012 22:38, Khem Raj <raj.khem@gmail.com> wrote:
> rest of linux
> world is moving in opposite direction where /usr is just fine and
> considered existing along with rest of basefile structure.

Agreed.  I'm with the side that says split / and /usr doesn't really
work and they should always be the same filesystem.

I'm curious if the people who want / and /usr on separate partitions
that Phil refers to are a hypothetical group of people, or people who
can chime in with their opinion.

Ross


