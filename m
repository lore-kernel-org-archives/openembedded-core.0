Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6aRj-0003qO-TO for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 05:59:36 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M40Usd020228 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 05:00:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7HsXEMwyzxCf
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 05:00:30 +0100 (BST)
Received: from [10.251.10.153] ([192.102.205.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M40LcA020224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 05:00:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 04:54:00 +0100
In-Reply-To: <683e143afdf821e4531850e2ae4c0dfd3e25798c.1316659695.git.dongxiao.xu@intel.com>
References: <cover.1316659695.git.dongxiao.xu@intel.com>
	<683e143afdf821e4531850e2ae4c0dfd3e25798c.1316659695.git.dongxiao.xu@intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316663655.13622.6.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] libglade: fix the python environment settings
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
X-List-Received-Date: Thu, 22 Sep 2011 03:59:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 10:51 +0800, Dongxiao Xu wrote:
> @PYTHON@ will points to the abstract path in sysroot, which should be
> replaced by "#!/usr/bin/env python".
> 
> This should fix the sato-sdk rootfs error.
> 
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>

Merged to master with a patch header added, thanks.

Richard



