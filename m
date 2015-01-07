Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 950B065CDB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 01:26:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t071QVbg025204
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jan 2015 17:26:32 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 17:26:31 -0800
Message-ID: <54AC8B46.8020206@windriver.com>
Date: Wed, 7 Jan 2015 09:26:30 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Chong Lu <Chong.Lu@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1414720498.git.Chong.Lu@windriver.com>
In-Reply-To: <cover.1414720498.git.Chong.Lu@windriver.com>
Subject: Re: [PATCH V2 0/1] libxml2: fix python path and add libxml2-python
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
X-List-Received-Date: Wed, 07 Jan 2015 01:26:33 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Ping, the target createrepo can't work without this patch.

// Robert

On 10/31/2014 09:56 AM, Chong Lu wrote:
> Change since v1:
> add python to PACKAGECONFIG.
>
> The following changes since commit 4faca22b8fe63a86d820990207aaf84b3fa83e01:
>
>    ref-manual: Updates to the migrating to YP 1.7 section. (2014-10-28 22:31:18 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib chonglu/libxml2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/libxml2
>
> Robert Yang (1):
>    libxml2: fix python path and add libxml2-python
>
>   meta/recipes-core/libxml/libxml2.inc | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
>

