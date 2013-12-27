Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 38A4B6B0E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2013 02:19:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Dec 2013 18:19:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,558,1384329600"; d="scan'208";a="456258316"
Received: from unknown (HELO [10.255.15.249]) ([10.255.15.249])
	by fmsmga002.fm.intel.com with ESMTP; 26 Dec 2013 18:19:10 -0800
Message-ID: <52BCE39D.50806@linux.intel.com>
Date: Thu, 26 Dec 2013 18:19:09 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: David Good <david.good1@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <CALMFhSxzi2HUDObDudmq6VDxxdDMhMCjBmj3w6p2v11dzwpDVQ@mail.gmail.com>
In-Reply-To: <CALMFhSxzi2HUDObDudmq6VDxxdDMhMCjBmj3w6p2v11dzwpDVQ@mail.gmail.com>
Subject: Re: tdom recipe
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
X-List-Received-Date: Fri, 27 Dec 2013 02:19:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/2013 04:27 PM, David Good wrote:
> Hello,
>
> I've created a recipe which I would like to add to OpenEmbedded: tDOM.
>
> How do I submit a recipe for approval?
>
This should go to openembedded-devel for inclusion in meta-openembedded, 
not openembedded-core.

Other comments below

> --David
>
> DESCRIPTION = "XML data processing in Tcl"
This is more of a SUMMARY, can you expand the DESCRIPTION

> LICENSE = "MPL-1"
> SECTION = "devel/tcltk"
> HOMEPAGE = "http://tdom.github.io/"
> DEPENDS = "tcl-native"
> LIC_FILES_CHKSUM = "file://../LICENSE;md5=
> 4673aaff544d4c9b9a521cb8e0860bfb"
Make sure you disable line-wrapping

> PR = "r0"
>
No PR needed


Sau!

> SRC_URI = "git://github.com/tDOM/tdom.git;protocol=git;tag=master
> <http://github.com/tDOM/tdom.git;protocol=git;tag=master>"
>
> S = "${WORKDIR}/git/unix"
>
> inherit autotools
>
> FILES_${PN} += "${libdir}/tdom0.8.3/"
>
> CONFIGUREOPTS = " \
>               --build=${BUILD_SYS} \
>           --host=${HOST_SYS} \
>               --target=${TARGET_SYS} \
> "
> EXTRA_OECONF = " \
>               --with-tcl=${STAGING_BINDIR_CROSS} \
>               --with-tclinclude=${STAGING_INCDIR} \
>               "
>
> do_configure() {
>          oe_runconf
> }
>
> oe_runconf () {
>      cfgscript="${S}/../configure"
>      if [ -x "$cfgscript" ] ; then
>          bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
>          set +e
>          ${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS}
> ${EXTRA_OECONF} "$@"
>          if [ "$?" != "0" ]; then
>              echo "Configure failed. The contents of all config.log
> files follows to aid debugging"
>              find ${S} -name config.log -print -exec cat {} \;
>              bbfatal "oe_runconf failed"
>          fi
>          set -e
>      else
>          bbfatal "no configure script found at $cfgscript"
>      fi
> }
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

