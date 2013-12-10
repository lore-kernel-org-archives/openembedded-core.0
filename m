Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BE36460660
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 04:38:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2013 20:34:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,863,1378882800"; d="scan'208";a="441448983"
Received: from unknown (HELO [10.255.15.207]) ([10.255.15.207])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2013 20:38:03 -0800
Message-ID: <52A69AAB.3020900@linux.intel.com>
Date: Mon, 09 Dec 2013 20:38:03 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: ChenQi <Qi.Chen@windriver.com>, Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1386558973.git.Qi.Chen@windriver.com>	<c20f79f4a812a4e007413751e3cabf63a4f5e6ec.1386558973.git.Qi.Chen@windriver.com>	<CAP9ODKpv76jtiMqmg3eCJ1TYzvrhBESQMfQF5rVeT2XgJHR0tw@mail.gmail.com>
	<52A67CF3.2060109@windriver.com>
In-Reply-To: <52A67CF3.2060109@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] image.bbclass: default USE_DEVFS to '1'
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
X-List-Received-Date: Tue, 10 Dec 2013 04:38:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/09/2013 06:31 PM, ChenQi wrote:
> On 12/09/2013 07:52 PM, Otavio Salvador wrote:
>> Hello,
>>
>> I agree with the commit but ...
>>
>> On Mon, Dec 9, 2013 at 1:17 AM,  <Qi.Chen@windriver.com> wrote:
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> Default USE_DEVFS to "1" so that the `makedevs' command is not run
>>> at rootfs time by default. There are mainly two reasons to do so.
>>> 1. This will fix a build failure with initramfs-kexecboot-klibc-image.
>> Can you elaborate this error? is it something we can/should fix?
>
> It's "makedevs: No entry for root in search list ", just as Andrea said.
> I've updated the commit message in remote tree.
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ChenQi/USE_DEVFS&id=435b6e6e34c4c65022e57b78a246cfd8fcd2d71f
>
Please resend as a V2

Sau!

>
> Thanks,
> Chen Qi
>
>>> 2. Most of our images use a filesystem over /dev. Most of the time, it's
>>>     just devtmpfs. So we actually are using a filesystem over /dev.
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   meta/classes/image.bbclass |    2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>>> index cc65e35..b8bd462 100644
>>> --- a/meta/classes/image.bbclass
>>> +++ b/meta/classes/image.bbclass
>>> @@ -77,7 +77,7 @@ PACKAGE_INSTALL_ATTEMPTONLY ?=
>>> "${FEATURE_INSTALL_OPTIONAL}"
>>>   # Images are generally built explicitly, do not need to be part of
>>> world.
>>>   EXCLUDE_FROM_WORLD = "1"
>>>
>>> -USE_DEVFS ?= "0"
>>> +USE_DEVFS ?= "1"
>>>
>>>   PID = "${@os.getpid()}"
>>>
>>> --
>>> 1.7.9.5
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

