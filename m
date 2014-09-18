Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D3F77142A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 09:40:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8I9e30Y014105
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Sep 2014 02:40:04 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 18 Sep 2014 02:40:03 -0700
Message-ID: <541AA872.8090201@windriver.com>
Date: Thu, 18 Sep 2014 17:40:02 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1410879378.git.kai.kang@windriver.com>
	<CAJTo0LYPVqG9pPrTeMLyzjGH2=2mb7W6av4dYHJq5+ZZk+3r2A@mail.gmail.com>
In-Reply-To: <CAJTo0LYPVqG9pPrTeMLyzjGH2=2mb7W6av4dYHJq5+ZZk+3r2A@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Joe Slater <jslater@windriver.com>
Subject: Re: [PATCH 0/9] V2: Add machine qemuaarch64
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
X-List-Received-Date: Thu, 18 Sep 2014 09:40:07 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年09月17日 23:11, Burton, Ross wrote:
> On 16 September 2014 16:06, Kai Kang <kai.kang@windriver.com> wrote:
>> V2:
>> * fix kernel linux-yocto build faiure
>> * redefine position of dynamic linker from /lib to /lib64
>> * other fixes of userspace packages
>>
>> Test with Joe Slater's patches:
>> * siteinfo: account for 32 and 64 bit arm
>> * sysprof: add aarch64 support
> So aarch64 support really needs qemuarm64 in oe-core to be tested, and
> qemuarm64 is a new feature, and we froze for new features two weeks
> ago.  Blindly merging aarch64 patches that we can't currently test
> doesn't seem sensible.
>
> Could someone who is actually testing and working on the aarch64
> support (you?) manage a single branch that tracks master, so when 1.7
> branches off we can do a merge straight away.

OK. We will continue to work on arch aarch64 and do runtime tests.

--Kai

>
> Ross
>
>


-- 
Regards,
Neil | Kai Kang


