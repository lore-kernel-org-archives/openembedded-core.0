Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1TPuTz-0008RA-GY for openembedded-core@lists.openembedded.org;
	Sun, 21 Oct 2012 14:18:19 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1TPu2d-0004EJ-H2 for openembedded-core@lists.openembedded.org;
	Sun, 21 Oct 2012 13:50:03 +0200
Received: from 91-66-230-199-dynip.superkabel.de ([91.66.230.199])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2012 13:50:03 +0200
Received: from holger by 91-66-230-199-dynip.superkabel.de with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2012 13:50:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Holger Freyther <holger@freyther.de>
Date: Sun, 21 Oct 2012 07:42:45 +0000 (UTC)
Message-ID: <loom.20121021T094018-148@post.gmane.org>
References: <1350064876-11475-1-git-send-email-holger@moiji-mobile.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 91.66.230.199 (Mozilla/5.0 (X11;
	Linux i686) AppleWebKit/537.1 (KHTML, like Gecko)
	Chrome/21.0.1180.89 Safari/537.1)
Subject: Re: [PATCH] kernel.bbclass: Do not chdir to /boot before	running update-alternatives
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Oct 2012 12:18:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther <holger@...> writes:

> 
> The symlink from uImage-3... to uImage is not created at image creation
> time and not properly update on kernel upgrades. This is fixed by removing
> the chdir. The other users of update-alternative do not change the directory
> before calling it.

Hi,

this patch has not been merged, nor has it received any comments. The symlink
creation for uImage is broken right now and I would be very happy if it could
be fixed.

holger



