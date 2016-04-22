Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E37E96011C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:48:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3M5m5sk021661
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 21 Apr 2016 22:48:06 -0700
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Apr 2016 22:48:04 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1460971725.git.liezhi.yang@windriver.com>
	<f4e17cb499c3e83333d197a65363587a5e5c2e51.1460971725.git.liezhi.yang@windriver.com>
	<CAJTo0LatBdHwJXAMSbh4HRoUtOyo_5SzkuSYrbaxC8D0Ah3fVQ@mail.gmail.com>
	<57182651.9050202@windriver.com> <571981E1.3050503@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5719BB13.7060702@windriver.com>
Date: Fri, 22 Apr 2016 13:48:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <571981E1.3050503@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] grub_git: set COMPATIBLE_HOST_armv7a to null
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
X-List-Received-Date: Fri, 22 Apr 2016 05:48:06 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/22/2016 09:44 AM, Robert Yang wrote:
>
>
> On 04/21/2016 09:01 AM, Robert Yang wrote:
>>
>>
>> On 04/21/2016 04:37 AM, Burton, Ross wrote:
>>> Andre's comment from the last time you submitted this is still valid:
>>>
>>>     Unless you have verified that armv4, armv5, armv6 and armv7ve all work
>>>     correctly then blacklisting only armv7a is probably not the correct
>>>     approach.
>>>
>>>
>>> Have you tested all the other architectures?
>>
>> No, I will have a try.
>
> I tried:
> armv7a
> armv7at
> armv4
> armv5

Also armv6.

// Robert

>
> There isn't anything *more* wrong with grub_git except armv7a, so I think
> that mark it COMPATIBLE_HOST_armv7a = 'null' is OK, but I did find other recipes
> failed to build, I will send a new PULL.
>
> We have quite a lot of arm tunes, I think that we need a script or tool to
> auto test them. What's your opinion, please ?
>
> // Robert
>
>>
>> // Robert
>>
>>>
>>> Ross
>>>
>>> On 18 April 2016 at 10:29, Robert Yang <liezhi.yang@windriver.com
>>> <mailto:liezhi.yang@windriver.com>> wrote:
>>>
>>>     It doesn't work with armv7a:
>>>     | build-grub-module-verifier: error: unsupported relocation 0x2b.
>>>     | make[3]: *** [reboot.mod] Error 1
>>>     | make[3]: *** Waiting for unfinished jobs....
>>>     | build-grub-module-verifier: error: unsupported relocation 0x2b.
>>>     | build-grub-module-verifier: error: unsupported relocation 0x2b.
>>>     | make[3]: *** [halt.mod] Error 1
>>>     | make[3]: *** [cat.mod] Error 1
>>>     | build-grub-module-verifier: error: unsupported relocation 0x2b.
>>>     | build-grub-module-verifier: error: unsupported relocation 0x2b.
>>>     | build-grub-module-verifier: error: unsupported relocation 0x2b.
>>>     | make[3]: *** [disk.mod] Error 1
>>>     | make[3]: *** [gptsync.mod] Error 1
>>>     | make[3]: *** [eval.mod] Error 1
>>>     | build-grub-module-verifier: error:build-grub-module-verifier: error:
>>>     unsupported relocation 0x2bunsupported relocation 0x2b.
>>>
>>>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>>>     <mailto:liezhi.yang@windriver.com>>
>>>     ---
>>>       meta/recipes-bsp/grub/grub_git.bb <http://grub_git.bb> | 1 +
>>>       1 file changed, 1 insertion(+)
>>>
>>>     diff --git a/meta/recipes-bsp/grub/grub_git.bb <http://grub_git.bb>
>>>     b/meta/recipes-bsp/grub/grub_git.bb <http://grub_git.bb>
>>>     index 6919c9a..8f8c5ed 100644
>>>     --- a/meta/recipes-bsp/grub/grub_git.bb <http://grub_git.bb>
>>>     +++ b/meta/recipes-bsp/grub/grub_git.bb <http://grub_git.bb>
>>>     @@ -18,6 +18,7 @@ SRC_URI = "git://git.savannah.gnu.org/grub.git
>>>     <http://git.savannah.gnu.org/grub.git> \
>>>       S = "${WORKDIR}/git"
>>>
>>>       COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
>>>     +COMPATIBLE_HOST_armv7a = 'null'
>>>
>>>       inherit autotools gettext texinfo
>>>
>>>     --
>>>     2.8.0
>>>
>>>     --
>>>     _______________________________________________
>>>     Openembedded-core mailing list
>>>     Openembedded-core@lists.openembedded.org
>>>     <mailto:Openembedded-core@lists.openembedded.org>
>>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>

