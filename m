Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AED3E6013D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 08:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u668pnsQ027918; Wed, 6 Jul 2016 09:55:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lB8jufwAUCcY; Wed,  6 Jul 2016 09:55:03 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u668svVQ027971
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 6 Jul 2016 09:54:59 +0100
Message-ID: <1467795297.8590.208.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Yi Zhao <yi.zhao@windriver.com>
Date: Wed, 06 Jul 2016 09:54:57 +0100
In-Reply-To: <CAJTo0LZ_gOmi8QffB+TChddE+ps0z348DJ0tRUwWM+1dMLDOmA@mail.gmail.com>
References: <cover.1467792379.git.yi.zhao@windriver.com>
	<6125589935ee01e7b5dec39659932f3ef3f47374.1467792379.git.yi.zhao@windriver.com>
	<CAJTo0LZ_gOmi8QffB+TChddE+ps0z348DJ0tRUwWM+1dMLDOmA@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Yue Tao <yue.tao@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] randrproto: set ALLOW_EMPTY
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
X-List-Received-Date: Wed, 06 Jul 2016 08:55:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-07-06 at 09:41 +0100, Burton, Ross wrote:
> 
> On 6 July 2016 at 09:09, Yi Zhao <yi.zhao@windriver.com> wrote:
> > When adding package randrproto to an image with
> > IMAGE_INSTALL_append = " randrproto", an error occurs:
> > 
> > $ bitbake core-image-sato
> > [snip]
> > ERROR: randrproto not found in the base feeds (qemux86 i586 x86
> > noarch any all).
> > [snip]
> > 
> No.
> 
> $ oe-pkgdata-util list-pkgs -rp randrproto
> randrproto-dbg
> randrproto-dev
> randrproto-doc
> 
> The answer here is to not add randrproto to an image, as the package
> doesn't exist.  Especially when this is whack-a-mole:
> 
> $ oe-pkgdata-util list-pkgs -rp renderproto
> renderproto-dev
> renderproto-dbg
> renderproto-doc
> 
> (repeat for every recipe in x11-proto)

Agreed. We've seen patches like this before, we rejected them last time
and we will do again.

Cheers,

Richard

