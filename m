Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 220DA71994
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 20:04:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v28K4UGK000647
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Mar 2017 12:04:30 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Mar 2017 12:04:29 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1488993907-13037-1-git-send-email-ross.burton@intel.com>
	<e1abebd7-dba3-0c61-a3cd-bdc5a9d39fab@windriver.com>
	<CAJTo0LbhUp_iYLyBX2VQd_P-ouZAjYqr8_vPLop2awoW-G3mhA@mail.gmail.com>
	<40cc8168-6fb5-6ff2-0ae2-497a36205727@windriver.com>
	<CAJTo0LZi3Ci+sbtrrXn9_4PEVkxZwVJ107nfq1ZQ5YWGWBB+zQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <726baa89-825d-4ad1-462c-9d97d4c8be22@windriver.com>
Date: Wed, 8 Mar 2017 14:04:28 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZi3Ci+sbtrrXn9_4PEVkxZwVJ107nfq1ZQ5YWGWBB+zQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: add gitupstream class
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
X-List-Received-Date: Wed, 08 Mar 2017 20:04:30 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 3/8/17 11:45 AM, Burton, Ross wrote:
> 
> On 8 March 2017 at 17:43, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
> 
>     Devtool can do something similar, create a custom recipe... but I don't believe
>     it has the ability to take an existing (patched) recipe, create a git tree
>     somewhere [external], and then make it available for modification.
> 
> 
> devtool modify RECIPE will generate this git repository for you, so doing that
> and then copying the git repo somewhere reachable seems like it mostly solves
> the problem?

Ahh I did not know that modify did that.  Thanks!

--Mark

> Ross


