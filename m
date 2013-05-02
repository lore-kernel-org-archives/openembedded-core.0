Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UXtbx-00060J-VI for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 15:32:05 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UXtKg-0000Ui-JS; Thu, 02 May 2013 15:13:58 +0200
Message-ID: <1367500437.14512.249.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 02 May 2013 14:13:57 +0100
In-Reply-To: <CAJTo0LZf1D75XU5CUWqyvNbY5A1kbXufiJDBKmc-Bmf9RxAjCQ@mail.gmail.com>
References: <1367497165.14512.247.camel@phil-desktop.brightsign>
	<CAJTo0LZf1D75XU5CUWqyvNbY5A1kbXufiJDBKmc-Bmf9RxAjCQ@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-runtime: Avoid error when trying to remove nonexistent directories
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
X-List-Received-Date: Thu, 02 May 2013 13:32:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-02 at 13:54 +0100, Burton, Ross wrote:
> On 2 May 2013 13:19, Phil Blundell <pb@pbcl.net> wrote:
> > If we didn't build libgomp then we won't have installed anything into
> > ${infodir} or ${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude.  Check
> > whether those directories exist before trying to remove them, else we
> > will lose.
> 
> Isn't it neater to use rm -rf?

The original code goes to some trouble to use "rmdir
--ignore-fail-on-non-empty", which I assume means that there are some
circumstances where those directories do contain other files that we
want to keep.  Using "rm -rf" would obviously blow the whole thing away.

p.




