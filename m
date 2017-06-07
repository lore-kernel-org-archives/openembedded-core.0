Return-Path: <jan.kiszka@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id E834E781AD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 16:29:30 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v57GTR6b006224
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 7 Jun 2017 18:29:27 +0200
Received: from md1f2u6c.ww002.siemens.net ([139.25.68.37])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v57GTRhe017356;
	Wed, 7 Jun 2017 18:29:27 +0200
To: "Burton, Ross" <ross.burton@intel.com>, Martin Kelly <mkelly@xevo.com>
References: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
	<2af19119-fac3-8ce3-fb36-c4aaf64163b7@xevo.com>
	<4e18dc00-1800-f2dd-797a-7e0a380467c4@xevo.com>
	<b51b0f8b-e21b-087b-5225-38fb8040479f@siemens.com>
	<8098d7e7-b887-4c4f-6dba-db9065c97571@xevo.com>
	<CAJTo0LbrkS8oG1s05KcMu6mREZwd-+h2aGwo7cLXjJc08XrMeA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2914be45-1aa7-42ae-3771-20b2896a659a@siemens.com>
Date: Wed, 7 Jun 2017 18:29:26 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbrkS8oG1s05KcMu6mREZwd-+h2aGwo7cLXjJc08XrMeA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcf-agent: Fix daemon termination
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
X-List-Received-Date: Wed, 07 Jun 2017 16:29:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-06-07 18:08, Burton, Ross wrote:
> 
> On 6 June 2017 at 18:28, Martin Kelly <mkelly@xevo.com
> <mailto:mkelly@xevo.com>> wrote:
> 
>     I sent a separate patch for fixing the systemd issue, so I think we
>     can merge the two patches separately (they're both needed):
> 
>     https://patchwork.openembedded.org/patch/140355/
>     <https://patchwork.openembedded.org/patch/140355/>
> 
>     Neither of our patches have been merged yet.
> 
> 
> Sorry, somehow slipped through the net.
> 
> This patch doesn't apply as it's been corrupted by the mailer.  Please
> use git-send-email instead of copy/pasting (I've managed to apply it
> manually as it's a simple patch this time).

GnuPG signatures cause troubles... I added to my blacklist.

Sorry,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux

