Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 505E46E9A9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 21:45:50 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id c10so296320igq.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 13:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0PMxfpQ7B5HwFMX5s7M0WKe603KDQXBjL6Ixtxhp1qM=;
	b=ZAnW9VhyrdNIikHsB30R/6cLQW78nCeNpAUBV57XI3Sp9VdF8qlUbSdUesuA6hFFwJ
	19jk1k0A3ZMUch9BAIkmRcQdjHQSwr7OC+pwKb1nKSEXOlBzUZ4tR52qevflhjz9kvqW
	ovXN4gAoeNNrUG3BTPQb34muGKhejQo3KQIKCoORNQZblM4JYqbVROJZMe1GIoYeH2P0
	69bN8TEcjWzxTg2fLckoBTNqiaso2z5J70xmNAIVY0kDalgUpxlvCr+oVRsp3cMr8akj
	IOlaTH/dbQ2+3kyRJJcGxlZnI9fDrQ+DWugJHDiNBhCpLKJK446tYDz07K9JKOK+RolT
	TMjg==
X-Received: by 10.43.182.74 with SMTP id pl10mr2642782icc.70.1391204751181;
	Fri, 31 Jan 2014 13:45:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Fri, 31 Jan 2014 13:45:21 -0800 (PST)
In-Reply-To: <CAMKF1sqemAcTHCPKbWH3tw1zc=QxNf+Cem1abKesLP_b4d3ChA@mail.gmail.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
	<CAJTo0Laed6Huugouio4F9=vfoNQyPHaa_-SKD_vXULy8iJwkOw@mail.gmail.com>
	<CAMKF1sqemAcTHCPKbWH3tw1zc=QxNf+Cem1abKesLP_b4d3ChA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Jan 2014 13:45:21 -0800
Message-ID: <CAMKF1soQc0ZNLUizYiR7uRMS2ZpjybKm5m69thzJ7EMp53swyw@mail.gmail.com>
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
X-List-Received-Date: Fri, 31 Jan 2014 21:45:51 -0000
Content-Type: text/plain; charset=UTF-8

There was another report where collections were packaged in python3-misc which
make python3 to not work without installing python3-misc I have fixed
that and updated
the pull tree.

On Thu, Jan 30, 2014 at 10:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Jan 30, 2014 at 10:14 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 30 January 2014 04:09, Khem Raj <raj.khem@gmail.com> wrote:
>>>   classes: Add distutils for python3
>>>   distutils3: Do build_ext as separate step during compile
>>>   distutils3.bbclass: Fix typo and use proper values for target sysroot
>>>   distutils3.bbclass: Use MACHINE for sysroot when not building for
>>>     build host
>>
>> Please try and squash patches like this set that simply fix bugs in
>> previous patches.
>
> Thanks, updated pull branch which squashed them and also another set
> of 4 python3 recipe specific patches
>
>>
>> Ross

