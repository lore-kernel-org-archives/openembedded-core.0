Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SBNgd-0000XN-AI for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 10:55:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2O9k6dN004828
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 09:46:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01784-06 for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 09:46:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2O9juYG004822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 09:45:58 GMT
Message-ID: <1332582359.9740.489.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 24 Mar 2012 09:45:59 +0000
In-Reply-To: <alpine.DEB.2.02.1203240436510.20052@oneiric>
References: <alpine.DEB.2.02.1203240436510.20052@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: "${bindir}" versus "${bindir}/*" ??
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
X-List-Received-Date: Sat, 24 Mar 2012 09:55:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-24 at 04:40 -0400, Robert P. J. Day wrote:
> in bitbake.conf, numerous variables like "FILES_${PN}" are
> initialized with a combination of directory variables, with two
> different forms:
> 
>   * ${bindir}
>   * ${bindir}/*
> 
> is there a functional difference between those two?  my wildly
> speculative guess is that if "*" works as it does in the shell, it
> would simply skip any hidden objects.  is that the difference?  since
> i don't see that clarified anywhere.

The former is recursive and the latter is not and will just match files
in the directory (unhidden ones at that).

Cheers,

Richard



