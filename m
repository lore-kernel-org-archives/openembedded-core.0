Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RrEee-0004ox-DR
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jan 2012 21:13:44 +0100
Received: by pbaa13 with SMTP id a13so2186278pba.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jan 2012 12:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=R9iaQl2C0k8L/WMXluxcmpF5Ch+2BCa7jLpHWp8R8Uw=;
	b=R/k7gH9zFMzoIhQk2RyQ409a6Rekj9GrHqXPwqRnrpctNwG4C3pawSpM5bCnjWcAS9
	Jw2wk1t5ObZ3hT0RqpG5zN92KCCItIvJFJ2dcTAILD98oS5uEe8c3wZuwLpGKMalKAw2
	YZRq4pA5vOY+Iga7YXe+F+GaLy0ayZX5xeCuk=
Received: by 10.68.73.69 with SMTP id j5mr26498621pbv.11.1327781148955;
	Sat, 28 Jan 2012 12:05:48 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id a5sm31523888pbh.15.2012.01.28.12.05.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jan 2012 12:05:47 -0800 (PST)
Date: Sat, 28 Jan 2012 12:05:37 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120128200537.GA22106@sakrah.homelinux.org>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
	<CA+M6bXmAt2xBmCpiXBXxtEB-ykB_4qwtZqF9FrgXf3AD7ranpg@mail.gmail.com>
	<CAGiJk9fVik9Cc425O5kntWzgtf0Z2WPYnVcAjdTkswHY5YX7_Q@mail.gmail.com>
	<2153827.uieeAmS9LV@helios>
MIME-Version: 1.0
In-Reply-To: <2153827.uieeAmS9LV@helios>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 0/3] Make pulseaudio a DISTRO_FEATURE
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
X-List-Received-Date: Sat, 28 Jan 2012 20:13:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (27/01/12 10:54), Paul Eggleton wrote:
> On Friday 27 January 2012 11:43:50 Samuel Stirtzel wrote:
> > just a quick question, couldn't we use a separate recipe for phonon,
> > so if a recipe depends on it we don't have to change distro vars?
> 
> Well, this thread is now about something more fundamental (how to introduce 
> new DISTRO_FEATURES), but we do still need to solve the problem that prompted 
> the wider discussion. It's still possible that someone would want to build 
> phonon without pulseaudio, even if it was split out into a separate recipe, so 
> I'm not sure that addresses the problem.
>  
> > IMHO it would be easier to just depend on libphonon.bb instead of
> > adding a distro var for the one single recipe I'm working on.
> > Just my 0.02 cents.
> 
> Pulseaudio has become an optional dependency for a lot of things. I think it 
> makes sense to make a decision on whether or not to include this on a distro 
> level since if you have it enabled in one place you almost certainly want it 
> enabled everywhere else (and disabled everywhere if it is disabled).
> 
> Now, at the start of this saga there was a question as to whether this should 
> be a DISTRO_FEATURE or PACKAGECONFIG (or both, ugh). Ultimately the result is 
> the same - distro policy controls whether this feature is on or off.

DISTRO_FEATURES are like global use_flags equivalent of gentoo and
PACKAGECONFIG is more like local use_flags. Sometimes DISTRO_FEATURES
will configure particular PACKAGECONFIG settings and sometimes you can
just tweak the PACKAGECONFIG

> 
> Cheers,
> Paul
> 
> -- 
> 
> Paul Eggleton
> Intel Open Source Technology Centre
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


