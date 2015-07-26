Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3564673D26
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jul 2015 22:56:12 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so55628212igb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jul 2015 15:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=tWv1GL1TYEgPox9pFfY0DkCwxDy3/I9qEuup4ul2l4s=;
	b=ajOL2pkNmQVrd2qMf8BfdN3ztWDvVC3NBReM2ovx7c4vK2qPT2jppzC0tFcTnMm86h
	dmkQ/AYffwDOud1Y+Z21TlpSU8Mjzwyl366EiY1KDTg/T6HsHz48xLCD2dqYd8tW5U6/
	bQnSx2+F+m6kgC17umU8HeOrrAyhJgIVDGmoLa3AJJx9SB2k9mERtukQD9iEU2coQD7+
	Lwwz8YOk6y0JUDjsZF0TnqxhVhVQ7eP3DA1WyPgeNEZ6vN05bRMrw+695XqlEUfFA9bC
	50LnqBecpqHAE6b4IHhWVnXNu8zNqiUEf6kBIpY2uz1mrbR1v8rZdG1+cTmENaBI1nSe
	P4cA==
X-Gm-Message-State: ALoCoQlJllo/i9mA5GZivI3DG7978w1l3HZD3P5M6m4NtaIe6G9W6pg1/LiluzC4FhIVRtD3TBIU
MIME-Version: 1.0
X-Received: by 10.50.59.148 with SMTP id z20mr13451563igq.77.1437951372645;
	Sun, 26 Jul 2015 15:56:12 -0700 (PDT)
Received: by 10.107.48.206 with HTTP; Sun, 26 Jul 2015 15:56:12 -0700 (PDT)
In-Reply-To: <1437944918.821.202.camel@linuxfoundation.org>
References: <1437927299.821.198.camel@linuxfoundation.org>
	<55B53F00.8050902@gmail.com>
	<1437944918.821.202.camel@linuxfoundation.org>
Date: Sun, 26 Jul 2015 23:56:12 +0100
Message-ID: <CAPhnLPA=YzFQEApcRgE9Pg_PDEW32h9Lv6gGKZiQJR2i55OHNA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Witt, Randy E" <randy.e.witt@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Weekend build status (master, fido, dizzy and -next)
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
X-List-Received-Date: Sun, 26 Jul 2015 22:56:15 -0000
Content-Type: text/plain; charset=UTF-8

On 26 July 2015 at 22:08, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2015-07-26 at 13:11 -0700, akuster808 wrote:
>> On 07/26/2015 09:14 AM, Richard Purdie wrote:
>> > Dizzy - Last Build showed ? failures:
>> > =====================================
>> >
>> > Managed to push most gcc5 fixes to the branch which has things building
>> > much better than the first time.
>> >
>> > https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/97/steps/Running%20oe-selftest/logs/stdio
>> > two different selftest sanity failures
>>
>> Why does the log show 1.8+snapshot? I would have expected 1.7+.
>
> That autobuilder appears to be running a buildtools-tarball which was
> built using 1.8 and installed in /opt/xxx. The build does appear to be a
> 1.7 build and those paths are safe to ignore.
>
>> > https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/407/steps/Running%20Sanity%20Tests/logs/stdio
>> > Systemd login prompt failure issue (Ross also has open bug for this in
>> > master)
>> >
>> > https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/413/steps/CheckForGPLv3/logs/stdio
>> > GPLv3 check failing?
>>
>> Was this run for 1.7.2 ? I don't see any license changes in the 1.7.3
>> patches.
>
> Beth?

The nightly-non-gpl3 target was run for 1.7.2. However the
"CheckForGPLv3" build step is new and is there to catch exactly this.
So something is wrong with the non-gplv3 builds for 1.7.x that this
caught.

-b

>
>> I am  confused by the logs. It references
>> "TERMINFO_DIRS=/opt/poky/1.8+snapshot" and other places is references
>> 'master'. is this representative of Dizzy?
>
> See above, same issue, its from buildtools-tarball the system is using.
>
>> >
>> > https://autobuilder.yoctoproject.org/main/builders/nightly-mips64/builds/60/steps/Running%20Sanity%20Tests/logs/stdio
>> > mips64 sanity test failed - do we support this on dizzy?
>>
>> Don't think so. It was not tested in the previews point releases either.
>>
>> >
>> > https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds/68
>> > arm64 build failed - do we support this on dizzy? (machine doesn't exist
>> > so no?)
>>
>> Arm64 is not support in Dizzy.
>
> Agreed, Beth will disable these to make things look a little cleaner.
> Which just leaves the other issues :/.
>
> Cheers,
>
> Richard
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

