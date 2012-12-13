Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1Tj46C-0006Cp-Uw
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 09:25:02 +0100
Received: from [192.168.0.2] (host86-137-81-183.range86-137.btcentralplus.com
	[86.137.81.183]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 060DE9BE3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2012 08:10:23 +0000 (GMT)
Message-ID: <50C98D6F.8050308@r-finger.com>
Date: Thu, 13 Dec 2012 08:10:23 +0000
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <alpine.DEB.2.02.1212122024470.1116@oneiric>
In-Reply-To: <alpine.DEB.2.02.1212122024470.1116@oneiric>
Subject: Re: [PATCH] patch.bbclass: Finally remove support for deprecated "pnum=".
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 08:25:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 13/12/12 01:25, Robert P. J. Day wrote:
> -        elif "pnum" in parm:
> -            #bb.msg.warn(None, "Deprecated usage of 'pnum' url parameter in '%s', please use 'striplevel'" % url)
> -            striplevel = parm["pnum"]

Not sure what the rationale is for needing to remove it at all, but if
you do, it should error on pnum use, so that folk who might have any
custom recipes using it get a clear error message, rather than letting
it fail inside the patch task.

Tomas



-- 
http://sleepfive.com


