Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SwYLd-0005CW-3D
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:48:21 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Aug 2012 05:36:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="200914340"
Received: from unknown (HELO helios.localnet) ([10.252.121.41])
	by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2012 05:36:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: wenzong.fan@windriver.com
Date: Wed, 01 Aug 2012 13:36:40 +0100
Message-ID: <26353882.Yjs6pOGhmz@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <f0327f027aad26e2b31f4eca789e20b24881b50f.1343821674.git.wenzong.fan@windriver.com>
References: <cover.1343821674.git.wenzong.fan@windriver.com>
	<f0327f027aad26e2b31f4eca789e20b24881b50f.1343821674.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Cc: wfan@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] qt4: fix qt4-native build failure on SLED-11
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
X-List-Received-Date: Wed, 01 Aug 2012 12:48:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 01 August 2012 19:50:02 wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
> 
> This issue is that with C++ compiler process an old version of kernel
> header file, coincidently that file has a variable named 'new':
> 
> * 'embedded/qkbdtty_qws.cpp' include 'linux/vt.h';
> * '/usr/include/linux/vt.h' has below code on SLED-11.x:
>     + unsigned int new;
> 
> On mostly hosts it has been changed to: new -> newev.
> 
> [YOCTO #2845]
> 
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>

Could you please add the description and signed-off-by to the inner patch as 
well?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


