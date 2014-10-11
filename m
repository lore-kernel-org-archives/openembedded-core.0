Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 59FF1713DA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 07:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9B755nv010445; Sat, 11 Oct 2014 08:05:05 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LLacF-OiBvCh; Sat, 11 Oct 2014 08:05:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9B74xNA010442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 11 Oct 2014 08:05:00 +0100
Message-ID: <1413011133.7562.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Sat, 11 Oct 2014 08:05:33 +0100
In-Reply-To: <54381C20.2060602@linux.intel.com>
References: <54380BF4.6010205@urbanec.net> <54381C20.2060602@linux.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Fix for gcc bug 61144
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
X-List-Received-Date: Sat, 11 Oct 2014 07:05:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-10-10 at 10:49 -0700, Saul Wold wrote:
> On 10/10/2014 09:40 AM, Peter Urbanec wrote:
> > See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61144 for details.
> >
> > This patch is taken from the gcc repository and should be obsoleted by a
> > gcc release after 4.9.1
> >
> > The problem is severe enough (at least from my point of view) to need
> > this patch until the next gcc release is available.
> >
> >
> >
> >
> 
> Hi Peter
> 
> Thank you for the patches.
> 
> Both the patch and the 0056-top-level-reorder_gcc-bug-61144.patch patch 
> file need to have Signed-off-by tags and the gcc patch itself needs an 
> Upstream-Status: Backport tag so we know it was a backport.
> 
> Please review the 
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> 
> I also note the second patch you sent does not have a Signed-off-by in 
> the commit message or the .patch files (which also needs an 
> Upstream-Status tag).
> 
> Can you please send a V2 updates commit for both of these.

Just to be clear, because of the important nature of the gcc fix and our
looming release deadlines, Saul has sent out a version of it in this
case. We don't normally do that.

Cheers,

Richard


