Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TbUS6-0001Fy-AA for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 11:56:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAMAg8Iu025025;
	Thu, 22 Nov 2012 10:42:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24528-01; Thu, 22 Nov 2012 10:42:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAMAfunM025019
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 22 Nov 2012 10:41:59 GMT
Message-ID: <1353580914.10459.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 22 Nov 2012 10:41:54 +0000
In-Reply-To: <CAP9ODKpd5BQDEn8tigirfCkA0ejfW6-Sd4HdWnwDe8Vrj5s4nQ@mail.gmail.com>
References: <cover.1353553772.git.kai.kang@windriver.com>
	<109a6ebf14ab5d312954f371eaf3bbfbcb6fb2d0.1353553774.git.kai.kang@windriver.com>
	<CAP9ODKpd5BQDEn8tigirfCkA0ejfW6-Sd4HdWnwDe8Vrj5s4nQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] lsb: move links from lsbsetup to here
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
X-List-Received-Date: Thu, 22 Nov 2012 10:56:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-11-22 at 08:37 -0200, Otavio Salvador wrote:
> On Thu, Nov 22, 2012 at 1:25 AM, Kang Kai <kai.kang@windriver.com> wrote:
> > Because package lsbsetup is dropped, move the links created for LSB test
> > to package lsb.
> >
> > Signed-off-by: Kang Kai <kai.kang@windriver.com>
> 
> This ought to be done before of dropping lsbsetup too.

I've queued them that way around in master-next.

Cheers,

Richard



