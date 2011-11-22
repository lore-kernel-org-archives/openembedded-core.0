Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RSsPA-0004T5-VC for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 16:37:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAMFDk0U019969
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 15:13:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19166-08 for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 15:13:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAMFDdsM019963
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 15:13:40 GMT
Message-ID: <1321974825.18926.55.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 22 Nov 2011 15:13:45 +0000
In-Reply-To: <d9894a49df3ecfddba6961615f5e8a98d0c2c9c7.1321942325.git.edwin.zhai@intel.com>
References: <cover.1321942325.git.edwin.zhai@intel.com>
	<d9894a49df3ecfddba6961615f5e8a98d0c2c9c7.1321942325.git.edwin.zhai@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] matchbox-wm: Fix variable type in _NET_WORKAREA setting
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
X-List-Received-Date: Tue, 22 Nov 2011 15:37:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-22 at 14:15 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> According to XChangeProperty doc, array of "long" should be used when format is
> 32. Wrong _NET_WORKAREA parameter caused blank screen in matchbox-desktop on 64
> bit platform.
> 
> [YOCTO #1689] got fixed.
> 
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
>  .../matchbox-wm/matchbox-wm_git.bb                 |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



