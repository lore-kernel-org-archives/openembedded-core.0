Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1Szya6-0004u3-65
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Aug 2012 01:25:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7ANDZiL014674
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 16:13:35 -0700 (PDT)
Received: from e6410-2 (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 10 Aug 2012 16:13:35 -0700
Date: Fri, 10 Aug 2012 18:13:22 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120810181322.22696f5d@e6410-2>
In-Reply-To: <2b1b028b5ad68154cd4a2a2ebd7cc2ff03b50b2b.1344639098.git.peter.seebach@windriver.com>
References: <cover.1344639098.git.peter.seebach@windriver.com>
	<2b1b028b5ad68154cd4a2a2ebd7cc2ff03b50b2b.1344639098.git.peter.seebach@windriver.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] base.bbclass: Expand PNBLACKLIST across multilibs too
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
X-List-Received-Date: Fri, 10 Aug 2012 23:25:26 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Fri, 10 Aug 2012 17:57:59 -0500
Peter Seebach <peter.seebach@windriver.com> wrote:

> The PNBLACKLIST feature does not currently work with multilibs,
> because they have different ${PN}. The obvious thing to do is to
> do this at the same point that we do the PREFERRED_PROVIDER
> and PREFERRED_VERSION fixups. (Making the PNBLACKLIST check
> do the for-each-multilib check requires it to do the multilib
> list generation repeatedly.)
> ---

Oh, look, I forgot my Signed-off-by again. I've updated the
seebs/blacklist tree on contrib with fixed commits.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


