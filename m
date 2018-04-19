Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1FFF66011F;
	Thu, 19 Apr 2018 19:02:17 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id j11so3071163pff.10;
	Thu, 19 Apr 2018 12:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=pKjlyt4f8w7oaj5mbA7l5oGnCYo9M9zJfjGFZmY1bQk=;
	b=LvKLGiPhVc2J5xx+7I9ZInHN5wSfM4JaecAtgzZyVAX534cit78RKc/JNWFtSq1ioB
	e+hF3YqKmqMbhEuc2x2d5FfAxtpN88nZQhiCfK782f756vBgjC4xqBde0IrHRdfuQ+tN
	dVPEg5lZs5jjAC9H+Q7e8prj/8d69mv2Ow1hpv/O8GHPoZndrU8ygVp+go4Bwvu0Sq4L
	kIUfj1+HKSLeXBldrGhYKe4HGp6u8kkD0DR9XH7TjbEs87rN0gkWwaxD3vc/NN4WmLNO
	RoWXnBeQb4frYEOva7QquWf8h6MH6rx5BVmsiQE+9n3Odd1oND9xGnzQR3okTUlcN2xe
	Iz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=pKjlyt4f8w7oaj5mbA7l5oGnCYo9M9zJfjGFZmY1bQk=;
	b=TfqV6nnlea4kWdaX11vB+6G38FvUhiJrsbImaj9dSdHzZ4d56quTqv7Z67Ym9Bbv3Z
	t9sYkGS4frSwIrYclUcmbboc2MYML35F62c3oE8X8EdpUpo5RfGCEqOZVDjfr4N7zU2y
	1Dh7RLcN/hZJXx8dzK//x6LmqyEEoPMudWp9K7T+HChtYTOlKRxr/puwsyLYwGq4m53K
	ToNio5iJNkMEz+YSgH2pECKiIsMOmVitmPkr9B7iWRDmJg4b/5pHsJ9LEKoKWqSmspPw
	7k16Y+45/JzWJmrC/ZKlP/AUPj1zF7/UX/YHl8V3BpqtfvaBVJ3UymbBHymMe3lXi8S+
	w9Vw==
X-Gm-Message-State: ALQs6tAHzZAHZ+ZFO6CDzHM8z9UZQCZNR9jGzr4u4N/ZfzsOyumfcgjB
	lV0mtsg6qElHHBYSOs7Kv7w=
X-Google-Smtp-Source: AIpwx4/CZW2icLZcSBm//0x8sJP9DzyBO/eiQ4CK/800AjM9pg6LZi31Ar57SjJ48zSihZ412b8Jcw==
X-Received: by 10.98.87.7 with SMTP id l7mr6854252pfb.148.1524164538815;
	Thu, 19 Apr 2018 12:02:18 -0700 (PDT)
Received: from [10.43.100.234] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	l192sm5297932pga.1.2018.04.19.12.02.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Apr 2018 12:02:17 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1524154643.18865.113.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <fe0e3e9d-ef00-2c9d-288f-992cfa6c626d@gmail.com>
Date: Thu, 19 Apr 2018 12:02:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1524154643.18865.113.camel@linuxfoundation.org>
Cc: yocto <yocto@yoctoproject.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	"Cetola, Stephano" <stephano.cetola@intel.com>
Subject: Re: [Openembedded-architecture] 2.6 planning proposals and meeting
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
X-List-Received-Date: Thu, 19 Apr 2018 19:02:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 04/19/2018 09:17 AM, Richard Purdie wrote:
> [Widely cross posted but please reply to openembedded-core only for
> want of picking somewhere to discuss this]
>
> The next big question facing us is what would we like to do in 2.6?
> What can we do with the resources we have?
>
> I'm proposing to hijack the next monthly Yocto Project technical
> call[1] and dedicate it to 2.6 planning. I'm going to detail some high
> level 'big' ideas blow in this email from a feature development
> perspective. Anyone is welcome to join the call (or reply) and I'm
> happy to answer questions about the ideas below and hear suggestions of=

