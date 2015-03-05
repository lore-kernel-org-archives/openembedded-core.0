Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id E56EB65C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 15:47:28 +0000 (UTC)
Received: by ierx19 with SMTP id x19so77577312ier.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 07:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TiuCJzWolcHndRhLRnjPbElBBQCcmlCJBlB+wH9PF2U=;
	b=d00OHbZ8xhQuvcLAuDc0j4wzR/OoEUDXUnst7UpE3iitVeot6qTIAxwaSAbvHxAqE5
	JnJ0AJY6kfP4SWnsLL1dOGg453DQBxZU9xln7gOPAMvYr911ewMJI7O886v5MVYAH52+
	4vXYxc8fe6ehmq54GnPKJj/XWZDuht93KGil4XcNZKue3CrHiP06+/1QNJFa8zuS0jH7
	kaUS4eXj3BoVO75ub3Q6sLTiH2FqLDqB/4sW5cbXpZjeCsKKPQI7dZRYyYUT4FlYr/g9
	BbWMWyXTYZ/tbSnHDcrqAYL6IOQycUw21SuqQwBwuXf45oR1YeZXZkCOhPY2UHpuWTdH
	BJqw==
X-Received: by 10.107.18.226 with SMTP id 95mr7592302ios.84.1425570449306;
	Thu, 05 Mar 2015 07:47:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Thu, 5 Mar 2015 07:46:58 -0800 (PST)
In-Reply-To: <CAJTo0LZSLk5tewPiw5WiTMsdFybSQ0Yp43PkKewKz8WPs0pX4w@mail.gmail.com>
References: <1425518629-19739-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LZSLk5tewPiw5WiTMsdFybSQ0Yp43PkKewKz8WPs0pX4w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Mar 2015 07:46:58 -0800
Message-ID: <CAMKF1so=t18a0nacmgeQPVyWXtsxPoF9iXF4aTtKHDOdjErapg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] tcmode-default: Define one gdb version
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
X-List-Received-Date: Thu, 05 Mar 2015 15:47:29 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 5, 2015 at 2:57 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 5 March 2015 at 01:23, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> +PREFERRED_VERSION_gdb-cross-${ARGET_ARCH} ?= "${GDBVERSION}"
>
>
> ARGET_ARCH? :)

Sent a v2, btw. its pinning to 7.9 assuming that 7.9 upgrade patch
will be applied before it.

>
> Ross

