Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3815373232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 09:52:41 +0000 (UTC)
Received: by qgx61 with SMTP id 61so30451541qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 02:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Kt/GkF1GMfOoOTanzaDWmzrcvTfs4xLDWD8drmBA7nI=;
	b=UGy5r/yhOHzol2T5lgLK5Jvc1JSOxu1QCawXReioeB3KtsauYDwbJD4rqoVCo58rVk
	K9P5hZBLxmisVioIjFgA69S6SgHduKuspYHAhqTZPzj0TlLQ0P1BM+/35tOH3wnowNch
	wA0+xKvyu6BP2/h49RZZ7E2bA5BkV/qia2P9+DSKyrRhkIbBBXwOi/z96bfM4bG5XYfA
	OL5em5ijl33m3eMgQdzsWoL4AKRNzrCGkEocTcGo5Pl7K2LCD5wfi5YodenEIT0HAbGC
	dgeYsE0JElJPE7SJMLAlMnRp58zg6MPTiVt2UnFyVNXxQxcFpS0cqccN6ZDmCYW8Xa9s
	HNVA==
X-Gm-Message-State: ALoCoQlLaBwsZzKLAuiYvQH9xbDlZn3Ot5Z4rcE07h//OMbhF5cYMViubVqX1UDKlHXEDwY5n32a
X-Received: by 10.140.232.150 with SMTP id d144mr51613620qhc.17.1441878761442; 
	Thu, 10 Sep 2015 02:52:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 10 Sep 2015 02:52:22 -0700 (PDT)
In-Reply-To: <1441225085-2988-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1675897.By6dee7Xjq@peggleto-mobl.ger.corp.intel.com>
	<1441225085-2988-1-git-send-email-benjamin.esquivel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Sep 2015 10:52:22 +0100
Message-ID: <CAJTo0LZWChOX1NRpFoc=FwYay76-mOXhmeMdJU6=0JuKQNzJdQ@mail.gmail.com>
To: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] selftest/manifest.py: Test support for manifests
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
X-List-Received-Date: Thu, 10 Sep 2015 09:52:42 -0000
Content-Type: multipart/alternative; boundary=001a1135485262bd87051f618f5c

--001a1135485262bd87051f618f5c
Content-Type: text/plain; charset=UTF-8

On 2 September 2015 at 21:18, Benjamin Esquivel <
benjamin.esquivel@linux.intel.com> wrote:

> adding support for tests to verify manifest collections
> (i.e. all the manifests found in a given dir) checking them
> to provide entries that exist in an specified pkgdata dir
>
> tests added:
>  -adding an SDK manifest test
>  -adding a core-image-minimal manifest test
> test support written for future tests:
>  -adding a setUpClass that supports other tests
>  -a get dir from bb var function that verifies if the dir exists
>  -an initial ManifestCollection and ManifestEntry classes defined
>  -check for the paths and fail gracefully if not there
>  -debug prints for failure analysis
>

Just ran this on the autobuilder:

FAIL: test_image_manifest_entries (oeqa.selftest.manifest.VerifyManifest)
Verifying the image manifest entries exist
----------------------------------------------------------------------
Traceback (most recent call last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/manifest.py",
line 165, in test_image_manifest_entries
    if m_collection.errors: self.fail()
AssertionError: None

Ross

--001a1135485262bd87051f618f5c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 September 2015 at 21:18, Benjamin Esquivel <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:benjamin.esquivel@linux.intel.com" target=3D"_blank">benjamin.=
esquivel@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D":2c6" class=3D"" style=3D"overflow:hidden">adding support for tests to =
verify <span class=3D"">manifest</span> collections<br>
(i.e. all the <span class=3D"">manifests</span> found in a given dir) check=
ing them<br>
to provide entries that exist in an specified pkgdata dir<br>
<br>
tests added:<br>
=C2=A0-adding an SDK <span class=3D"">manifest</span> test<br>
=C2=A0-adding a core-image-minimal <span class=3D"">manifest</span> test<br=
>
test support written for future tests:<br>
=C2=A0-adding a setUpClass that supports other tests<br>
=C2=A0-a get dir from bb var function that verifies if the dir exists<br>
=C2=A0-an initial ManifestCollection and ManifestEntry classes defined<br>
=C2=A0-check for the paths and fail gracefully if not there<br>
=C2=A0-debug prints for failure analysis</div></blockquote></div><br>Just r=
an this on the autobuilder:</div><br>FAIL: test_image_manifest_entries (oeq=
a.selftest.manifest.VerifyManifest)<br>Verifying the image manifest entries=
 exist<br>-----------------------------------------------------------------=
-----<br>Traceback (most recent call last):<br>=C2=A0 File &quot;/home/poky=
build/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeq=
a/selftest/manifest.py&quot;, line 165, in test_image_manifest_entries<br>=
=C2=A0 =C2=A0 if m_collection.errors: self.fail()<br>AssertionError: None<d=
iv><br></div><div>Ross</div></div>

--001a1135485262bd87051f618f5c--
