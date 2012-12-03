Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TfYa2-0006aM-FW for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 17:09:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB3FsqTY027155;
	Mon, 3 Dec 2012 15:54:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25756-03; Mon,  3 Dec 2012 15:54:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB3Fsgqr027134
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 3 Dec 2012 15:54:43 GMT
Message-ID: <1354550072.5970.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: niqingliang2003@gmail.com
Date: Mon, 03 Dec 2012 15:54:32 +0000
In-Reply-To: <3752816.NQS16Yy7Ff@yiqingliang-pc>
References: <3752816.NQS16Yy7Ff@yiqingliang-pc>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: why remove yaffs2?
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
X-List-Received-Date: Mon, 03 Dec 2012 16:09:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-12-03 at 14:03 +0000, niqingliang2003@gmail.com wrote:
> Hi, All:
> 
> I have untouched oe for several months, and recently found that yaffs is 
> dropped, and also in official kernel, why?

We removed it from OE-Core 18 months ago. The code was old, not working
particularly well and lacking someone to maintain it so it got moved
out. I'm sure the tools would be accepted into meta-oe if someone
updated and cleaned up the recipe for it. For OE-Core you'd have to show
a larger user base than there currently appears to be...

Cheers,

Richard



