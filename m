Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id DED0F70281
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 02:58:37 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id hn18so9039396igb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 19:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QAeNhtupGj52fT0MlPet3gpsacpxOT69vJ9Pkucarrk=;
	b=RkydaFr5ulFE0Vkrf3tZlFgMV5T13/uN3fj4/cO9DCLTUNIhZYNzUwDPBhPZ3l6xnN
	7nMx9BfwU7YmKqeoXHhXHKDT+iwdFUZZxOSTzilmJE+asU6Q3O4vmO0jCX6utJ37TXeD
	ZK512hMWI5yIHII6+2cK7nNV9NKLJH+xUTi1HfZH1K9XvnX0y2Z/xTLb2maYTfCi5azv
	kDrKvxRITD+gHL0VJAznnzy0AwHc4rSfC8Wn2dHgPDzNW9hi2rnNEpW6SI1Xr9vaYWHa
	1T7HqSwpC+IL0cMbHWWHbjFPDkcBv64DGIh5wZQuv1ZAgXH2AT3mvAYJkxA1hkP38nrc
	6fSQ==
X-Received: by 10.50.111.112 with SMTP id ih16mr1068298igb.30.1409281118607;
	Thu, 28 Aug 2014 19:58:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Thu, 28 Aug 2014 19:58:08 -0700 (PDT)
In-Reply-To: <53FADCD1.2050807@windriver.com>
References: <cover.1408326458.git.Qi.Chen@windriver.com>
	<1408814895.5457.36.camel@ted> <53FADCD1.2050807@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Aug 2014 19:58:08 -0700
Message-ID: <CAMKF1sqxz2DCvH3G9SdvgNbPR6zqGL3tWb85vDSAacz+BOCN8w@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Richard Purdie <rpurdie@rpsys.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 00/10] upgrade systemd to 215 and other misc fixes
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
X-List-Received-Date: Fri, 29 Aug 2014 02:58:40 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 24, 2014 at 11:50 PM, ChenQi <Qi.Chen@windriver.com> wrote:
> On 08/24/2014 01:28 AM, Richard Purdie wrote:
>>
>> On Mon, 2014-08-18 at 09:51 +0800, Chen Qi wrote:
>>>
>>> The following changes since commit
>>> 4321c553d5ae816e566234e981a0815bba046d39:
>>>
>>>    SIGGEN_EXCLUDERECIPES_ABISAFE: add initscripts (2014-08-11 17:44:09
>>> +0100)
>>>
>>> are available in the git repository at:
>>>
>>>    git://git.openembedded.org/openembedded-core-contrib
>>> ChenQi/systemd-misc-fixes
>>>
>>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd-misc-fixes
>>>
>>> Chen Qi (10):
>>>    systemd: upgrade to 215
>>>    systemd: add PACKAGECONFIG for 'elfutils'
>>>    systemd: make runlevel work in non-runlevel targets
>>>    update-rc.d: fix logic in populate_packages_updatercd
>>>    alsa-state: fix pkg_postinst and set INHIBIT_UPDATERCD_BBCLASS
>>>    keymaps: fix for systemd
>>>    systemd: add kbd-keymaps to RRECOMMENDS of systemd-vconsole-setup
>>>    v86d: set INHIBIT_UPDATERCD_BBCLASS if 'sysvinit' not in
>>>      DISTRO_FEATURES
>>>    systemd: add support for executing scripts under /etc/rcS.d
>>>    dhcp: add dhcpd.service
>>
>> Testing with this patchset included resulted in:
>>
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/6/steps/Running%20Sanity%20Tests_2/logs/stdio
>>
>> Could you have a look into this and see if we can figure out why some of
>> these start failing please?
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>>
>
> Got it.
>
> I'm looking into the problem.

where are we with this ? we shud have systemd 216 in 1.7. can you rebase

