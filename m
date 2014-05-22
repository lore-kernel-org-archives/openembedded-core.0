Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (unknown [206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 7B32D6116C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 19:09:59 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N5Z00MVRP7UDL00@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 22 May 2014 14:09:46 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 620D22016D; Thu,
	22 May 2014 15:09:28 -0400 (EDT)
Date: Thu, 22 May 2014 15:09:28 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-id: <20140522190928.GC27324@denix.org>
References: <1400783274-7258-1-git-send-email-otavio@ossystems.com.br>
	<537E464F.10700@linux.intel.com>
	<CAP9ODKrmQu+dSDm-5xQUDDsLn+wG9Y96Hj-GRkQunqFyTw4kig@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKrmQu+dSDm-5xQUDDsLn+wG9Y96Hj-GRkQunqFyTw4kig@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [daisy-backport][PATCH 0/6] Daisy backports
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 May 2014 19:10:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 22, 2014 at 03:56:40PM -0300, Otavio Salvador wrote:
> Hello,
> 
> (Adding Denys in Cc)
> 
> On Thu, May 22, 2014 at 3:47 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > On 05/22/2014 11:27 AM, Otavio Salvador wrote:
> >>
> >> Hello,
> >>
> >> Those are the changes I have in my local backport branch which I run
> >> on top of 'sgw/daisy' branch.
> >>
> >> Chen Qi (2):
> >>    tcf-agent: add systemd support
> >>    gdb: add PACKAGECONFIG for babeltrace
> >>
> > These are already in my branch
> 
> Good.
> 
> >> Denys Dmytriyenko (3):
> >>    cryptodev-linux: move to recipes-kernel to be shared with module and
> >>      tests
> >>    cryptodev-linux: create common .inc file to be shared by module and
> >>      tests
> >>    cryptodev-tests: recipe for cryptodev test suite based on OpenSSL
> >>
> > I have pulled these for testing, but we don't normally enable new
> > functionality in point releases.  I would like to get a clear justification
> > as to why these are needed to be back-ported.
> >
> > Please provide more details on the cryptodev functionality and why it should
> > be backported.
> 
> We need those to use crypto support in some SoC as is the case for
> Freescale (in meta-fsl-arm) and TI (in meta-ti). Unfortunately this
> has been sent late in the release but with the drop of ocf-linux it
> makes sense to provide cryptodev in my opinion.
> 
> Denys?

Did you miss the 4th patch in the series adding the actual cryptodev-module?

Otherwise I'd support this backport. ocf-linux was dropped before the release, 
but complete cryptodev replacement didn't make in time for the release and was 
added afterwards. The partial cryptodev support was for the header file only 
and assumed that the kernel had been patched with the rest of cryptodev device 
driver...

-- 
Denys

