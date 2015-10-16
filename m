Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id F2CD077153
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 16:20:43 +0000 (UTC)
Received: by qgez77 with SMTP id z77so104126917qge.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 09:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GAAL1PKrXS4AWCqI+hW6y9gHAY/R7xWxB/hdTrdaU/g=;
	b=FnsuH1zGwh+Fc/iQ4sidiGRbtPmZAKvU+oDQCtYj7y69+UMifoRcvihFZggBQViiQs
	IlzSm4GnB/RuUOavBo+x90ioR/uEoxALt3xwKp/0u24oOVx2zZ2j0AVlbHjALGhTtUEi
	DKu80uy1o6lYxdZRby8y+2T5jBVMDiA9wuvNAgJ7/RZEDN9ENnea1O/T3o9mpMOh0q1M
	1knZygVY3+s7j3Nmg22ZlE0E/X58/6iZllsnrVLXvYQji6BHIQBvhCgZjUutRpJ47UHF
	XqHLDPoYGitesZ85TzuiKNVZqil7gM+tUr8dupciVNOORX5t1Q21dOh/b6/bOiFt/Z92
	092A==
X-Gm-Message-State: ALoCoQken0X7o831LuX10cwmNi3OmTBhFriDLqFlYyEKzZnDrqhEOlGcFeSet/9nHhyigJvMGjQ8
X-Received: by 10.140.232.150 with SMTP id d144mr21179987qhc.17.1445012443388; 
	Fri, 16 Oct 2015 09:20:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Fri, 16 Oct 2015 09:20:23 -0700 (PDT)
In-Reply-To: <1444246883-475-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1441921274.14702.2.camel@linux.intel.com>
	<1444246883-475-1-git-send-email-benjamin.esquivel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Oct 2015 17:20:23 +0100
Message-ID: <CAJTo0LaA-QhLiy5aUno_AAZpFAEnajOLEXuZU5+kPoPFRqeYow@mail.gmail.com>
To: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] selftest/manifest.py: Test support for manifests
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
X-List-Received-Date: Fri, 16 Oct 2015 16:20:47 -0000
Content-Type: multipart/alternative; boundary=001a113548526273b205223b2d66

--001a113548526273b205223b2d66
Content-Type: text/plain; charset=UTF-8

On 7 October 2015 at 20:41, Benjamin Esquivel <
benjamin.esquivel@linux.intel.com> wrote:

> tests added:
>  - manifest.VerifyManifest.test_image_manifest_entries
>

This test case isn't exposing a known bug in the manifests, where the
installed package list and the manifest don't match, specifically the
manifest is missing the locale packages (8444).

Ross

--001a113548526273b205223b2d66
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 7 October 2015 at 20:41, Ben=
jamin Esquivel <span dir=3D"ltr">&lt;<a href=3D"mailto:benjamin.esquivel@li=
nux.intel.com" target=3D"_blank">benjamin.esquivel@linux.intel.com</a>&gt;<=
/span> wrote:<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":2vv" class=3D"a3s" style=3D"overflow:hidden">tests added:<br>
=C2=A0- <span class=3D"il">manifest</span>.VerifyManifest.test_image_manife=
st_entries<br></div></blockquote></div><br>This test case isn&#39;t exposin=
g a known bug in the manifests, where the installed package list and the ma=
nifest don&#39;t match, specifically the manifest is missing the locale pac=
kages (8444).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--001a113548526273b205223b2d66--
