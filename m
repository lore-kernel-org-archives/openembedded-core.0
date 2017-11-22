Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6142D78707
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 20:25:37 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id w95so15727693wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 12:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=guGjHXT+7lvV+uqoOOC0d2mCdv/+57lrySadU7emAm0=;
	b=T36gIJNxNPIKm0A0sHQl5zrhUK/6N5D7X2ePIEcvB40PSOi5Rmbjm6l2Bvzv4FRQr/
	U8uf4oWxHamaO1BmGvKDB5LFq1PoiEVdFYRSs/7POUc/tsrY4akb6XbfbvZlnzUU8yVG
	5+YSuF4MBHzB/cM9UqAzvHFzgLu3cDNoXjeoV1+yLnYPd9OjQw5qqlK98RZ+H3cgbb3h
	VrmsjtfiZzy1OHeim0QL8e+HPdr1BA6BNxokfqxexYQgwEBgJesQOAxahj87rtOhcvDe
	vRta4AH4XuczSP4v5Em0u4nypNHAcnjMtYMo7zCMt+AzEuw5DPNei91MxUZI3cJPtgXw
	+Vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=guGjHXT+7lvV+uqoOOC0d2mCdv/+57lrySadU7emAm0=;
	b=bVmSVeAs+i3nrYkeHpcqM2SKfOVOve+nFqqO/FO12lQPRAEGTgofcsKM6ZvA0vBORm
	snsfMWT+wm8nql/jTqwh3t+yhVOPucwoCpJVqLpTeTwH/QA/lJ32I86/r0PFeUx5O4Rn
	CSK6ojQhvM/r4bR6cokiZ/Gb/A5PGVPLw3vIKWDoKLIC8cO2pti57bF5ctoCak0C7Rqp
	yXPojLZ6dEYnevKx+HHKQHSl5Jct/TD6cBpYXk+TLsT0+vMSnJ1Qxm85Zv14g8iN1aCl
	nkN4G+6Dt4XCwPATYuUkqZD7U7L2TIpBWoX+m4U8ui7zZ0WKi+ueZH04UMG4I3nO96Y/
	fXxw==
X-Gm-Message-State: AJaThX4JU9XR8uH+lTM7/ckDwzbgEnSqHgOlaquOcuQsgw+Bkn+VRx3q
	MENldinnURJsDGy4h+HC4s8FgMRv/eAt6nBxpvk=
X-Google-Smtp-Source: AGs4zMYSyUjzY6I8OjdCdqj8/4SoALdDC2jJtD6c09+r74/r7byACPg+FLQTps9w6ubDE6snHJWnGqTVUhk69JLJZtQ=
X-Received: by 10.223.135.59 with SMTP id a56mr20474388wra.173.1511382339061; 
	Wed, 22 Nov 2017 12:25:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Wed, 22 Nov 2017 12:25:38 -0800 (PST)
In-Reply-To: <CAJ86T=XNTYR=5=bZ=+Uecz_uJRHSktinLmb=4QX6Z3dwBkm2CQ@mail.gmail.com>
References: <1510293271-32407-1-git-send-email-armccurdy@gmail.com>
	<1510584490.22094.65.camel@intel.com>
	<CAJ86T=UQ_b0RLUTCTGPONvkxXCO_s3Hvim0Zh4_MpcBBPoDpeA@mail.gmail.com>
	<1510604789.5979.1.camel@intel.com>
	<CAJ86T=XNTYR=5=bZ=+Uecz_uJRHSktinLmb=4QX6Z3dwBkm2CQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 22 Nov 2017 12:25:38 -0800
Message-ID: <CAJ86T=UDWCpBpgXZyR7iPS=s4y5Th3fdCUjLeR0HXdFjEexOqw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: create wheel sysuser group offline
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
X-List-Received-Date: Wed, 22 Nov 2017 20:25:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 13, 2017 at 12:59 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Nov 13, 2017 at 12:26 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
>> On Mon, 2017-11-13 at 12:18 -0800, Andre McCurdy wrote:
>>> On Mon, Nov 13, 2017 at 6:48 AM, Patrick Ohly <patrick.ohly@intel.com
>>> > wrote:
>>> > On Thu, 2017-11-09 at 21:54 -0800, Andre McCurdy wrote:
>>> > > The default systemd-tmpfiles config file expects to be able to
>>> > > create
>>> > > files etc belonging to the wheel system group. Currently the
>>> > > wheel
>>> > > group is created at run time by systemd-sysusers, but that
>>> > > doesn't
>>> > > happen if systemd-sysusers is disabled (as it currently is by
>>> > > default
>>> > > when building with musl libc).
>>> >
>>> > Isn't this something that the systemd_create_users rootfs
>>> > postprocess
>>> > command in rootfs-postcommands.bbclass already takes care of?
>>>
>>> systemd_create_users() does a build time pass over the
>>> systemd-sysusers config files, but those files are not installed if
>>> systemd is configured without sysusers support.
>>
>> I didn't know that this is optional. To me it sounds like an invalid
>> (or let's say, unexpected) configuration to install tmpfiles config
>> files but not the sysusers files, because as you said, the tmpfiles may
>> depend on the sysusers.
>
> In the current recipe, there's no control of tmpfiles (so it will
> always be enabled) and sysusers is controlled by PACKAGECONFIG
> (enabled by default - but only when building with glibc), so the
> recipe does allow that combination.
>
>> Anyway, I just wanted to know because I was wondering whether it is
>> really necessary to duplicate the user creation information in the
>> systemd recipe.
>>

Ping.

Ross, it looks like you've started to stage the later systemd + musl
cleanups in mut. This fix is needed too.

