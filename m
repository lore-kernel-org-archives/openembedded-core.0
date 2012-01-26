Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RqPuq-0007X0-UH for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 15:03:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QDtHPZ022836
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 13:55:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22219-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 13:55:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QDt7OP022830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 13:55:09 GMT
Message-ID: <1327586109.19643.374.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jan 2012 13:55:09 +0000
In-Reply-To: <4F214E8A.4030209@ts.fujitsu.com>
References: <4F214E8A.4030209@ts.fujitsu.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Avoid stripping of firmware files?
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
X-List-Received-Date: Thu, 26 Jan 2012 14:03:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-26 at 14:00 +0100, Rainer Koenig wrote:
> Hi,
> 
> for my work on the dm8148-evm I got firmware files with the suffix
> ".xem3" from TI. I made a simple recipe to install those files in my
> image, but I ran into a bad problem:
> 
> The firmware files I find in my image are different from the files i use
> in my recipe. No matter if I use "install" or just "cp" to copy the
> files to the destination.
> 
> Looks like those files get stripped during packaging. Normally not a bad
> idea, but in this special case stripping the symbols makes the files
> dysfunctional.
> 
> Is there a way to avoid stripping?

If its just a firmware recipe and there aren't other files that do need
to be stripped, you could set:

INHIBIT_PACKAGE_STRIP = "1"

We don't have a mechanism to exclude specific files at present but we
could probably do with adding one. The code that does stripping is in
package.bbclass if you haven't already found it.

Cheers,

Richard



