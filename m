Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAKWf-000279-EG for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 13:20:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LCBW26001434
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 12:11:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01164-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 12:11:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LCBLbK001428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 12:11:22 GMT
Message-ID: <1332331884.9740.144.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 12:11:24 +0000
In-Reply-To: <1332328272.14363.983.camel@phil-desktop>
References: <alpine.DEB.2.02.1203210615100.21394@oneiric>
	<alpine.DEB.2.02.1203210625530.16813@oneiric>
	<1332328272.14363.983.camel@phil-desktop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: what is meaning of "SRC_URI_append_whatever +=" ??
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
X-List-Received-Date: Wed, 21 Mar 2012 12:20:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-21 at 11:11 +0000, Phil Blundell wrote:
> On Wed, 2012-03-21 at 06:28 -0400, Robert P. J. Day wrote:
> >   of course, if all of the above is perfectly valid, i'm going to be
> > embarrassed.
> 
> All the constructs you mentioned are syntactically valid, though it
> isn't clear that all of them are very useful.
> 
> There is a subtle difference between SRC_URI_append = "..." and
> SRC_URI_append += "..." in that the latter will insert a space whereas
> the former will not.  But I don't think there is any situation where
> this distinction serves any useful purpose.  As far as I know, with
> current bitbake at least,
> 
> SRC_URI = "a"
> SRC_URI_append = "b"
> SRC_URI_append += "c"
> 
> and
> 
> SRC_URI = "a"
> SRC_URI_append = "b"
> SRC_URI_append = " c"
> 
> will both produce exactly the same effect, viz. SRC_URI = "ab c".  I
> think it might have been the case with some older bitbakes that the
> middle line would have no effect in this situation but that doesn't
> appear to be true now.
> 
> >  SRC_URI_append = "..."                (why not just SRC_URI +=?)
> 

I hadn't realised the += combined with append would insert a space
although I can see why it would happen :)

Cheers,

Richard




