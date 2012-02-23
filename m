Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0f93-0004IQ-7E for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 21:20:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1NKBhLt024685
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 20:11:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18053-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 20:11:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1NKBYht024672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 20:11:36 GMT
Message-ID: <1330027895.32110.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 23 Feb 2012 20:11:35 +0000
In-Reply-To: <4F46919E.2050204@palm.com>
References: <4F457B4B.4000507@palm.com>
	<CAHQecY7-=cwCA7PXYhf3xes+SMsWo6qffwkQk6ckzRsP5ys7oA@mail.gmail.com>
	<E9FAD6E1E68141CCA2CF166F1762B320@gmail.com>	<4F458CAA.7040107@palm.com>
	<1329992162.32110.53.camel@ted> <4F46919E.2050204@palm.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: sharing DL_DIR?
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
X-List-Received-Date: Thu, 23 Feb 2012 20:20:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-23 at 11:21 -0800, Rich Pixley wrote:
> On 2/23/12 02:16 , Richard Purdie wrote:
> > On Wed, 2012-02-22 at 16:47 -0800, Rich Pixley wrote:
> >> What happens if two separate bitbake invocations both simultaneously
> >> attempt to download the same file?
> > The first will download it, the second will wait for it to finish, then
> > both will continue with the downloaded file.
> How does the second know that the first is in progress?

It won't be able to take the lock and the done stamp file doesn't exist
yet.

Cheers,

Richard





