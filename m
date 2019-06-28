Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6AC7E686
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 12:02:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5SC2R4I020349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 05:02:27 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Fri, 28 Jun 2019 05:02:27 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1561724112.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <9834fdd4-1352-4e4b-96ac-2b1f6ab2095a@windriver.com>
Date: Fri, 28 Jun 2019 20:03:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <cover.1561724112.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] devupstream.bbclass: Disable devupstream when multilib is enabled
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
X-List-Received-Date: Fri, 28 Jun 2019 12:02:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/28/19 8:15 PM, Robert Yang wrote:
> The following changes since commit 9f674a88c781c7092d5b3460922a1579b9fe4bf9:
> 
>    busybox: Fix typo in syslog initscript (2019-06-27 13:27:54 +0100)
> 
> are available in the git repository at:
> 
>    git://git.pokylinux.org/poky-contrib rbt/dev
>    http://git.pokylinux.org/cgit.cgi//log/?h=rbt/dev


Sorry, here should be oe-core, not poky:

   git://git.openembedded.org/openembedded-core-contrib rbt/dev
   http://cgit.openembedded.org//log/?h=rbt/dev

// Robert

> 
> Robert Yang (1):
>    devupstream.bbclass: Disable devupstream when multilib is enabled
> 
>   meta/classes/devupstream.bbclass | 6 ++++++
>   1 file changed, 6 insertions(+)
> 

