Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sg5bR-0006Kf-IX
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 04:52:37 +0200
Received: by yenl13 with SMTP id l13so2965322yen.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2012 19:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=rmWoxClq+u56k3HIRD3bsbFtWzK7LL+sPK0c4BKSQyg=;
	b=dZe7QSmvu5gvEGgvEq78kVNLjSQPp+THtnQ51MhxkKLgIRwOLMimcWuumA4O1F7ECS
	7MjYhq1aRVtDEd8TVyjW1Jnr8KrztqpbVYdmIn34v1yp9pasBsMr2BcQLvERw8tEdUd3
	nCi1qRRlZp6rR49ruli0xt+UV2uaISXEcT/ffx5M4YqJSj1SvkOmr5Cmth/Y4m3AF28y
	5eq72Kbo0Wt4wu8obo45f44tuNzgvaB28huXhyYE4JlmPoQkzLIPFPTdcScR4cCqphS3
	14aZd4JGOV7c67WMOnS5rLUwueFb+OogiMo6l3aiR15B7YY2sdVv9Di6mofYPY+5h6/g
	HuNQ==
Received: by 10.236.75.6 with SMTP id y6mr13396452yhd.24.1339900916644;
	Sat, 16 Jun 2012 19:41:56 -0700 (PDT)
Received: from [172.20.100.155] (rrcs-97-79-164-202.sw.biz.rr.com.
	[97.79.164.202])
	by mx.google.com with ESMTPS id l49sm48635328yhj.8.2012.06.16.19.41.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Jun 2012 19:41:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FDCFEFB.3090004@linux.intel.com>
Date: Sat, 16 Jun 2012 21:41:53 -0500
Message-Id: <5351B318-5055-410D-91E9-7A0460FC451D@dominion.thruhere.net>
References: <cover.1339799869.git.dvhart@linux.intel.com>
	<5f472764f7cea2d386b7ee572870fc03769868fc.1339799869.git.dvhart@linux.intel.com>
	<4FDBBD8D.1050201@linux.intel.com>
	<1339863500.3339.150.camel@x121e.pbcl.net>
	<4FDCB690.8090004@linux.intel.com>
	<CAMKF1soXK8fTW_LJZy2a0Mr1K1Aiwv-OA1rj_d_DGF8vHga5cg@mail.gmail.com>
	<4FDCFEFB.3090004@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlwbdesxzD2qogNBKiehKtxbmapYVA5As6IDYU4hUUowobWDXY9CsbtpZMRnkeLGOtSTDHq
Subject: Re: [PATCH 1/1] busybox: Include setsid and cttyhack in defconfig
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
X-List-Received-Date: Sun, 17 Jun 2012 02:52:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 jun. 2012, om 16:47 heeft Darren Hart het volgende geschreven:

>=20
>=20
> On 06/16/2012 10:47 AM, Khem Raj wrote:
>> On Sat, Jun 16, 2012 at 9:38 AM, Darren Hart <dvhart@linux.intel.com> =
wrote:
>>>=20
>>>=20
>>> On 06/16/2012 09:18 AM, Phil Blundell wrote:
>>>> On Fri, 2012-06-15 at 15:56 -0700, Darren Hart wrote:
>>>>> So the delta for including SETSID and CTTYHACK is 2560 bytes.
>>>>=20
>>>> Personally I am still not in favour of adding this to the default
>>>> configuration.  I appreciate that it's "only" 2.5k in this case, =
but
>>>> every time we make a change like this the binary gets a little bit
>>>> bigger and, over time, it does add up.  This sort of gradual bloat =
is
>>>> quite insidious and difficult to combat after the fact.
>>>>=20
>>>> So, I continue to think that poky-tiny should just provide its own
>>>> busybox configuration and turn on the options that it wants just =
like
>>>> other DISTROs do.  No doubt there are some things currently =
included in
>>>> the oe-core defaults that poky-tiny doesn't need, so you would =
probably
>>>> get a smaller binary that way as well.
>>=20
>> in retrospect I agree with Phil on gradual bloat. busybox and other
>> kconfig based
>> packages will always have fine tunings that we can never say one size
>> fits all unless
>> you enable everything and I think the purpose of using kconfig in
>> those packages is to provide this fine level of configuration
>>=20
>>>=20
>>> You are correct that poky-tiny would benefit from a smaller config. =
My
>>> original intent was to update the busybox recipe to use the new
>>> merge-config.sh that we pushed to the upstream Linux kernel (which
>>> should work with busybox as it uses the same config mechanism). This
>>> would allow us to maintain a base busybox config with a several =
config
>>> fragments that can be easily added via DISTRO_FEATURES rather than =
the
>>> complicated hack that is in busybox now for handling =
DISTRO_FEATURES. I
>>> prefer this approach as it reduces (if not eliminates) the need for =
the
>>> proliferation of busybox.bbappend files.
>>>=20
>>=20
>> . using merge-config.sh will probably make things better but until
>> then I don't think its a bad thing to have bbappends in current
>> scenario
>>=20
>>> However, this is a larger project and my immediate goal is to get
>>> poky-tiny into better shape in terms of the initial experience. This =
is
>>> why I originally implemented it as a "tiny" DISTRO_FEATURE as that =
would
>>> migrate naturally to the config fragment approach. You and others
>>> objected to that approach, and I do understand not wanting to =
complicate
>>> the DISTRO_FEATURE logic further.
>>>=20
>>> With the above goal in mind, can you accept either of my proposed
>>> patches as an interim solution? Either as an added tiny =
DISTRO_FEATURE
>>> or as a simple addition to the defconfig? I do believe these two
>>> features are useful beyond poky-tiny.
>>=20
>> I think best approach here is to have the defconfig of own in
>> poky-tiny layer. It will
>> be a contained change.
>=20
> Note that poky-tiny is not currently in its own layer, but is included
> in the meta-intel layer. I will look into ways to accomplish this
> without adding to the core busybox config and not having to break out
> poky-tiny into its own layer.

What is it with you intel folks (bless their hearts) wanting to combine =
BSP and distro? baerion, guacamayo and poky-tiny all force you to =
include the distro stuff if you want any of their recipes. I don't want =
to have all the hostnames on my boards changed to 'baerion' when I build =
mediatomb!



