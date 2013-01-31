Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U0xHG-0003ye-HP for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 17:46:21 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0VGYjkm020595; Thu, 31 Jan 2013 16:35:10 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hg3NR-o2VIR8; Thu, 31 Jan 2013 16:35:10 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0VGZ1Zj020765
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 31 Jan 2013 16:35:04 GMT
Message-ID: <1359649807.14071.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
Date: Thu, 31 Jan 2013 16:30:07 +0000
In-Reply-To: <1359633187-28629-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1359633187-28629-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] flex: updated to 2.5.37
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
X-List-Received-Date: Thu, 31 Jan 2013 16:46:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-01-31 at 13:53 +0200, Bogdan Marinescu wrote:
> Removed the patches to flex, because they are now applied to the
> latest version.
> 
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>  .../flex/flex/avoid-FORTIFY-warnings.patch         |   59 --------------------
>  .../flex/int-is-not-the-same-size-as-size_t.patch  |   42 --------------
>  meta/recipes-devtools/flex/flex_2.5.35.bb          |   11 ----
>  meta/recipes-devtools/flex/flex_2.5.37.bb          |    8 +++
>  4 files changed, 8 insertions(+), 112 deletions(-)
>  delete mode 100644 meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
>  delete mode 100644 meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch
>  delete mode 100644 meta/recipes-devtools/flex/flex_2.5.35.bb
>  create mode 100644 meta/recipes-devtools/flex/flex_2.5.37.bb

This failed to build for me:

| make[4]: Leaving directory `/media/build1/poky/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37'
| make[3]: Leaving directory `/media/build1/poky/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37'
| make[2]: Leaving directory `/media/build1/poky/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37'
| Making install in doc
| make[2]: Entering directory `/media/build1/poky/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37/doc'
| restore=: && backupdir=".am$$" && \
| 	am__cwd=`pwd` && CDPATH="${ZSH_VERSION+.}:" && cd . && \
| 	rm -rf $backupdir && mkdir $backupdir && \
| 	if (/bin/bash /media/build1/poky/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37/missing --run makeinfo --version) >/dev/null 2>&1; then \
| 	  for f in flex.info flex.info-[0-9] flex.info-[0-9][0-9] flex.i[0-9] flex.i[0-9][0-9]; do \
| 	    if test -f $f; then mv $f $backupdir; restore=mv; else :; fi; \
| 	  done; \
| 	else :; fi && \
| 	cd "$am__cwd"; \
| 	if /bin/bash /media/build1/poky/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37/missing --run makeinfo   -I . \
| 	 -o flex.info flex.texi; \
| 	then \
| 	  rc=0; \
| 	  CDPATH="${ZSH_VERSION+.}:" && cd .; \
| 	else \
| 	  rc=$?; \
| 	  CDPATH="${ZSH_VERSION+.}:" && cd . && \
| 	  $restore $backupdir/* `echo "./flex.info" | sed 's|[^/]*$||'`; \
| 	fi; \
| 	rm -rf $backupdir; exit $rc
| TEXINPUTS=".:$TEXINPUTS" \
| 	MAKEINFO='/bin/bash /media/build1/poky/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37/missing --run makeinfo   -I .' \
| 	texi2dvi --pdf --batch  --clean flex.texi
| /media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/bin/texi2dvi: 132: /media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/bin/texi2dvi: Syntax error: Bad function name
| make[2]: *** [flex.pdf] Error 2
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory `/media/build1/poky/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37/doc'
| make[1]: *** [install-recursive] Error 1
| make[1]: Leaving directory `/media/build1/poky/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37'


Cheers,

Richard



