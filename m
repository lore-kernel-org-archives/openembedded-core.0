Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1A925612E5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 14:01:49 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id d62so54628946iof.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 07:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FiCg5xFCaktiy+0pdyQ8YcBhJvludj49JPCwhQP0Uwk=;
	b=zh9+FZBvqVM3t58EwUUSoUtFcbyPK80aSrgZgVEv+Kb0EWb/8z87Lx5Kl5YVfHF+H6
	CnaM9ytB8talbQz0s4a7m0g7ZBaiMBloFZCZHYj8MK+HwCCD61P5ZDHgfEwBZzKuTJP1
	66Mf9UV5/wvCDTgNfXXZjNR4zbryWLHK/YUFOif265egwpfVpjN3jD5zIa7QycqFHAXY
	ZhEZ83GtHvn2oFZyUoYYBKqsjpPrMj8Fcj5ZcdhgFdrrW+mR1fTz5YNikc5AYQKSqMTL
	yH7sQAwrmFTLVZ0iYUsimg6y/enwUZXG5skMDlOVAJCjPek0P65jxNobZFpLQK8gCMHf
	esuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FiCg5xFCaktiy+0pdyQ8YcBhJvludj49JPCwhQP0Uwk=;
	b=Ct3vV2RLOlyEbVXfvdQ/2VEz0lRCDVty/3yF2P8ESvk9RpuLgbk1ZkL1fsmxtO4Nht
	vs3dFkODC8JOSkAf8uVIti++rEKPiiM448goV+8aioN+vKN/bCRCoFkNh+TIyjALVwOG
	OjPntfz8cI6aEAeq5wZcqMaM87P6b8raKmgxMcTavquFcAwOc4KzH4K/rxlTB0vuT4B9
	GADjCUsEzKaviOep50y8ZwrvbcrWty8SjH5bGVhi9/7lmLUkOYaWwgQjKsLNZWV1fXY7
	5kN6DHt3tY3HfyPiTXs8RIaPJgPPHzvJM8PS12j2KDVddDJA4LfseMV5sNaUd2sCovi/
	wCBA==
X-Gm-Message-State: AOPr4FWt6dQV8UiRFzTIvbYTVY8ZhzwYU4E0XxN2J0A2FGjtR+Gze7ds82nQX4F7PUYX+O31Ee146ImKXdQfSMGy
X-Received: by 10.107.135.211 with SMTP id r80mr11426031ioi.133.1462370510183; 
	Wed, 04 May 2016 07:01:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.142 with HTTP; Wed, 4 May 2016 07:01:30 -0700 (PDT)
In-Reply-To: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
References: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 May 2016 15:01:30 +0100
Message-ID: <CAJTo0LadzExDXkkX9a6r1TTO2aQhTQ+kY82mV_-BLqs6jYnFFA@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] gcc-cross{, -canadian}: remove --with-linker-hash-style
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
X-List-Received-Date: Wed, 04 May 2016 14:01:50 -0000
Content-Type: multipart/alternative; boundary=001a113ed20acabed3053204aa3b

--001a113ed20acabed3053204aa3b
Content-Type: text/plain; charset=UTF-8

On 2 May 2016 at 21:09, Christopher Larson <kergoth@gmail.com> wrote:

> This will result in a failure to obey LDFLAGS causing a GNU_HASH QA
> failure,
> which is what's often seen with external toolchains. This brings us all on
> the
> same page, and makes sure a failure to obey LDFLAGS is seen early.
>

I love the idea, but:

ERROR: libgcc-5.3.0-r0 do_package_qa: QA Issue: No GNU_HASH in the elf
binary:
'/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/libgcc/5.3.0-r0/packages-split/libgcc/lib/libgcc_s.so.1'
[ldflags]

Ross

--001a113ed20acabed3053204aa3b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 May 2016 at 21:09, Christopher Larson <span dir=3D"ltr">&lt;<a href=3D=
"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex"><div id=3D":2sm" class=3D"">This will result =
in a failure to obey LDFLAGS causing a GNU_HASH QA failure,<br>
which is what&#39;s often seen with external toolchains. This brings us all=
 on the<br>
same page, and makes sure a failure to obey LDFLAGS is seen early.</div></b=
lockquote></div><br>I love the idea, but:</div><div class=3D"gmail_extra"><=
br>ERROR: libgcc-5.3.0-r0 do_package_qa: QA Issue: No GNU_HASH in the elf b=
inary: &#39;/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/libgcc/5.=
3.0-r0/packages-split/libgcc/lib/libgcc_s.so.1&#39; [ldflags]</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ed20acabed3053204aa3b--
