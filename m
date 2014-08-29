Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3FC106ACBA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 04:33:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7T4XOXV021678
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Aug 2014 21:33:24 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 28 Aug 2014 21:33:23 -0700
Message-ID: <54000296.8030300@windriver.com>
Date: Fri, 29 Aug 2014 12:33:26 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1408326458.git.Qi.Chen@windriver.com>
	<1408814895.5457.36.camel@ted> <53FADCD1.2050807@windriver.com>
	<CAMKF1sqxz2DCvH3G9SdvgNbPR6zqGL3tWb85vDSAacz+BOCN8w@mail.gmail.com>
In-Reply-To: <CAMKF1sqxz2DCvH3G9SdvgNbPR6zqGL3tWb85vDSAacz+BOCN8w@mail.gmail.com>
X-Originating-IP: [128.224.162.187]
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
X-List-Received-Date: Fri, 29 Aug 2014 04:33:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/29/2014 10:58 AM, Khem Raj wrote:
> On Sun, Aug 24, 2014 at 11:50 PM, ChenQi <Qi.Chen@windriver.com> wrote:
>> On 08/24/2014 01:28 AM, Richard Purdie wrote:
>>> On Mon, 2014-08-18 at 09:51 +0800, Chen Qi wrote:
>>>> The following changes since commit
>>>> 4321c553d5ae816e566234e981a0815bba046d39:
>>>>
>>>>     SIGGEN_EXCLUDERECIPES_ABISAFE: add initscripts (2014-08-11 17:44:09
>>>> +0100)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>     git://git.openembedded.org/openembedded-core-contrib
>>>> ChenQi/systemd-misc-fixes
>>>>
>>>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd-misc-fixes
>>>>
>>>> Chen Qi (10):
>>>>     systemd: upgrade to 215
>>>>     systemd: add PACKAGECONFIG for 'elfutils'
>>>>     systemd: make runlevel work in non-runlevel targets
>>>>     update-rc.d: fix logic in populate_packages_updatercd
>>>>     alsa-state: fix pkg_postinst and set INHIBIT_UPDATERCD_BBCLASS
>>>>     keymaps: fix for systemd
>>>>     systemd: add kbd-keymaps to RRECOMMENDS of systemd-vconsole-setup
>>>>     v86d: set INHIBIT_UPDATERCD_BBCLASS if 'sysvinit' not in
>>>>       DISTRO_FEATURES
>>>>     systemd: add support for executing scripts under /etc/rcS.d
>>>>     dhcp: add dhcpd.service
>>> Testing with this patchset included resulted in:
>>>
>>>
>>> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/6/steps/Running%20Sanity%20Tests_2/logs/stdio
>>>
>>> Could you have a look into this and see if we can figure out why some of
>>> these start failing please?
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>>>
>>>
>> Got it.
>>
>> I'm looking into the problem.
> where are we with this ? we shud have systemd 216 in 1.7. can you rebase
>
>

OK.
I'll do it.

Best Regards,
Chen Qi

