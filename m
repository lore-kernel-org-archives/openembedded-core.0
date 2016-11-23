Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2DEC8719C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 15:01:47 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id c47so13784442qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V0APs4JToMeFef8/UO1Z2t75OkK+1M0v02I0x988jMA=;
	b=qV48zY6l7l1QXWdKTgbHiXiWCzfAAMXy8s4EtWmm0WB2vz32wYcpKJWGsbt2W8C4xv
	KN6810l2YBr92/yF0MTIH5u68Q+/8FxVhwb7Q9551UBGCboFpfLIKqX+EAgimMdvLmE3
	RehF1z9fLUgTiYTSbz0JcZ+L9FvEc8etEv3nc1Q/6H9Za129RA9hCvl8z0/TIkugRl3I
	uPPBDTM1gj5gotAD57ILfQhbguqFXy2P6D3V/l3QkgEtJXC/UXmnuGSiQ4Ho4iVlxwCL
	5u5Y7zYJvA/mYPpHrd72r2x9be+T1SzAxKEyA2QBZk8pke1phLNWfE4jaOCHmP2pJHxq
	51uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V0APs4JToMeFef8/UO1Z2t75OkK+1M0v02I0x988jMA=;
	b=YMTsaquCKPCwepDqKVSfjiIcTl041m8RGYRz/pOZmb38nLYC/xGK/ixi75Ie/tJtyB
	ajuJ3BmJmkHH95YA8jZnQTwEpqlfuFQEOQmZS8aUb0vm7pILtC+MIZfmeCrHjSlkYz7w
	I80wtNyT4BEbSoVSZMbFb+D+LsFhmYlJxDw6OhBK+KefZHpn14aoWkHvrtKD1s8k/3fm
	XIx5XVGt9yHA1PpC3yS5q0LUgiqtr8FvBbJd9ajJlYPzdQkTePcWORZgagbrZO0LdnSl
	9dBoMK3AvjWSZK6o5wpWT7XFzn1oTWLNQCIvQ1dvUqOCjeoudpQo1hQ1+Mv2EIDExRt1
	ixWg==
X-Gm-Message-State: AKaTC03/sxnXF4uQv5cu1q1e59s4rSIPF6bl0pYD0rP7l62m9TUvlnMrsf2ysIsiOIJDWMvQieacEvqaG41QRiEA
X-Received: by 10.237.44.161 with SMTP id g30mr2932236qtd.144.1479913309273;
	Wed, 23 Nov 2016 07:01:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Wed, 23 Nov 2016 07:01:28 -0800 (PST)
In-Reply-To: <672fdd07e6fc763ef96522fca4170240f515f1f6.1479804050.git.mariano.lopez@linux.intel.com>
References: <cover.1479804050.git.mariano.lopez@linux.intel.com>
	<672fdd07e6fc763ef96522fca4170240f515f1f6.1479804050.git.mariano.lopez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Nov 2016 15:01:28 +0000
Message-ID: <CAJTo0LaJKMkxoAZ8jGHdfvQ7GDq3BORqxPfrQXNOy=E0b_b53Q@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] nfs-utils: 1.3.3 -> 1.3.4
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
X-List-Received-Date: Wed, 23 Nov 2016 15:01:50 -0000
Content-Type: multipart/alternative; boundary=94eb2c12584819273c0541f92b25

--94eb2c12584819273c0541f92b25
Content-Type: text/plain; charset=UTF-8

On 22 November 2016 at 08:46, <mariano.lopez@linux.intel.com> wrote:

> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
>

ERROR: nfs-utils-1.3.4-r0 do_patch: Command Error: 'quilt --quiltrc
/data/poky-master/tmp-glibc/sysroots/x86_64-linux/etc/quiltrc push' exited
with 0  Output:
Applying patch fix-protocol-minor-version-fall-back.patch
patching file utils/mount/stropts.c
Hunk #1 FAILED at 841.
1 out of 1 hunk FAILED -- rejects in file utils/mount/stropts.c
Patch fix-protocol-minor-version-fall-back.patch can be reverse-applied
ERROR: nfs-utils-1.3.4-r0 do_patch: Function failed: patch_do_patch
ERROR: Logfile of failure stored in:
/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/nfs-utils/1.3.4-r0/temp/log.do_patch.18084
ERROR: Task
(/home/ross/Yocto/poky/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb:do_patch)
failed with exit code '1'

I really wish I knew why some people quilt silently handles this and for
others it throws an error.

Ross

--94eb2c12584819273c0541f92b25
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 November 2016 at 08:46,  <span dir=3D"ltr">&lt;<a href=3D"mailto:mari=
ano.lopez@linux.intel.com" target=3D"_blank">mariano.lopez@linux.intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:2bj" class=3D"g=
mail-a3s gmail-aXjCH gmail-m1588cfcb41b14d24">From: Mariano Lopez &lt;<a hr=
ef=3D"mailto:mariano.lopez@linux.intel.com">mariano.lopez@linux.intel.com</=
a><wbr>&gt;<br>
<br>
Signed-off-by: Mariano Lopez &lt;<a href=3D"mailto:mariano.lopez@linux.inte=
l.com">mariano.lopez@linux.intel.com</a><wbr>&gt;</div></blockquote></div><=
br><div class=3D"gmail_extra">ERROR: nfs-utils-1.3.4-r0 do_patch: Command E=
rror: &#39;quilt --quiltrc /data/poky-master/tmp-glibc/sysroots/x86_64-linu=
x/etc/quiltrc push&#39; exited with 0 =C2=A0Output:</div><div class=3D"gmai=
l_extra">Applying patch fix-protocol-minor-version-fall-back.patch</div><di=
v class=3D"gmail_extra">patching file utils/mount/stropts.c</div><div class=
=3D"gmail_extra">Hunk #1 FAILED at 841.</div><div class=3D"gmail_extra">1 o=
ut of 1 hunk FAILED -- rejects in file utils/mount/stropts.c</div><div clas=
s=3D"gmail_extra">Patch fix-protocol-minor-version-fall-back.patch can be r=
everse-applied</div><div class=3D"gmail_extra">ERROR: nfs-utils-1.3.4-r0 do=
_patch: Function failed: patch_do_patch</div><div class=3D"gmail_extra">ERR=
OR: Logfile of failure stored in: /data/poky-master/tmp-glibc/work/corei7-6=
4-poky-linux/nfs-utils/1.3.4-r0/temp/log.do_patch.18084</div><div class=3D"=
gmail_extra">ERROR: Task (/home/ross/Yocto/poky/meta/recipes-connectivity/n=
fs-utils/nfs-utils_1.3.4.bb:do_patch) failed with exit code &#39;1&#39;</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I really =
wish I knew why some people quilt silently handles this and for others it t=
hrows an error.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div></div>

--94eb2c12584819273c0541f92b25--
