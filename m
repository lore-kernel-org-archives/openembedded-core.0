Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9dqH-00075W-Lg
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 15:45:49 +0100
Received: by wera1 with SMTP id a1so5953628wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 07:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=GNps4ng8opRmDZTqwUsXvVS5NvGcND1aH3wggUhEIv0=;
	b=b46jHokKEaDkVh2p8kle3trfcAxQ8FeU8FAYdaml65kG6iSowgoHg3sju6RzfxfAe0
	eSv4KDenydl4NBQkFnG7ryzFFtUbWy/Di4jDeFXyYFMqwbCCr1czWaLEtrNzjZIns7wP
	mScoYd4+rtUY7EoAJAmsrZYRbjWfDFF6VFGy4N8oj5cd25TBWxoYrVanFtDTABpj7xv8
	Y+PjnMVO2MXfNNzDPU5wDPCYi7e/uCEUklLpiKBQTjPtDX9BjEER9V6YPW5R0IV1S/Ms
	UbLV5t4pxm7rdYApM83WgwEZ2ORY4nAH8ND7NUkrbwkzqcP5pOwcX0kwcMove9/4PG27
	nUpg==
Received: by 10.180.100.2 with SMTP id eu2mr20588023wib.1.1332167818273;
	Mon, 19 Mar 2012 07:36:58 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o2sm41918677wiv.11.2012.03.19.07.36.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 07:36:57 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1332164974.9740.28.camel@ted>
Date: Mon, 19 Mar 2012 15:36:44 +0100
Message-Id: <09F47EC8-47F6-465D-AA6A-040836411B35@dominion.thruhere.net>
References: <cover.1331859046.git.shane.wang@intel.com>
	<F29B7771-8017-4CB4-AFCF-19CB857CAAD1@dominion.thruhere.net>
	<3AB6CE7F274E534CAFD089D127A8A1FC23AED2D9@SHSMSX102.ccr.corp.intel.com>
	<A4E92037-A984-4CCF-BDCF-E1020891494E@dominion.thruhere.net>
	<1332076702.5077.10.camel@ted> <1332164974.9740.28.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQldIWwGAaVCfSY6ZpZ3jmF0hWBrfxim4QX5nk3usFUY9XC5kAXhSWXLx5d8BjO9n5hfqOkz
Subject: Re: Patch Merging Status
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
X-List-Received-Date: Mon, 19 Mar 2012 14:45:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 mrt. 2012, om 14:49 heeft Richard Purdie het volgende geschreven:

> I'm faced with a bit of a dilemma with the number of queued changes. =
I'm
> not very happy with as many updates right on the release freeze =
deadline
> and I know this is causing problems for downstream trees like meta-oe
> too.

Patches to fix bbappend related breakage have been submitted for review:

http://patches.openembedded.org/project/oe/list/?q=3Dmatch

> I believe the testing done has found the problematic changes in the
> branch (alsa-utils, xserver-xorg and automake for example) and that
> we're in a reasonable state to merge these and I appreciate the work
> Saul and others have done in stabilising and testing the changes. I
> appreciate meta-oe needs more time to test and integrate these though.

Thanks!

>=20
> One idea would be to feed these in though smaller sets of updates but
> since they've been tested as a unit, I don't really want to do this
> since I don't have a good feel for any interdependencies.


I'd advice people to stop sending huge patchset and break them up into =
manageable pullrequests and leave the combining to Sau!. Another option =
is to plainly refuse to even consider such huge patchsets so close to =
the freeze date.

Speaking of freeze dates, when is the schedule for oe-core going to be =
announced? I know there's some poky/yocto schedule somewhere, but I'm =
not into that, I just use oe-core.

regards,

Koen=


