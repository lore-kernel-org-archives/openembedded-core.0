Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QHl2Z-0007X0-Tf
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 00:59:32 +0200
Received: by pxi6 with SMTP id 6so1081363pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2011 15:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=XUxoFEG7t4M+y5sZOlxL86qQwl49lfIsZuaUzjhU4lI=;
	b=kg7gTovb0hsSAcn9NZfkqZhA8KbhYw4tEJSHdUYpIctV7y+q8FVBkgcm6YVhXjWheE
	a/VRumfAl5deXixDRoF2n+PiCujWSLdCdYPO1BelyHF8NZHDRNJTcf576J1QIkyA+Vbb
	Y913XUyKEYVYhjWv+sM4XD/6GuAGR5cv3EtPs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=Pe7vKcKi902opiZbYA7H1UOThc6T5etVZ9J2zUYGMjQ0AThIfdZjub0hk4GuA7EYE/
	m2Qmg9+ZKb2wr9LTMf7JKTPcdXfI+BSS57ZOvlXAPDCYtSqIf9jcgGFFXTgm1262yq2J
	YQl21E11eSUQANAqrQsVmsGbQWF7UnJhc//mg=
Received: by 10.68.1.4 with SMTP id 4mr2116471pbi.397.1304549811369;
	Wed, 04 May 2011 15:56:51 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id t6sm1011268pbc.21.2011.05.04.15.56.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 May 2011 15:56:50 -0700 (PDT)
Date: Wed, 4 May 2011 15:56:17 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110504225617.GB9750@sakrah.homelinux.org>
References: <BANLkTi=9fddo=qaHhom4cw9mBLrNP1rs8w@mail.gmail.com>
	<BANLkTikw8npv5q-gbhHWiOpxtVAwMo-XGA@mail.gmail.com>
	<BANLkTimvDmHUpEHEVJ4oS4N9RUX0n8ndLA@mail.gmail.com>
	<BANLkTinyr-cj4BEWQ553AkSH4uoCmfETpA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTinyr-cj4BEWQ553AkSH4uoCmfETpA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: How to patch yocto kernel
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
X-List-Received-Date: Wed, 04 May 2011 22:59:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (02/05/11 01:31), Bruce Ashfield wrote:
> On Sun, May 1, 2011 at 11:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Sun, May 1, 2011 at 7:40 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >> On Sun, May 1, 2011 at 9:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>> Hi
> >>>
> >>> I am trying to test this patch
> >>>
> >>> http://uclibc.org/~kraj/perf-tool-Fix-gcc-4.6.0-issues.patch
> >>>
> >>> to fix the build using gcc 4.6.0 but the kernel patching for yocto is
> >>> not as usual as other recipes
> >>> since it uses entire set of tooling around it.
> >>>
> >>> I tried to look around for documentation and few references I found
> >>>
> >>> https://wiki.pokylinux.org/wiki/Wind_River_Kernel
> >>>
> >>> discourages putting patches in metadata. and in another document it
> >>> says it uses git to do patching but does not explain how.
> >>>
> >>> So if someone can explain in simple terms how to patch a linux-yocto
> >>> would be really helpful from a
> >>> developer POV or any documentation will be helpful.
> >>>
> >>> How do people develop/test patches on linux-yocto I understand
> >>> eventually they are desired to be part
> >>> of linux-yocto git but that comes after they are tried and tested locally
> >>>
> >>> I would have preferred to have the usual SRC_URI patching atleast for
> >>> local testing. As of now
> >>> it seems not to use normal OE recipe procedures.
> >>
> >> Are you actually not  seeing this work ? I put in place compatibility
> >> with existing patching via the SRC_URI for just this reason. A patch
> >> specified in the SRC_URI will be picked up by the tools and applied
> >> to the end of the BSP branch during the patching phase.
> >>
> >
> > if it worked. I would not be writing this email :)
> 
> :) you never know, I didn't see your error message so I didn't want
> to presume.
> 
> But I spoke too soon earlier, I had a bbappend in my layers that
> meant I was modifying the wrong SRC_URI to have your patch
> applied.
> 
> When I modified the right SRC_URI like so:
> 
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta\
> +           file://perf-tool-Fix-gcc-4.6.0-issues.patch"
> 
> (i.e. the obvious way)
> 
> I see the patch applied to the end of my BSP branch:
> 
> > git branch
>   master
>   meta
>   yocto/base
>   yocto/eg20t
>   yocto/emgd
>   yocto/gma500
>   yocto/standard/arm-versatile-926ejs
>   yocto/standard/base
>   yocto/standard/beagleboard
>   yocto/standard/common-pc-64/base
>   yocto/standard/common-pc-64/jasperforest
>   yocto/standard/common-pc-64/sugarbay
>   yocto/standard/common-pc/atom-pc
> * yocto/standard/common-pc/base
> 
> commit 2500f7dc4d6c0d8b2f5ddad6369ee4541456533a
> Author: Kyle McMartin <kyle@mcmartin.ca>
> Date:   Mon May 2 01:26:49 2011 -0400
> 
>     commit fb7d0b3cefb80a105f7fd26bbc62e0cbf9192822 upstream.
> 
>     GCC 4.6.0 in Fedora rawhide turned up some compile errors in tools/perf
>     due to the -Werror=unused-but-set-variable flag.
> 
>     I've gone through and annotated some of the assignments that had side
>     effects (ie: return value from a function) with the __used annotation,
>     and in some cases, just removed unused code.
> 
>     In a few cases, we were assigning something useful, but not using it in
>     later parts of the function.
> 
>     kyle@dreadnought:~/src% gcc --version
>     gcc (GCC) 4.6.0 20110122 (Red Hat 4.6.0-0.3)
> 
>     Cc: Ingo Molnar <mingo@redhat.com>
>     LKML-Reference: <20110124161304.GK27353@bombadil.infradead.org>
>     Signed-off-by: Kyle McMartin <kyle@redhat.com>
>     [ committer note: Fixed up the annotation fixes, as that code
> moved recently ]
>     Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
>     [Backported to 2.6.38.2 by deleting unused but set variables]
>     Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
>     [Backported to linux-yocto kernel git version]
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> I did modify the patch format slightly, since git am needs to be able to
> grok the patch for it to apply.
> 
> Did you get any sort of error message when your patch didn't apply ?

When I did a build from scratch then it worked fine. Have you already
taken this patch in ? if not what needs to be done ?

-Khem


