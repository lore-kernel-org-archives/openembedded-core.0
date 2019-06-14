Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 596077E9AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 17:13:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5EHDUYP008374
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 10:13:31 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 14 Jun 2019 10:13:30 -0700
To: <openembedded-core@lists.openembedded.org>, "Li, Changqing"
	<changqing.li@windriver.com>
References: <20190614160229.6144-1-Randy.MacLeod@windriver.com>
	<20190614170112.2329.59911@do>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <db65a3d5-6b08-9232-28b2-3ab1bfd1e982@windriver.com>
Date: Fri, 14 Jun 2019 13:13:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614170112.2329.59911@do>
X-Originating-IP: [172.25.44.4]
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJ1dGlsLWxpbnV4OiBhZGQgc2V0cHJpdiB1dGlsaXQuLi4iIGFuZCAzIG1vcmUgKHJldjUp?=
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
X-List-Received-Date: Fri, 14 Jun 2019 17:13:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 6/14/19 1:01 PM, Patchwork wrote:
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>    Suggested fix    Rebase your series on top of targeted branch
>    Targeted branch  master (currently at ca737408bb)

This appears to be wrong.

 From my local repo:

$ git log --oneline  -6
3461af0c76 (HEAD -> bash-ptest) bash: use setpriv, sed.sed to run ptests
7ab387fcac ptest-runner: enable child procs as session leader
ef6ef10236 libcap-ng: split into libcap-ng/libcap-ng-python
11d5c1bbfd util-linux: add setpriv utility
ca737408bb (origin/master, origin/HEAD, master) <------ same id as above
             bluez: fix test case failures with GCC 9
c6b49cb752 kernel-fitimage: uboot-sign: Check UBOOT_DTB_BINARY before 
adding deps


I was setting the 'In-reply-to' field to the original thread so
perhaps patchtest is confused by that or I did something wrong since
I've rarely used that feature of git send-email.
-- 
# Randy MacLeod
# Wind River Linux

