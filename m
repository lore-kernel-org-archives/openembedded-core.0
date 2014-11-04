Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4FD487068F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 10:22:58 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id s7so1314526qap.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Nov 2014 02:22:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4gmIrO0EpnB/3Hk6x7LOVVklmd5gvFy4EjYA24rhYfY=;
	b=arHQtOqg0JJt9UGiy3GMRGFMC93V+5klGcucFm+QIu5bjrrdu9eZJ4FkOP8ANVBqSJ
	1t1t9x4b19fjOKnxd/oi+jMs+T/H6C34jj/ghPmiFdWIO5GbOgUQh2lVM6m+XPiCw6J4
	DsQC9igj314EtiTahS0hEHb4pr8hRtlH3uUz70Fo7zMwl9HUR8QjYV0jQkUpefle3L3z
	RNCgu89pWQS2Is1R8QXt8tGy8apGofXAXK8mc/GM/ErEigTRTUAS0Y/nVccWj4lH4TZw
	7G6oqXevRbMIXaSZ3q60BlfxlwXmjW5nfxzNsBbTsj22eSYAIEiFjzZi4i43evI6gHZY
	vgaQ==
X-Gm-Message-State: ALoCoQkePbjKVS5OswUyTFeni1bSo+ggkZFrE+zo0woZ3aAr3jJF9kXgihYPvvOCXwFcj/mTRRh3
X-Received: by 10.224.160.83 with SMTP id m19mr75077942qax.17.1415096579404;
	Tue, 04 Nov 2014 02:22:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Tue, 4 Nov 2014 02:22:39 -0800 (PST)
In-Reply-To: <5458472F.5080203@windriver.com>
References: <cover.1409069458.git.roxana.ciobanu@intel.com>
	<8ece0cf761b780c9d192d172b0bb7ae5ce987980.1409069458.git.roxana.ciobanu@intel.com>
	<5458472F.5080203@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Nov 2014 10:22:39 +0000
Message-ID: <CAJTo0LavebVn=pws3Bn6eAmTY-BUnFWRcekAjZUU=bFu3x1uRQ@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gdb: Upgrade gdb 7.7.1 -> 7.8
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
X-List-Received-Date: Tue, 04 Nov 2014 10:22:59 -0000
Content-Type: multipart/alternative; boundary=047d7bacb2aaf04630050705d876

--047d7bacb2aaf04630050705d876
Content-Type: text/plain; charset=UTF-8

On 4 November 2014 03:25, ChenQi <Qi.Chen@windriver.com> wrote:

> There are failures on autobuilder that might be related to this patch.
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/
> 88/steps/BuildImages/logs/stdio
>
> ERROR: Command Error: exit status: 1  Output:
> Applying patch include_asm_ptrace.patch
> patching file gdb/aarch64-linux-nat.c
> Hunk #1 succeeded at 32 with fuzz 2.
> patching file gdb/gdbserver/linux-aarch64-low.c
> Hunk #1 FAILED at 26.
> 1 out of 1 hunk FAILED -- rejects in file gdb/gdbserver/linux-aarch64-
> low.c
> Patch include_asm_ptrace.patch does not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch
>

Yes, I pulled that upgrade from mut because of this.

Ross

--047d7bacb2aaf04630050705d876
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 November 2014 03:25, ChenQi <span dir=3D"ltr">&lt;<a href=3D"mailto:Qi=
.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":3vp" class=3D"a3s" st=
yle=3D"overflow:hidden">There are failures on autobuilder that might be rel=
ated to this patch.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/b=
uilds/88/steps/BuildImages/logs/stdio" target=3D"_blank">https://autobuilde=
r.<u></u>yoctoproject.org/main/<u></u>builders/nightly-ppc/builds/<u></u>88=
/steps/BuildImages/logs/<u></u>stdio</a><br>
<br>
ERROR: Command Error: exit status: 1=C2=A0 Output:<br>
Applying patch include_asm_ptrace.patch<br>
patching file gdb/aarch64-linux-nat.c<br>
Hunk #1 succeeded at 32 with fuzz 2.<br>
patching file gdb/gdbserver/linux-aarch64-<u></u>low.c<br>
Hunk #1 FAILED at 26.<br>
1 out of 1 hunk FAILED -- rejects in file gdb/gdbserver/linux-aarch64-<u></=
u>low.c<br>
Patch include_asm_ptrace.patch does not apply (enforce with -f)<br>
ERROR: Function failed: patch_do_patch</div></blockquote></div><br>Yes, I p=
ulled that upgrade from mut because of this.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bacb2aaf04630050705d876--
