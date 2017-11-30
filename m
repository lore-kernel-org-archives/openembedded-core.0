Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 824A578434
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 02:23:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAU2NnB8022099
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Nov 2017 18:23:49 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 29 Nov 2017 18:23:43 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <7f75c29b-312b-2047-c002-a6c45b4b132b@windriver.com>
Date: Thu, 30 Nov 2017 10:23:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: About auto-upgrade-helper's enhancement
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
X-List-Received-Date: Thu, 30 Nov 2017 02:23:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Hi Anibal and Paul,

I tried auto-upgrade-helper, it is very helpful when upgrade recipes.
I'd like to make some enhancements to make it can be easily used by the
maintainer (recipe upgrader) himself:
1) Don't send email when maintainer uses it, for example, when I want to
    upgrade "strace", I don't need it send email to anyone.
2) Use git's user.name and user.email in git commit when not send email,
    we need let the maintainer take responsible for it.
3) Do the commit on the recipes when the upgrade is succeed, currently,
    it keeps the commit when failed, but removed it when succeed.
4) Make upgradehelper.py can accept multiple recipes as args.
5) It's a small tool and helpful when upgrade recipes, can we move it into
    oe-core/scripts, please ?

-- 
Thanks

Robert

