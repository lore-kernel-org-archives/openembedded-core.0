Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6B25678281
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 03:11:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6Q3BsJ5013314
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 20:11:55 -0700 (PDT)
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Jul 2017 20:11:54 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1500348040.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <c11f6dca-866f-5f43-4e2b-d2ad0dc84c18@windriver.com>
Date: Wed, 26 Jul 2017 11:11:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <cover.1500348040.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/5] runqemu: 5 fixes
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
X-List-Received-Date: Wed, 26 Jul 2017 03:11:54 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping.

// Robert

On 07/18/2017 11:21 AM, Robert Yang wrote:
> The following changes since commit ef68005a8c527e9b1d05b7769f0ec8ebe9ec3f91:
>
>   webkitgtk: Upgrade to 2.16.5 (2017-07-17 13:49:04 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/runqemu
>
> Robert Yang (5):
>   runqemu: add --debug and --quiet
>   runqemu: check qbconfload before running bitbake
>   runqemu: check tar.bz2 and .tar.gz
>   runqemu: validate combos
>   runqemu: chmod 0o777 for lockdir
>
>  scripts/runqemu | 64 ++++++++++++++++++++++++++++++++++++++-------------------
>  1 file changed, 43 insertions(+), 21 deletions(-)
>

