Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S4B1H-0006tr-26 for openembedded-core@lists.openembedded.org;
	Sun, 04 Mar 2012 13:58:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q24Co0wS025573;
	Sun, 4 Mar 2012 12:50:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25293-02; Sun,  4 Mar 2012 12:49:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q24Cnn1P025566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 4 Mar 2012 12:49:52 GMT
Message-ID: <1330865393.7590.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 04 Mar 2012 04:49:53 -0800
In-Reply-To: <1330842274-13635-1-git-send-email-denis@denix.org>
References: <1330842274-13635-1-git-send-email-denis@denix.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] soc-family.inc: to be included in machine.conf to add SOC_FAMILY to MACHINEOVERRIDE
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
X-List-Received-Date: Sun, 04 Mar 2012 12:58:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-03-04 at 01:24 -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Add a soc-family.inc file that can be included in a machine.conf to enable
> the use of SOC_FAMILY in MACHINEOVERRIDE, which could be useful to group
> multiple machines with the same common base. Some examples can be seen in
> meta-ti BSP layer.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/conf/machine/include/soc-family.inc |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>  create mode 100644 meta/conf/machine/include/soc-family.inc

Merged to maser, thanks.

Richard



