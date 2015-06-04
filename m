Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0F99E73BBE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 16:54:39 +0000 (UTC)
Received: by qcxw10 with SMTP id w10so20168033qcx.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 09:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=k55xUtlE81wxFYjyI1lpvjySOn1ZmqKmqRA0+dEcWWs=;
	b=GcUZxxjZl/ksT+X9/rKEpDBOWai6WR52emGuGMne7I9SgPi89jCwI+Gja9qzlssal3
	/8KjunaUlzr2nYky9XooYVjXOaeIzbhIa/WkpF34Qk345ZLdCKq4EMunr6yrbsUj2Z5m
	+Cl9nAVTCEcum2u2HFIoMSvLJZGADWIqa4tuXjrgFZiEaYHrz5V15ckk1V876ZC7USWX
	iXYOU7jw6bhdpgNk97mdfb205XWSVlSsYo6VwgKM5HrizHD+uREPuN1J9TqWxmI2A/TX
	l9UzJLVFxLWh0GpI0yxBeNRXQwJQSKJPS6UA8pSlmpGotCvSlse/6yTeMsZpjh5cgyH8
	04Kw==
X-Gm-Message-State: ALoCoQliHQN4ghWIDFqi1adM/qEAqq+0tLiU2ntzl339GaVmKPG044M6SevrvA9Xs8Xsra4ns6QU
X-Received: by 10.55.40.18 with SMTP id o18mr73095527qkh.58.1433436880576;
	Thu, 04 Jun 2015 09:54:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 4 Jun 2015 09:54:20 -0700 (PDT)
In-Reply-To: <557082C8.2090907@linux.intel.com>
References: <cover.1433274434.git.anibal.limon@linux.intel.com>
	<CAJTo0LbAsutsVamsW4mYt8rKHL069DKFKhWMYhwMK-o9tcabwQ@mail.gmail.com>
	<557082C8.2090907@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jun 2015 17:54:20 +0100
Message-ID: <CAJTo0LZkSUFvQWm2zL25keDCZYq0h_iW==5F8a+RKdmnpCcgmw@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] recipeutils adds get_recipe_upstream_version and distrodata fixes
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
X-List-Received-Date: Thu, 04 Jun 2015 16:54:40 -0000
Content-Type: multipart/alternative; boundary=001a11440fb81345a40517b40822

--001a11440fb81345a40517b40822
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4 June 2015 at 17:54, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.c=
om> wrote:

> The problem is i forget to add v2 to the patch [1] that is a new version
> of the patch [2], sorry
> about that.
>

The problem is we merged v1 of that patch into master.  Can you rebase and
fix what's in master?

Ross

--001a11440fb81345a40517b40822
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 June 2015 at 17:54, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.limon@l=
inux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":1d7" class=3D"a3s" style=3D"overflow:hidden">The problem is i forge=
t to add v2 to the patch [1] that is a new version of the patch [2], sorry<=
br>
about that.<br></div></blockquote></div><br>The problem is we merged v1 of =
that patch into master.=C2=A0 Can you rebase and fix what&#39;s in master?<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--001a11440fb81345a40517b40822--
