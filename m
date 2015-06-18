Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B833773306
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 07:27:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5I7RMb9013072
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 00:27:22 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 18 Jun 2015 00:27:21 -0700
Message-ID: <558272D8.2090102@windriver.com>
Date: Thu, 18 Jun 2015 15:27:20 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1433320510.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1433320510.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/2] gtk+/cairo/libsdl: build without x11 in DISTRO_FEATURE
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
X-List-Received-Date: Thu, 18 Jun 2015 07:27:24 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

Any comments on these two patches, please ?

// Robert

On 06/03/2015 04:38 PM, Robert Yang wrote:
> Hello,
>
> After the two patches, yocto's world build would be OK without x11 in
> DISTRO_FEATURE.
>
> // Robert
>
> The following changes since commit 968973d55d4b33e1a929ed4cdf9387fcaba2d93f:
>
>    qt4: unconditionally disable gstreamer 0.10 support in qt webkit (2015-05-30 22:25:12 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/nox11
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/nox11
>
> Robert Yang (2):
>    gtk+/cairo: enable x11 or directfb
>    libsdl: depends on libglu when both x11 and opengl
>
>   meta/recipes-gnome/gtk+/gtk+.inc              |    5 ++---
>   meta/recipes-graphics/cairo/cairo.inc         |    8 ++++++--
>   meta/recipes-graphics/libsdl/libsdl_1.2.15.bb |    3 ++-
>   3 files changed, 10 insertions(+), 6 deletions(-)
>

