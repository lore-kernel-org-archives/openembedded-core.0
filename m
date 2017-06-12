Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4BFEF782C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 15:39:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 12 Jun 2017 08:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,334,1493708400"; d="scan'208";a="867079687"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2017 08:39:54 -0700
Message-ID: <1497282530.26945.205.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 10:48:50 -0500
In-Reply-To: <20170612150147.1040.68226@do.openembedded.org>
References: <cover.1497278129.git.raj.khem@gmail.com>
	<20170612150147.1040.68226@do.openembedded.org>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEFkZCBHQ0MgNy4xIHJlY2lwZXM=?=
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
X-List-Received-Date: Mon, 12 Jun 2017 15:39:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-06-12 at 15:01 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add GCC 7.1 recipes
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/7195/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Series cannot be parsed correctly due to malformed diff lines [test_mbox_format] 
>   Suggested fix    Create the series again using git-format-patch and ensure it can be applied using git am
>   Diff line         diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-7.1/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> 
> 

This is complaining because the python unidiff module patchtest is using
is unable to parse the mbox correctly:

>>> unidiff.PatchSet.from_filename('foo.mbox')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File
"/usr/lib/python2.7/site-packages/unidiff-0.5.2-py2.7.egg/unidiff/patch.py", line 326, in from_filename
    instance = cls(f)
  File
"/usr/lib/python2.7/site-packages/unidiff-0.5.2-py2.7.egg/unidiff/patch.py", line 278, in __init__
    self._parse(data, encoding=encoding)
  File
"/usr/lib/python2.7/site-packages/unidiff-0.5.2-py2.7.egg/unidiff/patch.py", line 320, in _parse
    current_file._parse_hunk(line, diff, encoding)
  File
"/usr/lib/python2.7/site-packages/unidiff-0.5.2-py2.7.egg/unidiff/patch.py", line 193, in _parse_hunk
    raise UnidiffParseError('Hunk diff line expected: %s' % line)
unidiff.errors.UnidiffParseError: Hunk diff line expected: diff --git
a/meta/recipes-devtools/gcc/gcc-7.1/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-7.1/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch


The char that is causing trouble (confirmed) is just before that patch,
with a trailing ^L (seen on my emacs editor).

Leo




> 
> 
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 



