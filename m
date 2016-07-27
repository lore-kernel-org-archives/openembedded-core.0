Return-Path: <Liam.Howlett@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6DDA8606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 14:08:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6RE8nFE003207
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Jul 2016 07:08:50 -0700 (PDT)
Received: from yow-lhowlett-d0.wrs.com (128.224.56.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Wed, 27 Jul 2016 07:08:47 -0700
Date: Wed, 27 Jul 2016 10:08:42 -0400
From: "Liam R. Howlett" <Liam.Howlett@windriver.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160727140842.GA3207@yow-lhowlett-d0.wrs.com>
References: <1469211845-21125-1-git-send-email-Liam.Howlett@WindRiver.com>
	<1469211845-21125-2-git-send-email-Liam.Howlett@WindRiver.com>
	<CAJTo0LaiVPOSZfFt9ruzFGgtiL2gNFOZWHCNN2yZRBRsKm41TA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaiVPOSZfFt9ruzFGgtiL2gNFOZWHCNN2yZRBRsKm41TA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Originating-IP: [128.224.56.205]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wget: Add --ssh-askpass support
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
X-List-Received-Date: Wed, 27 Jul 2016 14:08:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Burton, Ross <ross.burton@intel.com> [160726 09:38]:
> On 22 July 2016 at 19:24, Liam R. Howlett <Liam.Howlett@windriver.com>
> wrote:
> 
> > diff --git a/meta/recipes-extended/wget/wget/0001-wget-Add-ssh-askpass-support.patch
> > b/meta/recipes-extended/wget/wget/0001-wget-Add-ssh-askpass-support.patch
> > new file mode 100644
> > index 0000000..e402375
> > --- /dev/null
> > +++ b/meta/recipes-extended/wget/wget/0001-wget
> > -Add-ssh-askpass-support.patch
> > [snip]
> >
> 
> 
> > diff --git a/meta/recipes-extended/wget/wget_1.18.bb
> > b/meta/recipes-extended/wget/wget_1.18.bb
> > index c969b98..20ec503 100644
> > --- a/meta/recipes-extended/wget/wget_1.18.bb
> > +++ b/meta/recipes-extended/wget/wget_1.18.bb
> > @@ -1,5 +1,6 @@
> >  SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
> >
> > file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
> > +           file://0001-Add-ssh-askpass-support.patch \
> 
> 
> As the patch and the SRC_URI don't match, this patch clearly hasn't been
> tested.
> 

Apologies for the SRC_URI mismatch.  I had tested my patch but during my
development, I clarified my commit message which changed the filename.
I did not update the include file SRC_URI and had left the old file in
place while I tested.  I will resend a new version as soon as upstream
is happy.

> Also if you're working with upstream then please change the Upstream-Status
> to Submitted and provide a link (mailing list post, bug entry, whatever).

There was a question as to where to send the patch and I wanted to get
your input for new revisions as well.  I will update the status with a
link on the next revision.

I appreciate your input.

Thanks,
Liam

> 
> Ross

