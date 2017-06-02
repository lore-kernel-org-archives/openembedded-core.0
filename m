Return-Path: <hayashi.kunihiko@socionext.com>
X-Greylist: delayed 2641 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 Jun 2017 17:00:18 UTC
Received: from www501.sakura.ne.jp (www501.sakura.ne.jp [59.106.13.151])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD6260043
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 17:00:18 +0000 (UTC)
Received: from [192.168.1.133] (zaq771a9e86.zaq.ne.jp [119.26.158.134])
	(authenticated bits=0)
	by www501.sakura.ne.jp (8.14.5/8.14.5) with ESMTP id v52GGEEx070407
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 3 Jun 2017 01:16:15 +0900 (JST)
	(envelope-from hayashi.kunihiko@socionext.com)
To: nicolas.dechesne@linaro.org
References: <CAP71WjxkYLeEaO5CfUjbEaON=j2pwRkjMDUxkyYafPAEt2qW1w@mail.gmail.com>
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Message-ID: <5f7f9187-8c25-e641-2d9f-88018201ad45@socionext.com>
Date: Sat, 3 Jun 2017 01:16:11 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjxkYLeEaO5CfUjbEaON=j2pwRkjMDUxkyYafPAEt2qW1w@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: KERNEL_IMAGETYPES and Image.gz
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
X-List-Received-Date: Fri, 02 Jun 2017 17:00:19 -0000
Content-Type: text/plain; charset=iso-2022-jp; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


On 2017/05/30 6:13, nicolas.dechesne@linaro.org (Nicolas Dechesne) wrote:
 > hi,
 >
 > i am trying to set  KERNEL_IMAGETYPES="Image.gz" in my machine conf
 > file. But it doesn't work. I am seeing this error during
 > kernel_do_compile():
 >
 > run.do_compile.30019: cannot open Image: No such file
 >
 > In fact the code snippet that tries to compress the Image file into
 > Image.gz expects the Image file to be in ${B}, but when compiling
 > kernel Image is actually in ${B}/arch/arm64/boot:
 >
 > $ find tmp-rpb-glibc/work/dragonboard_410c-linaro-linux/linux-linaro-qcomlt/
 > -name Image
 >  
tmp-rpb-glibc/work/dragonboard_410c-linaro-linux/linux-linaro-qcomlt/4.9-r0/build/arch/arm64/boot/Image
 >
 > The piece of code in question is in kernel.bbclass:
 >
 >   gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
 > It really sounds to me like something obvious is missing, i doubt I
 > would be the first one to try Image.gz..

I already suggested the patch to solve this issue.

https://patchwork.openembedded.org/patch/138596/

Although I've not received any comments on this yet, could you try to apply it?

 >
 > Any thoughts?
 >
 > thanks
 > nico
 >

Best Regards,
Kunihiko Hayashi