> others.
>
> [1]=C2=A0https://www.yoctoproject.org/monthly-technical-call/
>
> Ultimately, ideas will be turned into bugzilla enhancement entries. It
> will then be a case of seeing who is willing to step up and help work
> on any given feature. We're using the "2.99" target milestone as our
> holding area for potential ideas, only moving to 2.6 when we have a
> solid commitment for someone to do something.
>
> If nobody steps up for something, chances are it will just get pushed
> out as a "Future" idea. In the past, Intel in particular has stepped up=

> and done a lot of feature work but for various reasons, this is not
> likely to happen going forward as they focus more in Intel specific
> work.
>
> At the end of the day, we'll process the changes that make it onto the
> mailing list by the freeze deadlines for the milestones. If its not
> there, it won't be in the release and 2.6 will be what people put into
> it.
>
> List of high level 'big' ideas:
>
> - Reference binary package feed (in particular to test upgrade paths)
> -
> Secure/trusted boot support in OE-Core
> - Improved security tools (e.g.
> CVE database scanning)
I have ideas on the CVE scanning stuff.
> - Provide sstate feed out the box for reference
> -
> Improve binary output testing (esp. reproducibility, upgrade paths)
> -
> Widen the scope of our automated testing infrastructure (include
> =C2=A0 more
> layers)
> - Roll processes and tooling into the wider ecosystem (e.g.
> meta-
> =C2=A0 openembedded)
> - Ability to make builds more efficient by output
> comparison and
> =C2=A0 sstate prebuilt reuse in many more cases. Maybe sstate
> equivalence =C2=A0=C2=A0
> =C2=A0 server
> - Completion of migration to new autobuilder
> codebase and=C2=A0
> =C2=A0 infrastructure
Count me in on the new autobuilder codebase

> - Out of box experience/layer setup
> tooling
> - Improved binary reproducibility
>
> Features aren't all we need to plan for. There are other areas that
> need work/help:
>
> Many other smaller features
>
> =C2=A0 There are too many for me to list/call out individually but sear=
ch=C2=A0
> =C2=A0 bugzilla for 2.99 Medium+ items. A good example is adding=C2=A0
> =C2=A0 support for inter-multiconfig dependencies which is a small=C2=A0=

> =C2=A0 remaining multiconfig item which would make a big difference to=C2=
=A0
> =C2=A0 certain workflows.
>
> =C2=A0 Another harder example is parallelisation of oe-selftest. Its=C2=
=A0
> =C2=A0 currently the thing which ends up taking the longest in most of =
our=C2=A0
> =C2=A0 builds, improving its performance would reduce overall testing t=
imes.
>
> OE-Core Recipe maintenance: 840 recipes in OE-Core
> =C2=A0=C2=A0
> =C2=A0 - General recipe
> updates
> =C2=A0 - Security fixes
> =C2=A0 - Recipe specific bugs/regressions
> =C2=A0 - Adapt
> to new technologies/upstream changes
>
> General patch review
>
> =C2=A0 ~5000 commits/year which need review, testing, identifying=C2=A0=

> =C2=A0 regressions, merging
>
> General regressions
>
> =C2=A0 Regressions tests we have are good but don't catch every race=C2=
=A0
> =C2=A0 condition or intermittent problem. We end up having to track
> =C2=A0 down several, particularly runtime testing instability
>
> Bug fixing user issues
>
> =C2=A0 Users find new use cases and workflows and identify bugs which t=
hen=C2=A0
> =C2=A0 need to be addressed
>
> =C2=A0 For example we can't default to mem-res bitbake as there are kno=
wn=C2=A0
> =C2=A0
> issues.
>
> Maintain the tools
>
> =C2=A0 We directly maintain tools like bitbake, pseudo, devtool, recipe=
tool
> =C2=A0 opkg, yocto-autobuilder, patchwork+patchtest, wic
>
> Stable release maintenance
>
> =C2=A0 People all want stable releases and security fixes but someone h=
as=C2=A0
> =C2=A0 to make these happen.
I am fine continuing maintaining the stable branchs.
- Armin
>
>
> Help in any and all of these areas is much appreciated. Also keep in
> mind the things above are just to get people thinking. If there are
> changes you'd like to see, now is your chance to proposal and work on
> them to make them a reality.
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architectur=
e



