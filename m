Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TsCwu-0004QV-JU for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 14:41:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07DPuxs004767;
	Mon, 7 Jan 2013 13:25:56 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04131-02; Mon,  7 Jan 2013 13:25:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07DPmLX004760
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 7 Jan 2013 13:25:49 GMT
Message-ID: <1357565150.25855.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Philip Balister <philip@balister.org>
Date: Mon, 07 Jan 2013 13:25:50 +0000
In-Reply-To: <50E70BBE.1000607@balister.org>
References: <50E70742.6060201@balister.org>
	<CAF6bG8d=147QWj7C3nzXdbFkenUF4b7EefnNTSXFBB15W8nySw@mail.gmail.com>
	<50E70BBE.1000607@balister.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Recipes with SRC_URI in .inc file and checksum in bb file
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
X-List-Received-Date: Mon, 07 Jan 2013 13:41:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-01-04 at 12:05 -0500, Philip Balister wrote:
> On 01/04/2013 11:59 AM, Marko Lindqvist wrote:
> > On 4 January 2013 18:45, Philip Balister <philip@balister.org> wrote:
> >>
> >> I am on the process of updating the fftw recipes to the most recent
> >> version. Along the way I noticed it looks like the checksum test is
> >> being ignored. The only way I can get it to fail is to remove all the
> >> checksum entries from the bb files.
> > 
> >  I've got this kind of problems when I have made several iterations of
> > the recipe update. In my case the explanation has always been that
> > first test already downloaded the file, so no matter what I do to
> > checksums after that, there's no download + checksum check on later
> > tests.
> >  Remove file and <file>.done from download, + 'bitbake <recipe> -c clean'
> 
> I uderstand that, but the other problem is even with a new download, the
> checksum check is ignored if there are checksum entries in more than one
> bb file.

Multiple checksums in different .bb files for the same filename?

Cheers,

Richard



