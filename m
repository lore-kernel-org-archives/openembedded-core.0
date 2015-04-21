Return-Path: <zhengjunling@huawei.com>
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [119.145.14.65])
	by mail.openembedded.org (Postfix) with ESMTP id 15BD6735FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 01:06:49 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKB48852; Tue, 21 Apr 2015 09:06:50 +0800 (CST)
Received: from [127.0.0.1] (10.111.55.101) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 21 Apr 2015 09:06:27 +0800
Message-ID: <5535A290.10502@huawei.com>
Date: Tue, 21 Apr 2015 09:06:24 +0800
From: Junling Zheng <zhengjunling@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1429260608-3505-1-git-send-email-zhengjunling@huawei.com>	
	<CAJ86T=VcRP1Fxc2+yb12K33TKqssuChAwHTAKjtAWyeMmqMrew@mail.gmail.com>	
	<553456B2.8090004@huawei.com>
	<1429542910.26983.13.camel@linuxfoundation.org>
In-Reply-To: <1429542910.26983.13.camel@linuxfoundation.org>
X-Originating-IP: [10.111.55.101]
X-CFilter-Loop: Reflected
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gmp: remove referencing paths from the build host
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
X-List-Received-Date: Tue, 21 Apr 2015 01:06:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 2015/4/20 23:15, Richard Purdie wrote:
> On Mon, 2015-04-20 at 09:30 +0800, Junling Zheng wrote:
>> On 2015/4/18 2:24, Andre McCurdy wrote:
>>> On Fri, Apr 17, 2015 at 1:50 AM, Junling Zheng <zhengjunling@huawei.com> wrote:
>>>> Currently ${D}${includedir}/gmp.h references the path of build host
>>>> incorrectly, remove it.
>>>>
>>>> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
>>>> ---
>>>>  meta/recipes-support/gmp/gmp.inc | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
>>>> index 558ee06..a80b356 100644
>>>> --- a/meta/recipes-support/gmp/gmp.inc
>>>> +++ b/meta/recipes-support/gmp/gmp.inc
>>>> @@ -26,4 +26,8 @@ EXTRA_OECONF += " --enable-cxx=detect"
>>>>  PACKAGES =+ "libgmpxx"
>>>>  FILES_libgmpxx = "${libdir}/libgmpxx${SOLIBS}"
>>>>
>>>> +do_install_append_class-target() {
>>>> +       sed -i "s+--sysroot=${STAGING_DIR_HOST}++g" ${D}${includedir}/gmp.h
>>>> +}
>>>
>>> It's possible that STAGING_DIR_HOST could contain '+' characters, so
>>> '|' would be a safer sed separator to use here.
>>>
>>
>> Ok, thanks for your suggestion:)
> 
> I fixed this one whilst merging it (faster than dropping and re-adding).
> 
> Cheers,
> 
> Richard
> 
> 
> 
Thanks:)

Cheers,

Junling


