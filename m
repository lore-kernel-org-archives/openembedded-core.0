Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 8F00A6FC91
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jul 2014 18:58:06 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20140719185806745
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jul 2014 18:58:06 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [64.134.185.139] (port=58370 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X8ZpZ-0004yL-1U; Sat, 19 Jul 2014 14:58:01 -0400
Date: Sat, 19 Jul 2014 14:57:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Christopher Larson <clarson@kergoth.com>
In-Reply-To: <CABcZAN=K0zQ6JENDWWC4PCn9yNaPx0GD=xZS+sjhcrPx9KuapQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1407191456120.3229@localhost>
References: <alpine.LFD.2.11.1407181455510.13980@localhost>
	<CAJTo0Lbefya8wCNvhfVXXytN+HH0nuMbsEO7XPfTk5kVzQ0XxA@mail.gmail.com>
	<alpine.LFD.2.11.1407181726070.25832@localhost>
	<CABcZAN=K0zQ6JENDWWC4PCn9yNaPx0GD=xZS+sjhcrPx9KuapQ@mail.gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: patches can be either ".patch" or ".diff" files, yes?
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
X-List-Received-Date: Sat, 19 Jul 2014 18:58:10 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1570895713-1405796280=:3229"

--8323328-1570895713-1405796280=:3229
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 19 Jul 2014, Christopher Larson wrote:

>
> On Fri, Jul 18, 2014 at 2:26 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>       On Fri, 18 Jul 2014, Burton, Ross wrote:
>
>       > On 18 July 2014 19:58, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>       > >  not sure where i saw this recently (i'll track it down), but some OE
>       > > or yocto doc claimed that patch files *must* be suffixed with
>       > > ".patch". i'm pretty sure it can be either .patch or .diff, correct?
>       > > as in, it's perfectly valid to do this in a .bbappend file:
>
>
> Also remember that as Ross says ('*automatically* applied as a
> patch'), it's not a must, you can opt-in to patch application with
> ;apply=yes if the filename doesn't match the expected extensions.

  ah, that was a detail of which i was unaware -- that "apply=yes" was
meant for applying patches of any arbitrary filename. of course, that
suggests that there are some superfluous uses here and there in
oe-core, such as:

recipes-graphics/xorg-proto/calibrateproto_git.bb:           file://fix.patch;apply=yes"
recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb:        file://link-x11.patch;apply=yes \
recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI_append_poky = " file://owl-menu.patch;apply=yes "
recipes-sato/settings-daemon/settings-daemon_git.bb:           file://addsoundkeys.patch;apply=yes \

no harm, just unnecessary.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-1570895713-1405796280=:3229--
