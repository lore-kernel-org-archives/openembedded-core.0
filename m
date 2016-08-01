Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id AB82C731C6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 19:23:15 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id b62so192297892iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 12:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8WFfCT3vCXB1BxWTUQjMdQJwQwMbx+OYRjxDAvBJqvQ=;
	b=LMldpqxLGoNmQ4L9U0mVuwFi4htTdOCnKq7pZ0X3rLGiLoPZKCtGrZgyZE1NVJaPv0
	G/h5HsIk2B1xjoFb/51UYR4SBQiV9vmO+6giJcd3Uhf497Omy0Pd9KC5sr9CrDkAskfh
	sWN6M354rPz58VfqovvwtW7dJz4H6p0rmmddFpbFMQUo2KBZVe388Di+vyq2X3r6M/JZ
	EVPZs3e8LmY3j5WHkfs0OExved0o1VfgdpMYiom//4tfi0DqYZwEXEO5XsiekrPmdILR
	oP6AAKu2EQGwm8gouJMmEz0iOlC0V3LJGOdDcIfTvgo/hB2XuYN2mor5UVijs85quBYv
	v+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8WFfCT3vCXB1BxWTUQjMdQJwQwMbx+OYRjxDAvBJqvQ=;
	b=kMJCSQ2gNyumIX0kcdETSd02uEvY9n4lU+CESo3OVAcZvNSmrKboWI2/W2rSP1sj8n
	GZEZIqXEpxiUhRUl8vCZ6Y8BaDALbQ4vgfsac2IEYRtnCeRD5I+ohUXOrH/tcKWPBfsn
	tOq6FH6ERJa311fHMrb7M3kNe6Xw4H5QGzbK1zMMM1sb70/izxUWrBYI0cXwKtRMkRDp
	73wLBuWrwSE6iVW6woWfCSRQ9RcTdJAV+Lgz6g8Q5/ipbjh8nT5mPlHKSNy3YeBjv9el
	fBJfoGm+sbbl6Up+vVDFgUL3DmgetZkjVqbBoat3xrvdXz4jZ3YAXy8WhiudamTOUzL0
	7HIg==
X-Gm-Message-State: AEkoouvADmGfgCdgxLnBLnu559YSkA0sIa+uyMZkAu/wJLxF3RVqgFMXVFLsK+s0QcSF6eyndQ2FFJYyDrmCb+g5
X-Received: by 10.107.135.142 with SMTP id r14mr64332748ioi.133.1470079396032; 
	Mon, 01 Aug 2016 12:23:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 1 Aug 2016 12:22:55 -0700 (PDT)
In-Reply-To: <1470016499-30815-1-git-send-email-mingli.yu@windriver.com>
References: <1470016499-30815-1-git-send-email-mingli.yu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Aug 2016 20:22:55 +0100
Message-ID: <CAJTo0LadvrbvgPVpC=-pDSBd6ykYyKX=+MqqkNQhzFtbYo=3Ew@mail.gmail.com>
To: mingli.yu@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub2.inc: run autogen.sh before configure
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
X-List-Received-Date: Mon, 01 Aug 2016 19:23:15 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc316426053907882d

--001a113eccbc316426053907882d
Content-Type: text/plain; charset=UTF-8

On 1 August 2016 at 02:54, <mingli.yu@windriver.com> wrote:

> When adding new source files from upstream the autogen.sh
> script needs to be run
>

This results in this change:

packages/corei7-64-poky-linux/grub-efi/grub-efi: PKGSIZE changed from
6787555 to 7524227 (+10%)
  * FILELIST: added "/usr/sbin/grub-sparc64-setup"
packages/corei7-64-poky-linux/grub-efi/grub-efi: FILELIST: added
"/usr/sbin/grub-sparc64-setup"
packages/corei7-64-poky-linux/grub/grub-dbg: PKGSIZE changed from 26159624
to 28829025 (+10%)
packages/corei7-64-poky-linux/grub/grub: PKGSIZE changed from 5942339 to
6679011 (+12%)
  * FILELIST: added "/usr/sbin/grub-sparc64-setup"
packages/corei7-64-poky-linux/grub/grub: FILELIST: added
"/usr/sbin/grub-sparc64-setup"

Is this intentional?

Ross

--001a113eccbc316426053907882d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 August 2016 at 02:54,  <span dir=3D"ltr">&lt;<a href=3D"mailto:mingli.=
yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div id=3D":24c" class=3D"">When adding new sour=
ce files from upstream the autogen.sh<br>
script needs to be run<br></div></blockquote></div><br>This results in this=
 change:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a"><div class=3D"gmail_extra">packages/corei7-64-poky-linux/grub-efi/grub-e=
fi: PKGSIZE changed from 6787555 to 7524227 (+10%)</div><div class=3D"gmail=
_extra">=C2=A0 * FILELIST: added &quot;/usr/sbin/grub-sparc64-setup&quot;</=
div><div class=3D"gmail_extra">packages/corei7-64-poky-linux/grub-efi/grub-=
efi: FILELIST: added &quot;/usr/sbin/grub-sparc64-setup&quot;</div><div cla=
ss=3D"gmail_extra">packages/corei7-64-poky-linux/grub/grub-dbg: PKGSIZE cha=
nged from 26159624 to 28829025 (+10%)</div><div class=3D"gmail_extra">packa=
ges/corei7-64-poky-linux/grub/grub: PKGSIZE changed from 5942339 to 6679011=
 (+12%)</div><div class=3D"gmail_extra">=C2=A0 * FILELIST: added &quot;/usr=
/sbin/grub-sparc64-setup&quot;</div><div class=3D"gmail_extra">packages/cor=
ei7-64-poky-linux/grub/grub: FILELIST: added &quot;/usr/sbin/grub-sparc64-s=
etup&quot;</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Is this intentional?</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div></div>

--001a113eccbc316426053907882d--
