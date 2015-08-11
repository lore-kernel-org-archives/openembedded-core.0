Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7963376536
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 19:30:28 +0000 (UTC)
Received: by igfj19 with SMTP id j19so79441391igf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 12:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=3WGMPD3RhUWt9sr4GI1EHCFvNELwUjA0o6OoLelnY7Y=;
	b=pRtikqBxubnbvU3tL9hL5y3P4vsLiP8tvFNiZ2q4currp0/8+TpdceBLGeikON362W
	t8bxkYQBWN28Ga9AIbhvp0pjwg5n7tyQvPj6n0keX2D7biVjCubWc6U3mEy8/TOUSrpt
	T+Swh5cZG8ro9sVApIfyzlDwS3P0FEySc+uCRCrVHAexjZ3SEj58GYrtT6obBjyGBwxL
	658MyxOwlzca2kdWutDxncOEho7qXwoomUMH39ctNzuJrcd8/mpYomYJSqKReUP+fNCj
	ajR9ZIqRgCrGpP1WxLX0Dfy2D6Rzonm7pJNP4CZDANIYkqnGVn0+XiZu4HMa/vjpFINZ
	MsQg==
X-Received: by 10.50.112.166 with SMTP id ir6mr15436921igb.75.1439321428935;
	Tue, 11 Aug 2015 12:30:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Tue, 11 Aug 2015 12:29:59 -0700 (PDT)
In-Reply-To: <CAJTo0LbyhwxBW1HXmSV616hC+dkLDYzTPvo80jVphGjUGjnE=A@mail.gmail.com>
References: <cover.1438811921.git.raj.khem@gmail.com>
	<CAMKF1soS8PM-4NwJ3jxmzfdo=1KyrTkuAaB6QQQpvvJfO8bJaA@mail.gmail.com>
	<CAJTo0LbyhwxBW1HXmSV616hC+dkLDYzTPvo80jVphGjUGjnE=A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Aug 2015 12:29:59 -0700
Message-ID: <CAMKF1sq6=Uhc_Ars_R_VL0ukQs0i1aQi0B0wB2GbChK6bOBwYg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Upgrade glibc to 2.22
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
X-List-Received-Date: Tue, 11 Aug 2015 19:30:30 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 11, 2015 at 12:26 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 11 August 2015 at 20:14, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Wed, Aug 5, 2015 at 3:02 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > glibc 2.22 is now released. This has been tested on feature branch for
>> > months
>> > now as the release is out, therefore proposing it for master
>>
>> I have updated the pull request to fix the issue where PV was still
>> using AUTOREV
>
>
> Where can this branch be found?

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/for-master

>
> Ross

