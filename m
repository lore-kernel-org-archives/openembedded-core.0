Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SaJIR-0006Pb-MB
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 06:17:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5146h5C013390
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 May 2012 21:06:43 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 31 May 2012 21:06:42 -0700
Date: Thu, 31 May 2012 23:06:33 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120531230633.70344cfb@wrlaptop>
In-Reply-To: <367a51d945217c0a11caab13e71fe83a557a6872.1338515870.git.chris_larson@mentor.com>
References: <cover.1338515870.git.chris_larson@mentor.com>
	<367a51d945217c0a11caab13e71fe83a557a6872.1338515870.git.chris_larson@mentor.com>
X-Mailer: Claws Mail 3.7.8 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/3] external-sourcery: extract src and dest sysroot paths from gcc
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
X-List-Received-Date: Fri, 01 Jun 2012 04:17:08 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Thu, 31 May 2012 19:00:04 -0700
Christopher Larson <kergoth@gmail.com> wrote:

> +CSL_MULTILIB_ARGS[i586] = "-msgxx-glibc"
> +CSL_MULTILIB_ARGS[i686] = "-msgxx-glibc"
> +CSL_MULTILIB_ARGS[core2] = "-msgxx-glibc"
> +CSL_MULTILIB_ARGS[x86] = "-msgxx-glibc"
> +CSL_MULTILIB_ARGS[x86-64] = "-msgxx-glibc"
> +CSL_MULTILIB_ARGS[ppce500] = "-te500v1"
> +CSL_MULTILIB_ARGS[ppce500mc] = "-te500mc"
> +CSL_MULTILIB_ARGS[ppce500v2] = "-te500v2"
> +CSL_MULTILIB_ARGS[ppce600] = "-te600"

I would suggest that these be ?= assignments.

Rationale:  There is more than one Sourcery toolchain out there, and
they sometimes differ in these.  It'd be nice if a hypothetical vendor
using a hypothetical custom variant of the Sourcery toolchain could use
these configuration files with nothing more than a few variable
assignments.  :)

I do quite like the cleanup.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


