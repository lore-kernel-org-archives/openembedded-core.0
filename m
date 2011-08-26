Received: from lake.fysh.org ([81.94.195.195] ident=Debian-exim)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1QwstD-0003Ug-N5
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 11:39:51 +0200
Received: from deneb.mcrowe.com ([81.142.160.141])
	by lake.fysh.org with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69 #1 (Debian))
	id 1QwsXj-0006ts-Th; Fri, 26 Aug 2011 10:17:40 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.72)
	(envelope-from <mac@mcrowe.com>)
	id 1QwsXi-00024r-Uz; Fri, 26 Aug 2011 10:17:38 +0100
Date: Fri, 26 Aug 2011 10:17:38 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Saul Wold <sgw@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110826091738.GA7969@mcrowe.com>
References: <1314277168-4324-1-git-send-email-mac@mcrowe.com>
	<4E56A349.1090904@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4E56A349.1090904@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/2] kernel.bbclass: Find the kernel consistently.
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
X-List-Received-Date: Fri, 26 Aug 2011 09:39:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 25, 2011 at 12:32:25PM -0700, Saul Wold wrote:
> On 08/25/2011 05:59 AM, Mike Crowe wrote:
> >Use KERNEL_OUTPUT variable to find the generated kernel image rather than
> >duplicating the existing path. This also means it can be overridden simply.
> >
> There are other places in kernel.bbclass that use the path vs
> KERNEL_OUTPUT, is there a reason you did not change those also?

The patch came out of an earlier attempt to do what I was doing in
PATCH 2/2 and I hadn't needed to change the other places. :(

Looking at the other places now I think that the two in do_sizecheck
are candidates for changing to KERNEL_OUTPUT. I'm less sure about the
uImage ones in kernel_do_deploy due to there being other references to
arch/${ARCH}/boot/... nearby. I wouldn't want to make the code less
clear.

Updated patch follows.

Thanks for your comments.

Mike.


