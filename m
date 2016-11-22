Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id A908A71A5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 21:32:08 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id g23so47629191wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 13:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=U9y9zxolnlKuXQoo14G1z4wXuJ1k1fa4PqwejVCPgCQ=;
	b=WrX5IZrE3BTCcUk8t3oGQWwjiI24MXtZIDTRAwcPhm1MkqUPf/SAXIkATT5msuBbik
	0dIaIzA6j5XhP6y7oB4JM4UbkIIZ5+gCi9mVnlyJ+J4ge7oc8MDQbe1zI0gPze5Ff59v
	DacJqHA67WT8XPD4+nY69eJTxvnuyjqoozd8hdwf0jimRqg3i0z1POyFGM/3bxP/1zTk
	61Z/7+2+VuFyVx7i/BpG945CF72JJ2vC1zZu32zhk89EDNoLeDTDVPwUbUZu636yrIF/
	Gmru07Ml63DAvW6y9q/EtkctoTTJRDTanm2IufE/imB12OqWFDN3aZWwWR5P6AXVssiK
	/Lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=U9y9zxolnlKuXQoo14G1z4wXuJ1k1fa4PqwejVCPgCQ=;
	b=QU6/Um0oe6qWZdiHmOVwTIoazpl/CuYMdYFsz4/gQgCtZyvS+KQapZ09OPCASk7lzO
	YzS/bTh2oNBdWCzEQo6Xf88PJ/PBmJFtsifv/EC4SFC9C48CTCDbZvpn2WVxjuceLwQP
	dFa9WVUlnXJs/QbMDJMisufm/kBiB5lyou0193We2nIrD2OV9FXXJH49x318T6K7llTB
	6khxR8O9CO+C7pVzhr83P4SfPk5/f+cuOLhxY8HwmD0SM+k7MVfj2rebqKB/gv0+Cy/C
	KmVC1x1XoEv8nJx/NOTwPf/tjUy2lKCNTEqm4FvZhV+yYrWZVKX1cBdrW9Xsympqz4AZ
	m14Q==
X-Gm-Message-State: AKaTC01y+qdYOoaXDEHdqQoqdfsEA26WYahGhfnaEoYWFwmoYZkjKrTB/khTmX81hWNoxcHcOI2F3isXsXX9zw==
X-Received: by 10.28.104.213 with SMTP id d204mr4133182wmc.101.1479850329294; 
	Tue, 22 Nov 2016 13:32:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Tue, 22 Nov 2016 13:31:48 -0800 (PST)
In-Reply-To: <CAD4b0_JOLmdGF+ufTkn2V_ANiLUkxZHzWqvACT4ptUEtKGZUnQ@mail.gmail.com>
References: <cover.1479203195.git.maciej.borzecki@rndity.com>
	<eb38d44adc6f103f898ee7a8859d7ef046df4402.1479203195.git.maciej.borzecki@rndity.com>
	<CAJTo0LaJZkpg_z6uSz3oMAH-bE7x6-hth94okNG+2GzsGy913w@mail.gmail.com>
	<CAD4b0_JOLmdGF+ufTkn2V_ANiLUkxZHzWqvACT4ptUEtKGZUnQ@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Tue, 22 Nov 2016 22:31:48 +0100
Message-ID: <CAD4b0_KMvcUfDsS7PfehbtkzCU7HwzENLKScgSpJ=Jyvc7NVaQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 09/11] wic: selftest: add tests for --fixed-size partition flags
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
X-List-Received-Date: Tue, 22 Nov 2016 21:32:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2016 at 4:02 PM, Maciej Borz=C4=99cki
<maciej.borzecki@rndity.com> wrote:
> On Tue, Nov 22, 2016 at 3:47 PM, Burton, Ross <ross.burton@intel.com> wro=
te:
>>
>> On 15 November 2016 at 09:52, Maciej Borzecki <maciej.borzecki@rndity.co=
m>
>> wrote:
>>>
>>> wic has a new flag for setting a fixed parition size --fixed-size. Add
>>> tests that verify if partition is indeed sized properly and that errors
>>> are signaled when there is not enough space to fit partition data.
>>
>>
>> Just failed on the AB:
>>
>> FAIL: test_fixed_size (oeqa.selftest.wic.Wic)
>> ----------------------------------------------------------------------
>> Traceback (most recent call last):
>>   File
>> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/buil=
d/meta/lib/oeqa/selftest/wic.py",
>> line 418, in test_fixed_size
>>     self.assertEqual(0, res.status)
>> AssertionError: 0 !=3D 127
>>
>> Might be useful to print res.output in the failure. :)
>>
>
> A bit weird. The test failed on this:
>
>         # verify partition size with wic
>         res =3D runCmd("parted -m %s unit mib p 2>/dev/null" % wicimg,
> ignore_status=3DTrue)
>         self.assertEqual(0, res.status)
>
> So the image is there. It was listed by glob(), which is a directly
> before runing parted. Also wic has built it (because the test would have
> failed even earlier). However, when parted gets there, it either fails
> to understand `unit mib p` (unlikely), or the disk image is just not
> there anymore.
>
> Is there a chance these tests are run in parallel?
>

Nevermind. I have incorrectly assumed that runCmd() sets up PATH in a
way that enables running *-native tools. However, the tests ended up
host parted binary rather than the one built by parted-native. Worked
fine on my Fedora based build systems where parted is installed by
default.

I will post a v4 of the series (just the patches that are not in master
yet).

Cheers,
--=20
Maciej Borzecki
RnDity

