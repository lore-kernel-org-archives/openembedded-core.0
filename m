Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8B4C777163
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 20:05:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 16 Oct 2015 13:05:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,690,1437462000"; 
	d="scan'208,217";a="582385246"
Received: from besquive-mobl2.amr.corp.intel.com ([10.219.128.95])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Oct 2015 13:05:22 -0700
Message-ID: <1445025921.6970.19.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LaA-QhLiy5aUno_AAZpFAEnajOLEXuZU5+kPoPFRqeYow@mail.gmail.com>
References: <1441921274.14702.2.camel@linux.intel.com>
	<1444246883-475-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<CAJTo0LaA-QhLiy5aUno_AAZpFAEnajOLEXuZU5+kPoPFRqeYow@mail.gmail.com>
Organization: Intel Corporation
Date: Fri, 16 Oct 2015 15:05:21 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-3.fc22) 
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] selftest/manifest.py: Test support for manifests
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
X-List-Received-Date: Fri, 16 Oct 2015 20:05:27 -0000
Content-Type: multipart/alternative; boundary="=-tT/tvFB3aJoigU2n/ka4"

--=-tT/tvFB3aJoigU2n/ka4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

this test does a one way check from the .manifest to the pkgdata dir.
This test is looking for entries in the manifest that do not exist in
the pkgdata dir. The bug you mention is the other way around, things
that are installed in the rootfs but not listed in the manifest. I
believe a test for this would be necessary too though I am not sure
that the bug is a genuine error yet.
Benjamin 
On Fri, 2015-10-16 at 17:20 +0100, Burton, Ross wrote:
> On 7 October 2015 at 20:41, Benjamin Esquivel <
> benjamin.esquivel@linux.intel.com> wrote:
> > tests added:
> >  - manifest.VerifyManifest.test_image_manifest_entries
> > 
> This test case isn't exposing a known bug in the manifests, where the
> installed package list and the manifest don't match, specifically the
> manifest is missing the locale packages (8444).
> 
> Ross

--=-tT/tvFB3aJoigU2n/ka4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>this test does a one way check from the .manifest to the pkgdata dir. This test is looking for entries in the manifest that do not exist in the pkgdata dir. The bug you mention is the other way around, things that are installed in the rootfs but not listed in the manifest. I believe a test for this would be necessary too though I am not sure that the bug is a genuine error yet.</div><div><br></div><div>Benjamin&nbsp;</div><div><br></div><div>On Fri, 2015-10-16 at 17:20 +0100, Burton, Ross wrote:</div><blockquote type="cite"><div dir="ltr"><div class="gmail_extra">On 7 October 2015 at 20:41, Benjamin Esquivel <span dir="ltr">&lt;<a href="mailto:benjamin.esquivel@linux.intel.com" target="_blank">benjamin.esquivel@linux.intel.com</a>&gt;</span> wrote:<br><div class="gmail_quote"><blockquote type="cite"><div id=":2vv" class="a3s" style="overflow:hidden">tests added:<br>
&nbsp;- <span class="il">manifest</span>.VerifyManifest.test_image_manifest_entries<br></div><br></blockquote></div><br>This test case isn't exposing a known bug in the manifests, where the installed package list and the manifest don't match, specifically the manifest is missing the locale packages (8444).</div><div class="gmail_extra"><br></div><div class="gmail_extra">Ross</div></div>
</blockquote></body></html>

--=-tT/tvFB3aJoigU2n/ka4--
