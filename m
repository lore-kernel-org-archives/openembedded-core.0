Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SySTO-0007Zj-SQ
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 20:56:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q76IiSe3017991
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 11:44:28 -0700 (PDT)
Received: from e6410-2 (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Mon, 6 Aug 2012 11:44:28 -0700
Date: Mon, 6 Aug 2012 13:44:21 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120806134421.79416f4f@e6410-2>
In-Reply-To: <20120802174818.43aa2ad3@e6410-2>
References: <cover.1343937363.git.andrei@gherzan.ro>
	<fe3056c0364345c518f66266a7f92c1116763156.1343937363.git.andrei@gherzan.ro>
	<20120802174818.43aa2ad3@e6410-2>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] pseudo: Use fxstatat64 in unlinkat
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
X-List-Received-Date: Mon, 06 Aug 2012 18:56:15 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Thu, 2 Aug 2012 17:48:18 -0500
Peter Seebach <peter.seebach@windriver.com> wrote:

> I think probably the right solution is to use the PSEUDO_STATBUF logic
> that's already in ports, and expand on it a bit.

A followup:

I've got a test version of this tagged PSEUDO_1_4_1. I've got one
report about a cryptic error from tar (see yocto #2881 for some
discussion), but would be really interested in feedback from anyone who
is using 32-bit systems with this stuff.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


