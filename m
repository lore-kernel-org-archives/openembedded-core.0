Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0006D75E80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 20:30:48 +0000 (UTC)
Received: by qgbb65 with SMTP id b65so76105089qgb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 13:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qjRWwxKx5FDYH/VaYHs1oFKx9gu/JXNmlbI3gKtX3wI=;
	b=Ky80rSp83FD3k1VtokP0VgHm+pnybNWR92UEGSglb78IFlSMAyFY2XVB/Tfq/RQCl5
	d/c7Zs7ucaWOAW9fXSddPmmrBEyS3Pvtorc1t4pO+1riplAs6BLguHwcf/iI3YtzGzNg
	0KgprEqK5Yq8VrhCwFqDZAx/IW8zt7hCDdkMmKDA87rqQqkXn4VO57EWTUYsZuvV3LNg
	aq7viCCgLZBnoauWx8DpbP/b7EFX7tm+q0Qeec06d6ZV5Ebq/5bNixzV4TSTKhLgVAOY
	Cfkeqb8+jHYsfUN3AsTnB6BSR0QLYjJtfXFKVOci1VgzVaPxsBTLjk20IHO8bWbyNedL
	0VRQ==
X-Gm-Message-State: ALoCoQkHIUyDzD+xj94DyyhX3kVy32sXa+oT3uKHb3XJfdJvqBP7NAxfPZ6YenLoAKYbEPfm4dUs
X-Received: by 10.140.16.21 with SMTP id 21mr14302917qga.87.1445632248045;
	Fri, 23 Oct 2015 13:30:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Fri, 23 Oct 2015 13:30:28 -0700 (PDT)
In-Reply-To: <CAD1M063TPymcvdfn_qn+Ze+PFGs83D-q+0u=UuRPnf3vDcB+fQ@mail.gmail.com>
References: <1445620987-11004-1-git-send-email-psidhu@gateworks.com>
	<CAJTo0LYKycvgn4p3J88fjbWgc6Dh24q6dt9MJTr64e8LDByFyQ@mail.gmail.com>
	<CAD1M063TPymcvdfn_qn+Ze+PFGs83D-q+0u=UuRPnf3vDcB+fQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Oct 2015 21:30:28 +0100
Message-ID: <CAJTo0LYR7RMwyW750FMi7sViiK+PutyL3UKriJ=GV7z4zh_q3Q@mail.gmail.com>
To: Pushpal Sidhu <psidhu@gateworks.com>
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: Add upstream patch to fix build problem
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
X-List-Received-Date: Fri, 23 Oct 2015 20:30:49 -0000
Content-Type: multipart/alternative; boundary=001a11c051d49f11010522cb7c9c

--001a11c051d49f11010522cb7c9c
Content-Type: text/plain; charset=UTF-8

On 23 October 2015 at 21:21, Pushpal Sidhu <psidhu@gateworks.com> wrote:

> The patch is from a git format-patch, so the original commiter didn't
> do a sign-off. However, because I backported this patch, I supposed I
> can add my own name and extend the original patch's commit message to
> include Upstream-Status and add info on the problem. Will that work
> for you?
>

Yes, that's exactly what is expected - we need to know in the patch itself
who is signing off on it being added to oe-core.

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Ross

--001a11c051d49f11010522cb7c9c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 October 2015 at 21:21, Pushpal Sidhu <span dir=3D"ltr">&lt;<a href=3D=
"mailto:psidhu@gateworks.com" target=3D"_blank">psidhu@gateworks.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div id=3D":1kc" class=3D"" style=3D"ov=
erflow:hidden">The patch is from a git format-patch, so the original commit=
er didn&#39;t<br>
do a sign-off. However, because I backported this patch, I supposed I<br>
can add my own name and extend the original patch&#39;s commit message to<b=
r>
include Upstream-Status and add info on the problem. Will that work<br>
for you?<div class=3D""><div id=3D":u0" class=3D"" tabindex=3D"0"></div></d=
iv></div></blockquote></div><br>Yes, that&#39;s exactly what is expected - =
we need to know in the patch itself who is signing off on it being added to=
 oe-core.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra"><a href=3D"http://www.openembedded.org/wiki/Commit_Patch_Message_Guidel=
ines">http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines</a><=
br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a11c051d49f11010522cb7c9c--
