Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UPY2b-0004LT-Tc for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 14:52:50 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39CkTpA012318; Tue, 9 Apr 2013 13:46:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id K2caPgdMnJTZ; Tue,  9 Apr 2013 13:46:29 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39CkKjW012311
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 9 Apr 2013 13:46:23 +0100
Message-ID: <1365510909.12407.79.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Radu Moisan <radu.moisan@intel.com>
Date: Tue, 09 Apr 2013 13:35:09 +0100
In-Reply-To: <1365438555-19397-1-git-send-email-radu.moisan@intel.com>
References: <1365438555-19397-1-git-send-email-radu.moisan@intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] udev: Move udevd back to /sbin
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
X-List-Received-Date: Tue, 09 Apr 2013 12:52:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-08 at 19:29 +0300, Radu Moisan wrote:
> Along with v182 upgrade udevd was moved to ${base_libdir}
> making scripts like init-live.sh to fail in finding udevd
> 
> Fixes [Yocto #4046]
> 
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  meta/recipes-core/udev/udev.inc    |    3 ++-
>  meta/recipes-core/udev/udev_182.bb |    2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

We needed a decision on this. I've rewritten the commit message and
merged it. Most of the feedback was about the commit message, not the
patch itself. There were also no better proposals for how we could
actually fix the bugs we were seeing.

Cheers,

Richard



