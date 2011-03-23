Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q2NC7-0000DE-An for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 13:29:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NCRuwf028161
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 12:27:56 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26487-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 12:27:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NCRoZX028152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 12:27:50 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1300831551.git.tom_rini@mentor.com>
References: <cover.1300831551.git.tom_rini@mentor.com>
Date: Wed, 23 Mar 2011 12:27:48 +0000
Message-ID: <1300883268.3018.3.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/7] Consistent MIRROR usage
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
X-List-Received-Date: Wed, 23 Mar 2011 12:29:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-22 at 15:07 -0700, Tom Rini wrote:
> The following series updates the recipes in oe-core that fetch from
> a site we have a MIRROR variable for (gnu.org, sourceforge, etc) but
> were fetching directly rather than via the mirror variable.  Part of
> this is making use of KERNELORG_MIRROR consistent (mirrors.bbclass included
> /pub but the main variable did not) and finally we kill off checksums.ini.
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: trini/use-mirrors-consistently
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/use-mirrors-consistently

Changes look good, merged to master, thanks.

Richard



