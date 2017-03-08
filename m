Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7162D6006E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 09:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v289N9H4027143; Wed, 8 Mar 2017 09:23:09 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FrZcU1yAsnPk; Wed,  8 Mar 2017 09:23:09 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v289N5if027140
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Mar 2017 09:23:06 GMT
Message-ID: <1488964985.22968.54.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 08 Mar 2017 09:23:05 +0000
In-Reply-To: <a89026c4b38641650e5c14e231e452e842220238.1488272553.git.jussi.kukkonen@intel.com>
References: <cover.1488272553.git.jussi.kukkonen@intel.com>
	<a89026c4b38641650e5c14e231e452e842220238.1488272553.git.jussi.kukkonen@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 5/6] vulkan: Add recipe for Vulkan common loader
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
X-List-Received-Date: Wed, 08 Mar 2017 09:23:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-02-28 at 11:26 +0200, Jussi Kukkonen wrote:
> Add a recipe for vulkan loader library and the vulkaninfo binary.
> 
> Vulkan can be built to support X11 or wayland or both. There is
> currently no support for building tests, validation layers or even
> the demos as that would require a bunch of otherwise unnecessary
> dependencies.
> 
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  .../vulkan/demos-Don-t-build-tri-or-cube.patch     | 106
> +++++++++++++++++++++
>  meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb    |  33 +++++++
>  2 files changed, 139 insertions(+)
>  create mode 100644 meta/recipes-graphics/vulkan/vulkan/demos-Don-t-
> build-tri-or-cube.patch
>  create mode 100644 meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb

This doesn't seem to like musl:

https://autobuilder.yocto.io/builders/nightly-musl/builds/184/steps/BuildImages/logs/stdio

Cheers,

Richard

