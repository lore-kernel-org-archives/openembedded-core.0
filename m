Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UAPKI-0003cf-04 for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 19:32:30 +0100
Received: from cpc14-cmbg17-2-0-cust423.5-4.cable.virginmedia.com
	([86.14.229.168] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UAP4V-0002L9-59; Tue, 26 Feb 2013 19:16:11 +0100
Message-ID: <1361902512.22501.51.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 26 Feb 2013 18:15:12 +0000
In-Reply-To: <cover.1361862860.git.liezhi.yang@windriver.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/7] Create ext* filesystems using debugfs
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
X-List-Received-Date: Tue, 26 Feb 2013 18:32:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-02-26 at 17:24 +0800, Robert Yang wrote:
>     Before:
>     $ time bitbake core-image-minimal
>     
>     real    1m10.823s
>     user    0m37.108s
>     sys     0m15.894s
>     
>     After:
>     $ time bitbake core-image-minimal
>     
>     real    1m17.501s
>     user    0m29.304s
>     sys     0m20.731s
>     
>     # 7 seconds lost.
>   
>   - For a core-image-sato generation (IMAGE_FSTYPES="tar.bz2 ext3"):
>   
>     Before:
>     $ time bitbake core-image-sato
>     
>     real    11m10.645s
>     user    2m43.503s
>     sys     1m1.589s
>     
>     After:
>     $ time bitbake core-image-sato
>     
>     real    11m53.131s
>     user    3m18.988s
>     sys     2m8.350s
>     
>     # 43 seconds lost.
>   
> * The rootfs size changes
>   - The image size are the same by "ls -h", but different by "du -sh":
>     (core-image-sato)
>   
>     $ ls -lh BEFORE.rootfs.ext3 AFTER.rootfs.ext3 | awk '{print $5"\t"$NF}'
>     357M BEFORE.rootfs.ext3
>     357M AFTER.rootfs.ext3
>     
>     $ du -sh BEFORE.rootfs.ext3 AFTER.rootfs.ext3
>     238M    BEFORE.rootfs.ext3
>     357M    AFTER.rootfs.ext3

So, am I understanding correctly that your patch causes the rootfs
generation to take longer, and the resulting files to be bigger?  It
doesn't seem totally obvious to me that this is a good thing, and your
cover letter doesn't provide any other explanation for why the changes
are desirable.  Can you expand on the rationale for doing this?

Also, when sending patches for review, there is no point in sending a
series which adds a new file and then makes changes to it as separate
patches (in particular when the changes are just whitespace).  Please
squash those into a single patch before posting them on the list.

thanks

p.



