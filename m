Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f196.google.com (mail-ig0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 03E866011A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 16:52:10 +0000 (UTC)
Received: by mail-ig0-f196.google.com with SMTP id l10so5756992igk.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 09:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ZFsv52dep8zC0tA7FqS+hnQPzNVn3KAtKYpSgYgYVqY=;
	b=JpkUrXXtCJJfxU0gTLav8a3uCHT1MOzuGdyyM5vodI565p5Qeu6yeCNQZKtEsfsdVc
	v5Y0ttr8XH3yIl2iaO3M8RpVIT153Vy1g+qe2JmwmzDK5Hkg8VVig9OY5GHUQVaCoA9l
	29A0SwT6auD5dX2TH2G9dzFccfpEBhiftSA2ht13YS/DhR58/gFnvrQa+0y6RsdtI2oz
	8aNTFjcOP7qEyBxEe96NzZ9m0LLUPr8Q8WuK+xklf95T3tONG8W1xBzCQxQuffHERvYd
	b3k8lG1EC3z5eLbnbVfEPEuFz59vF8yJmNlcomjkDTuZ35jC2Er6fzObmzyUW7yRVOqv
	XPLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ZFsv52dep8zC0tA7FqS+hnQPzNVn3KAtKYpSgYgYVqY=;
	b=gVsYZlNNDFkQ7wa9A0KUXs1dmkXm5HKRwBvDUMHYReoOGeC21lx3/JS+PiW9nKBQw6
	faENkykiT21qCzL7t1i1u4Xwg6b32s+iXQK5DUgDSdZkFOHF0N/9v11bKWF4fsF3HENC
	CBpMqdQxx4FndYhLDLizsrpcFBOWR0v6PZkwDHxCCXCy2OVX0JQmCR8x/tHqV0kYyoQD
	8BR3m2gSHjRj2f6RZmWl3w2VwPA5iN44YbZEw2RhY7lV+unAssg5xXNumbLw732CDOZh
	nC6+xBUTkljaYT2mTmfqM9aEZl+jA0DtB7cNJI3Zeq1buWmBAUegmb9+SA4vsFJ5rI3d
	99Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ZFsv52dep8zC0tA7FqS+hnQPzNVn3KAtKYpSgYgYVqY=;
	b=Val7aeDLPbIUWxrLHZu4FacMaRjorBz406fRptO/IjcuqnecAuryUveHcEghJEokNM
	6DvESn4CeQVRoE6WuApRXXaKuRerlW07vQJmu0bfW9YUGYzVNy5P57UdIznQ3aQT59VF
	j8wjLeAhYeH3MbPVU0klz/8gMus5p6n8TmyzeM67b49a/cpT9jt1AmAiWvYLDcmQB8Qv
	R3EdEwRTif7LrkQ9jSzJVebD/y1vGYQWzlaIaTNmaXD0+/NJ31yb9cdy0Oi7gzoqbzEj
	IXOjocy2hN/04Cn2AuFVnWw4Nw3s9ohQAWTN+OQB1+brU/H6IsFMflKrdYn5SY8EIEUR
	As6g==
X-Gm-Message-State: ALyK8tIC4eLco58UFjz24yRhMkpx5Jqbli+GzMbpe4yCr2C+WovttSEQeoNRexneyQlCVDbLgF6KrYzstOgdrw==
X-Received: by 10.50.160.8 with SMTP id xg8mr4955649igb.87.1464195129278; Wed,
	25 May 2016 09:52:09 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Wed, 25 May 2016 09:51:49 -0700 (PDT)
In-Reply-To: <1464194942-28189-1-git-send-email-kergoth@gmail.com>
References: <1464194942-28189-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Wed, 25 May 2016 09:51:49 -0700
X-Google-Sender-Auth: GaPOtfnLlMyPWj6P7H51y5Ai9Zo
Message-ID: <CABcZANk3Crft8NyPyr+wNatRoNb1QjP1hA02Agfc3WKMG=F04g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [RFC PATCH] Switch most global exports to task level
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
X-List-Received-Date: Wed, 25 May 2016 16:52:13 -0000
Content-Type: multipart/alternative; boundary=001a11c28f0090194c0533ad7edf

--001a11c28f0090194c0533ad7edf
Content-Type: text/plain; charset=UTF-8

On Wed, May 25, 2016 at 9:49 AM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> The majority of our global exports are only needed for the build tasks, so
> switch them to those tasks (configure/compile/install, but not
> populate_sysroot or package).
>
> Kept global exports: PATH, PSEUDO_DISABLED, LC_ALL, CCACHE_DIR,
> CCACHE_DISABLE
>
> The variables which are exported by default are listed in logically grouped
> variables, to make it easy to add or remove them from task exports:
>
> - PKG_CONFIG_EXPORTS: PKG_CONFIG_DIR, etc
> - BUILD_EXPORTS: BUILD_CC, etc
> - TARGET_EXPORTS: TARGET_CC, etc
> - TARGET_PATH_EXPORTS: prefix, bindir, etc
>
> Intermediate variables are added as well, to ease usage and avoid the need
> to
> mess with the flags directly for the common cases:
>
> - CONFIGURE_EXPORTS
> - COMPILE_EXPORTS
> - INSTALL_EXPORTS
> - POPULATE_SYSROOT_EXPORTS
> - PACKAGE_EXPORTS
>
> Future patches will pare down the exports from here. Specifically removing
> the
> default export of BUILD_EXPORTS, TARGET_EXPORTS, and TARGET_PATH_EXPORTS,
> none
> of which are consistently used by the buildsystems we're calling into.
>
> This is placed into conf/task-exports.conf, to avoid cluttering up
> bitbake.conf any further.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

There are a couple exceptions for particular cases above and beyond this
patch, but not many, and I'm looking for thoughts on the approach and
direction here. Does this seem like a reasonable way to go?

Thinking about it, I should probably have mentioned the motivation behind
this in the commit message, I'll fix that. The issue is, global exports
(variables flagged as 'export') end up in the checksum of every single
task, as bitbake can't know where it's used and where it isn't, so I think
there's value in paring that down to make the checksums a bit less brittle.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c28f0090194c0533ad7edf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, May 25, 2016 at 9:49 AM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":25j" class=
=3D"a3s aXjCH m154e8d190d6a32b4">From: Christopher Larson &lt;<a href=3D"ma=
ilto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
The majority of our global exports are only needed for the build tasks, so<=
br>
switch them to those tasks (configure/compile/install, but not<br>
populate_sysroot or package).<br>
<br>
Kept global exports: PATH, PSEUDO_DISABLED, LC_ALL, CCACHE_DIR, CCACHE_DISA=
BLE<br>
<br>
The variables which are exported by default are listed in logically grouped=
<br>
variables, to make it easy to add or remove them from task exports:<br>
<br>
- PKG_CONFIG_EXPORTS: PKG_CONFIG_DIR, etc<br>
- BUILD_EXPORTS: BUILD_CC, etc<br>
- TARGET_EXPORTS: TARGET_CC, etc<br>
- TARGET_PATH_EXPORTS: prefix, bindir, etc<br>
<br>
Intermediate variables are added as well, to ease usage and avoid the need =
to<br>
mess with the flags directly for the common cases:<br>
<br>
- CONFIGURE_EXPORTS<br>
- COMPILE_EXPORTS<br>
- INSTALL_EXPORTS<br>
- POPULATE_SYSROOT_EXPORTS<br>
- PACKAGE_EXPORTS<br>
<br>
Future patches will pare down the exports from here. Specifically removing =
the<br>
default export of BUILD_EXPORTS, TARGET_EXPORTS, and TARGET_PATH_EXPORTS, n=
one<br>
of which are consistently used by the buildsystems we&#39;re calling into.<=
br>
<br>
This is placed into conf/task-exports.conf, to avoid cluttering up<br>
bitbake.conf any further.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;</div></blockquote></div><br>There are=
 a couple exceptions for particular cases above and beyond this patch, but =
not many, and I&#39;m looking for thoughts on the approach and direction he=
re. Does this seem like a reasonable way to go?</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Thinking about it, I should proba=
bly have mentioned the motivation behind this in the commit message, I&#39;=
ll fix that. The issue is, global exports (variables flagged as &#39;export=
&#39;) end up in the checksum of every single task, as bitbake can&#39;t kn=
ow where it&#39;s used and where it isn&#39;t, so I think there&#39;s value=
 in paring that down to make the checksums a bit less brittle.<br>-- <br><d=
iv class=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<br>kergoth=
 at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintai=
ner - Tslib<br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a11c28f0090194c0533ad7edf--
