Return-Path: <lizhijian@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 4A93A6BBCE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 06:16:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,974,1367942400"; 
   d="scan'208";a="8328189"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 28 Aug 2013 14:13:31 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r7S6GY5E020040;
	Wed, 28 Aug 2013 14:16:35 +0800
Received: from [127.0.0.1] ([10.167.226.56])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013082814143878-1014993 ;
	Wed, 28 Aug 2013 14:14:38 +0800 
Message-ID: <521D95B8.1040601@cn.fujitsu.com>
Date: Wed, 28 Aug 2013 14:16:24 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
Organization: fnst-ulinux
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1377596639-26980-1-git-send-email-lizhijian@cn.fujitsu.com>
	<521BFA2A.4090508@linux.intel.com>
	<521C2BDB.3020503@cn.fujitsu.com>
	<521C4CBD.3070506@linux.intel.com>
In-Reply-To: <521C4CBD.3070506@linux.intel.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/08/28 14:14:38,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/08/28 14:14:39
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] grep-2.5.1a: fix grep for LSB compliance
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
X-List-Received-Date: Wed, 28 Aug 2013 06:16:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

at 2013-8-27 14:52, Saul Wold wrote:
> On 08/26/2013 09:32 PM, Li Zhijian wrote:
>> ...skip... at 2013-8-27 9:00, Saul Wold wrote:
>>>> diff --git a/meta/recipes-extended/grep/grep=5F2.5.1a.bb
>>>> b/meta/recipes-extended/grep/grep=5F2.5.1a.bb index
>>>> 088959c..d964d84 100644 ---
>>>> a/meta/recipes-extended/grep/grep=5F2.5.1a.bb +++
>>>> b/meta/recipes-extended/grep/grep=5F2.5.1a.bb @@ -5,7 +5,7 @@
>>>> SECTION =3D "console/utils" LICENSE =3D "GPLv2" LIC=5FFILES=5FCHKSUM =
=3D
>>>> "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3"
>>>>
>>>> -PR =3D "r2" +PR =3D "r3"
>>>>
>>>> SRC=5FURI =3D "${GNU=5FMIRROR}/grep/grep-${PV}.tar.bz2 \
>>>> file://uclibc-fix.patch \ @@ -13,8 +13,25 @@ SRC=5FURI =3D
>>>> "${GNU=5FMIRROR}/grep/grep-${PV}.tar.bz2 \ file://gettext.patch \
>>>> file://fix64-int-to-pointer.patch \ file://Makevars \ -
>>>> file://grep-CVE-2012-5667.patch \
>>>
>>> Why are you removing this patch?
>>>
>>> Will an update to 2.5.3 accomplish the same thing as these
>>> patches?
>>>
>>> Also all of your patches above are missing Upstream-Status and
>>> Signed-off-by:
>>>
>>> See the Patch Guildlines on OE-Core:
>>> http://www.openembedded.org/wiki/Commit=5FPatch=5FMessage=5FGuidelines
>>>
>>> Thanks
>>>
>>> Sau!
>>>
>>>
>> ...skip...
>>>> + file://grep-CVE-2012-5667.patch \
>> ...skip...
>>
>> Thank a lots for your comments.
>>
>> This patch is not removed ,it is here =E2=86=91
>>
>> I don't know what's fixed bettwen 2.5.1a an 2.5.3, but grep-2.5.3
>> LICENSE is GPLv3+ differed from 2.5.1a(GPLv2)
>>
>> The Guildlines is very helpful for me. But those patch is come from
>> grep-2.5.1-55.el5.src.rpm and I have not research this patch's
>> Upstream-Status and Signed-off-by So I am sorry about that
>>
>
> Please review the recipes and licenesing, since it seems the we might
> have multiple versions and the license fields are incorrect for both.
>
> If there are both v2 and v3 versions, we need to ensure which is correct.

As I known,
grep-2.5.1: GPL
grep-2.5.1a: GPLv2
grep-2.5.3 or later: GPLv3

I think both of them(2.5.1a and 2.14) are in the correct license right now.

Thanks
  Li

>
> Thanks
>     Sau!
>
>> Thanks Li,
>>
>>
>>
>
>


--=20
Best regards.
Li Zhijian (8555)


=

