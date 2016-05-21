Return-Path: <olof.johansson@axis.com>
X-Greylist: delayed 353 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 21 May 2016 10:24:46 UTC
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id EC05965CC2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 10:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id C24402E28D;
	Sat, 21 May 2016 12:18:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id NeHd3-gsxA4K; Sat, 21 May 2016 12:18:53 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 219292E216;
	Sat, 21 May 2016 12:18:53 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 00B031957;
	Sat, 21 May 2016 12:18:53 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id E995918D5;
	Sat, 21 May 2016 12:18:52 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id E7E4AF89;
	Sat, 21 May 2016 12:18:52 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 1A4809C09F; Sat, 21 May 2016 12:18:59 +0200 (CEST)
Date: Sat, 21 May 2016 12:18:58 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Message-ID: <20160521101858.GP21318@axis.com>
References: <1463788963-31316-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1463788963-31316-1-git-send-email-paul.gortmaker@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: revert upstream commit causing havoc with ls output
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
X-List-Received-Date: Sat, 21 May 2016 10:24:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16-05-20 20:02 -0400, Paul Gortmaker wrote:
> Several large distros are voting with their feet and actively
> reverting the change, as per what can be seen above for Debian.

To me, it sounds like you're saying that the Debian maintainer is
actively taking a stand against upstream, but the changelog makes
it sound more like a temporary thing.

From the changelog entry:
> * Disable default ls quoting for now to get the rest of 8.25
>   into testing. (Closes: #813164)

Could you add something in the commit message to make this
clearer?

-- 
olofjn

