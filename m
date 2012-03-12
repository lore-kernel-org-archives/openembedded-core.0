Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7CgH-0004Zg-Hv
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 22:21:25 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Mar 2012 14:12:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="117023496"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2012 14:12:41 -0700
Message-ID: <4F5E66C9.9060900@linux.intel.com>
Date: Mon, 12 Mar 2012 14:12:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1330986694-28199-1-git-send-email-tworaz666@gmail.com>
In-Reply-To: <1330986694-28199-1-git-send-email-tworaz666@gmail.com>
Subject: Re: [PATCH] psplash: Add mising commands module import.
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
X-List-Received-Date: Mon, 12 Mar 2012 21:21:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2012 02:31 PM, Peter Tworek wrote:
> Python commands module is used in the recipe, but never imported.
> This leads to build errors like:
>
> NameError: global name 'commands' is not defined
>
> ERROR: The stack trace of python calls that resulted in this exception/failure was:
> ERROR:   File "do_compile", line 24, in<module>
> ERROR:
> ERROR:   File "do_compile", line 11, in do_compile
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0020:        bb.build.exec_func("oe_runmake", d)
> ERROR:      0021:        shutil.copyfile("psplash", outputfile)
> ERROR:      0022:
> ERROR:      0023:
> ERROR:  *** 0024:do_compile(d)
> ERROR:      0025:
> ERROR: (file: 'do_compile', lineno: 24, function:<module>)
> ERROR:      0007:    localfiles = d.getVar('SPLASH_LOCALPATHS', True).split()
> ERROR:      0008:    outputfiles = d.getVar('SPLASH_INSTALL', True).split()
> ERROR:      0009:    for localfile, outputfile in zip(localfiles, outputfiles):
> ERROR:      0010:        if localfile.endswith(".png"):
> ERROR:  *** 0011:            outp = commands.getstatusoutput('./make-image-header.sh %s POKY' % localfile)
> ERROR:      0012:            print(outp[1])
> ERROR:      0013:            fbase = os.path.splitext(os.path.basename(localfile))[0]
> ERROR:      0014:            shutil.copyfile("%s-img.h" % fbase, destfile)
> ERROR:      0015:        else:
>
> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
> ---
>   meta/recipes-core/psplash/psplash_git.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
> index 42ea615..bd405f9 100644
> --- a/meta/recipes-core/psplash/psplash_git.bb
> +++ b/meta/recipes-core/psplash/psplash_git.bb
> @@ -68,7 +68,7 @@ S = "${WORKDIR}/git"
>   inherit autotools pkgconfig update-rc.d
>
>   python do_compile () {
> -    import shutil
> +    import shutil, commands
>
>       # Build a separate executable for each splash image
>       destfile = "%s/psplash-poky-img.h" % d.getVar('S', True)
Merged into OE-Core

Thanks 	
	Sau!


