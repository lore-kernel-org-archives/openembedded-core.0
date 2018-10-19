Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3A474588
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 16:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 2552D184CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:06:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id AGiFJGTd7uxr
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:06:48 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 8E0FE18449
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:06:48 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3132D1E070
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:06:48 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 24F481E06A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:06:48 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:06:48 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id 18C251970
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 18:06:48 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 04B7A9C121; Fri, 19 Oct 2018 18:06:47 +0200 (CEST)
Date: Fri, 19 Oct 2018 18:06:47 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20181019160647.omhc2c4xiydxo577@axis.com>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <20181019160001.21686-1-olofjn@axis.com>
MIME-Version: 1.0
In-Reply-To: <20181019160001.21686-1-olofjn@axis.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] devtool-source.bbclass: Only create each patch branch once
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
X-List-Received-Date: Fri, 19 Oct 2018 16:06:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 18-10-19 18:00 +0200, Olof Johansson wrote:
> For conditonally applied patches based on SRC_URI overrides, the
> devtool-source class would try to create a new branch for each override
> assignment as a postfunc to do_patch, but if the same override was used
> multiple times, it would try to create the same branch multiple times,

Oops, this should have been a v2; should i repost? I'll repost
now, but let me know if this is redundant.

-- 
olofjn

