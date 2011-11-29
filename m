Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agust@denx.de>) id 1RVOTc-0005AD-60
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 15:16:04 +0100
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id D8FD21C0C0E2;
	Tue, 29 Nov 2011 15:09:24 +0100 (CET)
X-Auth-Info: IgulZUa9nFwWHkIlxDnHuaQ5ZC9T0KmFlvtF8i/rMVA=
Received: from wker (p4FC4623D.dip.t-dialin.net [79.196.98.61])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA id 144C11C0020F;
	Tue, 29 Nov 2011 15:09:12 +0100 (CET)
Date: Tue, 29 Nov 2011 15:09:12 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111129150912.7c209982@wker>
In-Reply-To: <1322574468.6171.1.camel@ted>
References: <1322572367-4246-1-git-send-email-agust@denx.de>
	<1322574468.6171.1.camel@ted>
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.22.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 29 Nov 2011 14:16:04 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Nov 2011 13:47:48 +0000
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2011-11-29 at 14:12 +0100, Anatolij Gustschin wrote:
> > Fix QML video player crash which happens when attempting
> > to play OGG video files.
> > 
> > Signed-off-by: Anatolij Gustschin <agust@denx.de>
> > ---
> >  ...stvideoconnector-fixed-buffers-allocation.patch |   32 ++++++++++++++++++++
> >  meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    3 +-
> >  2 files changed, 34 insertions(+), 1 deletions(-)
> >  create mode 100644 meta/recipes-qt/qt4/files/0001-gstvideoconnector-fixed-buffers-allocation.patch
> 
> Merged to master but please send patches against master in future.

Thanks for merging and sorry about my not applicable patch.
I'll base against master in future.

I just pulled from master and noticed that the patch file
0001-gstvideoconnector-fixed-buffers-allocation.patch got lost
while merging. Can you fix it or should I resend a proper patch.

Thanks,
Anatolij


