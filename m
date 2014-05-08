Return-Path: <ticotimo@gmail.com>
X-Greylist: delayed 362 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 May 2014 16:10:53 UTC
Received: from mail-pa0-f49.google.com (unknown [209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1368660702;
	Thu,  8 May 2014 16:10:53 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lj1so3043042pab.8
	for <multiple recipients>; Thu, 08 May 2014 09:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:from:subject:date:to;
	bh=LDOdKCkv6ZjpjVcR6ZUJVMe7pui7wE9hnQLr7Wrc8jc=;
	b=rDCyQleG0AdBlrzCQkbnwdpJ1Epmlz35WGpBVNYRdgkp0Vxnz/bOVaU2CyuAuVqcU5
	NLPvW+Ftr1FdnODvOXZQCZkGY1RXoMFrrsOOVRPrAum/elNE2yL9Yy8ojfh3NJCAYmob
	Ho+SS2BczTHXJBCamffm+P7Zz/BBKPlAdn+fY8B2jjn8jvuH87mh3kE6aZGsE5VvIkCl
	miKcQSjfYA72Rx1oqCT3rvJTrC1zPbAk9NvTkNg3Lk96xOJnXSIpa4WxJW/mMA3rR2r8
	IyyhCRHikVDW8D0TO+ZlvB6qnl5Rw7KhpTJQcdK1KEzgZdv6aCe3jQgKb0HcGLUSwV44
	bylQ==
X-Received: by 10.66.172.167 with SMTP id bd7mr2935714pac.72.1399565092377;
	Thu, 08 May 2014 09:04:52 -0700 (PDT)
Received: from [30.38.35.7] (m910436d0.tmodns.net. [208.54.4.145])
	by mx.google.com with ESMTPSA id lr3sm6315605pab.4.2014.05.08.09.04.50
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 May 2014 09:04:50 -0700 (PDT)
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
	<4880759.hcBN3hRDv1@peggleto-mobl5.ger.corp.intel.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <4880759.hcBN3hRDv1@peggleto-mobl5.ger.corp.intel.com>
Message-Id: <0906179D-0519-4C3E-B269-ABC8B1857021@gmail.com>
X-Mailer: iPhone Mail (11D201)
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 8 May 2014 09:04:45 -0700
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: GStreamer 0.10's future
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 May 2014 16:10:56 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On May 8, 2014, at 8:07 AM, Paul Eggleton <paul.eggleton@linux.intel.com> w=
rote:
>=20
>> On Thursday 08 May 2014 15:48:40 Burton, Ross wrote:
>> Hi all,
>>=20
>> Sorry for the cross-post but I want this to have a wide audience.
>>=20
>> For the 1.7 release I want to move GStreamer 0.10 from oe-core into
>> meta-multimedia, and ensure everything in oe-core has ported to
>> GStreamer 1.x.  GStreamer 0.10 is considered dead upstream and is
>> unmaintained so we don't need to be shipping both versions anymore.
>>=20
>> Everyone in agreement?  Should I expect any hate mail over this?
>=20
> +1
>=20
+1 as well
> The next question is does that mean for the "old" libav (which gst-ffmpeg=20=

> depends upon), do we move that as well or drop it?

If xbmc is ever going to work, it will need to be updated to build ffmpeg in=
ternally. Unless we can get upstream to improve things.

> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

