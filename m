Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 074AF7874F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 08:25:27 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vAK8PKnT018344
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 20 Nov 2017 08:25:22 GMT
Message-ID: <1511166320.3952.182.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org, "Burton, Ross"
	<ross.burton@intel.com>
Date: Mon, 20 Nov 2017 08:25:20 +0000
In-Reply-To: <a1b36b8d-0380-2cd4-8774-9927d2dd28f4@windriver.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
	<a1b36b8d-0380-2cd4-8774-9927d2dd28f4@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 00/23] Fixes for multilib and eSDK
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Nov 2017 08:25:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-11-20 at 15:36 +0800, Robert Yang wrote:
> Would you please take a look at these patches ? The multilib image is
> broken (wrong packages are installed because of the allarch issues)
> without these fixes.

As noted in the weekly status report, we're having trouble with test
builds. Until we figure out why we're getting intermittent test
failures, patch merging is effectively stalled.

I'd note that was no respond to that status email so I'll just have to
assume everyone is fine for us to halt merging for the next few weeks
whilst we struggle to resolve it.

Cheers,

Richard





