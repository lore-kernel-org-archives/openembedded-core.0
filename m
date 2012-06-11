Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Se4Ji-0006z6-3W for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 15:05:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5BCtOKB014944
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 13:55:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14910-01 for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 13:55:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5BCtGV1014938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 13:55:17 +0100
Message-ID: <1339419319.30460.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jun 2012 13:55:19 +0100
In-Reply-To: <1339166898-11667-1-git-send-email-laurentiu.palcu@intel.com>
References: <1339166898-11667-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] Package upgrades: freetype, tzdata, ethtool, menu-cache
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
X-List-Received-Date: Mon, 11 Jun 2012 13:05:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-08 at 17:48 +0300, Laurentiu Palcu wrote:
> Tests done:
> 	- packages compile fine on all architectures;
> 	- basic functionality:
> 		* ethtool - ran ethtool directly;
> 		* menu-cache - ran pcmanfm;
> 		* tzdata - it's just a database;
> 		* freetype - ran matchbox-keyboard;
> 
> Laurentiu Palcu (4):
>   freetype: upgrade to 2.4.9
>   tzdata: upgrade to 2012c
>   ethtool: upgrade to 3.2
>   menu-cache: upgrade to 0.3.3

Merged to master, thanks.

Richard



