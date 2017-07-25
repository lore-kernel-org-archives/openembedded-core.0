Return-Path: <patrick.ohly@intel.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3BC7A607F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 11:44:20 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id z129so18080003pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 04:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=VsH4fyZyfFH3bVMkuLlIuo65uLBzGBJDgTYVVsK225k=;
	b=ItrUjq669B/gmdUc21Ld+yLxuWJ79znbCxkDhY/Gjf6U2/I8S9aoHZdtGjUw7tTMgV
	EF98EzU7J1Xao3FAsDQp9WOZuekOvQSMK22ZRXHieAWmAkvUMcUnizdr1wBLl5gKlSGF
	NsXCq1UU7qJCHqA4DkBIDNuLbkagGBs0LqZd/ncPDoKq2UkbkYaT3/mBk0gnPyxVO4bZ
	izCVPxv41DcBn4LmJ2uvMn8QhGqc1NPodO02Da74JNsPNqk0l16jcIvxGlAWqTBaB74v
	2WG50Bk88t08QmecTYclGRkfDrkaLsLbH4hyCLB6bBp+wEbp3g5es4k1+Ov3Vo+NBpv5
	o7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=VsH4fyZyfFH3bVMkuLlIuo65uLBzGBJDgTYVVsK225k=;
	b=ClPhJST1qQh4QN9IZcbwjbzGvio2GQb4hh8C6eI7d9eGtuZ09i508+x7ywCG+qHPP3
	+W9Tmi8Sjpw0JGeD+/CpTtrtPUSqcGr06GPQuYg1d2A8tx+cKUgLfdjWnJ+xCKU3PqD1
	mlN0/Q5JvUv4VsU69gyXuZHpTm3Tx+JZKrv0R/SYmWkfhKdmIuD3ayvvP2pR7Fz2lGbN
	mY2dI5aEAot31QcfzYi6dccILzQSUjhBsy1UBzN52wQUWRCXNccFrIFpS/xt9Z6wXGVd
	bbXuMjnOB5ZxQY9tlpQwd3KMcBrqCB5N2VOVgfO7qMtGq/uybbjaF6UM/w0k9V4OTsrt
	JEsA==
X-Gm-Message-State: AIVw112+pegXuWZE4ZL81AKse3FNBLCsqJR8smjh/AoaeAA2jPk/yv0s
	0UGjrdaOYLIAh7KUpO4=
X-Received: by 10.84.210.40 with SMTP id z37mr21044379plh.265.1500983062591;
	Tue, 25 Jul 2017 04:44:22 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FE5D.dip0.t-ipconnect.de. [93.232.254.93])
	by smtp.gmail.com with ESMTPSA id
	s206sm26523300pfs.55.2017.07.25.04.44.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Jul 2017 04:44:21 -0700 (PDT)
Message-ID: <1500983054.26603.14.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Tom Rini <trini@konsulko.com>
Date: Tue, 25 Jul 2017 13:44:14 +0200
In-Reply-To: <20170724111905.GE26163@bill-the-cat>
References: <1500674794-23258-1-git-send-email-trini@konsulko.com>
	<1500885337.25812.2.camel@intel.com>
	<20170724111905.GE26163@bill-the-cat>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] image.bbclass: Correct chaining compression support
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
X-List-Received-Date: Tue, 25 Jul 2017 11:44:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-07-24 at 07:19 -0400, Tom Rini wrote:
> On Mon, Jul 24, 2017 at 10:35:37AM +0200, Patrick Ohly wrote:
> > On Fri, 2017-07-21 at 18:06 -0400, Tom Rini wrote:
> > > The fix for this inadvertently broke chaining
> > > compression/conversion.  First, correct the u-boot conversion
> > > code.
> > > 
> > > Fixes: 46bc438374de ("image.bbclass: do exact
> > > match for rootfs type")
> > > Cc: Zhenhua Luo <zhenhua.luo@nxp.com>
> > > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Cc: Patrick Ohly <patrick.ohly@intel.com>
> > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > ---
> > > This change is fairly important and, imho, innocuous and should
> > > be
> > > populated to pyro/etc, once merged to master.  The next part of
> > > the
> > > series is clean-up and while with my U-Boot hat on, I would say
> > > should
> > > be pushed more widely, I am biased.
> > > ---
> > >  meta/classes/image.bbclass             |  2 +-
> > >  meta/classes/image_types_uboot.bbclass | 13 +++++--------
> > >  2 files changed, 6 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/meta/classes/image.bbclass
> > > b/meta/classes/image.bbclass
> > > index de535ce6fcff..bd6a5b7b810a 100644
> > > --- a/meta/classes/image.bbclass
> > > +++ b/meta/classes/image.bbclass
> > > @@ -453,7 +453,7 @@ python () {
> > >          rm_tmp_images = set()
> > >          def gen_conversion_cmds(bt):
> > >              for ctype in ctypes:
> > > -                if bt[bt.find('.') + 1:] == ctype:
> > > +                if bt.endswith("." + ctype)
> > 
> > This reverts 46bc438374de and thus restores the code as I had
> > originally written it.
> > 
> > Looking at 46bc438374de, it's not clear to me how the commit
> > message
> > matches the code, i.e. I don't understand the commit. So it was an
> > incorrect fix for the problem described in that commit message, and
> > the
> > right one are your changes to the u-boot conversion command?
> 
> Ah, so the important bit is the other half of this patch, which
> addresses the problem 46bc438374de was intended to deal with,
> correctly.
> Prior to the chaining compression/conversion support, the "u-boot"
> targets would clean up their intermediate files.  With your patch
> those
> files get cleaned up automatically and that the mkimage calling
> function
> was also doing it lead to build failures.  But since we no longer
> need
> to have a manual cleaning step, we can just drop it.

Makes sense.

Acked-by: Patrick Ohly <patrick.ohly@intel.com>

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



