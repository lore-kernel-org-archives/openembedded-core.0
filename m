Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S9vXF-0000Bv-7D for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 10:39:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2K9USnD007930;
	Tue, 20 Mar 2012 09:30:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07784-02; Tue, 20 Mar 2012 09:30:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2K9UI2M007923
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 20 Mar 2012 09:30:19 GMT
Message-ID: <1332235820.9740.85.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 20 Mar 2012 09:30:20 +0000
In-Reply-To: <1332168207-18894-1-git-send-email-eballetbo@iseebcn.com>
References: <1332168207-18894-1-git-send-email-eballetbo@iseebcn.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Subject: Re: [PATCH] alsa-utils: move ${datadir}/init files to alsactl package.
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
X-List-Received-Date: Tue, 20 Mar 2012 09:39:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-03-19 at 15:43 +0100, Enric Balletbo i Serra wrote:
> The alsa-utils-speakertest contains some files from ${datadir} directory
> that are not correct, the files from  ${datadir}/init directory should
> be included in alsa-utils-alsactl package instead.
> 
> This patch moves the ${datadir}/init files to alsactl package and fixes
> following error at boot stage:
> 
>   /usr/sbin/alsactl: parse:1655: Unable to open file '/usr/share/alsa/init/00main': No such file or directory
> 
> Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
> ---
>  meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)

Merged to master, thanks.

Richard



