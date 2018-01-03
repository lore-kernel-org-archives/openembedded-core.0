Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 54EE07807C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 14:11:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w03E95X0019372
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 3 Jan 2018 14:09:06 GMT
Message-ID: <1514988545.5525.139.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Jan 2018 14:09:05 +0000
In-Reply-To: <20171221124500.29810-2-alexander.kanavin@linux.intel.com>
References: <20171221124500.29810-1-alexander.kanavin@linux.intel.com>
	<20171221124500.29810-2-alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCHv2 2/3] testimage.bbclass: add ptest to the list of runtime tests whenever possible
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
X-List-Received-Date: Wed, 03 Jan 2018 14:11:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-12-21 at 14:44 +0200, Alexander Kanavin wrote:
> If no ptest packages are installed in the image, the test does
> nothing;
> if ptest packages are installed in the image, then they should be
> run without user having to enable that manually.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/testimage.bbclass | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

https://autobuilder.yocto.io/builders/nightly-deb-non-deb/builds/673/steps/Running%20Sanity%20Tests/logs/stdio

Cheers,

Richard

