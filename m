Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1U3mtW-0006sj-UI
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 13:17:31 +0100
Received: by mail-ee0-f54.google.com with SMTP id c41so2046873eek.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 04:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=z4+5GYg7RJ9ozjOrdTdL95uyVAyCoVpZ8rJJ2QnvArc=;
	b=CIIRlTi+wvFodmBbcVMvERnzZ/n0CAz78uEQWKgIM0oiSwm1cMlrAWAyTL7wJUjSQe
	uBV0o4ocXEn7GaOCEopgEQzBvp2Kws/NUktcfeklqPXU+VNsBxqrtroruSpU2AgdFnbn
	13y/ANazayPxIFUkJZarloAxJI2DVwZk1CnRjiICzxn4gMC9wgXKiDaUp/9ESCQ/NPK7
	N/XY9KPVjnOhOZau2Qd78TXEGdjtfRTfstCiyKL7LOfQ5F1AUEK2j0c55lfQcKr8SKez
	qI1MNYyUs2/6DJMNLYNvwtQe2nyZvCF2UIRf2A2V9Fkaim2LtXkTTp7rIN8SsA12T68k
	pJ1Q==
X-Received: by 10.14.194.195 with SMTP id m43mr15225715een.44.1360324897129;
	Fri, 08 Feb 2013 04:01:37 -0800 (PST)
Received: from ?IPv6:2001:610:612::211c:688e:16f1:c3cd?
	([2001:610:612:0:211c:688e:16f1:c3cd])
	by mx.google.com with ESMTPS id 3sm46961687eej.6.2013.02.08.04.01.34
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 04:01:35 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0Lbd9uXC9B+VTO0SgbBSksqT+5XKiUUC62YgKadmRxqqdA@mail.gmail.com>
Date: Fri, 8 Feb 2013 13:01:33 +0100
Message-Id: <932EDA66-92E1-4B0A-A9CC-7037DACE0372@dominion.thruhere.net>
References: <1360318544-11013-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0Lbd9uXC9B+VTO0SgbBSksqT+5XKiUUC62YgKadmRxqqdA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQnMnkEdyQJvzLkFX6yzmm/2pxvw8cc1HGVn6y4npujNuz7clgCyI/PSwJ6ySpb9KWFP+qDq
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-danny][PATCH] xf86-video-modesetting: new recipe for gma500
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
X-List-Received-Date: Fri, 08 Feb 2013 12:17:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 feb. 2013, om 12:57 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 8 February 2013 10:15, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>=20
>> I am trying to use gma500 driver for the noemgd BSPs. The current =
best
>> xf86 driver for it is modesetting. This recipe provides that
>> driver.
>=20
> Big changes like this are generally avoided, but this is a pretty
> important recipe. Merged into danny-next, should being doing a full
> test build tonight.

The GMA500 comment is very misleading, this is just a recipe for =
yet-another-ddx that only gets installed when you ask for it :) What the =
commit forgets to mention is that it's a ddx for any DRM based kernel =
display driver, I need it for beagleboard, beaglebone which don't use =
gma500 and also for fri2 which does use gma500.

regards,

Koen=


