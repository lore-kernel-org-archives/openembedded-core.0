Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TsWwy-00018l-CD for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 12:02:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r08AlKC7020984;
	Tue, 8 Jan 2013 10:47:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04100-09; Tue,  8 Jan 2013 10:47:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r08Al9d0020978
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 8 Jan 2013 10:47:10 GMT
Message-ID: <1357642031.13022.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Tue, 08 Jan 2013 10:47:11 +0000
In-Reply-To: <b26787f62090d0760758b854627e94de25d6ccca.1357640488.git.hongxu.jia@windriver.com>
References: <cover.1357640488.git.hongxu.jia@windriver.com>
	<b26787f62090d0760758b854627e94de25d6ccca.1357640488.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] apt-native: fix the creation of apt.conf.sample
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
X-List-Received-Date: Tue, 08 Jan 2013 11:02:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-01-08 at 18:23 +0800, Hongxu Jia wrote:
> The file of apt.conf.sample is kept in outdir, and outdir is assigned
> by "os.path.join" with the params of ${D}, ${sysconfdir} and "apt". But
> ${sysconfdir} is an absolute dir and that is not allowed by "os.path.join".
> 
> The following is the help on function os.path.join(a, *p):
>      Join two or more pathname components, inserting '/' as needed.
>      If any component is an absolute path, all previous path components
>      will be discarded.
> 
> So remove "/" in ${sysconfdir} to create "apt.conf.sample" if it doesn't
> exist, not by the existance of prefix dir.

Use oe.path.join() instead which doesn't have this problem iirc.

Cheers,

Richard



