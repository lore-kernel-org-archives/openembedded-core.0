Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F47E65CC2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 04:42:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5J4gWPf004432
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2016 21:42:32 -0700
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 18 Jun 2016 21:42:31 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1464059717.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <576622B6.3050805@windriver.com>
Date: Sun, 19 Jun 2016 12:42:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1464059717.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] tcl: fix sed command in do_install
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
X-List-Received-Date: Sun, 19 Jun 2016 04:42:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Ping.

meta-openembedded requires this:

commit 44ea80d3a3652741cefbbe02b29ed7be4696d914
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Fri Jun 10 16:31:03 2016 +0200

     postgresql: blacklist because tcl in oe-core is broken for last month

     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


// Robert

On 05/24/2016 11:15 AM, Robert Yang wrote:
> The following changes since commit d6241e4c94a0a72acfc57e96a59918c0b2146d65:
>
>    useradd: Fix infinite build loop (2016-05-23 10:33:39 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/tcl
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/tcl
>
> Robert Yang (1):
>    tcl: fix sed command in do_install
>
>   meta/recipes-devtools/tcltk/tcl_8.6.4.bb | 2 --
>   1 file changed, 2 deletions(-)
>

