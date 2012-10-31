Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TTbD2-0007gR-5n for openembedded-core@lists.openembedded.org;
	Wed, 31 Oct 2012 17:32:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9VGINFJ025258;
	Wed, 31 Oct 2012 16:18:23 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15538-02; Wed, 31 Oct 2012 16:18:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9VGIBhA025251
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 31 Oct 2012 16:18:13 GMT
Message-ID: <1351671493.2828.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, Morten Minde Neergaard
	<mneergaa@cisco.com>
In-Reply-To: <508F8AD7.2000006@windriver.com>
References: <CAAQYJAtxfQDkODhaPZP1Z8honP1azA1B6PuQ_DfjtuB--8YnvA@mail.gmail.com>
	<508F8AD7.2000006@windriver.com>
Date: Wed, 31 Oct 2012 08:18:13 +0000
Mime-Version: 1.0
X-Mailer: Evolution 3.2.3-0ubuntu6 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches, the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: devshell spawning twice
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
X-List-Received-Date: Wed, 31 Oct 2012 16:32:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-30 at 16:07 +0800, Robert Yang wrote:
> I met the same problem on openSUSE 12.1 64 bit.
> 
> I used ssh -X to opensuse, and my client is Ubuntu 11.10 32bit

The trouble is the removal of:

os.environ[export] = str(value)

I think we're going to have to add this back since it looks like we need
the parent environment adjusted as well as that of the child.

For now I'm tempted to add that line back...

Cheers,

Richard





