Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SfFfE-0001ms-B6 for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 21:25:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5EJERj6005142
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 20:14:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04393-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 20:14:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5EJEIXh005135
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 20:14:19 +0100
Message-ID: <1339701258.24333.98.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jun 2012 20:14:18 +0100
In-Reply-To: <4FDA340C.5070300@linux.intel.com>
References: <1339487948-30612-1-git-send-email-bogdan.a.marinescu@intel.com>
	<4FDA340C.5070300@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] strace: update to 4.7
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
X-List-Received-Date: Thu, 14 Jun 2012 19:25:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-06-14 at 11:57 -0700, Saul Wold wrote:
> On 06/12/2012 12:59 AM, Bogdan Marinescu wrote:
> > Removed the x32 specific patches, since they seem to be fully
> > integrated into 4.7. Also removed the sigmask patch, since the
> > new version doesn't seem to use sigmask anymore.
> >
> > Signed-off-by: Bogdan Marinescu<bogdan.a.marinescu@intel.com>
> > ---
> >   .../strace/strace-4.6/sigmask.patch                |   23 -
> >   .../strace-4.6/strace-4.6_add_x32_support.patch    | 1242 --------------------
> >   meta/recipes-devtools/strace/strace_4.6.bb         |   23 -
> >   meta/recipes-devtools/strace/strace_4.7.bb         |   20 +
> >   4 files changed, 20 insertions(+), 1288 deletions(-)
> >   delete mode 100644 meta/recipes-devtools/strace/strace-4.6/sigmask.patch
> >   delete mode 100644 meta/recipes-devtools/strace/strace-4.6/strace-4.6_add_x32_support.patch
> >   delete mode 100644 meta/recipes-devtools/strace/strace_4.6.bb
> >   create mode 100644 meta/recipes-devtools/strace/strace_4.7.bb
> >
> Did you do a git mv?  by removing and creating, the git history gets 
> lost, can you respin this?

This is an urban myth. git does not track renames, ever. Some of the
tools can detect and display things with "rename detection" though.

So the patch was just sent without rename detection, it will make no
difference to the history whatsoever if merged. It can be harder to
review though. Rename detection doesn't always work in the cases of
large delta, the exact threshold can be configured.

Cheers,

Richard



