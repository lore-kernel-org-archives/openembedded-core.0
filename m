Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1USQWL-0006jO-S6
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 13:27:30 +0200
Message-ID: <516E8302.8090606@communistcode.co.uk>
Date: Wed, 17 Apr 2013 12:09:54 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1366195597-13363-1-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1366195597-13363-1-git-send-email-ml@communistcode.co.uk>
Subject: Re: [meta-oe][PATCHv2 1/2] net-snmp: fix failure when starting on system without pci bus
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 11:27:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 17/04/13 11:46, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> The snmpd daemon cannot start on platforms without a pci bus:
>
> snmpd[15460]: pcilib: Cannot open /proc/bus/pci
> snmpd[15460]: pcilib: Cannot find any working access method.
>
> snmpd should not depend on a PCI bus and should simply move on.
>
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>   .../recipes-extended/net-snmp/files/ifmib.patch    | 66 ++++++++++++++++++++++
>   .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |  1 +
>   2 files changed, 67 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/net-snmp/files/ifmib.patch
>

Apologies, wrong list.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



