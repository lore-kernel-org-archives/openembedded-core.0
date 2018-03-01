Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id A250F719AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:19:58 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id n128so474658ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=uw9zPCtV+GHCCIvvyOdPZakv7ho2KBDHiLfijkOtf8Q=;
	b=gZt0xEp2Fa8uEgI6MwYW5TP5bySr30D6yMxLvli6v06qOBhVCzKxHUmDY2I0PFWFAl
	atpMQcFE4T+1WYzP/2VYic14PmubQ4YQ30NblRO2tXS1M1WLCU3wTBGDDXsEbKbclqXg
	NR9+V5Wkd/z/OCe4mdQsj8wWomWUOFT2pqJv1c11PPCjZ9AsIh/rE2/Bx2pbG2isfx9n
	EdUS8Bk89e7mCv6L2enPdSAtBO/CQOBopYnUcyWMclR4dx1niB0bTY0xWpsEEaO2xYN0
	hrNA+aNH0fgYkyVJbpGAXsTwV9wF7AW9lMOcycty95IQxY6TOToV/wpXEApXKaapX8Ab
	KFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=uw9zPCtV+GHCCIvvyOdPZakv7ho2KBDHiLfijkOtf8Q=;
	b=CuKRloaKZjuseWm6K0FXKEv3k75iJtNEtkLrWipZI8bgoTjx5PC88ofuMg4Qgal8js
	KKjVy11UZ78guwz9UMkK33c8Fdwl4pPnOOEGHpzCZRH6RvoNjdC7gVPvykw8igwfMYFh
	3pV340PqQy5/WF2qTSgTsjWEmmKHEt4cYZ+rjSzMXmiiZUxqy5ztwFBWvjgmqs9dxkOb
	adf+run2Bqyh5LcC4tjJ72sReup1KMTdUTCeaVIj9hdS7MYOx+zG+FjNaRS71tQZjqjh
	ez6BvMslfZ2rC62GCH7i+7dNYVmfi1l8nYWr6/65G71MrmMypEHTxTEw23d5nBbABE7S
	BWiA==
X-Gm-Message-State: AElRT7FWdqoRFeUYGrrFmOh8CZYptxic8EzKE/4s4/O1EWTWwDlhPl1A
	fQNxkwp3Te+EEsWquRL+aFAOjMz0xa/lKfu8LtPrqg==
X-Google-Smtp-Source: AG47ELsNDo3RNQbvTjlyLXvPvHYTVI8n4sj5kQ0CgD2EDFVm+aTuCM8xj3QoyQo+5iJHNaj0oc4oY2eIblGKIeIGih4=
X-Received: by 10.36.66.195 with SMTP id i186mr13163itb.45.1519946399714; Thu,
	01 Mar 2018 15:19:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Thu, 1 Mar 2018 15:19:39 -0800 (PST)
In-Reply-To: <20180301230743.15539.2481@do.openembedded.org>
References: <20180301223509.5618-1-ross.burton@intel.com>
	<20180301230743.15539.2481@do.openembedded.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Mar 2018 23:19:39 +0000
Message-ID: <CAJTo0LZ9=TFC=nNPLKDB_jmVwqVd9dxCFQQuHG0HKAurHeEAzA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGxpYmVwb3h5OiBpbXByb3ZlIG11c2wgcGF0Y2g=?=
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
X-List-Received-Date: Thu, 01 Mar 2018 23:19:58 -0000
Content-Type: multipart/alternative; boundary="001a113b88043bacee056662198f"

--001a113b88043bacee056662198f
Content-Type: text/plain; charset="UTF-8"

Note that this is expected to fail as this is based on top of the 1.5.0
upgrade.

Ross

On 1 March 2018 at 23:07, Patchwork <patchwork@patchwork.openembedded.org>
wrote:

> == Series Details ==
>
> Series: libepoxy: improve musl patch
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/11175/
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
> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 8e4ece7bf0)
>
> * Issue             Upstream-Status is Submitted, but it is not mentioned
> where [test_upstream_status_presence_format]
>   Suggested fix    Include where no-tests.patch was submitted
>   Current          Upstream-Status: Submitted (https://github.com/anholt/
> libepoxy/pull/158)
>   Standard format  Upstream-Status: Submitted [where]
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your
> concerns.
> Otherwise we would appreciate you correcting the issues and submitting a
> new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_
> Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
>

--001a113b88043bacee056662198f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Note that this is expected to fail as this is based on top=
 of the 1.5.0 upgrade.<div><br></div><div>Ross</div></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 1 March 2018 at 23:07, Patchwor=
k <span dir=3D"ltr">&lt;<a href=3D"mailto:patchwork@patchwork.openembedded.=
org" target=3D"_blank">patchwork@patchwork.openembedded.org</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">=3D=3D Series Details =3D=3D<br>
<br>
Series: libepoxy: improve musl patch<br>
Revision: 1<br>
URL=C2=A0 =C2=A0: <a href=3D"https://patchwork.openembedded.org/series/1117=
5/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.<wbr>openembedde=
d.org/series/11175/</a><br>
State : failure<br>
<br>
=3D=3D Summary =3D=3D<br>
<br>
<br>
Thank you for submitting this patch series to OpenEmbedded Core. This is<br=
>
an automated response. Several tests have been executed on the proposed<br>
series by patchtest resulting in the following failures:<br>
<br>
<br>
<br>
* Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Series does not appl=
y on top of target branch [test_series_merge_on_head]<br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Rebase your series on top of targeted bra=
nch<br>
=C2=A0 Targeted branch=C2=A0 master (currently at 8e4ece7bf0)<br>
<br>
* Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Upstream-Status is S=
ubmitted, but it is not mentioned where [test_upstream_status_<wbr>presence=
_format]<br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Include where no-tests.patch was submitte=
d<br>
=C2=A0 Current=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Upstream-Status: Submitted=
 (<a href=3D"https://github.com/anholt/libepoxy/pull/158" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/anholt/<wbr>libepoxy/pull/158</a>)<b=
r>
=C2=A0 Standard format=C2=A0 Upstream-Status: Submitted [where]<br>
<br>
<br>
<br>
If you believe any of these test results are incorrect, please reply to the=
<br>
mailing list (<a href=3D"mailto:openembedded-core@lists.openembedded.org">o=
penembedded-core@lists.<wbr>openembedded.org</a>) raising your concerns.<br=
>
Otherwise we would appreciate you correcting the issues and submitting a ne=
w<br>
version of the patchset if applicable. Please ensure you add/increment the<=
br>
version number when sending the new version (i.e. [PATCH] -&gt; [PATCH v2] =
-&gt;<br>
[PATCH v3] -&gt; ...).<br>
<br>
---<br>
Guidelines:=C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.openembedded.org/wiki=
/Commit_Patch_Message_Guidelines" rel=3D"noreferrer" target=3D"_blank">http=
s://www.openembedded.org/<wbr>wiki/Commit_Patch_Message_<wbr>Guidelines</a>=
<br>
Test framework: <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/patcht=
est" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/<wbr>=
cgit/cgit.cgi/patchtest</a><br>
Test suite:=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit/=
cgit.cgi/patchtest-oe" rel=3D"noreferrer" target=3D"_blank">http://git.yoct=
oproject.org/<wbr>cgit/cgit.cgi/patchtest-oe</a><br>
<br>
</blockquote></div><br></div>

--001a113b88043bacee056662198f--
