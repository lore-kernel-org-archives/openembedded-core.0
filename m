Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 619747847D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 17:09:39 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 18 Aug 2017 10:09:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,393,1498546800"; d="scan'208";a="120461360"
Received: from jalamego-mobl3.zpn.intel.com (HELO [10.219.128.130])
	([10.219.128.130])
	by orsmga004.jf.intel.com with ESMTP; 18 Aug 2017 10:09:40 -0700
To: openembedded-core@lists.openembedded.org
References: <1502831134-27642-1-git-send-email-jose.a.lamego@linux.intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <2ca752dc-b545-6bda-a7e5-fce1fe8c935f@linux.intel.com>
Date: Fri, 18 Aug 2017 12:09:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502831134-27642-1-git-send-email-jose.a.lamego@linux.intel.com>
Subject: Re: [PATCH] packagegroup-python3: add packagegroup
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
X-List-Received-Date: Fri, 18 Aug 2017 17:09:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Please disregard this patch. The python3 recipe provides python-modules,
which includes all of the listed packages, making a new packagegroup
unnecessary.


On 08/15/2017 04:05 PM, Jose Lamego wrote:
> Many of the most usual python3 modules are missing when
> trying to import them to python3 in images built with
> python3-core installed.
>
> This change creates the python3 packagegroup, containing
> the most usual python3 packages to be installed for images
> featuring complete python functionality by using the
> FEATURES_PACKAGES variable to define python3 as a new feature
> and then adding it to the image to build.
>
> [YOCTO #10667]
>
> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
> ---
>  .../packagegroups/packagegroup-python3.bb          | 85 ++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 meta/recipes-devtools/packagegroups/packagegroup-python3.bb
>
> diff --git a/meta/recipes-devtools/packagegroups/packagegroup-python3.bb b/meta/recipes-devtools/packagegroups/packagegroup-python3.bb
> new file mode 100644
> index 0000000..ab83460
> --- /dev/null
> +++ b/meta/recipes-devtools/packagegroups/packagegroup-python3.bb
> @@ -0,0 +1,85 @@
> +SUMMARY = "Provides a basic set of python3 packages"
> +
> +DEPENDS = "python3-native"
> +
> +PR = "1"
> +
> +inherit packagegroup
> +
> +RPROVIDES_${PN} = "python3"
> +
> +RDEPENDS_${PN} = "\
> +    libpython3 \
> +    libpython3-staticdev \
> +    python3-pyvenv \
> +    python3-dbg \
> +    python3-2to3 \
> +    python3-argparse \
> +    python3-asyncio \
> +    python3-audio \
> +    python3-codecs \
> +    python3-compile \
> +    python3-compression \
> +    python3-core \
> +    python3-crypt \
> +    python3-ctypes \
> +    python3-curses \
> +    python3-datetime \
> +    python3-db \
> +    python3-debugger \
> +    python3-dev \
> +    python3-difflib \
> +    python3-distutils \
> +    python3-doctest \
> +    python3-email \
> +    python3-enum \
> +    python3-fcntl \
> +    python3-gdbm \
> +    python3-html \
> +    python3-idle \
> +    python3-image \
> +    python3-importlib \
> +    python3-io \
> +    python3-json \
> +    python3-lang \
> +    python3-logging \
> +    python3-mailbox \
> +    python3-math \
> +    python3-mime \
> +    python3-mmap \
> +    python3-multiprocessing \
> +    python3-netclient \
> +    python3-netserver \
> +    python3-numbers \
> +    python3-pickle \
> +    python3-pkgutil \
> +    python3-pprint \
> +    python3-profile \
> +    python3-pydoc \
> +    python3-re \
> +    python3-readline \
> +    python3-reprlib \
> +    python3-resource \
> +    python3-selectors \
> +    python3-shell \
> +    python3-signal \
> +    python3-smtpd \
> +    python3-sqlite3 \
> +    python3-sqlite3-tests \
> +    python3-stringold \
> +    python3-subprocess \
> +    python3-syslog \
> +    python3-terminal \
> +    python3-tests \
> +    python3-textutils \
> +    python3-threading \
> +    python3-tkinter \
> +    python3-typing \
> +    python3-unittest \
> +    python3-unixadmin \
> +    python3-xml \
> +    python3-xmlrpc \
> +    python3-modules \
> +    python3-misc \
> +    python3-man \
> +    "

-- 
Jose Lamego | OTC Embedded Platform & Tools | GDC


