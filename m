Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CAD4B6B70B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 02:15:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0K2FaJq022014
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 19 Jan 2014 18:15:37 -0800 (PST)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 19 Jan 2014 18:15:36 -0800
Message-ID: <52DC86CD.3040302@windriver.com>
Date: Mon, 20 Jan 2014 10:15:41 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
References: <cover.1388992959.git.Qi.Chen@windriver.com>
	<0522b744ff3e02f6ef1f794294f759ec1f176923.1388992959.git.Qi.Chen@windriver.com>
	<66190526.u9bvojJavk@peggleto-mobl5.ger.corp.intel.com>
	<20140117153740.GN3742@jama>
In-Reply-To: <20140117153740.GN3742@jama>
X-Originating-IP: [128.224.162.164]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 2/2] Add missing RDEPENDS of initscripts-functions
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
X-List-Received-Date: Mon, 20 Jan 2014 02:15:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2014 11:37 PM, Martin Jansa wrote:
> On Fri, Jan 17, 2014 at 02:11:39PM +0000, Paul Eggleton wrote:
>> Hi Qi,
>>
>> On Monday 06 January 2014 15:27:35 Chen Qi wrote:
>>> Now that the initscripts-functions has been packaged separately,
>>> packages which may use the functions script should have a runtime
>>> dependency on it.
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   meta/recipes-bsp/alsa-state/alsa-state.bb          |    2 +-
>>>   meta/recipes-bsp/apmd/apmd_3.2.2-14.bb             |    1 +
>>>   .../irda-utils/irda-utils_0.9.18.bb                |    2 ++
>>>   .../nfs-utils/nfs-utils_1.2.9.bb                   |    4 ++--
>>>   meta/recipes-connectivity/openssh/openssh_6.4p1.bb |    2 +-
>>>   meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    1 +
>>>   meta/recipes-core/dbus/dbus.inc                    |    2 +-
>>>   meta/recipes-core/systemd/systemd_208.bb           |    2 +-
>>>   meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    2 +-
>>>   meta/recipes-devtools/distcc/distcc_3.1.bb         |    1 +
>>>   meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    2 +-
>>>   meta/recipes-extended/at/at_3.1.14.bb              |    3 +--
>>>   meta/recipes-extended/cronie/cronie_1.4.11.bb      |    2 ++
>>>   meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb     |    2 ++
>>>   meta/recipes-extended/sysklogd/sysklogd.inc        |    2 ++
>>>   meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    1 +
>>>   .../oprofile/oprofileui-server_git.bb              |    2 +-
>>>   17 files changed, 22 insertions(+), 11 deletions(-)
>> Sorry to come back on this patchset again, but could we not detect
>> installation of an initscript requiring these functions in update-rc.d.bbclass
>> and just add the RDEPENDS automatically? Otherwise it's just another thing
>> people can get wrong when writing a recipe, not to mention all of the existing
>> recipes outside OE-Core that install initscripts.
> Agreed, my current list of components where I've reverted this (to get
> my images building again) is:
>
> dbus, systemd, apmd, rpcbind, nfs-utils, alsa-state, openssh, ppp,
> cronie, irda-utils

Hi Martin,

Could you please give me some more information why to revert this?
I really don't want to mess things up. So I really wish I could be aware 
of some potential problems before I start working on this.

Best Regards,
Chen Qi

> To be fair, it's possible that some of these need it and I just don't
> use their script in runtime (e.g. irda-utils is included only in image
> on "spitz" MACHINE and I've never used irda here - it's pulled through
> some packagegroup because MACHINE_FEATURES have irda)
>


