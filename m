Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RoZYt-0002aa-Pl for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 12:56:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0LBn5PS029472
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2012 11:49:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27250-09 for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2012 11:48:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0LBmvuL029466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2012 11:48:58 GMT
Message-ID: <1327146536.10079.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 21 Jan 2012 11:48:56 +0000
In-Reply-To: <CADkTA4MWvSsScXymA1-3vStE4qrY6yR5p3-8QG8FkN+-rqaYvg@mail.gmail.com>
References: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
	<4F1A3608.70002@linux.intel.com>
	<CADkTA4MWvSsScXymA1-3vStE4qrY6yR5p3-8QG8FkN+-rqaYvg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] qemuppc: replace emulation of qemuppc
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
X-List-Received-Date: Sat, 21 Jan 2012 11:56:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-20 at 23:12 -0500, Bruce Ashfield wrote:
> On Fri, Jan 20, 2012 at 10:50 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > On 01/05/2012 12:37 AM, Liming Wang wrote:
> >>
> >> Hi Richard,
> >>
> >> These patches are aimed to replace emulation of qemuppc from prep to
> >> mac99.
> >> With this new emulation, qemuppc now supports framebuffer and the network
> >> works well.
> >>
> > Is there anything that needs to be setup differently for the runqemu
> > scripts?  Our sanity tests have failed after changing to the new ppc code
> > and I wonder if there is something for the command line or ???
> 
> What type of failure ? boot ? I'm building and booting it all the time, so I can
> help there. Or are you talking about something in particular like the network ?
> disk ?

I ran a test build and can confirm that whilst qemuppc can boot, there
is no network. We need to fix the network ASAP as our automated testing
depends on working network access...

Cheers,

Richard



