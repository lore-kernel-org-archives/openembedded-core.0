Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RZAkB-00005E-Cj for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 01:24:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBA0HtC1008335
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 00:17:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08250-02 for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 00:17:50 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBA0HmoP008329
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 00:17:49 GMT
Message-ID: <1323476279.5309.205.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 10 Dec 2011 00:17:59 +0000
In-Reply-To: <cover.1323475141.git.elizabeth.flanagan@intel.com>
References: <cover.1323475141.git.elizabeth.flanagan@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] License: dash fix, deb support and ast parse fix
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
X-List-Received-Date: Sat, 10 Dec 2011 00:24:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-12-09 at 16:05 -0800, Beth Flanagan wrote:
> Three patches here, one of which requires 4a13766c7b223d.
> 
> - Fixed the bashism during license manifest creation.
> - Add deb as a valid pkg type for manifest creation. This requires 4a137766c
> - Handle LICENSE fields that ast chokes on nicer.
> 
> The following changes since commit af7fbd6083f4b5f1770e58fe0a2262951037c176:
> 
>   connman: disable ntp support (2011-12-09 19:18:24 +0000)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib eflanagan/license_fixes
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/license_fixes
> 
> Elizabeth Flanagan (3):
>   license.bbclass: remove bashism.
>   license.bbclass: remove deb exlusion
>   license/copyleft: exception for ast parse

Merged to master, thanks.

Richard



