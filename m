Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 04216731BC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 09:38:12 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 3D9F868A01C; Wed,  6 Apr 2016 10:38:11 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 7DA6368A019;
	Wed,  6 Apr 2016 10:38:10 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 1AB806740B48;
	Wed,  6 Apr 2016 11:38:10 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <cover.1459934955.git.liezhi.yang@windriver.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <5704D900.3000505@mlbassoc.com>
Date: Wed, 6 Apr 2016 11:38:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1459934955.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/2] Fixes for len(TMPDIR) == 410
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
X-List-Received-Date: Wed, 06 Apr 2016 09:38:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-04-06 11:30, Robert Yang wrote:
> The following changes since commit b2dc5a68e74dafedf7960ef77ad3d73912ed7960:
>
>    bdwgc: use github repo for source location (2016-04-05 11:48:09 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/long
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/long
>
> Robert Yang (2):
>    sanity.bbclass: fix a hardcode in check_path_length()
>    wget: fix build when len(TMPDIR) == 410
>
>   meta/classes/sanity.bbclass         | 2 +-
>   meta/recipes-extended/wget/wget.inc | 5 +++++
>   2 files changed, 6 insertions(+), 1 deletion(-)
>

How are these patches related and what is magic about a path length of 410?
Are you sure that it might not be 569 on my system for example?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

