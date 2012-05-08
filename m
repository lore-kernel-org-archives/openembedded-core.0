Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SRqCP-0004ep-50
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 21:35:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q48JQ0xD007963
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2012 12:26:00 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 8 May 2012 12:25:59 -0700
Date: Tue, 8 May 2012 14:25:58 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120508142558.5837dc31@wrlaptop>
In-Reply-To: <4FA971F0.8020406@windriver.com>
References: <20120508180256.GB3138@jama.jama.net>
	<4FA971F0.8020406@windriver.com>
X-Mailer: Claws Mail 3.7.8 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: CONFLICTS as keyword or just misspelled RCONFLICTS?
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
X-List-Received-Date: Tue, 08 May 2012 19:35:53 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Tue, 8 May 2012 14:20:16 -0500
Mark Hatle <mark.hatle@windriver.com> wrote:

> > BTW: IIRC TUNE_CONFLICTS/TUNECONFLICTS inconsistency was discussed
> > on ML already (I could not find that thread, but still it's used in
> > meta/conf/machine/include/arm  
> 
> Ya, patches to fix these, and actually check them were sent to the
> list, but I don't believe they have been merged yet.

I hadn't noticed TUNE_CONFLICTS, just TUNECONFLICT and TUNECONFLICTS.

As of this writing, I have two outstanding patches to do with that; I
think the consistency patch is in, but we're still waiting on
approval/more changes decisions on the sanity check implementation.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


