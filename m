Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7B22179274
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 08:13:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8P8DG8E004485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 25 Sep 2018 09:13:18 +0100
Message-ID: <7083c560991d491f0e8b8b70eee611c1187b58d0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 09:13:16 +0100
In-Reply-To: <20180924190313.32027-1-pkj@axis.com>
References: <20180924190313.32027-1-pkj@axis.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/3] acl: Make it compatible with externalsrc
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
X-List-Received-Date: Tue, 25 Sep 2018 08:13:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-09-24 at 21:03 +0200, Peter Kjellerstedt wrote:
> Make the subdir fetch path for configure.ac relative. This avoids the
> following error after having done `devtool modify acl`:
> 
> ERROR: acl-2.2.52-r0 do_unpack: Unpack failure for URL:
> 'file://configure.ac;subdir=.../builds/qemux86-
> 64/workspace/sources/acl'.
> subdir argument isn't a subdirectory of unpack root
> .../builds/qemux86-64/tmp/work/core2-64-poky-linux/acl/2.2.52-r0
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-support/attr/acl_2.2.52.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/attr/acl_2.2.52.bb b/meta/recipes-
> support/attr/acl_2.2.52.bb
> index 8f3dc45cf7..8b89de9b42 100644
> --- a/meta/recipes-support/attr/acl_2.2.52.bb
> +++ b/meta/recipes-support/attr/acl_2.2.52.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70e
> d2b4d48995b790403217a249 \
>  DEPENDS = "attr"
>  
>  SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.src.tar.gz \
> -           file://configure.ac;subdir=${S} \
> +           file://configure.ac;subdir=${BP} \
>             file://run-ptest \
>             file://acl-fix-the-order-of-expected-output-of-
> getfacl.patch \
>             file://test-fix-insufficient-quoting-of.patch \

This isn't making sense to me. Doesn't externalsrc set ${S} to the
external source location?

Also, doesn't it remove the do_unpack task?

Cheers,

Richard

