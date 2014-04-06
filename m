Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id BA32F60D67
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Apr 2014 15:37:26 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id ij19so4568779vcb.38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Apr 2014 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Vwp0cKJXUUFD9rdszVhiPwVkSgS1QLaQ3vlZrE65DOk=;
	b=LneSDB8u0hLrS5mlJC0Nnsyare3iHhbLMatVbCkvjeb38NfGx16asz7ydhn3JKx/Gx
	OK87FXcGY1owRdMap3ziSDsuV+Zo4mPVuYc17NtLDRYL8YLEt6KQyp0ifEzXwAhiMmEU
	O0xN0n1d3Y3chkfpFgC6hPRQ3jiXxfFvZXcS1p5hplG3wPDUwhAcoG1rBXWoB7+V/8ez
	H0BaBmjcZksFBDmCCqj5NzC+ryYCzEoJEaY/qkOn1TPGuUAkgEDDipvBynFoawCH7OZo
	tZ9ww+nWhSS2WBKGfJzGgKpTVINwxXcTJyMbLLhlNO3zJ7EgMCCfm7gi2wz+ND7bcXY6
	iHpw==
X-Received: by 10.52.173.165 with SMTP id bl5mr20372563vdc.13.1396798647737;
	Sun, 06 Apr 2014 08:37:27 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.221.5.133 with HTTP; Sun, 6 Apr 2014 08:36:47 -0700 (PDT)
In-Reply-To: <1396786107.24597.17.camel@ted>
References: <CANyK_8dPFDShPAvhYt+89j0Mr4fjzpeMt28HrwNAZrN8qfnS4w@mail.gmail.com>
	<1396786107.24597.17.camel@ted>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sun, 6 Apr 2014 16:36:47 +0100
X-Google-Sender-Auth: bV-2mKz8M-OKsyavtFRPuYu0yoc
Message-ID: <CANyK_8eSA8fOD2dZTJ=LPm84JGGmn=zrvNsbtANJmMV2FJ2DcA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg-0.2.2 release
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
X-List-Received-Date: Sun, 06 Apr 2014 15:37:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 6 April 2014 13:08, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2014-04-01 at 22:18 +0100, Paul Barker wrote:
>> Hi all,
>>
>> I've just released opkg-0.2.2 with the following bugfixes (issue
>> numbers refer to the opkg issue list):
>>
>> - Fix '--force-reinstall' flag so that it acts as an upgrade rather than
>>   removing possibly critical packages before reinstall (issue 71)
>>
>> - Symlinks are now correctly removed during package uninstall (issue 91)
>>
>> - Fixed help and manual pages to reflect that shell globs not true regexps are
>>   accepted by opkg (issue 107)
>>
>> - The error message "no valid architecture" is no longer given when the
>>   architecture of a package is valid but incompatible with the current system.
>>
>> This is a bugfix only release with no other significant changes.
>>
>> I have also rebased the patches against opkg in oe-core against the
>> new release and checked that they still apply and that the result
>> builds with recent oe-core master. The result was tested on qemuarm by
>> running 'opkg update' against a package feed and installing a few new
>> packages.
>
> Thanks for checking this, it certainly helps and is appreciated!
>
>> Do we want to try to get this in to the upcoming Yocto release or
>> shall I delay the recipe upgrade until after the release? If you want
>> it for the upcoming release I'll re-run my tests locally just to be
>> sure it's looking good and then send a patch.
>
> We're about to roll -rc3 so this is getting late in the cycle to change
> the package manager. Having said that this sounds like bug fixes which
> would be nice to have.
>
> I think I'm leaning to not taking it right now as it is really too late
> but I'm open to other views on this...
>

I'll hold off for now then and send patches for oe-core after daisy
has been released.

> Cheers,
>
> Richard
>
>

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

