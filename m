Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TztyS-0006if-IA
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 20:02:36 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jan 2013 10:46:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,554,1355126400"; d="scan'208";a="277595724"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.77])
	by orsmga002.jf.intel.com with ESMTP; 28 Jan 2013 10:46:53 -0800
Message-ID: <5106C79D.2050606@linux.intel.com>
Date: Mon, 28 Jan 2013 10:46:53 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Yevhen Kyriukha <kirgene@gmail.com>
References: <CADV-EXF+r-Bj08253OJ+Dga5TfgSS7CrLQtAeaTDVc5hSxZbWg@mail.gmail.com>
In-Reply-To: <CADV-EXF+r-Bj08253OJ+Dga5TfgSS7CrLQtAeaTDVc5hSxZbWg@mail.gmail.com>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Do not build initramfs
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
X-List-Received-Date: Mon, 28 Jan 2013 19:02:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/28/2013 08:05 AM, Yevhen Kyriukha wrote:
> I want to build an image ("core-image-minimal" for example) without
> initramfs support.
> How can I do it?
> 
> When I run "bibake core-image-minimal" I'm getting 2 image types: the
> actual image with needed packages and initramfs image.

Check the dependency chain to see what pulls in the initramfs, but you
can drop the live image target as that definitely requires it.

Are you just trying to reduce your build time?


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


