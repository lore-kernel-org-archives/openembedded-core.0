Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8C505607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 19:12:08 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so58876932qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 12:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DKmHUi1bPI4C2qchdh6rkVbiFm2A3CO2OWBABdu9f3U=;
	b=nImwU5RAix8AVCprTSK08hhCiL90QJbO0odXCjz0DXbtvo4OD0jQQ5gp6Jy3wi75fi
	8dpKZ/tHqtZrLCtFswLkBgA4XyDb/04bNKkZfhobVZeD1Cat+3AHKnZkxrlYYj8MHkKL
	TCM/fu2waoED1SsFPm9SbeO5yITxSm4TWc7AGwWzc9AXkwMVRHu2JW9fizhYLt8LdPG2
	Urtl17Im9nl4NwfGsZvN26sSZj+g7A1q5/AGsSP2FkSj/KHr6EiKz1jykR1b8OlBND66
	N+5t3igY0LK1mSxX5oU+EXxbFpFpjXvlZb5IJNbsqOT43LYuNYD4jSJ0GFb7oxxhSkIF
	4yfw==
X-Gm-Message-State: ALoCoQnmdzmhAzeiJgHZNH/cxFLYJhZrhnVHrcULoobPIzih3RFfsOXyUo3nz/HSXn8xAQ+9KdI3
X-Received: by 10.140.235.19 with SMTP id g19mr47150272qhc.52.1435864328983;
	Thu, 02 Jul 2015 12:12:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 2 Jul 2015 12:11:49 -0700 (PDT)
In-Reply-To: <1435743643-25276-1-git-send-email-Yuanjie.Huang@windriver.com>
References: <1435743643-25276-1-git-send-email-Yuanjie.Huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Jul 2015 20:11:49 +0100
Message-ID: <CAJTo0LYGrFZFqQ0HBvaxd=XnTWPCEVWDX6pFaRJ2r7QO=p7zow@mail.gmail.com>
To: Yuanjie Huang <Yuanjie.Huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] ldconfig-native: Add 64-bit flag for ELF64 entries
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
X-List-Received-Date: Thu, 02 Jul 2015 19:12:09 -0000
Content-Type: multipart/alternative; boundary=001a11376dac46786e0519e937e0

--001a11376dac46786e0519e937e0
Content-Type: text/plain; charset=UTF-8

On 1 July 2015 at 10:40, Yuanjie Huang <Yuanjie.Huang@windriver.com> wrote:

> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>
> ldconfig-native was grepped from an old version of glibc, and its output
> lacks neccessary 64bit flag in entries.
> Due to this defect, ctypes.util.find_library() python function fails to
> detect any library due to the old file format that ldconfig-native
> creates. This fix sets architecture-dependent 64bit flags for 64-bit ELF.
>
> Since the host's elf.h may not have definition for new AArch64 machine
> type, a work-around is added to correctly flag 64-bit ARM libraries.
>
> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>


This doesn't apply to master, can you verify it is based on that branch?

Ross

--001a11376dac46786e0519e937e0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 July 2015 at 10:40, Yuanjie Huang <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:Yuanjie.Huang@windriver.com" target=3D"_blank">Yuanjie.Huang@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"=
">From: Yuanjie Huang &lt;<a href=3D"mailto:yuanjie.huang@windriver.com">yu=
anjie.huang@windriver.com</a>&gt;<br>
<br>
ldconfig-native was grepped from an old version of glibc, and its output<br=
>
lacks neccessary 64bit flag in entries.<br>
Due to this defect, ctypes.util.find_library() python function fails to<br>
detect any library due to the old file format that ldconfig-native<br>
creates. This fix sets architecture-dependent 64bit flags for 64-bit ELF.<b=
r>
<br>
Since the host&#39;s elf.h may not have definition for new AArch64 machine<=
br>
type, a work-around is added to correctly flag 64-bit ARM libraries.<br>
<br>
</span><span class=3D"">Signed-off-by: Yuanjie Huang &lt;<a href=3D"mailto:=
yuanjie.huang@windriver.com">yuanjie.huang@windriver.com</a>&gt;</span></bl=
ockquote></div><br>This doesn&#39;t apply to master, can you verify it is b=
ased on that branch?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11376dac46786e0519e937e0--
