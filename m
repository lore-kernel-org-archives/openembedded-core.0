Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D491F6E74C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Mar 2014 20:53:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Mar 2014 12:53:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,573,1389772800"; d="scan'208";a="490934769"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.49])
	by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2014 12:53:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun, 02 Mar 2014 20:53:26 +0000
Message-ID: <2434502.a14tfVEIXy@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.4-200.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <1393782102.22581.9.camel@ted>
References: <1393782102.22581.9.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] acpica: Add recipe for latest version
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
X-List-Received-Date: Sun, 02 Mar 2014 20:53:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 02 March 2014 17:41:42 Richard Purdie wrote:
> This is now used by multiple architectures and is useful when working
> with firmware. I'd love to see more BSPs shipping working firmware
> builds and this should bring us a step closer to that.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> ---
> diff --git a/meta/recipes-bsp/acpica/acpica_20140114.bb
> b/meta/recipes-bsp/acpica/acpica_20140114.bb new file mode 100644
> index 0000000..584023d
> --- /dev/null
> +++ b/meta/recipes-bsp/acpica/acpica_20140114.bb
> @@ -0,0 +1,16 @@
> +SRC_URI =
> "http://acpica.org/sites/acpica/files/acpica-unix2-20140114.tar.gz"
> +LICENSE = "GPLv2.0 | ACPICA"
> +LIC_FILES_CHKSUM =
> "file://source/include/acpi.h;endline=42;md5=23044abac8549f92999615207f2b8f
> 56" +
> +S = "${WORKDIR}/acpica-unix2-${PV}/"
> +
> +EXTRA_OEMAKE = "CC='${CC}'"
> +
> +do_install () {
> +	oe_runmake install DESTDIR='${D}' INSTALLFLAGS='-m 555'
> INSTALLDIR=${bindir} +}
> +
> +SRC_URI[md5sum] = "fcd4b7304f1bfabc7d4b9cfdecc6b0c6"
> +SRC_URI[sha256sum] =
> "0d5bd32690ab77e21ab143ef25361c314a4ed13c33a5fb3ddd6f5559ab24ebc3" +
> +BBCLASSEXTEND = "native"


Not sure if you saw it already but meta-oe has an acpica recipe:

http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extended/acpica

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

