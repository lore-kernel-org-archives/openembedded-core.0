Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0B0296080F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 11:08:44 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l124so5090889wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 04:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=Sy+GOPoEZYLfaxkcqVheIRJxFMeevHhHmRtuw0z3oeI=;
	b=XItUbOY0nkr2zcHWPCQaBlLq7mQyRArvJSXk/T3DSBBtB+g+c4FV60XBTGxh7mE72q
	TdidAH42xPoKd8C3ULvrCjY8Scb9lVbs0GnwGtxauOT1ovfu2+/eF8h+m9tQUZKpRyvZ
	KLqxxb5QJXMkbtbNuP2VwOrMbhiJK2qf0L12tqSOavlK7oqBwq6IEd1P+SgxTpTBH/C3
	2jh2HKQQvXeVyxHR5JoxoR1u1EhbnV8NF+o8YPm83NnOTtAfb3H210V4y/3z1C4P4bP5
	m5GjqIJbxtU89LLMNfOvoqMlCYK49Rvo3k6l/5Pj2NWYAf1LyCjxCI9N5qEgRYYFoN2B
	8rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=Sy+GOPoEZYLfaxkcqVheIRJxFMeevHhHmRtuw0z3oeI=;
	b=N5JlL2l764YkfQhUOV0h90t6NHKWiuxZH3XnlK9G1r3kW+/Asse3HEzMZXYb5mcFjU
	i7zqr4NfGQ+NrNUUjCSEg32ouvfiBdzm+aUaRE7b/A5X3Opw2VmeytVQWoEWb45430rb
	Zry7OZhnRTnj7sbiUXx70IAe+3T4NPw+T4CgatR0NSwv9dLq+B+/D1gMZkZzCl/GLmRz
	PIaHAAkTyhFYN8tcK87uz0zfHq+QwvUu/mo3iBjbpHlTdsROIwQ/eO/SzyQqUDLiTNSJ
	8GfARs26b6clR8++TrMTtrMG5TlAohUBDAIksHtBUxO8QW+oWWFZkmWryTgSctC7DFWD
	JWEw==
X-Gm-Message-State: AD7BkJI9Cil9u48lk0VryYueYu+ySnVPbcTXN5PPntr5NPKuskh6s6fpbxqsndYVBaVSnve7DJzliviRO3hL3Q==
MIME-Version: 1.0
X-Received: by 10.28.50.133 with SMTP id y127mr40596528wmy.4.1458299324515;
	Fri, 18 Mar 2016 04:08:44 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Fri, 18 Mar 2016 04:08:44 -0700 (PDT)
In-Reply-To: <1458248553.7615.34.camel@linuxfoundation.org>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
	<1458235169-9267-2-git-send-email-armccurdy@gmail.com>
	<CAJTo0LZ_9NTAMLo9eYGKYa+W4L_QQWQXrROog2Bwn89pbxmRng@mail.gmail.com>
	<CAJ86T=X=amcjcvmsUidKYTsUYHMO+LHEE5znv-t0Qv8KGZLyjA@mail.gmail.com>
	<1458248553.7615.34.camel@linuxfoundation.org>
Date: Fri, 18 Mar 2016 04:08:44 -0700
Message-ID: <CAJ86T=WpO9wAphNS==h6zzcg2oUZLa4tepVbAORT865VtX0YxQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] bitbake.conf: remove 'gobject-introspection-data' from DISTRO/MACHINE_FEATURES_BACKFILL
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
X-List-Received-Date: Fri, 18 Mar 2016 11:08:46 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 17, 2016 at 2:02 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2016-03-17 at 11:17 -0700, Andre McCurdy wrote:
>> On Thu, Mar 17, 2016 at 10:31 AM, Burton, Ross <ross.burton@intel.com
>> > wrote:
>> >
>> > On 17 March 2016 at 17:19, Andre McCurdy <armccurdy@gmail.com>
>> > wrote:
>> > >
>> > > -DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5
>> > > gobject-introspection-data"
>> > > -MACHINE_FEATURES_BACKFILL = "rtc gobject-introspection-data"
>> > > +DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5"
>> > > +MACHINE_FEATURES_BACKFILL = "rtc"
>> >
>> > So every BSP (apart from the qemu ones) would need to add the
>> > feature to
>> > MACHINE_FEATURES?
>> >
>> > Maybe we should remove from DISTRO backfill but keep backfilling
>> > for MACHINE
>> > features?
>>
>> Or don't control via a MACHINE feature at all (which would also solve
>> the package PACKAGE_ARCH issue) ?
>>
>> Each CPU tuning file would then instead need to somehow express "this
>> tuning target creates binaries which can / can't be run with qemu",
>> but maybe that's an improvement too - isn't it better to define and
>> maintain that information centrally in files controlled by oe-core
>> rather than leave it up to BSPs to get right?
>
> MACHINE_FEATURES is a variable which represents the features the target
> hardware has. There is nothing which says "this must be set in
> MACHINE.conf". In fact there is significant precedent for setting up
> common include files which define the hardware properties.
>
> If you look at one of my patches, it alters a core common include file
> to exclude introspection in a case where we can't use it (x32).
>
> So I think we actually want the same thing which is for the common tune
> files to setup the right data.

Yes, I think so.

Deciding if/how qemu can run binaries for each tuning target is
already partially addressed by the QEMU_EXTRAOPTIONS logic in
qemu.bbclass. My suggestion would be to somehow generalise that
existing logic, so (at least for machines using one of the standard
oe-core tuning files) the question "can qemu run binaries created for
${MACHINE}?" could be answered automatically.

> We have made a decision to defaulting to introspection, rightly or
> wrongly. I'm also quite happy to disable it where we know qemu can't
> work and tune files are likely the right place to that.
>
> I don't think this patchset is right.
>
> Cheers,
>
> Richard
>

