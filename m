Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id C98F06FFED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 08:42:06 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id o4so74744846ywd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 01:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Avzd+fm96pnbZVnyr0rOSQikhqjoQohTm9WJWCW2xUY=;
	b=oDyxawYU1jAXHwg2lN4snuklZppLnJzSRf3QgIYvB2r2u64JOhvIxrILHflGzOaQel
	NbXur6YaKLzJOor8FtcgwJahYaHbPk0hD2HS5HNhOyxBQpnq9w+1D7dB2I4h5SozgBNg
	YDjOLypyLZyOzfOQWpyeg5Wp6zlquipVvpgcF4//7RsQgFQPJVMjPRfjzeF97d//9erP
	B3wrnOxFmj7nklKWodMudtOuSKzI2heyEMLU9RX4gxhG4xfvZmiU8cfKzSGR0TYagLFc
	enGRIxf/n4x6pKNBUnjJALZyoqu+txA5TbxII52A/kEO3KeH1Weq6yDyqC5bXoAHtqmc
	sQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Avzd+fm96pnbZVnyr0rOSQikhqjoQohTm9WJWCW2xUY=;
	b=KQoy2SN/R+LzTUEGR1wg82l7/1EXJ6wOb9tbI32q1ai9vCZxGFSLAnfVuqtANi7kY7
	72+ts7lFVdtdTgaU8Y8vTofJAOe/4SvYJbAyy0zYClh7NetOXfobEhFCZZA9voXpAz2H
	ijhqHCRJLtFH40JGn+fy4MWtcsyBmYJlPxnZA/SSKMmjEtq54OlN/y1uZO4t7hORzb/D
	/9h6YMFo86ytn6tmztCiBi6GIUw7N3fmHnb0bn4Vp06Nhx50cgu5X2ZUmhPZd5c5P06+
	TvkUUBihLUzWFFBeHDu4AjlSjFsBguVq8vpdHEz8X6CNQnOm0F6rggQb6ja66Ei8Lysj
	Sogw==
X-Gm-Message-State: AMke39ncJb6dHIGjspyFRR2RTs1rW7Ic0c/s2AIX4MbCQol60czbwJYYiLE1pLuAPZ9ImpqmGEz1WqEMqGef00jz
X-Received: by 10.13.211.70 with SMTP id v67mr21049679ywd.260.1489480927594;
	Tue, 14 Mar 2017 01:42:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Tue, 14 Mar 2017 01:41:37 -0700 (PDT)
In-Reply-To: <1489426850-26058-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1489426850-26058-1-git-send-email-jose.a.lamego@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 14 Mar 2017 10:41:37 +0200
Message-ID: <CAHiDW_GWfg73izumSztPm6ipSvz+_EHPM1ugD88CuNFbSnPi_Q@mail.gmail.com>
To: Jose Lamego <jose.a.lamego@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python*-git: Upgrade to version 2.1.3
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
X-List-Received-Date: Tue, 14 Mar 2017 08:42:07 -0000
Content-Type: multipart/alternative; boundary=001a114d83ea971d2e054aaccdbb

--001a114d83ea971d2e054aaccdbb
Content-Type: text/plain; charset=UTF-8

On 13 March 2017 at 19:40, Jose Lamego <jose.a.lamego@linux.intel.com>
wrote:

> Both python-git and python3-git need to be upgraded to latest
> upstream
> version.
> This change was tested using qemux86 with core-image-sato.
>

M3 freeze was scheduled for Feb 28, more than two weeks ago. I think all
version upgrades after that should have clear justification in the commit
message or cover letter.

Cheers,
  Jussi

--001a114d83ea971d2e054aaccdbb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
3 March 2017 at 19:40, Jose Lamego <span dir=3D"ltr">&lt;<a href=3D"mailto:=
jose.a.lamego@linux.intel.com" target=3D"_blank">jose.a.lamego@linux.intel.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Both python-git=
 and python3-git need to be upgraded to latest<br>
upstream<br>
version.<br>
This change was tested using qemux86 with core-image-sato.<br></blockquote>=
<div><br></div><div>M3 freeze was scheduled for Feb 28, more than two weeks=
 ago. I think all version upgrades after that should have clear justificati=
on in the commit message or cover letter.</div><div><br></div><div>Cheers,<=
/div><div>=C2=A0 Jussi</div><div><br></div></div></div></div>

--001a114d83ea971d2e054aaccdbb--
