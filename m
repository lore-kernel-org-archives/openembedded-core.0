Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB6266AC37
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 16:29:55 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id v84so7536245oie.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 09:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=3q+WmIMXfDhWfc6WELjfQCsJomXdLL2xgq1VeAJf1j0=;
	b=Q5rHUBpUO0eYGTj+phLZduHv2y2E7zYtzJc58QnBT2ckbEqOM21c5gukpIfCVI2Kk8
	iwZSxU2UBJF4zMAPJvIx5KSftVlfR5RHMfuy9rPt/iDt7ZbcnhniZ+EcMWn6i0DoLPMr
	GnJ8wrYhckbqBmFBs4TUZfZgF6+Qp9i/Sk6PODxzBCE54h8mDC1rQrUGLbBFXG5EhDDw
	lVmRcLBr1avkVeL5rs7GknImB1asbw6tMcxHugWdBQGxx8giXtYKTEgRQJnADKmB8f1N
	lKmV2NqhW6qxkKq7bxyq/xCirvJ+CofITSA8Ow5SYEr5x02jcYgnUN7o3MSqEnABgZIS
	zwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=3q+WmIMXfDhWfc6WELjfQCsJomXdLL2xgq1VeAJf1j0=;
	b=dun1QsVhBPwJPpeepx2vfcllBhHlHfWr8MjWrhsXretaEGJw+hHNjEwBpiPfpFJiBB
	cOgi0+Wcmv9TnFf48chdyZ3qOBXXm6cEdK+9fMHTKW04vE/jVf/q1NmxWZSMtTtxj1xJ
	i8x5BHtALHQOhobXa1wHAKvjH6ldVdIuymWoL2MZUD/fGdLMI/zq12u702ljP6q3nZ1b
	qy4hiGXjFQk9RpMKYnVtLZ1MygE+tKeadQ7lVwxlB4dOHtjBoz69s+sVAbM2X6rQuD8R
	O3wnv827J8HvfUzXKBhsnn3BOdtNNIecZJaFXN7DatE7mqMJr5Ccf0BAwHz3zQK2WzOg
	tZdA==
X-Gm-Message-State: ABUngveNkzIf0CamZC3shqDkLoBDcu9a7JvG1IFf1pmBn6hRPl6SNlm9DRW3xG46MGvUhiFgnnA13xXNSlawVg==
X-Received: by 10.157.46.149 with SMTP id w21mr6321428ota.219.1478190596629;
	Thu, 03 Nov 2016 09:29:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Thu, 3 Nov 2016 09:29:36 -0700 (PDT)
In-Reply-To: <6511599a-ddb1-77b0-f42e-69afeaa60cae@linux.intel.com>
References: <6511599a-ddb1-77b0-f42e-69afeaa60cae@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 3 Nov 2016 09:29:36 -0700
X-Google-Sender-Auth: fQXmSuSoeN3DQV9Hkn_Bt9HJD74
Message-ID: <CABcZANnYeGT9VVFBH3cNGUKnE_jPw8CDGv2YC_10-w5pe=WmKQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: using devtool for rebasing patches
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
X-List-Received-Date: Thu, 03 Nov 2016 16:29:56 -0000
Content-Type: multipart/alternative; boundary=001a113aced86c328b05406811e9

--001a113aced86c328b05406811e9
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 3, 2016 at 9:01 AM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> it would be very useful if devtool offered support for rebasing source
> patches when they fail to apply, but currently there does not seem to be
> any such feature:
>
> ak@kanavin-desktop:~/development/poky/build$ devtool modify libksba
> Parsing recipes..done.
> NOTE: Fetching libksba...
> NOTE: Unpacking...
> NOTE: Patching...
> ERROR: Applying 'ksba-add-pkgconfig-support.patch' failed:
> checking file Makefile.am
> Hunk #1 FAILED at 21.
> 1 out of 1 hunk FAILED
> checking file configure.ac
> Hunk #1 succeeded at 414 (offset 14 lines).
> checking file ksba.pc.in
> checking file src/ksba.m4
> ERROR: Function failed: patch_do_patch
> ak@kanavin-desktop:~/development/poky/build$
>
> What devtool could do here is apply the patches that can be applied and
> then partially apply the patches that fail. Then give the developer some
> kind of UI for dealing with the rejected hunks (which typically means
> finding the place in the target file where the changes should go and then
> manually editing them in, while looking at the original patch).
>
> Without this feature devtool is half as useful as it could be particularly
> for recipe version updates.
>

That would be useful, indeed.

git already provides such a UI, afaik devtool just needs to use git-am to
apply the patches, ideally passing -3 to it, and let the user use git am to
resolve and continue applying patches.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113aced86c328b05406811e9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 3, 2016 at 9:01 AM, Alexander Kanavin <span dir=3D"ltr">&lt;<a =
href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexand=
er.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D":kb" class=3D"a3s aXjCH m1582afc939339589">it would be v=
ery useful if devtool offered support for rebasing source patches when they=
 fail to apply, but currently there does not seem to be any such feature:<b=
r>
<br>
ak@kanavin-desktop:~/developme<wbr>nt/poky/build$ devtool modify libksba<br=
>
Parsing recipes..done.<br>
NOTE: Fetching libksba...<br>
NOTE: Unpacking...<br>
NOTE: Patching...<br>
ERROR: Applying &#39;<a href=3D"http://ksba-add-pkgconfig-support.pa">ksba-=
add-pkgconfig-support.pa</a><wbr>tch&#39; failed:<br>
checking file Makefile.am<br>
Hunk #1 FAILED at 21.<br>
1 out of 1 hunk FAILED<br>
checking file <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a><br>
Hunk #1 succeeded at 414 (offset 14 lines).<br>
checking file <a href=3D"http://ksba.pc.in" rel=3D"noreferrer" target=3D"_b=
lank">ksba.pc.in</a><br>
checking file src/ksba.m4<br>
ERROR: Function failed: patch_do_patch<br>
ak@kanavin-desktop:~/developme<wbr>nt/poky/build$<br>
<br>
What devtool could do here is apply the patches that can be applied and the=
n partially apply the patches that fail. Then give the developer some kind =
of UI for dealing with the rejected hunks (which typically means finding th=
e place in the target file where the changes should go and then manually ed=
iting them in, while looking at the original patch).<br>
<br>
Without this feature devtool is half as useful as it could be particularly =
for recipe version updates.</div></blockquote></div><div class=3D"gmail_ext=
ra"><br></div>That would be useful, indeed.</div><div class=3D"gmail_extra"=
><br>git already provides such a UI, afaik devtool just needs to use git-am=
 to apply the patches, ideally passing -3 to it, and let the user use git a=
m to resolve and continue applying patches.<br>-- <br><div class=3D"gmail_s=
ignature" data-smartmail=3D"gmail_signature">Christopher Larson<br>clarson =
at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Mainta=
iner - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a113aced86c328b05406811e9--
