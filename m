Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ldorileo@gmail.com>) id 1Qxkne-0007m7-Fv
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Aug 2011 21:13:42 +0200
Received: by yia28 with SMTP id 28so2740209yia.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2011 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0F3gqzRpinRXbwnhTneZeYOP3nC+33XUAI7wdQ9ZovE=;
	b=MeWRDnr4znPIhtQAhjmGGBysHJbzE560KzEB2s+t0msmAJOLXz0LlrGyf7C+GFBO9n
	IW670zczPb3liTec4sg7ovSNIYCPQghSAgcFNEQgTx+2hqFl5Si3QVUJ36inIS+imRKa
	wIZtNIcKJlZp6yhUw4GqjjLUTRhRVMhy8UX/Y=
Received: by 10.236.177.65 with SMTP id c41mr20026587yhm.16.1314558530815;
	Sun, 28 Aug 2011 12:08:50 -0700 (PDT)
Received: from vps-dorilex (vps.dorilex.net [174.143.253.171])
	by mx.google.com with ESMTPS id x42sm1717863yhm.23.2011.08.28.12.08.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Aug 2011 12:08:50 -0700 (PDT)
Date: Sun, 28 Aug 2011 19:05:43 +0000
From: Leandro Dorileo <ldorileo@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110828190543.GA4498@vps-dorilex>
References: <4E537A0E.2040605@gmail.com>
	<201108231725.13418.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <201108231725.13418.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Wiki seems dead. is openembedded wiki still active?
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
X-List-Received-Date: Sun, 28 Aug 2011 19:13:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,


On Tue, Aug 23, 2011 at 05:25:13PM +0100, Paul Eggleton wrote:
> On Tuesday 23 August 2011 10:59:42 Klausfpga wrote:
> > Am I using the correct url? (it's at least the url also mentioned in
> > wikipedia)
> > 
> > Is the Wiki just temporarily down and I was just unlucky enough to try
> > to connect at the wromg time?
> 
> Yes that's the correct link, although the website is temporarily down; the 
> appropriate people have apparently been informed and hopefully can fix it soon.
> 
> However the website/wiki can still be accessed under 
> http://wiki.openembedded.org.
>  
> > What I wanted to find out on the wiki:
> > 
> > - what branch / tag to checkout to have a consitant verison
> 
> I'm not quite sure what you're asking here. 
> 
> FYI OE is in the middle of a transition of sorts; we're moving to a more 
> modular metadata structure based around a smaller common core (OE-Core). For 
> more information please see this page:


The wiki frontpage could be updated stating the current OE status at least
stating the transition, I`m a newcomer and took some time trying the wiki howtos.
I just figured out things after I read all the mailing list archives :)


> 
>   http://wiki.openembedded.org/index.php/OpenEmbedded-Core
> 
> For new development work we would strongly recommend OE-core as a base, 
> allowing you greater flexibility as well as avoiding some legacy cruft.



This is also important to highlight somewhere, maybe the wiki front page as well.


Regards,

Leandro Dorileo

> 
> > - what to use as starting point for a minimalist x86 system being able
> > to run under qemu (x86)
> 
> "Minimalist" is somewhat subjective. OE-core alone provides a "qemux86" 
> machine target, a distro-less basic configuration and a "core-image-minimal" 
> image that provides a basic console-only system without package management.
> 
> > - How to add a gnu toolchain package to my minimalist target system
> 
> I think this is a case of adding "tools-sdk" to your IMAGE_FEATURES; someone 
> else might be able to offer more help here.
> 
> > - what to use as starting point for a minimalist arm11 system being able
> > to run under qemu (x86)
> 
> Same as above except use "qemuarm" as the machine.
> 
> > - what is the recommended way to run bitbake in a 64 bit environment
> > (psyco is not working). Is pypy an option?
> 
> There's no specific recommended way; the psyco warning was just a warning and 
> in any case if you're using a recent version of BitBake (as you need to for 
> OE-core) then Psyco support has been removed and you won't get the warning.
> 
> > - what are the correct mailing lists for such questions
> 
> For OE-classic discussion as well as layers above OE-core, use the 
> openembedded-devel mailing list. For OE-core use this list (openembedded-
> core). I suspect the openembedded-core list will merge into openembedded-devel 
> at some point in the near future.
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


