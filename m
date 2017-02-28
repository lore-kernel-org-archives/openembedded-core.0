Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id DAB7772F8F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 10:04:21 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id l7so6135046ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 02:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=nTNxhFKzfbNT0JXZz5Oa5YO8iIfhf+jjRwfaieZKpkM=;
	b=v0tgLdhxTJnrp+69uCIrHJy6e6KJ/9urUHYQBDdabkWB4ekezJa8FvZWwhBnByoKjS
	YL9wmtLe/bVgyYrkbqkPEpCDgn7IFcmJ3dHAwyWJcFgAFmsNSqh/TIw7SgPuPw4TzVBs
	tFk++/UXjLS5x3JK9TB3a4y8k9TdMC4YCj+saTXeRI+XUW6EQd5LxxxR5RDIH5Z7OsWN
	fQgCJZQGqtwbyYr8Mq/jrr8JgZMzPIxOeyN/WCOVhe7Qg78mUeK8t9Cwxoss6Mdh1WyI
	K7dMbdTHBYpiF2iz7sNblQCcVIuJgutfEzaktnUJelxkM2fPopt1Dq6C6j2VwR5OtoKT
	Pvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=nTNxhFKzfbNT0JXZz5Oa5YO8iIfhf+jjRwfaieZKpkM=;
	b=IuNqLsZ7vSdxPATJ9kgwrDY1KWkbu2JIC3S+iCVFC0tyoCMb3jvpHvKNVJNfqgrFgX
	4dZ7WCpqzUrvf5NAQvl8Hy3szw9LDNmsig9dvG7UIo5z99dwG40DW8t0D4VcSA6Tm63b
	hl1uxBQMz/ECdhaSdmDVBurDXbWV1zdh0HI02ZkJejHBcUWB1x8Oxu/a22EhZC4a4Yh+
	MsZnLkecfj5O9+uEmmDl+Z2JciVllRIK0jEgpt6umAyRLdL92pORaNjCnVrVwKruHD3h
	F4suNiExs2GAoWcsT/6Rs+Gc/FxtnCTsRZ+Bs1wWwoNLGGvSymPNfz6472eXUnnZGnwg
	gMpA==
X-Gm-Message-State: AMke39md5DSswklKwPM24x/zA2nV1PxaLJIsrjrGUYtt8k3IdJwnuhly2RXpehDqVULFybOp
X-Received: by 10.107.20.148 with SMTP id 142mr1582795iou.12.1488276262741;
	Tue, 28 Feb 2017 02:04:22 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D654.dip0.t-ipconnect.de. [93.232.214.84])
	by smtp.gmail.com with ESMTPSA id u65sm633876ioe.47.2017.02.28.02.04.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Feb 2017 02:04:21 -0800 (PST)
Message-ID: <1488276258.7785.26.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 28 Feb 2017 11:04:18 +0100
In-Reply-To: <alpine.LFD.2.20.1702270559150.22784@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702270559150.22784@uk63952.mitel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: style suggestions for that whole "_append" and leading space thing
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
X-List-Received-Date: Tue, 28 Feb 2017 10:04:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-02-27 at 06:07 -0500, Robert P. J. Day wrote:
>   getting pedantic (as i am wont to do), occasionally i run across
> things like this, from meta/conf/distro/include/no-static-libs.inc:
> 
>   EXTRA_OECONF_append = "${DISABLE_STATIC}"
> 
> which, at first glance, simply seems wrong given the lack of a leading
> space, until one looks higher up in that same file to read:
> 
>   DISABLE_STATIC = " --disable-static"
> 
> where one finds the leading space as part of the variable itself. i
> find this potentially *really* confusing; consistent style suggests
> variables should be assigned their values without regard as to how
> they might be used later. subsequent references or usages of those
> variables should be responsible for making sure they're included
> properly, no?

In principle you are right, but probably it was done this way here to
avoid adding a space to EXTRA_OECONF in those cases where DISABLE_STATIC
is overridden to be empty. Consider DISABLE_STATIC an implementation
detail and then it becomes okay to set it as needed by the
implementation.

>   and the last line in that same file also suggests potential misuse:
> 
>   EXTRA_OECMAKE_append_pn-libical = "-DSHARED_ONLY=True"

Yes, that's just plain wrong and just happens to work by accident.

> p.s. would the same logic hold with lines like this?
> 
> meta/conf/machine/include/tune-ppce6500.inc:
> 
>   MACHINE_FEATURES_BACKFILL_CONSIDERED_append =
>      "${@bb.utils.contains('TUNE_FEATURES', 'e6500', ' qemu-usermode', '', d)}"
> 
> would it not be clearer if one were to write:
> 
>   MACHINE_FEATURES_BACKFILL_CONSIDERED_append =
>      " ${@bb.utils.contains('TUNE_FEATURES', 'e6500', 'qemu-usermode', '', d)}"

The existing line is better because it avoids adding a space when
nothing needs to be added.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




