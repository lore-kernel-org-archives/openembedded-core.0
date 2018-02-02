Return-Path: <california.l.sullivan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CE6EE7885D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 23:17:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Feb 2018 15:17:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,451,1511856000"; d="scan'208";a="31597637"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2018 15:17:16 -0800
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	openembedded-core@lists.openembedded.org
References: <1517523029-19272-1-git-send-email-alejandr@xilinx.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <40632d02-90d3-02ab-47cf-afa6ddb333fb@intel.com>
Date: Fri, 2 Feb 2018 15:17:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1517523029-19272-1-git-send-email-alejandr@xilinx.com>
Subject: Re: [PATCH v2] ninja: Upgrade from 1.7.2 to major release 1.8.2
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
X-List-Received-Date: Fri, 02 Feb 2018 23:17:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 02/01/2018 02:10 PM, Alejandro Enedino Hernandez Samaniego wrote:
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
> ---
>   meta/recipes-devtools/ninja/ninja_1.7.2.bb | 30 ------------------------------
>   meta/recipes-devtools/ninja/ninja_1.8.2.bb | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 30 insertions(+), 30 deletions(-)
>   delete mode 100644 meta/recipes-devtools/ninja/ninja_1.7.2.bb
>   create mode 100644 meta/recipes-devtools/ninja/ninja_1.8.2.bb
Adding the following to your .gitconfig will give you more readable 
patches for package upgrades:
[diff]
         renames = copies

It simplifies the delete -> creation to a rename, then shows what 
changed in the renamed file (SRC_URI and SRCREV).

Thanks,
Cal

>
> diff --git a/meta/recipes-devtools/ninja/ninja_1.7.2.bb b/meta/recipes-devtools/ninja/ninja_1.7.2.bb
> deleted file mode 100644
> index 4d3b272..0000000
> --- a/meta/recipes-devtools/ninja/ninja_1.7.2.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -SUMMARY = "Ninja is a small build system with a focus on speed."
> -HOMEPAGE = "http://martine.github.com/ninja/"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
> -
> -DEPENDS = "re2c-native ninja-native"
> -
> -SRCREV = "717b7b4a31db6027207588c0fb89c3ead384747b"
> -
> -SRC_URI = "git://github.com/martine/ninja.git;branch=release"
> -UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
> -
> -S = "${WORKDIR}/git"
> -
> -do_configure[noexec] = "1"
> -
> -do_compile_class-native() {
> -       ./configure.py --bootstrap
> -}
> -
> -do_compile() {
> -       ./configure.py
> -       ninja
> -}
> -
> -do_install() {
> -       install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja
> -}
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/ninja/ninja_1.8.2.bb b/meta/recipes-devtools/ninja/ninja_1.8.2.bb
> new file mode 100644
> index 0000000..c6fcfef
> --- /dev/null
> +++ b/meta/recipes-devtools/ninja/ninja_1.8.2.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "Ninja is a small build system with a focus on speed."
> +HOMEPAGE = "http://martine.github.com/ninja/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
> +
> +DEPENDS = "re2c-native ninja-native"
> +
> +SRCREV = "253e94c1fa511704baeb61cf69995bbf09ba435e"
> +
> +SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
> +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
> +
> +S = "${WORKDIR}/git"
> +
> +do_configure[noexec] = "1"
> +
> +do_compile_class-native() {
> +       ./configure.py --bootstrap
> +}
> +
> +do_compile() {
> +       ./configure.py
> +       ninja
> +}
> +
> +do_install() {
> +       install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.7.4
>
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.


