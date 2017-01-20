Return-Path: <ross.burton@intel.com>
Received: from mail-yb0-f169.google.com (mail-yb0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id B8AC772002
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:52:32 +0000 (UTC)
Received: by mail-yb0-f169.google.com with SMTP id w194so54465099ybe.0
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 05:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ovQ4fps/nQFT1kc7ZOYhQVIiunhvTtF7evO7NDr66L8=;
	b=JLViF740/OV1NEmzeETcmvfRhwq0LzQCfUT4iJilNNrtaOfyqrE9pbGnyXe3QUDnn7
	MAhpnuRzG5bBmAIs93GPS1W1N8jiODHBl6WHdsRKHiDoyd0IM8MTS8z7CQEnpv2uu1KN
	j4GnT1cNBF0M/0Z5gpQfHub27hDzlJGJNUQJbfJ3/EWM3itMBjRq8RztWgrKSXCj2nU1
	sznFGR1ZdG7hS/hlLj74/1rLzXf5bIfwMe/twRoCXBPwCTzIb6PrwM/hJflXIEt4bL0d
	et7yrZ5vcCcRFu8sOVFBikwae2gsmKtuZSY6gPj8pM9BjycdcCxRViSkGVBT/F2eiaNg
	B1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ovQ4fps/nQFT1kc7ZOYhQVIiunhvTtF7evO7NDr66L8=;
	b=YPeEklLyiNQWtEqH6kjtHtvazCgAcLpmmhdcuatGXDeAujgwo21KHm9SwESE+ZHa3u
	ZowenChcenD5iB+Wy23dUHc5Y4khDJbuKvhadvGjLQgiCAL+em+Quw88+lD/ri+Cee3x
	8ZN1nqKAmqM/W2B7RAOluKmNoLqQV5CKdf7s6FCiHjDY9k5YThAJBw/AIEKll5r7vLSu
	B6vSvsIR6XVZRkSWRWs+LrK/wdtyF54vb9SVdR+JrWCCQkOA555Uc4jh/+u5LQ6bhiVH
	Sjk/cNZ9SMu71h2i4ysjaYlfFruH8LpWA1yulWJOttOZjTOi7bRsbxH8J7R34tlViGKH
	ctTQ==
X-Gm-Message-State: AIkVDXJMj9awz5ETqoNiNvkM3/WZwbbLs9Xs+ZZQN66oDHK5Sst8N2X0zgGsyXPdx1PAGiDFIpGxObxxizQcgA34
X-Received: by 10.200.45.247 with SMTP id q52mr12541922qta.197.1484920352571; 
	Fri, 20 Jan 2017 05:52:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 20 Jan 2017 05:52:12 -0800 (PST)
In-Reply-To: <63d74901-4f7e-292f-8163-445006e226d2@windriver.com>
References: <20170119211441.126457-1-jason.wessel@windriver.com>
	<20170119211441.126457-2-jason.wessel@windriver.com>
	<f97e0ddf-dd9d-06d3-831c-fa47349a1e66@windriver.com>
	<20170120132920.GA8341@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0LaFMD3cFHR2d_1W4pM3cy7ekhM21UpBRz_Ec+C4tYigQQ@mail.gmail.com>
	<63d74901-4f7e-292f-8163-445006e226d2@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Jan 2017 13:52:12 +0000
Message-ID: <CAJTo0LZ+C=_cz3wdvtqmYJBrNHR-UBX9fasrg_T632G_u43itA@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Revert "kernel: Modify kernel modules installation path."
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
X-List-Received-Date: Fri, 20 Jan 2017 13:52:33 -0000
Content-Type: multipart/alternative; boundary=001a1139cdf022bd47054686f6a1

--001a1139cdf022bd47054686f6a1
Content-Type: text/plain; charset=UTF-8

On 20 January 2017 at 13:48, Jason Wessel <jason.wessel@windriver.com>
wrote:

> WARNING: linux-yocto-4.8.12+gitAUTOINC+3edb4de355_9bcb4ea3fa-r0
> do_package: QA Issue: linux-yocto: Files/directories were installed but not
> shipped in any package:
>   /lib64
>   /lib/modules/4.8.17-yocto-standard/modules.builtin
>   /lib64/firmware
>   /lib64/firmware/cpia2
>   /lib64/firmware/cpia2/stv0672_vp4.bin
> Please set FILES such that these items are packaged. Alternatively if they
> are unneeded, avoid installing them or delete them within do_install.
> linux-yocto: 5 installed and not shipped files. [installed-vs-shipped]
>
I suspect this is trivial with fresh eyes.  What multilib configuration are
you using?  My usual "test multilib" stanza is:

#require conf/multilib.conf
#MULTILIBS_x86-64 = "multilib:lib32"
#DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

I'm guessing this isn't going to produce the same paths that you're seeing
problems with.

Ross

--001a1139cdf022bd47054686f6a1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 January 2017 at 13:48, Jason Wessel <span dir=3D"ltr">&lt;<a href=3D"=
mailto:jason.wessel@windriver.com" target=3D"_blank">jason.wessel@windriver=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><p>WARNING: linux-yocto-4.8.=
12+gitAUTOINC+<wbr>3edb4de355_9bcb4ea3fa-r0
      do_package: QA Issue: linux-yocto: Files/directories were
      installed but not shipped in any package:<br>
      =C2=A0 /lib64<br>
      =C2=A0 /lib/modules/4.8.17-yocto-<wbr>standard/modules.builtin<br>
      =C2=A0 /lib64/firmware<br>
      =C2=A0 /lib64/firmware/cpia2<br>
      =C2=A0 /lib64/firmware/cpia2/stv0672_<wbr>vp4.bin<br>
      Please set FILES such that these items are packaged. Alternatively
      if they are unneeded, avoid installing them or delete them within
      do_install.<br>
      linux-yocto: 5 installed and not shipped files.
      [installed-vs-shipped]</p></blockquote></div>I suspect this is trivia=
l with fresh eyes.=C2=A0 What multilib configuration are you using?=C2=A0 M=
y usual &quot;test multilib&quot; stanza is:</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">#require =
conf/multilib.conf</div><div class=3D"gmail_extra">#MULTILIBS_x86-64 =3D &q=
uot;multilib:lib32&quot;</div><div class=3D"gmail_extra">#DEFAULTTUNE_virtc=
lass-multilib-lib32 =3D &quot;x86&quot;</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">I&#39;m guessing this isn&#39;t going to =
produce the same paths that you&#39;re seeing problems with.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></di=
v>

--001a1139cdf022bd47054686f6a1--
