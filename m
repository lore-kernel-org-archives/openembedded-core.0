Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RRPXM-0002gv-5v for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 15:35:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAIESoq3030543
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 14:28:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29527-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 14:28:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAIEShXT030537
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 14:28:44 GMT
Message-ID: <1321626528.15352.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 Nov 2011 14:28:48 +0000
In-Reply-To: <1321481130-14072-1-git-send-email-jluebbe@debian.org>
References: <1321481130-14072-1-git-send-email-jluebbe@debian.org>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] libpcap: use binconfig class to deploy pcap-config
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
X-List-Received-Date: Fri, 18 Nov 2011 14:35:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-16 at 23:05 +0100, Jan Luebbe wrote:
> This fixes building of tcpdump on hosts where libpcap-dev is installed.
> Also introduce INC_PR.
> 
> Signed-off-by: Jan Luebbe <jluebbe@debian.org>
> ---
>  meta/recipes-connectivity/libpcap/libpcap.inc      |    4 +++-
>  meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb |    2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



