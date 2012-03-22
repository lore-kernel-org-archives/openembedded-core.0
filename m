Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAZjB-0002UK-U5
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 05:34:22 +0100
Received: by lagw12 with SMTP id w12so1368546lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 21:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=he563DEDxxTRmSsNl0OQN/w2RnK/g/Tzd30gMOigDfM=;
	b=O1hMJdrWBg3oN7FTcWbAM9wjd+Z8fEvsMOnWodROxF2CvAuwyAnPsmEG8zie0WwTVk
	mwepFruIWxIXVeEy78Y08eojCMjX6k7kPFc3xgtconbdOYt/t6R5Ni1DI4Tj0uOYMY3x
	tzzFIRFF67lQnplIyST4genzS941PEjrgMLiKw800KHq4fr7MwMi6h8NpOlN7qtOE5V9
	KZuUvV9Zer95k0sJWWXvZUnVus9XggC/04xP/EhYBAhJIxhT5uaaWpdnCOijOFQjNAhu
	F7pfcDjoI+nKZ7wqS2g4fP7V5Xv23gpb6IcjPhh/WTMv4jchItruXnlZnMsZSUrPPin+
	AUcg==
Received: by 10.152.127.136 with SMTP id ng8mr4694974lab.16.1332390327488;
	Wed, 21 Mar 2012 21:25:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Wed, 21 Mar 2012 21:24:56 -0700 (PDT)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0137B889@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
	<20120321185216.440a6353@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
	<20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
	<20120321203249.54411613@eb-e6520>
	<20120321194906.GC3659@jama.jama.net>
	<ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
	<20120321220253.00c4f254@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B5A8@ORSMSX106.amr.corp.intel.com>
	<20120321223521.36e49bba@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B66D@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sq7hcTKrzFBYgmUOTcdQw6sC1FG4jUhsfKauqeXLQMgsg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B889@ORSMSX106.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Mar 2012 21:24:56 -0700
Message-ID: <CAMKF1srP52bxqwkaqPZTQbRmhp_V+4-iJ7wTKeKWfC1z4W=fyw@mail.gmail.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Thu, 22 Mar 2012 04:34:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 6:58 PM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
> Actually we noticed that Eric=E2=80=99s working sdk gdb was getting linke=
d with the
> host libpython.so, And if it is linked with the sdk libpython.so then he =
is
> able to see same issue what I am seeing.
>
> So look like issue is in the generated libpython.so.
>
> And in failing case, somehow ldd is not reporting that sdk gdb is
> dynamically linked with libpython.so. That is also strange.
>

OK can you generate the gdb core and post it. I can debug whats causing it.

> Thanks,


