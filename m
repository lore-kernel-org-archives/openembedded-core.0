Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1T94MB-0002D4-Sx
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 03:24:40 +0200
Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 04 Sep 2012 18:12:16 -0700
Received: by qatn12 with SMTP id n12so85641qat.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 18:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=Ko47fc7++HyrMKo+edjEt2iJBRcXHfb0nM5T2dO4T8c=;
	b=YXxj4u4dEUIRDnfDuXqDMmhkTN/C8ZNLqM9GYP47OkcWZBYLbH0QRJqjW0tZwbm+RD
	MX9fen13Ki+JA7xfmgCm49QFixN0w25xZohy/CDywUC8Yu0PSCRYshfEJUn1+bzcdRsV
	KcJVVt0o021Sk/53Rrq2TB966TzIyI5A0SrT6a66mN2J+exRcdKeo9ubHio7yO5PPK1k
	vxM2uf73m9c4zAivHPBVB/p8/YXTcJFih9CdZfr9BXXTlfecOIyYN92z3dNa+mJV2/eQ
	B+x7D6b0daYY2Kg4DJOVAQgkfTrun7fN2+xtRtsv38eJfdU0JsDjJtSE73QrGAw6VPZw
	vR1g==
MIME-Version: 1.0
Received: by 10.224.44.135 with SMTP id a7mr25979788qaf.84.1346807535109; Tue,
	04 Sep 2012 18:12:15 -0700 (PDT)
Received: by 10.229.63.1 with HTTP; Tue, 4 Sep 2012 18:12:15 -0700 (PDT)
In-Reply-To: <cover.1346806132.git.elizabeth.flanagan@intel.com>
References: <cover.1346806132.git.elizabeth.flanagan@intel.com>
Date: Tue, 4 Sep 2012 18:12:15 -0700
Message-ID: <CAPhnLPAeHFBk=mLr0pG3oAz=pqKdnNFxD-LaitwsyC8zw-ivfw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQmCvvttrM2wh7tXXy9BcFndJV0QmYPcxY0k6TUeuVTcTsvG4eCTsFCstLSGKp7bn33Gnvmq
Subject: Re: [PATCH 0/1] Add adt-installer-dev target for QA use
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 01:24:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 4, 2012 at 5:56 PM, Elizabeth Flanagan
<elizabeth.flanagan@intel.com> wrote:
> This is the first step in fixing the long standing QA complaint of having
> no good way of testing ADTREPO:

I missed something in do_populate_adt that will cause this to fail (it
will build, it just won't actually function).

Please don't pull, I'll resubmit tomorrow.

-b

>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2800
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=1877
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2718
>
> This target will be added to most autobuilder buildouts and the autobuilder
> will populate adtrepo-dev from the artifacts. This ensures that released build
> artifacts are jailed off and cannot be accidentally destroyed while ensuring
> QA has something to test.
>
> The following changes since commit 99c85ba93075a1aff789cafabbacf42e6a93bd32:
>
>   build-appliance-image: Update to latest poky master (2012-09-04 18:04:40 +0100)
>
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib eflanagan/adtfix
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/adtfix
>
> Elizabeth Flanagan (1):
>   adt-installer: Add adt-installer-dev.bb
>
>  .../installer/adt-installer-dev_1.0.bb             |   26 ++++++++++++++++++++
>  .../installer/adt-installer/adt_installer.conf     |    2 +-
>  2 files changed, 27 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-devtools/installer/adt-installer-dev_1.0.bb
>
> --
> 1.7.5.4
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


