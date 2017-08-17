Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 40340782E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 07:36:17 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7H7aEwX017185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 17 Aug 2017 08:36:16 +0100
Message-ID: <1502955374.13978.182.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: juan.m.cruz.alcaraz@linux.intel.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 17 Aug 2017 08:36:14 +0100
In-Reply-To: <20170817013615.5900-1-juan.m.cruz.alcaraz@linux.intel.com>
References: <20170817013615.5900-1-juan.m.cruz.alcaraz@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 17 Aug 2017 08:36:16 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v2] devtool/copy_buildsystem: adds meta-skeleton layer in the eSDK installation.
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
X-List-Received-Date: Thu, 17 Aug 2017 07:36:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-08-16 at 18:36 -0700, juan.m.cruz.alcaraz@linux.intel.com
wrote:
> From: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
> 
> The eSDK installation requires the meta-skeleton layer.
> The build system might use the meta-skeleton recipes as layout
> to create custom recipes. An example is the recipetool script
> that uses the meta-skeleton kernel recipe when creating a custom
> kernel recipe.
> 
> [YOCTO #11102]
> 
> Signed-off-by: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.c
> om>
> ---
>  meta/lib/oe/copy_buildsystem.py | 8 ++++++++
>  1 file changed, 8 insertions(+)

Failed to build on the autobuilder I'm afraid:

https://autobuilder.yoctoproject.org/main/builders/nightly-x86/builds/1216/steps/BuildImages_2/logs/stdio

Cheers,

Richard

