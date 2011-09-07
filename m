Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R1QCe-0001tw-1s for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 00:02:40 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87M3YeT029311 for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 23:03:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id e5EjlrTc235k
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2011 23:03:34 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87M3Sop029288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 23:03:30 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <ebc08824e0f440526c40294f873e62b99daa7e1c.1315415799.git.sgw@linux.intel.com>
References: <cover.1315415799.git.sgw@linux.intel.com>
	<ebc08824e0f440526c40294f873e62b99daa7e1c.1315415799.git.sgw@linux.intel.com>
Date: Wed, 07 Sep 2011 22:57:25 +0100
Message-ID: <1315432645.13021.26.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PULL v3 1/1] gcc: add patch for ice 50099, which caused lttng-ust not to build
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
X-List-Received-Date: Wed, 07 Sep 2011 22:02:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-07 at 10:19 -0700, Saul Wold wrote:
> [YOCTO #1381]
> 
> This patch came from from GCC Bugzilla via Khem
> 
> Cc: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
>  .../gcc/gcc-4.6/fix-for-ice-50099.patch            |   49 ++++++++++++++++++++
>  2 files changed, 51 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-50099.patch

Merged to master, thanks.

Richard



