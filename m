Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 704137ECF9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 19:33:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6NJWxbu031143
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Jul 2019 12:33:19 -0700
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 23 Jul 2019 12:33:02 -0700
To: Anuj Mittal <anuj.mittal@intel.com>,
	<openembedded-core@lists.openembedded.org>, Zhao Yi <yi.zhao@windriver.com>
References: <20190723044052.29756-1-anuj.mittal@intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <f35a7ecf-7f25-aaf2-cf5b-ce4d89ed14f4@windriver.com>
Date: Tue, 23 Jul 2019 15:33:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723044052.29756-1-anuj.mittal@intel.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [PATCH] libsdl: CVE fixes
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
X-List-Received-Date: Tue, 23 Jul 2019 19:33:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 7/23/19 12:40 AM, Anuj Mittal wrote:
> Fixes CVE-2019-7572, CVE-2019-7574, CVE-2019-7575, CVE-2019-7576,
> CVE-2019-7577, CVE-2019-7578, CVE-2019-7635, CVE-2019-7637,
> CVE-2019-7638.

Wow, that a load of CVE fixes. Thanks Anuj!

Can you remind tell me why we need to keep libsdl_1.2.15?
It was deprecated 7 years ago:
    https://en.wikipedia.org/wiki/Simple_DirectMedia_Layer


$ cd .../oe-core.git
$ rgrep sdl * | grep -v sdl2 | \
    grep -v recipes-graphics/libsdl/libsdl[-_]1.2.15

...nothing that looks like a dependency on this version...

There are some dependencies in other layers so maybe we should
move this to meta-oe if those dependencies can't be changed to
libsdl2.

-- 
# Randy MacLeod
# Wind River Linux

