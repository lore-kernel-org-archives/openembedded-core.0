Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E2DFB74510
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 07:44:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2U7i12v028693
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 30 Mar 2018 08:44:03 +0100
Message-ID: <1522395841.11431.108.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org, "Burton, Ross"
	<ross.burton@intel.com>
Date: Fri, 30 Mar 2018 08:44:01 +0100
In-Reply-To: <77cd677d-8c26-9eac-1dae-22afa985f447@windriver.com>
References: <cover.1522392229.git.hongxu.jia@windriver.com>
	<20180330070529.2394.14955@do.openembedded.org>
	<77cd677d-8c26-9eac-1dae-22afa985f447@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFVwZ3JhZGUgNyBwYWNrYWdlcw==?=
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
X-List-Received-Date: Fri, 30 Mar 2018 07:44:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-03-30 at 15:26 +0800, Hongxu Jia wrote:
> On 2018年03月30日 15:05, Patchwork wrote:
> > 
> > == Series Details ==
> > 
> > Series: Upgrade 7 packages
> > Revision: 1
> > URL   : https://patchwork.openembedded.org/series/11622/
> > State : failure
> > 
> > == Summary ==
> > 
> > 
> > Thank you for submitting this patch series to OpenEmbedded Core.
> > This is
> > an automated response. Several tests have been executed on the
> > proposed
> > series by patchtest resulting in the following failures:
> > 
> > 
> > 
> > * Issue             LIC_FILES_CHKSUM changed on target libgpg-error 
> > but there is no "License-Update" tag in commit message
> > [test_lic_files_chksum_modified_not_mentioned]
> >    Suggested fix    Include "License-Update: <description>" into
> > the commit message with a brief description
> >    Current checksum
> > file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552                
> >      file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1       
> >               file://src/gpg-
> > error.h.in;endline=23;md5=beae1e44d8d5c265d194760276033a7c         
> >             file://src/init.c;endline=20;md5=872b2389fe9bae7ffb80d2
> > b91225afbc
> >    New
> > checksum     file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552   
> >                   file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206
> > a5b0a1                     file://src/gpg-
> > error.h.in;endline=23;md5=fc7423b56d5f7163a9a2acf9fe2f8d6b         
> >             file://src/init.c;endline=20;md5=872b2389fe9bae7ffb80d2
> > b91225afbc
> It already includes "License-Update: <description>":
> ...
> 1. License-Update: update years from 2003-2004 to 2001-2018,
>     and add a new line 'SPDX-License-Identifier: LGPL-2.1+'
> ...
> 
> Should I remove the starting "1. "?

Yes, the "1. " is why its not understanding what you added.

> 
> > * Issue             Patches not removed from tree
> > [test_src_uri_left_files]
> >    Suggested fix    Amend the patch containing the software patch
> > file removal
> >    Patch            avoid-host-contamination.patch
> >    Patch            mkdir-p.patch
> >    Patch            do-not-check-local-libpng-source.patch
> >    Patch            ghostscript-9.02-genarch.patch
> >    Patch            ghostscript-9.21-prevent_recompiling.patch
> >    Patch            ghostscript-9.16-Werror-return-type.patch
> >    Patch            cups-no-gcrypt.patch
> >    Patch            ghostscript-9.15-parallel-make.patch
> It already removes them from tree.
> Should I git format-patch without "-M"?

To be clear, these patches are all renamed. I think patchtest is
failing to understand the rename. Please continue to send with -M but
lets file a bug against patchtest to see if we can fix this issue. 

We could avoid the issue by not renaming patches.

Cheers,

Richard

