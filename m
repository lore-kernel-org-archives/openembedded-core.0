Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3494A71633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 20:26:50 +0000 (UTC)
Received: by iecrp18 with SMTP id rp18so35344074iec.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 12:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=I1/LAeqsT6auF6KpIHb+xuqBpKnGWN/AhqlqX4vzunI=;
	b=Jf7d/oNbj/z7mJjp9HQGs1/uPIy3jVgzf781I9E8QXUnq3+xXOGRqCOUR8G42uo4aK
	EcInV3FB/g5wMS7tElczM+HIxEz0mBxzpwhpelE6W5VpwrbXrBZSjik+JzzY0qX9FesL
	O6qZ8nZzibR+wskqSzb/f+FREfCKFF7e+Ut6nPVZ89i4RvnaBKu9n1EV98nD9bJaCSud
	qZfodr8xI6RIWxwnXt3zr1dgLYaCgWOVPEw3oYXCz/19T9VkL/Da9aebhhesjnpu2wh8
	q8lLFiO/SPijp16TJGrtj3NY2pW9Uk8/HLY9IIvEwLm5QPF4+PDr4OcDn6gp15fCQmz/
	XzDQ==
X-Received: by 10.107.10.148 with SMTP id 20mr23155979iok.79.1424809612038;
	Tue, 24 Feb 2015 12:26:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Tue, 24 Feb 2015 12:26:21 -0800 (PST)
In-Reply-To: <CAJTo0LZzTQ-Yh0AOYrdi2eg_CdptLzUj2xduMjG5QX2dBYeuSg@mail.gmail.com>
References: <e879427a035a12a0b9040ff948fe3e22618412b8.1424405852.git.raj.khem@gmail.com>
	<f2524b85ea338525d78147b4bd90d2a1f3f3790d.1424405852.git.raj.khem@gmail.com>
	<1424436945.11836.46.camel@linuxfoundation.org>
	<CAJTo0LZzTQ-Yh0AOYrdi2eg_CdptLzUj2xduMjG5QX2dBYeuSg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Feb 2015 12:26:21 -0800
Message-ID: <CAMKF1sptfdOVgy3hjf25w3yTAVNwhZsBgn6_tBJ1pXFQcNB7HA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] util-linux, util-linux-libs: Build and package util-linux libs separately
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
X-List-Received-Date: Tue, 24 Feb 2015 20:26:52 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 20, 2015 at 1:26 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 20 February 2015 at 12:55, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> Every time we're tried to split a piece of software into two like this
>> it has been a world  of pain. Are we sure there is no alternative to
>> this?
>
>
> One alternative is to just disable systemd in util-linux, surely.  Last time
> I looked it was just uuidd that can optionally use libsystemd to daemonise
> cleanly.

Thats is intrusive too. btw I have updated the latest patch here
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/misc&id=c53322e9e587ef9a88c050f21aa98604deeeeb1f

Double installs were fixed which I found with clean builds from sstate.

