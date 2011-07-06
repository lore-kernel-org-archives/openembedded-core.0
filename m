Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QeLrI-0003Ao-CR
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 08:45:16 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Wed, 6 Jul 2011
	08:41:26 +0200
From: Anders Darander <anders@chargestorm.se>
Organization: ChargeStorm AB
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jul 2011 08:41:29 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.39-2-amd64; KDE/4.6.4; x86_64; ; )
References: <cover.1309877488.git.anders@chargestorm.se>
In-Reply-To: <cover.1309877488.git.anders@chargestorm.se>
MIME-Version: 1.0
Message-ID: <201107060841.29809.anders@chargestorm.se>
Subject: Re: [PATCH 0/1] Remove exported KERNEL_SOURCE
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
X-List-Received-Date: Wed, 06 Jul 2011 06:45:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


* Anders Darander Anders Darander <anders@chargestorm.se> [07/05/11 04:52 PM]:
> Remove KERNEL-SOURCE as an exported variable.
> When building an external module the
> STAGING_KERNEL_DIR variable can justbas well be used in
> the module recipe.

There is an alternative solution, which is to instead of removing the line
 export KERNEL_SOURCE = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-
source')}"
replace it with something like:
export KERNEL_SOURCE = "${STAGING_KERNEL_DIR}"

The only benefit from that solution is to prevent breaking of recipes when 
moving from oe.dev to oe-core. However, I prefer the original solution as we 
otherwise would have more redundant variables.

Regards,
Anders


