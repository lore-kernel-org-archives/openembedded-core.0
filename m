Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2EEE471AB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 08:34:46 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0J8YiI9031932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 19 Jan 2018 08:34:45 GMT
Message-ID: <1516350884.24502.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Fri, 19 Jan 2018 08:34:44 +0000
In-Reply-To: <20180118171659.14485-1-sgw@linux.intel.com>
References: <20180118171659.14485-1-sgw@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] image_types: add support for modern f2fs flash filesystem
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
X-List-Received-Date: Fri, 19 Jan 2018 08:34:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-01-18 at 09:16 -0800, Saul Wold wrote:
> The f2fs filesystem is a newer flash filesystem that is available in
> meta-filesystems. This needs a minimum sized blank space to operate
> in correctly.
> 
> The f2fs has overprovision functionality and when building smaller
> filesystems, you actually need more space, therefore under 500M (or
> so)
> double the amount of space needed in order to handle the
> overprovision
> functions in f2fs.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/image_types.bbclass | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

We'll need to exclude this fs type from the test:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/762/steps/Running%20oe-selftest/logs/stdio

Cheers,

Richard



