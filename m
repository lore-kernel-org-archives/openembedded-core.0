Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7D85A71BA1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 17:10:44 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id v23so24072113qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 09:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ajkv/mTs4vuq1sewA290bLeIIkhpLWIyA6p75mgD/Ng=;
	b=patHqaj73SWKfRpZueJyrra/Lnt1mSYY9KfX3QtO5hoH5ocBU1BWorTHG/r8vInDic
	KPlkiU1HgHBrc6GyDRBXSqdpcMScFsQhnH/7T99l4K40ptYWxpLkNlEnc5PIPHpMtc04
	A49ap/sd53+1RAlxe8L2flIShXbCBZlGPbeu0e83PtF9ziMzgYMS2RjCjF1EK63OsSAl
	MisjfYe3Qatp2NvFH/AhxTCBsawKKzikndWosHJFJ7Lc0N5twCxtV1Y760chZmIQJ+1l
	zSrW69tfw6bnPm6bFSnApPenmRv8NpZv11iIyIprZEVy4w7W3phdTsSfsCTL1urwLeKm
	gapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ajkv/mTs4vuq1sewA290bLeIIkhpLWIyA6p75mgD/Ng=;
	b=ORCmVQOKzahUGdD6S1r+fsa59fMFvfb5wqxYqe1MCx6ciSYnc/fp91wdU8mRQss/bj
	iRFNuvVgOawNu5RAEFRMHtUSduYo2j6aHqHz2AD6IWE1v8n+ABUYXGu4GWf3raAzp58L
	ENj0x4Ef9zMCK4TBwbJjqisGKlnzLImK4gEsuQYI0xmlwUxpDs4mfhHWHpFPhGvtoADG
	O4PrsPotmaxe7pjNvc/4twwgpZeek6w+5HLN43YGOSeqELd7uLTnTNVSUuyPJcV3aCZJ
	orfXaWhDTNlA88DPJxB6KazSlkTgSmynvZ1Nv9aMbZOJ5MhF6Ub8HuiJyztbeZu/xkvS
	Jf7g==
X-Gm-Message-State: AIkVDXK2cskc907K1csthLf/NxarFr8SctPJItOA+BfrQXSYpiEpKa+C+N2kel6Bnte3B1Jkmy6qpgvBYLZiQv65
X-Received: by 10.237.62.232 with SMTP id o37mr13122046qtf.188.1484241044129; 
	Thu, 12 Jan 2017 09:10:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 12 Jan 2017 09:10:23 -0800 (PST)
In-Reply-To: <b15cc7cffbf3ef385dd6c4afb8f3d80d37082576.1484164023.git.alejandro.hernandez@linux.intel.com>
References: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
	<b15cc7cffbf3ef385dd6c4afb8f3d80d37082576.1484164023.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jan 2017 17:10:23 +0000
Message-ID: <CAJTo0LYzaFMY7mNS3fDtiRrhzZ-G0558Mp=dKxHppVVtons11A@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] image-.bbclass: standarize usage of DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Thu, 12 Jan 2017 17:10:51 -0000
Content-Type: multipart/alternative; boundary=001a11406f0e327ba00545e8cca2

--001a11406f0e327ba00545e8cca2
Content-Type: text/plain; charset=UTF-8

On 11 January 2017 at 19:55, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> Since wic now looks for boot artifacts on DEPLOY_DIR_IMAGE,
> we need to standarize the usage of this variable and drop
> HDDDIR to avoid confusion, which will let us drop support
> for hddimg in the future.
>
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  meta/classes/image-live.bbclass | 18 +++++++++---------
>  meta/classes/image-vm.bbclass   | 12 ++++++------
>

There's other places that use this variable:

meta/lib/oeqa/selftest/wic.py:        wicvars =
wicvars.difference(('HDDDIR', 'IMAGE_BOOT_FILES',
scripts/lib/wic/plugins/source/bootimg-efi.py:            bootimg_dir =
get_bitbake_var("HDDDIR")
scripts/lib/wic/plugins/source/bootimg-efi.py:
 msger.error("Couldn't find HDDDIR, exiting\n")
scripts/lib/wic/plugins/source/isoimage-isohybrid.py:        hdd_dir =
get_bitbake_var("HDDDIR")

Ross

--001a11406f0e327ba00545e8cca2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 January 2017 at 19:55, Alejandro Hernandez <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejan=
dro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><di=
v id=3D"gmail-:1x9" class=3D"gmail-a3s gmail-aXjCH gmail-m1598f1c5e4330547"=
>Since wic now looks for boot artifacts on DEPLOY_DIR_IMAGE,<br>
we need to standarize the usage of this variable and drop<br>
<span class=3D"gmail-il">HDDDIR</span> to avoid confusion, which will let u=
s drop support<br>
for hddimg in the future.<br>
<br>
Signed-off-by: Alejandro Hernandez &lt;<a href=3D"mailto:alejandro.hernande=
z@linux.intel.com">alejandro.hernandez@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/image-live.<wbr>bbclass | 18 +++++++++---------<br>
=C2=A0meta/classes/image-vm.bbclass=C2=A0 =C2=A0| 12 ++++++------</div></bl=
ockquote></div><div class=3D"gmail_extra"><br></div>There&#39;s other place=
s that use this variable:</div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_extra">meta/lib/oeqa/selftest/wic.py: =C2=A0 =C2=A0 =C2=A0 =C2=A0wic=
vars =3D wicvars.difference((&#39;HDDDIR&#39;, &#39;IMAGE_BOOT_FILES&#39;,<=
/div><div class=3D"gmail_extra">scripts/lib/wic/plugins/source/bootimg-efi.=
py: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootimg_dir =3D get_bitbake_va=
r(&quot;HDDDIR&quot;)</div><div class=3D"gmail_extra">scripts/lib/wic/plugi=
ns/source/bootimg-efi.py: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0msger.error(&quot;Couldn&#39;t find HDDDIR, exiting\n&quot;)</div><di=
v class=3D"gmail_extra">scripts/lib/wic/plugins/source/isoimage-isohybrid.p=
y: =C2=A0 =C2=A0 =C2=A0 =C2=A0hdd_dir =3D get_bitbake_var(&quot;HDDDIR&quot=
;)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div></div>

--001a11406f0e327ba00545e8cca2--
