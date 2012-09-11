Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TBTHu-0002J2-G5
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:26:10 +0200
Received: by wgbdr1 with SMTP id dr1so498492wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 09:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Lg38XY723HJxOeScWSjGj3EmsyXPytFhEP7fZ9tWMME=;
	b=OpjpPuOEkZMB7XUsSLDTnT054ronx7oc1aeQCqnZxO6YXFCa5vnMJluuxSpYWv7hsE
	Q6ysE5oNM3wnmNcRlCAWBtQnKMWUIfPALnVZIISo+Si50KQzvy22KiXgHeKeantixR4L
	Wqn+deT7iNxkQZI/WnWgVgx1ZxyI83YFESUDQQoBZmv58psCzj4rAzPb18LlxzRlrhPw
	sReo55aiVNm1qK4Td6MQXy7VnOndmayGTXPKUWX0m5T0TBuftdBKm8qjNKALMtw7LrNd
	uRGf2Aya7bdUvtKRhinpfeP6EGbIx07lLJ/7dFTe4ttT7VsENqiIE7TSAPx7cxMf+GhK
	xyhg==
Received: by 10.217.4.139 with SMTP id u11mr9985479wes.190.1347380019570;
	Tue, 11 Sep 2012 09:13:39 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id hv8sm3514320wib.0.2012.09.11.09.13.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 09:13:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <504F5E0C.7040502@windriver.com>
Date: Tue, 11 Sep 2012 18:13:36 +0200
Message-Id: <A6372E3C-A8A4-4987-9C2B-D65FFBBCEF5C@dominion.thruhere.net>
References: <20120911130155.GC14077@jama.jama.net>
	<20120911134814.GF14077@jama.jama.net>
	<504F5E0C.7040502@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQnGPgelAAE6rTuwmi19qWdJhragMXyRp2sr7j4K9NeXYBxKc7lMGYmO09gb4kT2J7p/wOrt
Cc: openembedded-core@lists.openembedded.org
Subject: Re: ARM-tuning -- was qemuarm: should it really have TUNE_ARCH armv5te?
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
X-List-Received-Date: Tue, 11 Sep 2012 16:26:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 sep. 2012, om 17:51 heeft Mark Hatle <mark.hatle@windriver.com> =
het volgende geschreven:

> On 9/11/12 8:48 AM, Martin Jansa wrote:
>> On Tue, Sep 11, 2012 at 03:01:55PM +0200, Martin Jansa wrote:
>>> Hi,
>>>=20
>>> when building spitz and qemuarm (both produces packages in armv5te =
feed)
>>> resulting packages are tuned with -mtune=3Dxscale (when built for =
spitz)
>>> or -mtune=3Darm926ej-s (when built for qemuarm).
>=20
> I argued this when we original did the work for the tunings, and I =
lost....
>=20
>>> From
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1916#c5
>>> Firstly, if you go changing the tune parameters in a given machine, =
you are expected to use a different PACKAGE_ARCH. If you do that, you =
will get a different package feed for the different binaries, different =
WORKDIR and so on. This was always the way the package architectures was =
intended to work and nothing has changed there. Yes, you as the user =
changing various variables can create inconsistent package feeds. There =
are 101 ways you can do that, the simple answer is just don't. We're =
therefore unlikely to add MACHINE to DEPLOY_DIR or remove PACKAGE_ARCH, =
please just use it as its intended.
>=20
> That is certainly my expectation.  I'm not sure that the arm926ej-s =
can produce binaries that are -not- arm5te binaries -- as that seems to =
be the standard for what an armv5te is.  The xscale on the other hand is =
capable of having different tuning parameters and had a few additional =
instructions. =20

=46rom a gcc point of view both are the same ISA, but using xscale will =
take in account the absurdly long pipeline on that SoC.=


