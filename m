Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7620B60017
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 08:27:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3M8RkIX025636
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 01:27:47 -0700
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 22 Apr 2016 01:27:46 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1461033288.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5719E07B.90001@windriver.com>
Date: Fri, 22 Apr 2016 16:27:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1461033288.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/3] create-pull-request: 3 improvements (master branch only)
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
X-List-Received-Date: Fri, 22 Apr 2016 08:27:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


I updated the patches a little:

* Updated the env var to avoid confusion:
   CONTRIB_REMOTE -> CPR_CONTRIB_REMOTE
   CONTRIB_AUTO_PUSH -> CPR_CONTRIB_AUTO_PUSH


   git://git.openembedded.org/openembedded-core-contrib rbt/cpr
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/cpr

Robert Yang (3):
   create-pull-request: create branch on remote if not found
   create-pull-request: read remote from env var CONTRIB_REMOTE
   create-pull-request: set subject automatically for cover latter

// Robert

On 04/19/2016 10:45 AM, Robert Yang wrote:
> The following changes since commit e003ef038819c10f351bb8268b377626c95bb077:
>
>    toasterconf.json: Update for krogoth release (2016-04-18 16:48:58 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/cpr
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/cpr
>
> Robert Yang (3):
>    create-pull-request: create branch on remote if not found
>    create-pull-request: read remote from env var CONTRIB_REMOTE
>    create-pull-request: set subject automatically for cover latter
>
>   scripts/create-pull-request | 78 +++++++++++++++++++++++++--------------------
>   1 file changed, 43 insertions(+), 35 deletions(-)
>

