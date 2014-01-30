Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3542E6E9AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 18:27:22 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id j1so18132991iga.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 10:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/3F/i8GZ+X7kQhMBtiXatmm0bRktthvrYw09RTkAN/A=;
	b=H7xxWauWLFk4CAKaqSHoULOy23+mpAc/9wg7X8q8fV+HyIH2q0pXkT8ozt0D7cPg/H
	1rm716T+2Aof3/ngQJgfaiR4MkUuHbQJntfoqudl4sYjI+8ygT640DzS2K3X+Z76EWH4
	vHfSn6s2yvFhDjuUdYmCCGOglnvVEBmxQ/4Xz7zc4SiGVQ0d5LxY1slINN2E8Kl6VL4S
	RQp6oM93CR1/8cR1cJf1EvfZBlkSRwoCPIVHMPDD870O0TtMrkK1A/NGIK5CJXq3uLOL
	NnnQsc/18l2H8wYOfYwaiy/48vzitLTS+FXsUCpeCBhII4Jup+abYI7brp8X8bGpWK2X
	/9mQ==
X-Received: by 10.50.43.134 with SMTP id w6mr15674432igl.20.1391106443022;
	Thu, 30 Jan 2014 10:27:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Thu, 30 Jan 2014 10:26:52 -0800 (PST)
In-Reply-To: <CAJTo0Laed6Huugouio4F9=vfoNQyPHaa_-SKD_vXULy8iJwkOw@mail.gmail.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
	<CAJTo0Laed6Huugouio4F9=vfoNQyPHaa_-SKD_vXULy8iJwkOw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Jan 2014 10:26:52 -0800
Message-ID: <CAMKF1sqemAcTHCPKbWH3tw1zc=QxNf+Cem1abKesLP_b4d3ChA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/15] Add python 3 support
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
X-List-Received-Date: Thu, 30 Jan 2014 18:27:24 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 30, 2014 at 10:14 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 30 January 2014 04:09, Khem Raj <raj.khem@gmail.com> wrote:
>>   classes: Add distutils for python3
>>   distutils3: Do build_ext as separate step during compile
>>   distutils3.bbclass: Fix typo and use proper values for target sysroot
>>   distutils3.bbclass: Use MACHINE for sysroot when not building for
>>     build host
>
> Please try and squash patches like this set that simply fix bugs in
> previous patches.

Thanks, updated pull branch which squashed them and also another set
of 4 python3 recipe specific patches

>
> Ross

