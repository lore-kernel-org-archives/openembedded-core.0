Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id F3CDF73081
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 23:08:01 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id x35so5067125qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 15:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+GmRQihUVHjJGxwZzqiG7H3zsAKLRu5OyTrSNQMLBGw=;
	b=fPJ2ZI0nz47nh3SjMwKiL4oQzyOBPSX34D95lfa40hMOeG8MBQyNWF7ufSNcS7ZGl8
	JKT4HnlhhbyVF0JnVtbZZuOOHJkFGbuw41uYmcHKXR2G1sGmZxyRiAOpNJNQXCR2GWK7
	szUldp0qSXA1Ta/vHlJlPY5YS27SAIUFLGtjwpCxCGTzrCFT6N6Qu0MtQaJF28/VGm/1
	1FV31nxcAEghfOsKGGCNvOwcyXXXKpFBmNsxBDc9ZDr7u67SFP8TLD4vlHCO6LE3d+2Q
	tWFEuI97HDc7wY2bYG1MiLRzFJhP0Dm7LlSEajT1/LrpAInHgxUHSs/Mz/uSk786sxQ7
	NUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+GmRQihUVHjJGxwZzqiG7H3zsAKLRu5OyTrSNQMLBGw=;
	b=GJ6ydRK7sLIdT0JwFbfJNKSuucMVeUy0p2ZtAkTewJsLKwn6dD3vDsDMJf5iFs9bjN
	dlOcK2DogDrE+7N7WTSdmHwXnCJNgFsace8qqgCPU6tAX3uWyC1uUb0mTdjUqTRM1UHn
	xsE4h1aABWs/VA/08R+GFOdeF3yRbJ+ORBHEoGOOu5oadmrlBDlcLYBJKVdgAb2nFe4x
	vHTDx0cJM77Ej6xjohHXB4V9duu4Muj7W+ZHnHEIIuJ2xw5bmn7BlzU3YggafOnZU79V
	njvnIxH4OlYPREyhtl4GT4HEezaJBzwFtWrA+HGqk7UWPtyg3EjUtGReevLHAbUMFBtu
	Q4Yw==
X-Gm-Message-State: AMke39nL1KAMdH+u1iJs8KGYCUJaE7+MPMKRnQO34kES2HyqBQGe6QgUcAxgASGBB6RM3R/UwOF62RigAWES73N+
X-Received: by 10.237.32.230 with SMTP id 93mr26510340qtb.144.1487891282800;
	Thu, 23 Feb 2017 15:08:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 23 Feb 2017 15:07:42 -0800 (PST)
In-Reply-To: <1487889124-8585-1-git-send-email-california.l.sullivan@intel.com>
References: <1486684537-17517-1-git-send-email-california.l.sullivan@intel.com>
	<1487889124-8585-1-git-send-email-california.l.sullivan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Feb 2017 23:07:42 +0000
Message-ID: <CAJTo0LaBPhygGF8NgjNOMPrHFS3Pa2F29PRviZDPB=+JjbBdkw@mail.gmail.com>
To: California Sullivan <california.l.sullivan@intel.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] kernel.bbclass: Make sanity check opt-out and provide easy opt-out
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
X-List-Received-Date: Thu, 23 Feb 2017 23:08:02 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c9b9c60693e05493aaf7f

--94eb2c0c9b9c60693e05493aaf7f
Content-Type: text/plain; charset=UTF-8

On 23 February 2017 at 22:32, California Sullivan <
california.l.sullivan@intel.com> wrote:

> The only change from V1 to V2 is the updated commit message, changing
> AUTOINC to AUTOREV and adding the blurb about impacting outside recipes.
>
> I also agree with Richard in that this is a significant functionality
> change
> and should not be backported.
>

I failed to say that I suspected this patch was to blame for SDK generation
failing on the autobuilder earlier.  Can you try generating a eSDK (bitbake
core-image-minimal -c populate_sdk_ext)  with this patch?

Ross

--94eb2c0c9b9c60693e05493aaf7f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 February 2017 at 22:32, California Sullivan <span dir=3D"ltr">&lt;<a =
href=3D"mailto:california.l.sullivan@intel.com" target=3D"_blank">californi=
a.l.sullivan@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":449" class=3D"a3s aXjCH m15a6d1aea290b109">The only change =
from V1 to V2 is the updated commit message, changing<br>
AUTOINC to AUTOREV and adding the blurb about impacting outside recipes.<br=
>
<br>
I also agree with Richard in that this is a significant functionality chang=
e<br>
and should not be backported.</div></blockquote></div><br>I failed to say t=
hat I suspected this patch was to blame for SDK generation failing on the a=
utobuilder earlier.=C2=A0 Can you try generating a eSDK (bitbake core-image=
-minimal -c populate_sdk_ext) =C2=A0with this patch?</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0c9b9c60693e05493aaf7f--
