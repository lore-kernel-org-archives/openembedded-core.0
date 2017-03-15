Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3125360191
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 15:04:42 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id w124so51009567itb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 08:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Z6VnzKul91FTk9YaTJ9mCHQRUdnac4qHKkIZfHOWews=;
	b=ttEEr7BgEyUuKcqN8hiIAJJqWdd8QSmzgp5FixhtyKKMe/aWA+P2SX7qd41fVbilFr
	onLsCFZ2u35Wd9F/ucTblEPshhEOicIajlVIb0NS2uSsnSKzJ9yTy3df3Sf2DJexvMXf
	ZTldphkzTbqfnBRqm7XF3g8BVPbYd/hVM3ZkwxLgyiH1vO3IBRu7zpoyej+ocyK7kjnU
	amALC2CvxaGTc+lUcl+QP7/NIHq8DWE376WVBz/WATkhpS3MsxRIIG5TlbHJv2w9Iz+d
	YWolTFfki58aA6jsY457ArNQb0q2+VE/NddDwk+u5bfQDis9D+b/7NbnBPjzZWrqC41w
	hc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Z6VnzKul91FTk9YaTJ9mCHQRUdnac4qHKkIZfHOWews=;
	b=YjXNjmBZ/R5aBcRwgW3ehsYlKHmndZ199B6hZ+EinualnCph4NYPD6h/nkYQ5kCPGo
	U3ptqAtUtSC51HcMz2gT2PpbD2HX+K9Q9Dv821iANyZUr16eMsF7yysI4W0LIrsWhRGH
	YL31po+mz+Rhc3uorKS4B0yDdeDMLWQzptVrYGkmodbxGqdqZ/kE4lHNwHYNPyYDDSAQ
	tZKfA2VJerv+wpHjpyckpE1iloLDj0YP/VnRpcJIcobWZOd5f6VK5gG7zT+Msw4CJr5B
	Z5goe6AWvRjhl/wHT8ow7A1mhO46vXFwj24Vqp8ASo7D5MxVx2tAqKScbEtokeqxGZwf
	tp5w==
X-Gm-Message-State: AFeK/H20T7yMreNFEGoGCOlLwaitLOhyZtzUxVaNceREgx8NtQ3OMMz/ft1n/koEK8t36BDg
X-Received: by 10.36.9.209 with SMTP id 200mr22081795itm.44.1489590283806;
	Wed, 15 Mar 2017 08:04:43 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8DCEB.dip0.t-ipconnect.de. [93.232.220.235])
	by smtp.gmail.com with ESMTPSA id 10sm270981itm.12.2017.03.15.08.04.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Mar 2017 08:04:42 -0700 (PDT)
Message-ID: <1489590279.6396.110.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: ed.bartosh@linux.intel.com
Date: Wed, 15 Mar 2017 16:04:39 +0100
In-Reply-To: <20170315140143.GA17397@linux.intel.com>
References: <7d4a770f-25c6-5747-5a5c-370c822f2efb@mlbassoc.com>
	<20170308134349.GA16099@linux.intel.com>
	<a0d78645-9670-f3a1-cd9d-d66370e89ef9@phytec.de>
	<20170314171147.GA28498@linux.intel.com>
	<1489513785.6396.83.camel@intel.com>
	<20170314180644.GA22000@linux.intel.com>
	<1489562674.6396.89.camel@intel.com>
	<20170315125810.GA28986@linux.intel.com>
	<1489585158.6396.102.camel@intel.com>
	<1489585294.6396.104.camel@intel.com>
	<20170315140143.GA17397@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
Subject: Re: Create more than one image with WIC
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
X-List-Received-Date: Wed, 15 Mar 2017 15:04:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-15 at 16:01 +0200, Ed Bartosh wrote:
> On Wed, Mar 15, 2017 at 02:41:34PM +0100, Patrick Ohly wrote:
> > On Wed, 2017-03-15 at 14:39 +0100, Patrick Ohly wrote:
> > > On Wed, 2017-03-15 at 14:58 +0200, Ed Bartosh wrote:
> > > > Regarding do_rm_work. It should not touch rootfs directories, I believe.
> > > 
> 
> > It does, and it should by default because a rootfs can be quite large.
> > If it's not going to be reused in another recipe, then it is worthwhile
> > to remove it.
> This is true unless we're going to use wic as a stand-alone tool, which some
> people still do.
> 
> > I should add that RM_WORK_EXCLUDE_ITEMS += "rootfs" can be used in image
> > recipes which know that their rootfs is going to be needed elsewhere -
> > it's just not the default.
> 
> Isn't rootfs going to be rebuilt if one rootfs recipe depends on another one?

No, that's now how it works. Suppose there's a
image-a:do_image_wic->image-b:do_rootfs task dependency. That dependency
ensures that image-b:do_rootfs runs before image-a:do_image_wic. But it
does not delay image-b:do_rm_work until image-a:do_image_wic is done.

That could be fixed by also adding a
image-b:do_rm_work->image-a:do_image_wic dependency. As I said,
something that works out of the box for this use case would be nice...
we can't expect developers to figure all of this out themselves.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




