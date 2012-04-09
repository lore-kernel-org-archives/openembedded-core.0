Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SHL06-0007FB-Hf
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 22:15:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id B9858315AFAC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2012 22:06:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id DjXXBNYzoIKx
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2012 22:06:24 +0200 (CEST)
Received: from [172.22.22.61] (drms-590ce6c6.pool.mediaWays.net
	[89.12.230.198])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id AD0CA315AFAA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2012 22:06:24 +0200 (CEST)
Message-ID: <4F83413F.7010608@opendreambox.org>
Date: Mon, 09 Apr 2012 22:06:23 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<c1765e7544603baa60bec27185a947aeee404bee.1333481624.git.mark.hatle@windriver.com>
	<4F7CC6E6.6020006@opendreambox.org>
	<CAMKF1soi+==bbEKMD+FLdk+8BvWNK3Nj24EJVhoyT5e=_5MvDw@mail.gmail.com>
	<4F7F28FB.20600@windriver.com>
	<CAMKF1srkXSBHFtO__F9m9TQ=dJzfn+7kfmXoK4=tWknEdc80eg@mail.gmail.com>
	<4F7F85DC.2000301@windriver.com>
	<4F820472.1080109@opendreambox.org>
	<4F82FD70.9080609@windriver.com>
In-Reply-To: <4F82FD70.9080609@windriver.com>
Subject: Re: [PATCH 3/7] conf/machine/include: Cleanup MIPS tunings to match README
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
X-List-Received-Date: Mon, 09 Apr 2012 20:15:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09.04.2012 17:17, Mark Hatle wrote:
> On 4/8/12 4:34 PM, Andreas Oberritter wrote:
>> On 07.04.2012 02:10, Mark Hatle wrote:
>>> Just ran a local build with the qemumips machine, this is a standard
>>> mips32 target.
>>>
>>>  From the configure line for eglibc:
>>>
>>> /msp-lpggp1/mhatle/git/oe-core/build-mips32/tmp-eglibc/work/mips32-oe-linux/eglibc-2.13-r23+svnr15508/eglibc-2_13/libc/configure
>>>
>>> --build=x86_64-linux --host=mips-oe-linux --target=mips-oe-linux
>>> --prefix=/usr --exec_prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin
>>> --libexecdir=/usr/libexec --datadir=/usr/share --sysconfdir=/etc
>>> --sharedstatedir=/com --localstatedir=/var --libdir=/usr/lib
>>> --includedir=/usr/include --oldincludedir=/usr/include
>>> --infodir=/usr/share/info --mandir=/usr/share/man --disable-silent-rules
>>> --disable-dependency-tracking
>>> --with-libtool-sysroot=/msp-lpggp1/mhatle/git/oe-core/build-mips32/tmp-eglibc/sysroots/qemumips
>>>
>>> --enable-kernel=2.6.16 --without-cvs --disable-profile --disable-debug
>>> --without-gd --enable-clocale=gnu
>>> --enable-add-ons=ports,nptl,libidn,ports
>>> --with-headers=/msp-lpggp1/mhatle/git/oe-core/build-mips32/tmp-eglibc/sysroots/qemumips/usr/include
>>>
>>> --without-selinux
>>>
>>> The system is correctly setting the target to "mips-oe-linux".
>>>
>>> I checked and bash is the same way.
>>>
>>> So the canonical arch is correct, the mips32 is only the packaging
>>> arch.  It was always intended that the packaging arch be used in full on
>>> MIPS.  (This will allow us to specify mips32r2, mipsiii, mipsiv, etc as
>>> necessary if we expand the mips tunings.)
>>
>> I don't think such a change should be done only few days before a
>> release. Until this patch was applied, the packaging arch has always
>> been mipsel, not mips32el. Please, revert or fix this!
> 
> This is easy to change to the previous behavior...  however it was a bug
> in the original implementation.
> 
> But again, I stress nothing changed except for the packaging arch... the
> way the packages are configured, compiled, installed remain the same,
> only the package arch has changed.  The only place that may be affected
> by this is the package feed mechanism.

I think breaking package feeds in such a way is one of the worst things
to do in OE.

> To revert to the previous behavior, in the
> meta/conf/machine/include/tune-mips.inc:
> 
> --- a/meta/conf/machine/include/tune-mips32.inc
> +++ b/meta/conf/machine/include/tune-mips32.inc
> @@ -9,17 +9,17 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES",
> "mips32"
>  AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
> 
>  TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips} mips32"
> -MIPSPKGSFX_VARIANT_tune-mips32 = "mips32"
> +MIPSPKGSFX_VARIANT_tune-mips32 = "mips"
>  PACKAGE_EXTRA_ARCHS_tune-mips32 = "mips mips32"
> 
>  TUNE_FEATURES_tune-mips32el = "${TUNE_FEATURES_tune-mipsel} mips32"
> -MIPSPKGSFX_VARIANT_tune-mips32el = "mips32el"
> +MIPSPKGSFX_VARIANT_tune-mips32el = "mipsel"
>  PACKAGE_EXTRA_ARCHS_tune-mips32el = "mipsel mips32el"
                                               ^^^^^^^^
I don't think this is correct, in all four cases, because no packages
will have that arch.

>  TUNE_FEATURES_tune-mips32-nf = "${TUNE_FEATURES_tune-mips-nf} mips32"
> -MIPSPKGSFX_VARIANT_tune-mips32-nf = "mips32"
> +MIPSPKGSFX_VARIANT_tune-mips32-nf = "mips"
>  PACKAGE_EXTRA_ARCHS_tune-mips32-nf = "mips-nf mips32-nf"
> 
>  TUNE_FEATURES_tune-mips32el-nf = "${TUNE_FEATURES_tune-mipsel-nf} mips32"
> -MIPSPKGSFX_VARIANT_tune-mips32el-nf = "mips32el"
> +MIPSPKGSFX_VARIANT_tune-mips32el-nf = "mipsel"
>  PACKAGE_EXTRA_ARCHS_tune-mips32el-nf = "mipsel-nf mips32el-nf"
> 
> Before I submit this patch though, I would like others to weigh in on
> the issue.  This was a mistake in the earlier version of the code.  The
> "variant" wasn't be set as it should have been.
> 
> The problem is that if you set the tune to "mips", you get the default
> compiler behavior.

According to the gcc docs, there is no "mips" ISA name. Valid names are:
`mips1', `mips2', `mips3', `mips4', `mips32', `mips32r2', `mips64' and
`mips64r2'. Therefore I don't understand why "mips" should default to
anything else, if it was an alias for mips32 before.

>  However, if you set the tune to mips32, you get
> "-march=mips32" added to your CCARGS.  This will produce slightly
> different binaries, thus "mips" and mips32" are not equal.

Btw, meta/recipes-core/eglibc/eglibc-ld.inc doesn't know about mips32 or
mips32el, so this probably broke, too.
meta/recipes-devtools/gdb/gdb-common.inc likewise. Do overrides still
work, e.g. EXTRA_OECONF_mipsel etc.? How about
meta/recipes-qt/qt4/qt4_arch.inc?

Whatever the answers are, the most important point is that it's the
worst point in time to do such a change. We should rather discuss it
after the release, if at all.

Regards,
Andreas


