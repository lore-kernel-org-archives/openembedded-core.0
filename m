Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QUNCP-0003bh-1F
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 20:09:49 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QUN9A-00064Q-PO from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 11:06:28 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 8 Jun 2011 11:02:19 -0700
Received: from [172.30.36.148] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 8 Jun 2011 11:06:27 -0700
Message-ID: <4DEFBA1F.9040304@mentor.com>
Date: Wed, 8 Jun 2011 11:06:23 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1307540102.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1307540102.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 08 Jun 2011 18:02:19.0844 (UTC)
	FILETIME=[35A31040:01CC2606]
Subject: Re: [PATCH 0/1] Fix "ip route get"
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
X-List-Received-Date: Wed, 08 Jun 2011 18:09:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/08/2011 06:44 AM, Paul Eggleton wrote:
> The following changes since commit 30101d4153aa8e116892063933b868d325bdd79c:
> 
>   distro tracking: Manual Updates (2011-06-06 23:51:26 -0700)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/iproute-2.6.37
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/iproute-2.6.37
> 
> Paul Eggleton (1):
>   iproute2: update to 2.6.37
> 
>  .../configure-cross.patch                          |    0
>  .../{iproute2_2.6.35.bb => iproute2_2.6.37.bb}     |    4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/iproute2/{iproute2-2.6.35 => iproute2-2.6.37}/configure-cross.patch (100%)
>  rename meta/recipes-connectivity/iproute2/{iproute2_2.6.35.bb => iproute2_2.6.37.bb} (50%)

2.6.38 is current (and in oe.dev), so why not that one?

-- 
Tom Rini
Mentor Graphics Corporation


