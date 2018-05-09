Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 451C074A6A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 16:09:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w49G9VTS028039
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 May 2018 09:09:31 -0700 (PDT)
Received: from yow-masselst-lx1.localnet (128.224.60.223) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 9 May 2018 09:09:31 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 May 2018 12:09:30 -0400
Message-ID: <3120035.nktNMt2fzU@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CAJTo0LaHtEh3JBQqnsx1v6c31jbTYe2jLUztLtpiqwDi+W3nLg@mail.gmail.com>
References: <1523387170-30191-1-git-send-email-denis@denix.org>
	<3814374.oaZWZoq0et@yow-masselst-lx1>
	<CAJTo0LaHtEh3JBQqnsx1v6c31jbTYe2jLUztLtpiqwDi+W3nLg@mail.gmail.com>
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wayland: upgrade to 1.15.0
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
X-List-Received-Date: Wed, 09 May 2018 16:09:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, May 9, 2018 12:03:26 PM EDT Burton, Ross wrote:
> On 9 May 2018 at 17:00, Mark Asselstine <mark.asselstine@windriver.com>
> 
> wrote:
> > I am also seeing build failures due to this conflict:
> > 
> > ERROR: libglu-2_9.0.0-0 do_prepare_recipe_sysroot: The file /usr/lib64/
> > libwayland-egl.la is installed by both wayland and mesa, aborting
> > ..
> > ERROR: mesa-2_18.0.2-r0 do_package: QA Issue: mesa: Files/directories were
> > 
> > installed but not shipped in any package:
> >   /usr/lib64/libwayland-egl.la
> > 
> > Please set FILES such that these items are packaged. Alternatively if they
> > are
> > unneeded, avoid installing them or delete them within do_install.
> > mesa: 1 installed and not shipped files. [installed-vs-shipped]
> > 
> > is someone working on a fix or should I take some time to put something
> > together?
> 
> As it appears you can test quickly then I think you just drew the short
> straw.  Should be a trivial patch...

I knew that this had a 50/50 chance of going this way :). Lunch then a fix. I 
assume then we will go with Martin's suggestion of an explicit remove in 
mesa.inc?

Mark

> 
> Ross





