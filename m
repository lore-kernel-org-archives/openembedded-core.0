Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FDC97FA78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 16:57:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9PGvPUG018436
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Oct 2019 09:57:26 -0700
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 25 Oct 2019 09:57:25 -0700
To: Trevor Gamblin <trevor.gamblin@windriver.com>, akuster808
	<akuster808@gmail.com>, <openembedded-core@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
References: <20191025122212.25687-1-trevor.gamblin@windriver.com>
	<cf553688-0f48-33ae-8c4c-18c7c34a5971@gmail.com>
	<370152d1-d96f-8863-4746-999422d85721@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <fac4b88a-2343-5d9c-e1d4-bff9b81a5d5b@windriver.com>
Date: Fri, 25 Oct 2019 12:57:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <370152d1-d96f-8863-4746-999422d85721@windriver.com>
X-Originating-IP: [172.25.44.8]
Subject: Re: [zeus][PATCH v3] binutils: fix CVE-2019-17450
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
X-List-Received-Date: Fri, 25 Oct 2019 16:57:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 10/25/19 11:05 AM, Trevor Gamblin wrote:
> It does, but I'm working on an upgrade for binutils to 2.33 for master 
> that I'll then apply this (and another CVE patch) on top of.

You should probably send the CVE fix to master so it gets tested there
even if there's an upgrade coming in a few days. It might take a while
for the upgrade to get merged.

Khem has been doing binutils upgrades recently.
CC him in case there needs to be some co-ordination with glibc or
other recipe upgrades.



-- 
# Randy MacLeod
# Wind River Linux

