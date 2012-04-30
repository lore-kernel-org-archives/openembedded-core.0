Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SOxfx-00067h-HW
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 22:58:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3UKmkPc004778
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 13:48:46 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 30 Apr 2012 13:48:46 -0700
Date: Mon, 30 Apr 2012 15:48:23 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120430154823.3a4ea3ee@wrlaptop>
In-Reply-To: <4F9EF944.9080503@windriver.com>
References: <cover.1335815704.git.peter.seebach@windriver.com>
	<1a15132d9ff316a53f58764aad35bb09c5fbcf0e.1335815704.git.peter.seebach@windriver.com>
	<4F9EF944.9080503@windriver.com>
X-Mailer: Claws Mail 3.7.8 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] sanity.bbclass: Implement initial toolchain sanity checks
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
X-List-Received-Date: Mon, 30 Apr 2012 20:58:29 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Mon, 30 Apr 2012 15:42:44 -0500
Mark Hatle <mark.hatle@windriver.com> wrote:

> Is the above debugging?  (I suspect it is)  I suggest the following...

Actually, that one's intentional.  I originally did it for debugging,
but I thought it was super convenient to actually get a list of the CPU
feature set bitbake thought it was using.  We can't tell you whether
you picked the right features, but we can tell you what they are.

So for instance, with a qemux86 and a core2 lib32:

NOTE: Sanity-checking tuning 'x86-64' (default) features:
NOTE:   checking for conflicts: m64
NOTE:   checking for conflicts with: m32
NOTE:   m64: IA32e (x86_64) ELF64 standard ABI
NOTE: Sanity-checking tuning 'core2' (lib32) features:
NOTE:   m32: IA32 ELF32 standard ABI
NOTE:   core2: Enable core2 specific processor optimizations

I found this really handy, and left it there on purpose.  I could take
it out, and/or move it to somewhere else, but I really do like having
that information appear.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


