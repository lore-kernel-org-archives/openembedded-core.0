Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RooAY-0003ft-UL
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 04:32:39 +0100
Received: by iabz21 with SMTP id z21so3222029iab.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2012 19:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=paVQDt/HXU3KOZgw1dDgM7v67Ho4g3MGt5XnyDe2TRM=;
	b=gsS2ejIbqBFWZeT5cy+U4XWEnv64v4AOItjlAw/Y66AyUSt9n9L6gVZNP63MvEI/5y
	0Ylmk3Y//b5GmdeGCOrhD5+aUSzHcSBaPauLjT+kruMK2Enqf7nvA8xGtMJ//gEalRzS
	Vw2XV0+c5BZ1CXiRqv34BRy2fIVV7SF8+c2Rw=
Received: by 10.42.180.9 with SMTP id bs9mr3437716icb.0.1327202695616;
	Sat, 21 Jan 2012 19:24:55 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id py9sm14709897igc.2.2012.01.21.19.24.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jan 2012 19:24:54 -0800 (PST)
Date: Sat, 21 Jan 2012 19:25:48 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120122032548.GG27997@sakrah.homelinux.org>
References: <4F16C61C.4020304@ts.fujitsu.com>
	<20120118134322.GB5443@deadlock.dhs.org>
	<F2C23BA4-EF14-44A5-A4B3-B50848CD0844@dominion.thruhere.net>
	<4F16D882.8080701@balister.org>
MIME-Version: 1.0
In-Reply-To: <4F16D882.8080701@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: How do I get rid of systemd
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
X-List-Received-Date: Sun, 22 Jan 2012 03:32:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (18/01/12 09:34), Philip Balister wrote:
> On 01/18/2012 09:21 AM, Koen Kooi wrote:
> > 
> > Op 18 jan. 2012, om 14:43 heeft Sergey 'Jin' Bostandzhyan het volgende geschreven:
> > 
> >> Hi Rainer,
> >>
> >> On Wed, Jan 18, 2012 at 02:16:12PM +0100, Rainer Koenig wrote:
> >>> built my first basic customized console image (based on angstrom's
> >>> console-image.bb) and managed to get SystemV init pulled in by deleting
> >>> the systemd entry for the init manager.
> >>>
> >>> But systemd is still pulled in via connman, dhcp, rsyslog and ntp. How
> >>> can I get totally rid of systemd so that I don't need a kernel with CGROUPS?
> >>
> >> I also did not want systemd in my image, I had to create a layer and patch
> >> out systemd from each package that was pulling it in, one by one.
> >>
> >> Surely not the nicest solution, but I did not find any other ways to solve this.
> > 
> > It's really easy, create your own image, no patching needed. The systemd dependencies are all in ${PN}-systemd, so just don't include those in your image. I you do include ${PN}-systemd in your image you shouldn't be surprised that systemd ends up in it.
> 
> I'm working through this now. The meta-oe task-basic is sucking in
> rsyslog-systemd. I already made a renamed copy of this so I could use
> openssh instead of dropbear, so this was an easy fix for me.
> 
> But it would be a good idea to keep references to systemd (or sysvinit)
> out of core tasks to make life easier for people.
> 
> And, it would be really nice not to have the ssh daemon determined in
> task-basic. I do not want to use a local var to override that setting,
> since then my task-basic is different from everyone elses.

I guess define PACKAGE_GROUPS for both and then user can chose whichever
one wants in an image.

> 
> Philip
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


