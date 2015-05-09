Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 49D9373F00
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 May 2015 22:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t49M0Tbq008013; Sat, 9 May 2015 23:00:29 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lUo9wSpCI03S; Sat,  9 May 2015 23:00:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t49M0AoA008009
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 9 May 2015 23:00:25 +0100
Message-ID: <1431208810.30971.2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Sat, 09 May 2015 23:00:10 +0100
In-Reply-To: <CAJ86T=W2chZiZXvey7oeuisVYTEHkukKMQ5jFioZaA9HFY+vFQ@mail.gmail.com>
References: <1431097454-28641-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAJ86T=UDg+yZPgsuuNXqV0ZENMTAatbnx1qk1LxscwTfN0ndkg@mail.gmail.com>
	<CAP9ODKqyMGSov5FpbWkwN5cqVrHdCmP5ZeHB31+2Q6vhQB-YJQ@mail.gmail.com>
	<CAJ86T=W2chZiZXvey7oeuisVYTEHkukKMQ5jFioZaA9HFY+vFQ@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gstreamer1.0: convert GSTREAMER_1_DEBUG to PACKAGECONFIG
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
X-List-Received-Date: Sat, 09 May 2015 22:00:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-05-08 at 13:35 -0700, Andre McCurdy wrote:
> On Fri, May 8, 2015 at 12:12 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> > On Fri, May 8, 2015 at 4:07 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> > ...
> >> Or perhaps even use the "GSTREAMER_DEBUG" variable in gstreamer 1.x recipes?
> >
> > I think the PACKAGECONFIG is a nice compromise as it allows for
> > granular control over what to enable or not. It is easy to enable it
> > for recipes in a local.conf using pn-<package>_append or similar.
> 
> Over-riding GSTREAMER_DEBUG could be done on a per-package basis too,
> if there's really a need to enable debugging selectively.
> 
> However, I guess when you want to enable gstreamer debugging, you
> typically want to do so through-out gstreamer and all plug-ins... and
> needing to control PACKAGECONFIG for each recipe makes it harder to do
> that.
> 
> Whatever happens, the GSTREAMER_DEBUG, GSTREAMER_1_DEBUG and
> GSTREAMER_1_0_DEBUG duplication should probably be fixed.
> 
> I don't have a strong preference though and I'm stuck partnered with
> an SoC vendor who only supports Gtreamer 0.10, so I'll be watching
> from the sidelines as everyone else debugs GStreamer 1.x in oe-core
> :-(

I took the patch since I do think PACKAGECONFIG is an improvement for
this. We could build upon it with something like:

GSTREAMER_CONFIG = ""
PACKAGECONFIG ??= "${GSTREAMER_CONFIG}"

then setting GSTREAMER_CONFIG = "debug" could do what you describe if
there really is the demand for it.

Cheers,

Richard


