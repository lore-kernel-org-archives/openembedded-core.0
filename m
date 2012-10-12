Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TMf0W-0000do-Dg for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 15:10:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9CCvFRu027625;
	Fri, 12 Oct 2012 13:57:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26327-05; Fri, 12 Oct 2012 13:57:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9CCv5A3027619
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 12 Oct 2012 13:57:06 +0100
Message-ID: <1350046631.25627.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ml@communistcode.co.uk
Date: Fri, 12 Oct 2012 13:57:11 +0100
In-Reply-To: <5077FEA8.5080308@communistcode.co.uk>
References: <5077FEA8.5080308@communistcode.co.uk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build Failures
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
X-List-Received-Date: Fri, 12 Oct 2012 13:10:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-10-12 at 12:27 +0100, Jack Mitchell wrote:
> On my git pull and build today I ran into some compile errors. As 
> mentioned before I would usually just -c cleansstate and retry, which 
> 99% of the time sorts the issue. However, I was informed this was not 
> meant to happen and logs would be appreciated, so please find them below.
> 
> pkgconfig-native
> http://ix.io/38G
> 
> binutils-crosssdk
> http://ix.io/38I
> 
> Possibly looks like something doesn't have a 'sed' dependency when it 
> should?

See the libtool patch I recently sent out...

Cheers,

Richard



