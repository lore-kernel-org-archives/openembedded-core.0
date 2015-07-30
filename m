Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id F0B0E7632C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 08:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 971BF1810B;
	Thu, 30 Jul 2015 10:32:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id tvYoe2P4ZUru; Thu, 30 Jul 2015 10:32:41 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 2541A180CB;
	Thu, 30 Jul 2015 10:32:41 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 0184A100C;
	Thu, 30 Jul 2015 10:32:41 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id EA1F3E1F;
	Thu, 30 Jul 2015 10:32:40 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id E7BB13E049;
	Thu, 30 Jul 2015 10:32:40 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0; Thu, 30 Jul 2015
	10:32:40 +0200
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 8D3509C68B; 
	Thu, 30 Jul 2015 10:32:40 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <55B9CD93.1000902@windriver.com>
References: <cover.1438161068.git.liezhi.yang@windriver.com>
	<5755146.lYtmNt1cvb@peggleto-mobl.ger.corp.intel.com>
	<55B8A89A.6050406@windriver.com> <1438170429-sup-8609@axis.com>
	<CAP9ODKob+TVBpb1jrzVueZT0w2DQpP5X0YBAwy-RFEoh615rHw@mail.gmail.com>
	<1438239812-sup-93@axis.com> <55B9CD93.1000902@windriver.com>
Date: Thu, 30 Jul 2015 10:32:40 +0200
Message-ID: <1438244164-sup-163@axis.com>
User-Agent: Sup/0.20.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] bitbake.conf: add GITHUB_GIT
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
X-List-Received-Date: Thu, 30 Jul 2015 08:32:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Excerpts from Robert Yang's message of 2015-07-30 09:09:07 +0200:
> PREMIRRORS is for all the recipes/protocols ?

No, PREMIRRORS is quite expressive, for instance:

PREMIRRORS = " \
  https?$://downloads.example.org$/.*   http://mirror.example.com/ \n \
"

This should only premirror downloads.example.com files, fetched via http
or https. See the bitbake fetcher's uri_replace method in
bitbake/lib/bb/fetch2/__init__.py for the implementation.

-- 
olof johansson

