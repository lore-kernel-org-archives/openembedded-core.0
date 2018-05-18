Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D97A74992
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 03:43:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4I3gdbO020800
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 May 2018 20:42:54 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 17 May 2018 20:42:28 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1526447201.git.Qi.Chen@windriver.com>
	<6d46c58082741876ffc994c6e37364b65fe16f1f.1526447201.git.Qi.Chen@windriver.com>
	<CAJTo0LZdoMNLNxyLg+T=F3+yZT8UGPi2XURdnETRHRT2VvR+RQ@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <78a4c6e8-3455-293a-c31a-6f08632f767c@windriver.com>
Date: Fri, 18 May 2018 11:44:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZdoMNLNxyLg+T=F3+yZT8UGPi2XURdnETRHRT2VvR+RQ@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oeqa/sdk/cases/buildgalculator.py: skip if gettext not available
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
X-List-Received-Date: Fri, 18 May 2018 03:43:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/17/2018 06:00 PM, Burton, Ross wrote:
> On 16 May 2018 at 06:07, Chen Qi <Qi.Chen@windriver.com> wrote:
>> +        if not (self.tc.hasPrefixedTargetPackage("gettext")):
>> +            raise unittest.SkipTest("GalculatorTest class: SDK doesn't contain gettext")
>    File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/meta/lib/oeqa/sdk/cases/buildgalculator.py",
> line 14, in setUpClass
>      if not (self.tc.hasPrefixedTargetPackage("gettext")):
> AttributeError: 'OESDKTestContext' object has no attribute
> 'hasPrefixedTargetPackage'
>
> Ross
>
Sorry for such an obvious mistake.

I've sent out V2.

Best Regards,

Chen Qi


