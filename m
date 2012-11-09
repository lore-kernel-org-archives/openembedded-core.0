Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TWxjD-00011I-3V for openembedded-core@lists.openembedded.org;
	Sat, 10 Nov 2012 00:11:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qA9MvJEj027122;
	Fri, 9 Nov 2012 22:57:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22382-05; Fri,  9 Nov 2012 22:57:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qA9Mv8AR027116
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 9 Nov 2012 22:57:09 GMT
Message-ID: <1352501827.9083.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 09 Nov 2012 22:57:07 +0000
In-Reply-To: <CAP9ODKor1L_sv0hLi_-FTCY383fyE0NguXEeMp1U0=KcPQrk1A@mail.gmail.com>
References: <cover.1352455397.git.ross.burton@intel.com>
	<154a30032b03a9ce269752adbf5bbec85205720e.1352455397.git.ross.burton@intel.com>
	<CAP9ODKor1L_sv0hLi_-FTCY383fyE0NguXEeMp1U0=KcPQrk1A@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] meta: remove redundant _FOR_BUILD variables
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
X-List-Received-Date: Fri, 09 Nov 2012 23:11:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-11-09 at 20:32 -0200, Otavio Salvador wrote:
> On Fri, Nov 9, 2012 at 8:09 AM, Ross Burton <ross.burton@intel.com>
> wrote:
>         Signed-off-by: Ross Burton <ross.burton@intel.com>

>
> Please bump PR. Even it might not change the end result we need to
> force a rebuild as we did change the meta-data and we risk having a
> subtle bug somewhere.

This patch set adds a number of exports to autotools.bbclass. In doing
so, the sstate checksums will change for pretty much everything and
hence pretty much everything will rebuild. Using PR specifically to
force a rebuild is therefore unnecessary.

Cheers,

Richard







