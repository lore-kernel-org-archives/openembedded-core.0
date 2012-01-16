Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RmlpX-00075y-FR for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 13:38:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0GCUrUg019468;
	Mon, 16 Jan 2012 12:30:53 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19305-04; Mon, 16 Jan 2012 12:30:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0GCUhLY019462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 16 Jan 2012 12:30:44 GMT
Message-ID: <1326717048.532.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jan 2012 12:30:48 +0000
In-Reply-To: <1325911915-16001-4-git-send-email-steve@sakoman.com>
References: <1325911915-16001-4-git-send-email-steve@sakoman.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH RFC v2] dhcp: package /var/lib/dhcp with dhcp-client rather than dhcp-server
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
X-List-Received-Date: Mon, 16 Jan 2012 12:38:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 20:51 -0800, Steve Sakoman wrote:
> Otherwise dhclient encounters errors of this type:
> 
> dhclient: can't create /var/lib/dhcp/dhclient-c0c60402-0bc5-4bd7-bc3b-49a27fa37d72-eth1.lease: No such file or directory
> 
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-connectivity/dhcp/dhcp.inc      |    4 ++--
>  meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Merged to master, thanks.

Richard



