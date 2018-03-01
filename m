Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38D57788E8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 01:56:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w211ukwY028078
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 17:56:46 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.240) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 28 Feb 2018 17:56:19 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1517541572.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <e3cf27c3-1f2b-3959-92c3-6a24881dfd11@windriver.com>
Date: Thu, 1 Mar 2018 09:57:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1517541572.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/4] use qemuboot.json to replace qemuboot.conf
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
X-List-Received-Date: Thu, 01 Mar 2018 01:56:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping.

// Robert

On 02/02/2018 11:23 AM, Robert Yang wrote:
> The qemuboot.conf uses configparser which can't suport upper case as key, and
> json is more clearer than configparser and is widely used in oe-core, so use
> qemuboot.json to replace qemuboot.conf.
> 
> // Robert
> 
> The following changes since commit a0988c3374e964170d1d24fc230306b887432d31:
> 
>    tcmode-default.inc: drop preferred version of gzip-native (2018-01-31 17:01:12 +0000)
> 
> are available in the git repository at:
> 
>    git://git.openembedded.org/openembedded-core-contrib rbt/json
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/json
> 
> Robert Yang (4):
>    qemuboot.bbclass: qemuboot.conf -> qemuboot.json
>    runqemu: qemuboot.conf -> qemuboot.json
>    runqemu: check for qemuboot.conf and raise error
>    selftest/cases/runqemu.py: qemuboot.conf -> qemuboot.json
> 
>   meta/classes/qemuboot.bbclass           | 17 ++++----
>   meta/lib/oeqa/selftest/cases/runqemu.py | 12 +++---
>   scripts/runqemu                         | 73 +++++++++++++++++----------------
>   3 files changed, 52 insertions(+), 50 deletions(-)
> 

