Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QQaN8-0003YU-Kv
	for openembedded-core@lists.openembedded.org;
	Sun, 29 May 2011 09:25:14 +0200
Received: by wwb17 with SMTP id 17so2550896wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2011 00:22:07 -0700 (PDT)
Received: by 10.227.204.148 with SMTP id fm20mr1621561wbb.38.1306653727117;
	Sun, 29 May 2011 00:22:07 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b10sm2259532wbh.43.2011.05.29.00.22.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 00:22:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DE192CF.5050508@intel.com>
Date: Sun, 29 May 2011 09:22:04 +0200
Message-Id: <807BF058-0201-46AC-8366-11854D9BE27E@dominion.thruhere.net>
References: <4DE192CF.5050508@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] license.bbclass: Infinite recursion of or nodes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 May 2011 07:25:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 29 mei 2011, om 02:26 heeft Elizabeth Flanagan het volgende geschreven:

> 
> This fixes two bugs. When populate_lic was hitting | it was going
> into an infinite recursion of the node.
> 
> Also, some LICENSE fields may start with "(". We want to avoid
> invalid python syntax here, so we strip out the whitespace.
> 
> Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
> ---
> meta/classes/license.bbclass |   15 ++++++++-------
> 1 files changed, 8 insertions(+), 7 deletions(-)


This doesn't apply for me with git am:

Applying: license.bbclass: Infinite recursion of or nodes
error: patch failed: meta/classes/license.bbclass:22
error: meta/classes/license.bbclass: patch does not apply
Patch failed at 0001 license.bbclass: Infinite recursion of or nodes
When you have resolved this problem run "git am --resolved".

or plain patch:
 
patching file meta/classes/license.bbclass
Hunk #1 FAILED at 22.
Hunk #2 FAILED at 77.
Hunk #3 FAILED at 97.
Hunk #4 FAILED at 106.
Hunk #5 FAILED at 119.
Hunk #6 FAILED at 130.
Hunk #7 FAILED at 157.




