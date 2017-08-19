Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 881D778310
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 21:14:30 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7JLEQSo003655
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 19 Aug 2017 22:14:28 +0100
Message-ID: <1503177266.32591.25.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: leonardo.sandoval.gonzalez@linux.intel.com,
	openembedded-core@lists.openembedded.org
Date: Sat, 19 Aug 2017 22:14:26 +0100
In-Reply-To: <20170815190828.82873-2-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170815190828.82873-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20170815190828.82873-2-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sat, 19 Aug 2017 22:14:28 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/2] build-appliance-image: include proxy on pip3 installation
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
X-List-Received-Date: Sat, 19 Aug 2017 21:14:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-08-15 at 12:08 -0700,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> Otherwise, we get timeouts, leading to errors:
> 
>     pip._vendor.requests.exceptions.ConnectTimeout:
> HTTPSConnectionPool(host='pypi.python.org', port=443): Max retries
> exceeded with url: /pypi/pip/json (Caused by
> ConnectTimeoutError(<pip._vendor.requests.packages.urllib3.connection
> .VerifiedHTTPSConnection object at 0x7ff741bb3ef0>, 'Connection to
> pypi.python.org timed out. (connect timeout=5)'))
>     WARNING: TOPDIR/tmp/work/qemux86-poky-linux/build-appliance-
> image/15.0.0-r0/temp/run.do_populate_poky_src.185123:1 exit 1 from
> 'pip3 install --user -I -U -v -r TOPDIR/tmp/work/qemux86-poky-
> linux/build-appliance-image/15.0.0-
> r0/rootfs/home/builder/poky/bitbake/toaster-requirements.txt'
>     DEBUG: Python function do_image finished
> 
> Complete log at [1]
> 
> [1] http://errors.yoctoproject.org/Errors/Build/43393/
> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.in
> tel.com>
> ---
>  meta/recipes-core/images/build-appliance-image_15.0.0.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Something isn't correct here:

https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/1176/steps/BuildImages_1/logs/stdio

Cheers,

Richard


