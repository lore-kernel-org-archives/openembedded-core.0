Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1ToQ3W-0003bD-5x
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 03:52:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBS2bMog007344
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2012 18:37:22 -0800 (PST)
Received: from [128.224.162.143] (128.224.162.143) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 27 Dec 2012 18:37:22 -0800
Message-ID: <50DD05E2.9000809@windriver.com>
Date: Fri, 28 Dec 2012 10:37:22 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1356310727.git.rongqing.li@windriver.com>
In-Reply-To: <cover.1356310727.git.rongqing.li@windriver.com>
Subject: Re: [PATCH 0/1] replace portmap with rpcbind
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
X-List-Received-Date: Fri, 28 Dec 2012 02:52:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Ping



this is a cleanup of below commit, please consider to merge it.

commit f63add40c6bdfb3a19e59ac28f7d2ae5597f5bfd
Author: Christopher Larson <kergoth@gmail.com>
Date:   Thu Jun 7 16:36:51 2012 -0700

     task-core-basic: drop portmap

     Both rpcbind and portmap are RPC port mappers. Having both is 
redundant. Chose
     rpcbind over portmap as rpcbind supports ipv6, nfs4, and builds 
without the
     glibc rpc headers, which have been obsoleted in glibc 2.14.

     Signed-off-by: Christopher Larson <kergoth@gmail.com>
     Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Thanks

-roy


On 12/24/2012 09:02 AM, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> *** BLURB HERE ***
> The following changes since commit 26bf8f6a047ccc0f73eaa40093afddabfce8ea1b:
>
>    gst-openmax: fix build with newer GLib (2012-12-17 17:53:33 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib roy/rpcbind
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/rpcbind
>
> Roy.Li (1):
>    replace portmap with rpcbind.
>
>   meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb |    2 +-
>   .../initscripts/initscripts-1.0/mountnfs.sh            |   16 ++++++++--------
>   meta/recipes-core/packagegroups/packagegroup-base.bb   |    2 +-
>   3 files changed, 10 insertions(+), 10 deletions(-)
>

-- 
Best Reagrds,
Roy | RongQing Li


