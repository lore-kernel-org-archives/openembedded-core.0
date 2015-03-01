Return-Path: <lpapp@archlinux.us>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1A0EA7372E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2015 13:48:09 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id hq11so322261vcb.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2015 05:48:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=VSbfcN0alzdgSYW8xcgO7o504GOY5998sBE95MY4lNs=;
	b=CidazMDrqMFWBvVIniWRe+p+rbv/vGHWXad+hl0xjM60F2lvlJCrqIYcYXG8M9rzyB
	5MxDrwOBJllOILXLqUIfYdVrE+sI1uCPy3sqO7MqffjVaidcWXs8uEQYQJiKUpWip44R
	T4bul6RDFSN0tkdDay28Tl4G1MQnOu+px/fX/q72it6Fa6vub+x0FTSr/Q9DAI/SOl/V
	cUldt1TUfjklw0eA3oEP9vX+WnMZTrpjcyIk9lrjxMenEfk04r2XBUoB9XNtvHRW/Vqr
	KjaQSpCJrztiK3bKceN6Hw+YgHrJzHGf1y3rNa4GOyawumLyl8XGS644u1HQrVUDeDBZ
	w4yA==
X-Gm-Message-State: ALoCoQm39gpqd+lfCDUZkPWYtrouixzzbew7DiEKApzqUAHnYDyGVmiVBkfTtd9Z2VRmhieO+vMi
MIME-Version: 1.0
X-Received: by 10.53.6.35 with SMTP id cr3mr20990902vdd.17.1425217691185; Sun,
	01 Mar 2015 05:48:11 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.52.38.225 with HTTP; Sun, 1 Mar 2015 05:48:11 -0800 (PST)
In-Reply-To: <CAOMwXhOtSitBvR=v0AVJbcK8HBsfxsU-4wrEkBd=tjX-UhEX1g@mail.gmail.com>
References: <CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
	<CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
	<CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
	<CAP9ODKqTi=PGUHOsRSkHJrS0nsxEzoYyFbQffm4UU5iedLJNWA@mail.gmail.com>
	<CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
	<CAJTo0LZgVSK-7tWuO0ByNZqwtwseY-fgLp2Dquu6Nj-4j9AVsw@mail.gmail.com>
	<B0C68756-9FE4-459F-9DFE-753106847A87@dominion.thruhere.net>
	<CAOMwXhMDOma1N73M5n64G2T-FaH+Zevo2r8baenFsX9EZiFa5Q@mail.gmail.com>
	<CAJTo0LYuTsUkt8E0oTn0CGG+JFQhM67eCAHBRiX8W_1Fw67ErQ@mail.gmail.com>
	<CAOMwXhNqH76QKt9hsqpeOeRTBjKUix4e0GCy8PZVkrjCdm+OAA@mail.gmail.com>
	<20140321143939.GI3726@jama>
	<CAOMwXhO3q3ZWmJ3mc==FV=S3t9fa7of9+449KGjQt4v=FQ=RRA@mail.gmail.com>
	<CAOMwXhOtSitBvR=v0AVJbcK8HBsfxsU-4wrEkBd=tjX-UhEX1g@mail.gmail.com>
Date: Sun, 1 Mar 2015 13:48:11 +0000
X-Google-Sender-Auth: SDwkIYoXEUq9Th5d-w899jFG60w
Message-ID: <CAOMwXhMFK_cjS0i07rXUnoCy+2Mq-E7zzaZeHKk-vy3k6DMxEA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Sun, 01 Mar 2015 13:48:11 -0000
Content-Type: text/plain; charset=UTF-8

I finally decided to get this patch another go, even though still no
busybox daemon has LSB headers, but I would need to ask for some prime
example of LSB headers that I can start off with. Could anyone please
provide me a good example for that from the Yocto project? Thanks.

On Fri, Jul 25, 2014 at 2:32 PM, Laszlo Papp <lpapp@kde.org> wrote:
> Any reason why this feature has never got in? It was submitted more than
> five months ago, and it would have added some feature to the system even if
> not _everything_ right from the beginning?
>
>
> On Sat, Mar 22, 2014 at 2:03 PM, Laszlo Papp <lpapp@kde.org> wrote:
>>
>> On Fri, Mar 21, 2014 at 2:39 PM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> > On Fri, Mar 21, 2014 at 01:59:15PM +0000, Laszlo Papp wrote:
>> >> On Thu, Mar 20, 2014 at 7:59 PM, Burton, Ross <ross.burton@intel.com>
>> >> wrote:
>> >> > On 20 March 2014 19:01, Laszlo Papp <lpapp@kde.org> wrote:
>> >> >> This init script is adding support for sysv and no more. This is
>> >> >> also
>> >> >> indicated in the first line of the commit message. I am sorry, but I
>> >> >> will not test it systemd and with other systems
>> >> >
>> >> > You're not being asked to test with systemd.  You're being asked to
>> >> > add LSB-standard sysvinit-specific headers to a sysvinit script.
>> >>
>> >> In my understanding, people were referring to two issues:
>> >>
>> >> 1) not working with systemd and what not compat modes. This is not
>> >> something I will test any soon.
>> >
>> > Other people already know it's causing the issues without LSB headers,
>> > so if you just add them, you don't need to test it with systemd, other
>> > people who care about systemd will do that for you or at least be OK
>> > with adding this script, because it will have LSB headers (so it should
>> > work fine in systemd world).
>>
>> If someone is really interested in systemd, et al, unlike me at this
>> point, I guess it is not a big deal to get an LSB header from someone
>> to get it integrated into my change?
>>
>> If no one cares about that, then why bother? So, if someone sends this
>> to me I will integrate it, otherwise there is no point since that
>> means no one cares.
>>
>> But then again, this should not still block the change as it can be
>> added incrementally. I am not sure if it is a good idea to block a
>> feature because it does not provide another feature, too.
>
>

