Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8AAD2763F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 19:52:57 +0000 (UTC)
Received: by qged69 with SMTP id d69so81497328qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 12:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Zp0oW/Kw2Pl0/C3CqHiqwcclcZuD067ebZnzmePzyJ4=;
	b=M9fsWspkUrg99mCaDzbb4nqw8at6+IvWvOsJOLoz4xH3bfXmqxhZImWXYA6jkBnCot
	0oPNIbatZVkttWy+Gqs1qBcv+yRwcStxOTq3SRNoup/K1F+cZpyTHrMe2MPmEM1nlql3
	C97htJ5Ynj0U+BiYBlGEgoda6auzC4cIpzHMQueVnpD83AbkBUsW8L35QzM6IgxCYaEr
	N0V3XOKk7uFH8qYIG0eHJVI63WWD7IDPz7/q/TcoUPSY1VsnrYunRMjIkNCWtOQYGogJ
	lZOAU9vuY8kwMLOloJhbWc/7UOt84YHO1NtDDe5T7OHZlh44gPD5wLa6EqNOuH80913M
	dgWQ==
X-Gm-Message-State: ALoCoQlHlqC25jzgI+OUbxj7Stzsbk3vTb5fY4XjtmjDvkKfDKJCvDPOQbK4pnppSb8vit9KdURm
X-Received: by 10.140.89.100 with SMTP id u91mr51615116qgd.15.1438113178224;
	Tue, 28 Jul 2015 12:52:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Tue, 28 Jul 2015 12:52:38 -0700 (PDT)
In-Reply-To: <6F44F925AFE971408EDDDD548F9B486F1989D378@DEMUMBX005.nsn-intra.net>
References: <6F44F925AFE971408EDDDD548F9B486F1989D378@DEMUMBX005.nsn-intra.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Jul 2015 20:52:38 +0100
Message-ID: <CAJTo0LZ1j+1RPqZ1AJyHN=Oo1UYxKiSpyJHXDe1NiMarwfyJiA@mail.gmail.com>
To: "Kucharczyk,
	Bartlomiej (Nokia - PL/Wroclaw)" <bartlomiej.kucharczyk@nokia.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Why python-native is not available via '#!/usr/bin/env python'?
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
X-List-Received-Date: Tue, 28 Jul 2015 19:53:01 -0000
Content-Type: multipart/alternative; boundary=001a11c1334e22a07f051bf4d10b

--001a11c1334e22a07f051bf4d10b
Content-Type: text/plain; charset=UTF-8

On 28 July 2015 at 17:23, Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw) <
bartlomiej.kucharczyk@nokia.com> wrote:

> Q1. What are the reasons behind that `/usr/bin/env python` refer to the
> host tool instead the native one?
>

Because the use of the built python-native is opt-in for each recipe, and
if you want to use it then the recipe should just inherit pythonnative.
This adjusts PATH so the standard #! works.

You only need to use the python-native binary if you build-depend on
non-standard Python modules which are in your DEPENDS (and so installed
into the native sysroot).  Otherwise we assume that the host Python is
sufficient: it's running bitbake already so it can't be that broken.

Ross

--001a11c1334e22a07f051bf4d10b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 July 2015 at 17:23, Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw) <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:bartlomiej.kucharczyk@nokia.com" target=
=3D"_blank">bartlomiej.kucharczyk@nokia.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div id=3D":1uo" class=3D"a3s" style=3D"overflow:h=
idden">Q1. What are the reasons behind that `/usr/bin/env python` refer to =
the host tool instead the native one?<br></div></blockquote></div><br>Becau=
se the use of the built python-native is opt-in for each recipe, and if you=
 want to use it then the recipe should just inherit pythonnative.=C2=A0 Thi=
s adjusts PATH so the standard #! works.</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">You only need to use the python-native b=
inary if you build-depend on non-standard Python modules which are in your =
DEPENDS (and so installed into the native sysroot).=C2=A0 Otherwise we assu=
me that the host Python is sufficient: it&#39;s running bitbake already so =
it can&#39;t be that broken.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a11c1334e22a07f051bf4d10b--
