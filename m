Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3EAF360C14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 01:14:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0L1DxNZ010662
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Jan 2014 17:14:00 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 20 Jan 2014 17:13:58 -0800
Message-ID: <52DDC9D4.2010701@windriver.com>
Date: Tue, 21 Jan 2014 09:13:56 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1389206129.git.Martin.Jansa@gmail.com>
	<52D3493D.70501@windriver.com>
	<C78732B4-A012-46A8-A69E-84187182C284@dominion.thruhere.net>
In-Reply-To: <C78732B4-A012-46A8-A69E-84187182C284@dominion.thruhere.net>
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora][PATCH 0/4] Dora backports
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
X-List-Received-Date: Tue, 21 Jan 2014 01:14:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/21/2014 12:08 AM, Koen Kooi wrote:
>
>
> Op 13 jan. 2014, om 03:02 heeft Robert Yang <liezhi.yang@windriver.com> het volgende geschreven:
>
>>
>> Hi Martin,
>>
>> Thank you ver much, I will merge them to dora-next.
>
>
> What's the status on these?
>

Hi Koen,

I will send out a branch with will the fixes for dora-next (1.5.2) by this week.

// Robert

> regards,
>
> Koen
>
>>
>> // Robert
>>
>> On 01/09/2014 02:36 AM, Martin Jansa wrote:
>>> The following changes since commit e86622a932bbd0acdea67ecfb15c8b06c27353d8:
>>>
>>>    libsoup-2.4: add intltool-native to DEPENDS (2013-12-19 14:59:47 +0000)
>>>
>>> are available in the git repository at:
>>>
>>>    git://git.openembedded.org/openembedded-core-contrib jansa/dora-backports2
>>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/dora-backports2
>>>
>>> Martin Jansa (1):
>>>    ltp: set PREFERRED_PROVIDER and rename runtests_noltp.sh script
>>>
>>> Mike Crowe (2):
>>>    Revert "kernel.bbclass: move bundle_initramfs after
>>>      kernel_link_vmlinux"
>>>    kernel.bbclass: Stop bundle_initramfs thwarting sstate cache and fix
>>>      race
>>>
>>> Richard Purdie (1):
>>>    eglibc-initial.inc: Drop duplicate include
>>>
>>>   meta/classes/kernel.bbclass                        |  24 +--
>>>   meta/conf/distro/include/default-providers.inc     |   2 +
>>>   meta/recipes-core/eglibc/eglibc-initial.inc        |   2 -
>>>   ...tests_noltp.sh-script-so-have-unique-name.patch | 202 +++++++++++++++++++++
>>>   meta/recipes-extended/ltp/ltp_20130503.bb          |   4 +-
>>>   5 files changed, 219 insertions(+), 15 deletions(-)
>>>   create mode 100644 meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
>>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>

