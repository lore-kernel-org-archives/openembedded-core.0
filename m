Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id E72B178913
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 01:17:37 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id v111so12346395wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 17:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=V8swmSuwp3M4QmjDfr7xZ9Ehu37T56Yd/SF7jH7E7CI=;
	b=blurS9Xle/eFOGPVVmleVR+HHs+/XUCd+AwHbN7IDAJmcE+IBj3sikL2D0H5HTURDp
	g3UnxUtLa9orkJ0vTumkNxgTqaAWEHlDLzSD3gzV1rFkzEI+manfKjqUpiZrTzm5c7Tw
	1d0y04nMoz+iIhG/l7/fRaawEPo451v3tBDX5qz1QwN98BpDVTtSiaxCpfxIYDxbJuO2
	IbV0MzcYtN/Sy+Xw7CZza5A2Nb0dbx0rnaOLzE1pbyN5AdCny38rqEKrrZlQG1tH/icC
	BTqDV6lnntHkiLm6GJfHZYOO5zIgnYB9BIWPZbuSmCBsjhq20h6iu+gNlixJpYNpyyAd
	7PHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=V8swmSuwp3M4QmjDfr7xZ9Ehu37T56Yd/SF7jH7E7CI=;
	b=KOB0ODGKffG0xFN/gSihG6BDELeku23JyK5lC8ApXX4VCFx2I+Oihydr/dEM0ulcda
	7TtRkOLJkSkna7gy2PpxEtJWI7oeu+LtPWoN6o4157fLXVdONqFeh5YILUKVEcupuPjj
	mT7vjy+FMMJE08RsfmjLIw95A5O8NzvtQnFALQ4+pa9Fhhi9LZH59tssjgpFC7Eent8O
	1xJ6I3e2gE4MhF7kgLEa/3STr54TFC16Vvqw0CN6t63wYL2eJsNUxlXME9rTfkZkUV+l
	a2rScPUuyp+5nfdeHMJHUzff5af/PP8p1lYILUNHPuXQCxhr51p+NjnclIgSxw6FeXkD
	8+eg==
X-Gm-Message-State: AElRT7H29qrMth7s4Nod7MQO6BfscCj5ZisKGoKPuNUVd8BL5OyQa+x7
	fo1Sw7yDgJ/bXHUqXnbL/ybYCiKXM9hnvKbVrEycXQ==
X-Google-Smtp-Source: AG47ELtmvtk76FFVmH1GGs1g/YDFDNkgmOTZxTLlsIVLqNomnisBbXoGajxvRN8inTdsu5sA7oF76ESzw6m1pqs+qnw=
X-Received: by 10.223.147.36 with SMTP id 33mr2404884wro.133.1520731058768;
	Sat, 10 Mar 2018 17:17:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Sat, 10 Mar 2018 17:17:38 -0800 (PST)
In-Reply-To: <20180311010859.15536.68801@do.openembedded.org>
References: <cover.1520728803.git.Martin.Jansa@gmail.com>
	<20180311010859.15536.68801@do.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 11 Mar 2018 02:17:38 +0100
Message-ID: <CA+chaQfcSAi3LSzvceQooC499XV6w-Wza_3ve3LKVys0WXPfQA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEJhY2twb3J0cyBmb3IgcHlybyAocmV2Myk=?=
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
X-List-Received-Date: Sun, 11 Mar 2018 01:17:38 -0000
Content-Type: multipart/alternative; boundary="94eb2c0df0288e8ff5056718ca98"

--94eb2c0df0288e8ff5056718ca98
Content-Type: text/plain; charset="UTF-8"

Upstream-Status typo fixed in contrib/jansa/pyro-backports

On Sun, Mar 11, 2018 at 2:08 AM, Patchwork <
patchwork@patchwork.openembedded.org> wrote:

> == Series Details ==
>
> Series: Backports for pyro (rev3)
> Revision: 3
> URL   : https://patchwork.openembedded.org/series/8739/
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
> * Issue             Upstream-Status is in incorrect format
> [test_upstream_status_presence_format]
>   Suggested fix    Fix Upstream-Status format in
> 0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
>   Current          UpStream-Status: Backport
>   Standard format  Upstream-Status: <Valid status>
>   Valid status     Pending, Accepted, Backport, Denied, Inappropriate
> [reason], Submitted [where]
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

--94eb2c0df0288e8ff5056718ca98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">Upstream-Status typo fixed in co=
ntrib/jansa/pyro-backports</span><br></div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Sun, Mar 11, 2018 at 2:08 AM, Patchwork <span =
dir=3D"ltr">&lt;<a href=3D"mailto:patchwork@patchwork.openembedded.org" tar=
get=3D"_blank">patchwork@patchwork.openembedded.org</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">=3D=3D Series Details =3D=3D<br>
<br>
Series: Backports for pyro (rev3)<br>
Revision: 3<br>
URL=C2=A0 =C2=A0: <a href=3D"https://patchwork.openembedded.org/series/8739=
/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.<wbr>openembedded=
.org/series/8739/</a><br>
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
* Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Upstream-Status is i=
n incorrect format [test_upstream_status_<wbr>presence_format]<br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Fix Upstream-Status format in 0001-enable=
-FL_LPAE-flag-for-<wbr>armv7ve-cores.patch<br>
=C2=A0 Current=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UpStream-Status: Backport<=
br>
=C2=A0 Standard format=C2=A0 Upstream-Status: &lt;Valid status&gt;<br>
=C2=A0 Valid status=C2=A0 =C2=A0 =C2=A0Pending, Accepted, Backport, Denied,=
 Inappropriate [reason], Submitted [where]<br>
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

--94eb2c0df0288e8ff5056718ca98--
