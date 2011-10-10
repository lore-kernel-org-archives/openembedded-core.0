Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDMdi-0004JP-4P for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 22:39:58 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9AKep8t013229 for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 21:40:52 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VuBs+NzMUY5q
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 21:40:51 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9AKelWg013225
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 21:40:50 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 10 Oct 2011 21:34:07 +0100
In-Reply-To: <CAP9ODKq+9Bhu9A8jZhYH-uBVSWcncsNQvAxyNxLnG133J237iA@mail.gmail.com>
References: <678AE8F3-DBF3-4315-83A5-AA2CA040C5D8@dominion.thruhere.net>
	<CAP9ODKq+9Bhu9A8jZhYH-uBVSWcncsNQvAxyNxLnG133J237iA@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318278855.23801.61.camel@ted>
Mime-Version: 1.0
Subject: Re: Multiple git repos in SRC_URI and/or git submodules support
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
X-List-Received-Date: Mon, 10 Oct 2011 20:39:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-10 at 16:40 -0300, Otavio Salvador wrote:
> On Mon, Oct 10, 2011 at 15:19, Koen Kooi <koen@dominion.thruhere.net> wrote:
> ...
> > I'm not going to do 1), 3) is unlikely, so I want to ask if 2) is
> already supported. I've seen various patches that add an 'unpackdir'
> or similar, but I can't find any docs on it. Can someone enlighten me
> on the current status of that?
> ...
> 
> Yes, this works. I have added support to SRCREV_FORMAT into gitpkgv too ;-)

Just to be clear, something like:

SRC_URI = "\
  git://foo.git?subpath=bar \
  git://foo2.git?subpath=bar2 \
"

should work but I can think of reasons why it might get confused. Try
it, report back and if it fails we can figure out ways to fix it...

Cheers,

Richard






