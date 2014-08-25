Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C432B62252
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 19:14:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7PJE4qJ018065
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 12:14:05 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Mon, 25 Aug 2014 12:14:04 -0700
Message-ID: <53FB8AFB.7090406@windriver.com>
Date: Mon, 25 Aug 2014 14:14:03 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1408916479-31831-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1408916479-31831-1-git-send-email-akuster808@gmail.com>
Subject: Re: [PATCH 0/3] Add new tune files for IBM POWER5,6,7
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
X-List-Received-Date: Mon, 25 Aug 2014 19:14:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/14, 4:41 PM, Armin Kuster wrote:
> I believe these are new tune files. They add support for
> IBM's POWER[5,6,7] cpus. Minimally tested on qemuppc64.
> This is the first set of patches to add qemuppc64 support.
>
> Let me know if there are any issues with the format of these tune files.

Only a minor comment.. I'd prefer if the tunes were named 'tune-power5.inc', 
etc.. instead of 'ppcpower...'

But I can't say I care enough to say reject this.  :)  So if the existing names 
are already in use, I think thats enough of reason to let it in..

--Mark

>
>
> Armin Kuster (3):
>    IBM Power5: Add new tune file for PPC power5 cpu
>    IBM power6: Add new tune file for PPC power6
>    IBM power7: Add new tune file for PPC power7
>
>   meta/conf/machine/include/tune-ppcpower5.inc | 21 +++++++++++++++++++++
>   meta/conf/machine/include/tune-ppcpower6.inc | 21 +++++++++++++++++++++
>   meta/conf/machine/include/tune-ppcpower7.inc | 21 +++++++++++++++++++++
>   3 files changed, 63 insertions(+)
>   create mode 100644 meta/conf/machine/include/tune-ppcpower5.inc
>   create mode 100644 meta/conf/machine/include/tune-ppcpower6.inc
>   create mode 100644 meta/conf/machine/include/tune-ppcpower7.inc
>


