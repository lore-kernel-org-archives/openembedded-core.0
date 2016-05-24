Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82C5B60721
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 07:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E0AB61814E;
	Tue, 24 May 2016 09:35:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 0vjPw4egxeEx; Tue, 24 May 2016 09:35:47 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 41F701814A;
	Tue, 24 May 2016 09:35:47 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 249011ABD;
	Tue, 24 May 2016 09:35:47 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 17C4717AA;
	Tue, 24 May 2016 09:35:47 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 1665EDF4;
	Tue, 24 May 2016 09:35:47 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id EBA4C9C09F; Tue, 24 May 2016 09:35:54 +0200 (CEST)
Date: Tue, 24 May 2016 09:35:54 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Message-ID: <20160524073554.GS21318@axis.com>
References: <1463788963-31316-1-git-send-email-paul.gortmaker@windriver.com>
	<20160521101858.GP21318@axis.com>
	<20160523180908.GE27984@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20160523180908.GE27984@windriver.com>
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
X-List-Received-Date: Tue, 24 May 2016 07:35:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16-05-23 14:09 -0400, Paul Gortmaker wrote:
> > On 16-05-20 20:02 -0400, Paul Gortmaker wrote:
> > > Several large distros are voting with their feet and actively
> > > reverting the change, as per what can be seen above for Debian.
> > 
> > To me, it sounds like you're saying that the Debian maintainer is
> > actively taking a stand against upstream, but the changelog makes
> > it sound more like a temporary thing.
> 
> I did write "... it doesn't appear that the coreutils folks are going
> to change the default back to the old way..."

What I lack from the (OE) commit message is that this should be
something temporary, just like in Debian. Instead, you write that
Debian "voted with their feet", when in fact, this is a
maintainer decision out of practical considerations. (As can be
understood from the debian/changelog.)

-- 
olofjn

