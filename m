Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 84C2F60053
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 21:41:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 10 Sep 2015 14:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,507,1437462000"; 
	d="scan'208,217";a="642532012"
Received: from besquive-mobl2.zpn.intel.com ([10.219.17.58])
	by orsmga003.jf.intel.com with ESMTP; 10 Sep 2015 14:41:10 -0700
Message-ID: <1441921274.14702.2.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LZWChOX1NRpFoc=FwYay76-mOXhmeMdJU6=0JuKQNzJdQ@mail.gmail.com>
References: <1675897.By6dee7Xjq@peggleto-mobl.ger.corp.intel.com>
	<1441225085-2988-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<CAJTo0LZWChOX1NRpFoc=FwYay76-mOXhmeMdJU6=0JuKQNzJdQ@mail.gmail.com>
Organization: Intel Corporation
Date: Thu, 10 Sep 2015 16:41:14 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] selftest/manifest.py: Test support for manifests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: benjamin.esquivel@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Sep 2015 21:41:12 -0000
Content-Type: multipart/alternative; boundary="=-IdRgIA+0FU73dkF3oBLb"

--=-IdRgIA+0FU73dkF3oBLb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Thanks for the notice, I'll check it up.
Benjamin
On Thu, 2015-09-10 at 10:52 +0100, Burton, Ross wrote:
> 
> On 2 September 2015 at 21:18, Benjamin Esquivel <
> benjamin.esquivel@linux.intel.com> wrote:
> > adding support for tests to verify manifest collections
> > (i.e. all the manifests found in a given dir) checking them
> > to provide entries that exist in an specified pkgdata dir
> > 
> > tests added:
> >  -adding an SDK manifest test
> >  -adding a core-image-minimal manifest test
> > test support written for future tests:
> >  -adding a setUpClass that supports other tests
> >  -a get dir from bb var function that verifies if the dir exists
> >  -an initial ManifestCollection and ManifestEntry classes defined
> >  -check for the paths and fail gracefully if not there
> >  -debug prints for failure analysis
> > 
> Just ran this on the autobuilder:
> 
> FAIL: test_image_manifest_entries
> (oeqa.selftest.manifest.VerifyManifest)
> Verifying the image manifest entries exist
> ---------------------------------------------------------------------
> -
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe
> -selftest/build/meta/lib/oeqa/selftest/manifest.py", line 165, in
> test_image_manifest_entries
>     if m_collection.errors: self.fail()
> AssertionError: None
> 
> Ross

--=-IdRgIA+0FU73dkF3oBLb
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>Thanks for the notice, I'll check it up.</div><div><br></div><div>Benjamin</div><div><br></div><div>On Thu, 2015-09-10 at 10:52 +0100, Burton, Ross wrote:</div><blockquote type="cite"><div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On 2 September 2015 at 21:18, Benjamin Esquivel <span dir="ltr">&lt;<a href="mailto:benjamin.esquivel@linux.intel.com" target="_blank">benjamin.esquivel@linux.intel.com</a>&gt;</span> wrote:<br><blockquote type="cite"><div id=":2c6" class="" style="overflow:hidden">adding support for tests to verify <span class="">manifest</span> collections<br>
(i.e. all the <span class="">manifests</span> found in a given dir) checking them<br>
to provide entries that exist in an specified pkgdata dir<br>
<br>
tests added:<br>
&nbsp;-adding an SDK <span class="">manifest</span> test<br>
&nbsp;-adding a core-image-minimal <span class="">manifest</span> test<br>
test support written for future tests:<br>
&nbsp;-adding a setUpClass that supports other tests<br>
&nbsp;-a get dir from bb var function that verifies if the dir exists<br>
&nbsp;-an initial ManifestCollection and ManifestEntry classes defined<br>
&nbsp;-check for the paths and fail gracefully if not there<br>
&nbsp;-debug prints for failure analysis</div><br></blockquote></div><br>Just ran this on the autobuilder:</div><br>FAIL: test_image_manifest_entries (oeqa.selftest.manifest.VerifyManifest)<br>Verifying the image manifest entries exist<br>----------------------------------------------------------------------<br>Traceback (most recent call last):<br>&nbsp; File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/manifest.py", line 165, in test_image_manifest_entries<br>&nbsp; &nbsp; if m_collection.errors: self.fail()<br>AssertionError: None<div><br></div><div>Ross</div></div>
</blockquote></body></html>

--=-IdRgIA+0FU73dkF3oBLb--
