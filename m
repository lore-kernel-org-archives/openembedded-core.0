Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 29E9E78589
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 15:26:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w19FQ7k0032671
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 9 Feb 2018 07:26:08 -0800
Received: from yow-masselst-lx1.localnet (128.224.60.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 9 Feb 2018 07:26:00 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Fri, 9 Feb 2018 10:26:06 -0500
Message-ID: <2302663.UK8lGXnfU6@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <8f3fceb1-bb2b-de95-acd0-947ccc7a674e@linux.intel.com>
References: <20180202173815.9500-1-alexander.kanavin@linux.intel.com>
	<1778379.J915XxZyfQ@yow-masselst-lx1>
	<8f3fceb1-bb2b-de95-acd0-947ccc7a674e@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gtk-doc: update to 1.27
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
X-List-Received-Date: Fri, 09 Feb 2018 15:26:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, February 9, 2018 2:03:01 AM EST Alexander Kanavin wrote:
> On 02/09/2018 12:13 AM, Mark Asselstine wrote:
> > The use of libunique is non-consequential here. The issue is that the
> > gtk-doc package has imports which are not going to be present via direct
> > runtime dependencies. Any sw which attempts to run the python scripts
> > found in gtk-doc will fail in the same way unless the python3-six is
> > installed via an indirect dependency. I didn't have a chance to dig in to
> > this deeper today so I don't have more to add than this but the "import
> > six" is pretty explicit and will fail unless this script is not meant to
> > actually be run anytime, anywhere.
> gtk-doc recipe does have a direct dependency on python3-six, subject to
> 'api-documentation' in DISTRO_FEATURES. The reason it's conditional is
> that we don't want to build a ton of gtk-doc dependencies in the default
> case that used by almost everyone. Yes, this produces gtk-doc scripts
> that are not working, but they will not be run anyway, if gtk-doc
> capable recipes inherit the gtk-doc class, which will disable the
> gtk-doc feature. libunique was missing that inherit, the patch to fix
> that is now on oe-devl list. Take it and the issue will go away.

Thanks for sending out the updates, I am giving them a go. I wasn't clear 
about the intention based on your initial change so glad I reached out to you 
and that this will move on.

Thanks again,
Mark

> 
> Alex



