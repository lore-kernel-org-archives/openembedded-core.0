Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVOuU-0006Ai-G2 for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 15:43:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATEb3lK014368;
	Tue, 29 Nov 2011 14:37:03 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14014-04; Tue, 29 Nov 2011 14:36:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATEatLc014362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 29 Nov 2011 14:36:56 GMT
Message-ID: <1322577424.6171.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anatolij Gustschin <agust@denx.de>
Date: Tue, 29 Nov 2011 14:37:04 +0000
In-Reply-To: <20111129150912.7c209982@wker>
References: <1322572367-4246-1-git-send-email-agust@denx.de>
	<1322574468.6171.1.camel@ted> <20111129150912.7c209982@wker>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: qt-mobility: fix QML video player crash
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
X-List-Received-Date: Tue, 29 Nov 2011 14:43:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 15:09 +0100, Anatolij Gustschin wrote:
> On Tue, 29 Nov 2011 13:47:48 +0000
> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > On Tue, 2011-11-29 at 14:12 +0100, Anatolij Gustschin wrote:
> > > Fix QML video player crash which happens when attempting
> > > to play OGG video files.
> > > 
> > > Signed-off-by: Anatolij Gustschin <agust@denx.de>
> > > ---
> > >  ...stvideoconnector-fixed-buffers-allocation.patch |   32 ++++++++++++++++++++
> > >  meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    3 +-
> > >  2 files changed, 34 insertions(+), 1 deletions(-)
> > >  create mode 100644 meta/recipes-qt/qt4/files/0001-gstvideoconnector-fixed-buffers-allocation.patch
> > 
> > Merged to master but please send patches against master in future.
> 
> Thanks for merging and sorry about my not applicable patch.
> I'll base against master in future.
> 
> I just pulled from master and noticed that the patch file
> 0001-gstvideoconnector-fixed-buffers-allocation.patch got lost
> while merging. Can you fix it or should I resend a proper patch.

I've fixed it, that was my fault when tried to fix the merge manually.

Cheers,

Richard



