Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QciM1-0003US-LM for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 20:22:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61IIRBt014039
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 19:18:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13648-08 for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2011 19:18:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61IIMN1014033
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 19:18:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <38420CC7-A216-4D03-B512-0D85BA9393B9@dominion.thruhere.net>
References: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>
	<201106301633.48933.paul.eggleton@linux.intel.com>
	<4FC82E26-5A0C-48DF-99F5-7E2D9B8C7290@dominion.thruhere.net>
	<201106301659.54941.paul.eggleton@linux.intel.com>
	<1309537504.20015.531.camel@rex>	<1309540367.20015.534.camel@rex>
	<4E0E00FA.1060508@gmail.com> <4E0E02FF.4040304@windriver.com>
	<38420CC7-A216-4D03-B512-0D85BA9393B9@dominion.thruhere.net>
Date: Fri, 01 Jul 2011 19:18:00 +0100
Message-ID: <1309544280.20015.535.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] insane bbclass: turn fatal errors back into fatal errors
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
X-List-Received-Date: Fri, 01 Jul 2011 18:22:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 19:33 +0200, Koen Kooi wrote:
> Op 1 jul 2011, om 19:25 heeft Mark Hatle het volgende geschreven:
> 
> > On 7/1/11 12:16 PM, Khem Raj wrote:
> >> On 07/01/2011 10:12 AM, Richard Purdie wrote:
> >>> gcc-4.6.0+svnr175150, non dev contains .so, gcc, /work/i586-poky-linux/gcc-4.6.0+svnr175150-r4/packages-split/gcc/usr/libexec/gcc/i586-poky-linux/4.6.1/liblto_plugin.so
> >>>> 
> >> 
> >> This should be packages with gcc itself. May be adding to FILES will get 
> >> rid of this warning
> > 
> > The warning above indicates that it -is- being packaged in the 'gcc' package.
> > The check verified that no files of the name .so exit and they are not symlinks:
> > 
> >    if not name.endswith("-dev") and not name.endswith("-dbg") and
> > path.endswith(".so") and os.path.islink(path):
> > 
> > In this case, I believe that the file is likely supposed to be there.  Is there
> > a way to selectively disable insane checks on a per-recipe basis when we know
> > they are wrong?
> 
> We only have the big INSANE_SKIP_gcc = True hammer

Although as I hint at in my insane.bbclass patch, I just made it much
easier to implement skipping specific checks. Its not there yet but
shouldn't be too difficult from where the code it at now...

Cheers,

Richard



