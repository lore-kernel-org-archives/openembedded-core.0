Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9E19377CF1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 16:41:56 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id n4so15787788qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 May 2017 09:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PXHDiellCrqj4UBFsAwif0UAgiGx44yvSmEHgtebUIs=;
	b=YXIOQHGixLW8eNZ7WI4m+6M9aT5AH2IoqbwPUvTxA0JBj4Y6QheoH/z3P8md28BeZg
	CKN5Vc1VlYEa78gAQdY6BA7vbwCLZzC+kVMwEvHHO6M6QVqykHByYCArlwzf9s731xv/
	ShycNgaCohOIiMUQKgat/LmQuAaMatSfX2OuQxoZZ1qI71YKNAOHHJgI1GLGyJ4qEoCq
	TqRuyi+QRauFzIOScAJ9PrOIPezqnXHMm5qr4NGNnNcLkBTgvAmNuK1RCLHnfc5HjUPA
	tywxkD2/BxICOzsygPfj+YwTVjA9jb2EWJENBT1ydOlM4IHd8W+8XF10XM167VbIMCa9
	6kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PXHDiellCrqj4UBFsAwif0UAgiGx44yvSmEHgtebUIs=;
	b=JuUd+s31E2ayVA9P+LvC3v+TKi2bpSg6Xj+7E10DgY6XObBKbimsPPNt2vopHA5tai
	640/1Jm8BuysOO6g3FUsJvBohpPAKVxV+t4rEV8WCmAyxALyVO5fbEUXsdjTlYkrBWSb
	SUevJki3QIfSdahLbRJoTPpiNHZLZJ2QvKK/4NcceM2mBi3cQAs1xvcvlREgTxvGw/D3
	CxMLCtEQuQanZGPYnoNIqySu73K4CyDe40Wib1sEg3mx0KtZCh+wDQ66OeJuEWKgyNKO
	cmdGwMU3FxtIOezovGv1FBrgRfzq1qa3Wv2YBev4QbRwDcRmXAbVvNqiseX3IrkrDWgS
	m/GQ==
X-Gm-Message-State: AN3rC/4PNl0qgthLUwn7gmTkqgFeeLWyZwnHhi+/ARLCzfJm6NSfduF0
	aOnnynbVRa/AzjFwN3DVyZn/YCXfQP6g4hc=
X-Received: by 10.55.75.75 with SMTP id y72mr9870019qka.36.1493916117169; Thu,
	04 May 2017 09:41:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Thu, 4 May 2017 09:41:36 -0700 (PDT)
In-Reply-To: <20170502173735.11700-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170502173735.11700-1-leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 May 2017 17:41:36 +0100
Message-ID: <CAJTo0LbVxh8udLko405=dm9G1o20rXpSsP_ohWcB3SpvEYo5PQ@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts/oe-selftest: avoid deprecated imp.reload function
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
X-List-Received-Date: Thu, 04 May 2017 16:41:56 -0000
Content-Type: multipart/alternative; boundary=001a114a6abe7d0d88054eb573ae

--001a114a6abe7d0d88054eb573ae
Content-Type: text/plain; charset=UTF-8

On 2 May 2017 at 18:37, <leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> As explained in [1], the module function imp.reload has been deprecated for
> importlib.reload, so use the latter instead.
>

$ oe-selftest -r package
2017-05-04 17:40:10,352 - selftest - INFO - Running bitbake -e to get BBPATH
Traceback (most recent call last):
  File "/home/ross/Yocto/poky/scripts/oe-selftest", line 806, in <module>
    ret = main()
  File "/home/ross/Yocto/poky/scripts/oe-selftest", line 500, in main
    importlib.reload(oeqa.selftest)
UnboundLocalError: local variable 'importlib' referenced before assignment

Ross

--001a114a6abe7d0d88054eb573ae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 May 2017 at 18:37,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leonardo.s=
andoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.gonza=
lez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-sty=
le:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gm=
ail-:25v" class=3D"gmail-a3s gmail-aXjCH gmail-m15bca3e3c35f861d">As explai=
ned in [1], the module function imp.reload has been deprecated for<br>
<span class=3D"gmail-il">importlib</span>.reload, so use the latter instead=
.<br></div></blockquote></div><br><div class=3D"gmail_extra">$ oe-selftest =
-r package</div><div class=3D"gmail_extra">2017-05-04 17:40:10,352 - selfte=
st - INFO - Running bitbake -e to get BBPATH</div><div class=3D"gmail_extra=
">Traceback (most recent call last):</div><div class=3D"gmail_extra">=C2=A0=
 File &quot;/home/ross/Yocto/poky/scripts/oe-selftest&quot;, line 806, in &=
lt;module&gt;</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 ret =3D main()<=
/div><div class=3D"gmail_extra">=C2=A0 File &quot;/home/ross/Yocto/poky/scr=
ipts/oe-selftest&quot;, line 500, in main</div><div class=3D"gmail_extra">=
=C2=A0 =C2=A0 importlib.reload(oeqa.selftest)</div><div class=3D"gmail_extr=
a">UnboundLocalError: local variable &#39;importlib&#39; referenced before =
assignment</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div></div>

--001a114a6abe7d0d88054eb573ae--
