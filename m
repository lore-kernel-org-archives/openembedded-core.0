Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QK5K3-0005eq-B2 for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 11:03:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4B90OoY017291
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 10:00:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16641-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 10:00:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4B90FJl017276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 10:00:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1305088327.git.raj.khem@gmail.com>
References: <cover.1305088327.git.raj.khem@gmail.com>
Date: Wed, 11 May 2011 10:00:10 +0100
Message-ID: <1305104410.30391.305.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Do not depend on BBFILES to compute scm dirs
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
X-List-Received-Date: Wed, 11 May 2011 09:03:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 21:35 -0700, Khem Raj wrote:
> This fixes the problem that I described in 
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/001966.html
> 
> Additionally we do not need directories with */packages/* in BBFILES
> anymore
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: kraj/misc-fixes
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes
> 
> Thanks,
>     Khem Raj <raj.khem@gmail.com>
> ---
> 
> 
> Khem Raj (2):
>   metadata_scm.bbclass: Use COREBASE to grok for SCM operations
>   meta/conf/layer.conf: Remove packages/*bb from BBFILES

Merged to master, thanks.

Richard



