Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 61CB778411
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Feb 2018 10:00:03 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w149xoXs025329
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 4 Feb 2018 09:59:52 GMT
Message-ID: <1517738390.3090.76.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jan Siegmund <jan.siegmund0@hm.edu>,
	openembedded-core@lists.openembedded.org
Date: Sun, 04 Feb 2018 09:59:50 +0000
In-Reply-To: <20180203103314.2646-1-jsiegmun@hm.edu>
References: <20180203103314.2646-1-jsiegmun@hm.edu>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Jan Siegmund <jsiegmund@arri.de>
Subject: Re: [PATCH v2] apt-native: Add libapt-pkg headers
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
X-List-Received-Date: Sun, 04 Feb 2018 10:00:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2018-02-03 at 11:33 +0100, Jan Siegmund wrote:
> From: Jan Siegmund <jsiegmund@arri.de>
> 
> Native tools were not able to use the headers of apt-pkg. This patch
> adds the feature.
> The headers were added from apt-pkg and apt-inst to the native
> recipe.
> The shipped headers match the ones in the Ubuntu package libapt-pkg-
> dev.
> 
> Signed-off-by: Jan Siegmund <jsiegmund@arri.de>
> ---
>  meta/recipes-devtools/apt/apt-native.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-
> devtools/apt/apt-native.inc
> index 68f1b3ce2c..d82ffcc59f 100644
> --- a/meta/recipes-devtools/apt/apt-native.inc
> +++ b/meta/recipes-devtools/apt/apt-native.inc
> @@ -35,6 +35,8 @@ python do_install_config () {
>          outfile.close()
>  }
>  
> +FILES_${PN} += "${includedir}"
> +
>  do_install_base () {
>  	install -d ${D}${bindir}
>  	install -m 0755 bin/apt-cdrom ${D}${bindir}/

I suspect a native recipe doesn't need to set FILES?

Cheers,

Richard

