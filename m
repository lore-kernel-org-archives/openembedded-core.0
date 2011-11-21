Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RSXDW-0000Fx-Eu for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 17:59:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pALGrAGM009202
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 16:53:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08521-09 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 16:53:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pALGr1Ar009196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 16:53:02 GMT
Message-ID: <1321894387.18926.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 21 Nov 2011 16:53:07 +0000
In-Reply-To: <1321824774-23819-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1321824774-23819-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] package.bbclass: fix path for relative links on elf files, when moved to debugdir
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
X-List-Received-Date: Mon, 21 Nov 2011 16:59:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-11-20 at 22:32 +0100, Henning Heinold wrote:
> * relative links for elf files like ../foo.so ends up in the
>   debugdir with ../.debug/foo.so, this causes infinite fileaccessloops
>   fix it by adding an extra "../" to the link path
> 
> Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>

Merged to master, thanks.

Richard



