Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB9160272
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 01:33:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9V1WTIl004017
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Oct 2018 18:33:10 -0700
Received: from [128.224.162.215] (128.224.162.215) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 30 Oct 2018 18:32:23 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1540885980-278826-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0LYGn-tUcgjwMo1801RARVivebmW=sm-dkzy7hdSbjzQuw@mail.gmail.com>
	<CAJTo0LYHiG2Q149oQrCfJnMY3Si3rC8zrQ7hC7U7U89igSfD5A@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5BD905FA.8090402@windriver.com>
Date: Wed, 31 Oct 2018 09:31:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYHiG2Q149oQrCfJnMY3Si3rC8zrQ7hC7U7U89igSfD5A@mail.gmail.com>
X-Originating-IP: [128.224.162.215]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: Update SRC_URI
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
X-List-Received-Date: Wed, 31 Oct 2018 01:33:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年10月31日 03:51, Burton, Ross wrote:
> It's back now.

Got it, thanks Ross!

Thanks,

>
> Ross
> On Tue, 30 Oct 2018 at 12:13, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> The machine is only down temporarily and should be back soon.  I don't
>> think we should merge this as we'll be reverting shortly.
>>
>> Ross
>> On Tue, 30 Oct 2018 at 07:53, <mingli.yu@windriver.com> wrote:
>>>
>>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>>
>>> The official repo for mtd-utils is git://git.infradead.org/mtd-utils.git,
>>> however there comes below error:
>>> $ git ls-remote git://git.infradead.org/mtd-utils.git
>>> fatal: unable to connect to git.infradead.org:
>>> git.infradead.org[0: 198.137.202.133]: errno=Connection timed out
>>> git.infradead.org[1: 2607:7c80:54:e::133]: errno=Network is unreachable
>>>
>>> Use the alternative one instead currently.
>>>
>>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>>> ---
>>>   meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
>>> index f53c6c1..b71c997 100644
>>> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
>>> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
>>> @@ -13,7 +13,7 @@ RDEPENDS_mtd-utils-tests += "bash"
>>>   PV = "2.0.2+${SRCPV}"
>>>
>>>   SRCREV = "bc63d36e39f389c8c17f6a8e9db47f2acc884659"
>>> -SRC_URI = "git://git.infradead.org/mtd-utils.git \
>>> +SRC_URI = "git://github.com/sigma-star/mtd-utils.git \
>>>              file://add-exclusion-to-mkfs-jffs2-git-2.patch \
>>>              file://0001-Revert-Return-correct-error-number-in-ubi_get_vol_in.patch \
>>>   "
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

