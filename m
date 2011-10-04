Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBD7N-0007d9-PY for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 00:05:41 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94M6ZLd025380; Tue, 4 Oct 2011 23:06:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EDa6uYgBJfyU; Tue,  4 Oct 2011 23:06:34 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94M6Vl4025358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 4 Oct 2011 23:06:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 04 Oct 2011 23:00:01 +0100
In-Reply-To: <CAP9ODKqb8RGLi_5-_+uegLmtZ7Wo-70oDJcF_R6yaSJ2q9mGwg@mail.gmail.com>
References: <1317370770-27225-1-git-send-email-Martin.Jansa@gmail.com>
	<1317392122.12332.208.camel@ted> <20110930164658.GB7364@jama.jama.net>
	<1317402578.12332.218.camel@ted>
	<CAP9ODKqb8RGLi_5-_+uegLmtZ7Wo-70oDJcF_R6yaSJ2q9mGwg@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317765609.14671.118.camel@ted>
Mime-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] Improve handling of 'all' architecture recipes and their interaction with sstate
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
X-List-Received-Date: Tue, 04 Oct 2011 22:05:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-10-01 at 15:48 -0300, Otavio Salvador wrote:
> On Fri, Sep 30, 2011 at 14:09, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> ...
> > Thanks. I've taken the two patches. I'd love to get rid of hal, in fact
> > its on my list of things that need to migrate out of OE-Core...
> ...
> 
> From default images this shouldn't be difficult but don't remove hal
> from oe-core since many embedded OS still use it and haven't migrate
> to udev or devicekit yet.

Really? hal doesn't really replace udev though, we can just use udev
directly in place of it for many things now?

Specifically which applications are people using with dependencies on
hal? As has been pointed out we can fix the xserver and that appears to
be the only thing remaining in OE-Core?

Cheers,

Richard



