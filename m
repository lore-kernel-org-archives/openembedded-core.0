Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RmlrL-0007An-Qy for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 13:40:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0GCWiqG019518;
	Mon, 16 Jan 2012 12:32:44 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19305-05; Mon, 16 Jan 2012 12:32:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0GCWZ0N019512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 16 Jan 2012 12:32:36 GMT
Message-ID: <1326717159.532.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jan 2012 12:32:39 +0000
In-Reply-To: <4F13AD3B.50902@linux.intel.com>
References: <1326409412-15507-1-git-send-email-msm@freescale.com>
	<4F13AD3B.50902@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH 1/2] bitbake/fetch2: add support for wrapper command
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
X-List-Received-Date: Mon, 16 Jan 2012 12:40:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-01-15 at 20:53 -0800, Saul Wold wrote:
> On 01/12/2012 03:03 PM, Matthew McClintock wrote:
> > cc: bitbake-devel@lists.openembedded.org
> > Signed-off-by: Matthew McClintock<msm@freescale.com>
> > ---
> >   bitbake/lib/bb/fetch2/__init__.py |    2 ++
> >   1 files changed, 2 insertions(+), 0 deletions(-)
> >
> > diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
> > index 3af56e5..1d7d5c7 100644
> > --- a/bitbake/lib/bb/fetch2/__init__.py
> > +++ b/bitbake/lib/bb/fetch2/__init__.py
> > @@ -389,6 +389,8 @@ def runfetchcmd(cmd, d, quiet = False, cleanup = []):
> >       Optionally remove the files/directories listed in cleanup upon failure
> >       """
> >
> > +    cmd = "%s %s" % (bb.data.getVar("BB_FETCH_WRAPPER", d, True), cmd)
> > +
> I am guessing you really want a check here if BB_FETCH_WRAPPER is set, 
> otherwise I am not sure this will work correctly, did you test without 
> this new variable set?

We've had this conversation on the bitbake list. I think Matthew has an
alternative fix to use instead of this so we'll likely drop this patch
anyway.

Cheers,

Richard



