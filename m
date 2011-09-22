Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6XOB-0000Fh-Mp for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 02:43:43 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M0icwK015675 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 01:44:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Pw4BIKX+nOdP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 01:44:38 +0100 (BST)
Received: from [10.251.10.153] ([192.102.205.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M0M66F015069
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 01:44:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 01:38:21 +0100
In-Reply-To: <ea5aa20a9c0bf3dbaadd97a3186cefdc97dadbbc.1316631873.git.dongxiao.xu@intel.com>
References: <cover.1316631873.git.dongxiao.xu@intel.com>
	<ea5aa20a9c0bf3dbaadd97a3186cefdc97dadbbc.1316631873.git.dongxiao.xu@intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316651902.13622.3.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] rootfs_rpm: two step installation
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
X-List-Received-Date: Thu, 22 Sep 2011 00:43:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 03:06 +0800, Dongxiao Xu wrote:
> Firstly we install a base image.
> Then install those multilib packages listed in MULTILIB_IMAGE_INSTALL.
> 
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  meta/classes/package_rpm.bbclass |   54 +++++++++++++++++++++++++++++++++++---
>  1 files changed, 50 insertions(+), 4 deletions(-)

Merged to master, thanks.

Richard



