Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1T3kNI-0000jZ-Cj
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 11:03:48 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69) with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1T3kBd-0003Ce-4Q>; Tue, 21 Aug 2012 10:51:45 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69) with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1T3kBb-0008Ic-3R>; Tue, 21 Aug 2012 10:51:43 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1T3kBX-0000TT-0u; Tue, 21 Aug 2012 10:51:39 +0200
Date: Tue, 21 Aug 2012 10:51:39 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Liang Li <liang.li@windriver.com>
Message-ID: <20120821085138.GA29885@mi.fu-berlin.de>
References: <502D12E2.4000808@windriver.com> <1345132684.14667.70.camel@ted>
	<20120817033209.GB19625@localhost> <1345196146.14667.84.camel@ted>
	<20120817100001.GA16621@localhost> <1345200782.26132.18.camel@ted>
	<20120817130151.GA1416@localhost> <20120817130517.GB1416@localhost>
	<50324E29.5060005@windriver.com> <20120821050825.GB27917@localhost>
MIME-Version: 1.0
In-Reply-To: <20120821050825.GB27917@localhost>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Cc: darren.hart@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [discussion] perf: specify SLANG_INC dir for perf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 09:03:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 21, 2012 at 01:08:25PM +0800, Liang Li wrote:
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -190,6 +190,9 @@ kernel_do_install() {
>  	for entry in $bin_files; do
>  	        rm -f $kerneldir/$entry
>  	done
> +
> +	# Fix SLNAG_INC for slang.h
> +	sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
Hm,

is this "-I=" a new special feature of gcc?

-I/usr/include/slang
-I=/usr/include/slang

Bye Henning


