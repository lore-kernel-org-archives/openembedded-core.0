Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8887876B1C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 16:26:30 +0000 (UTC)
Received: by qkch123 with SMTP id h123so97486786qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=St43KpE+cnkXoa561N/Ov6hLZgdRRNHS+oJKBP3BOjQ=;
	b=frd9OIa3ZlVxFrNpplhoG/fFKGLbgvktLmcESHwvpqLU+VhO7irH/OlKRhCEMsUpuA
	eKWjm0Oq49jvgyz6JDlyM8fPGVxZzSZrd/LqgHZidzw1GgHYlf6QHwhdwy4pcILt3dIR
	HEU368wgQdzWoPdTYV2s6IWe8ZvQSUPoa1zN939gajdAERYOblkB0LCZ5X3bX984IQ1a
	RniC7JU6uRX5rF10Yfpwqd3B3GXFbKIcZFRgeLCifcSl06ELCTX3eTcLU2VJ3oiD5JV6
	X3i2ZiY+U9sxAN27aLoJEi61WO4mcfE8DbmLatH78Q3MR2YqTaIzEYvr0oe7Sxb1+Zt4
	J5ng==
X-Gm-Message-State: ALoCoQklSA4Vmu9iYJAMU9NbrXk9w0aVkSHkYS+t54D1O9Vzh42BBBSzguULq9EPxOP3HaSUTpsi
X-Received: by 10.55.197.151 with SMTP id k23mr67263666qkl.13.1440519989972;
	Tue, 25 Aug 2015 09:26:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 25 Aug 2015 09:26:10 -0700 (PDT)
In-Reply-To: <9bf77291c7084cfdef86008d204932e7adb1067a.1440446290.git.raj.khem@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
	<9bf77291c7084cfdef86008d204932e7adb1067a.1440446290.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Aug 2015 17:26:10 +0100
Message-ID: <CAJTo0LZLhzWSo-vN79hKbOdZ-N7U+zD_wECtXCAGgN5y56=Y2A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/17] python-distribute, python-setuptools: Migrate to good old python-setuptools
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
X-List-Received-Date: Tue, 25 Aug 2015 16:26:33 -0000
Content-Type: multipart/alternative; boundary=001a114996704bb762051e25327e

--001a114996704bb762051e25327e
Content-Type: text/plain; charset=UTF-8

On 24 August 2015 at 21:03, Khem Raj <raj.khem@gmail.com> wrote:

> setuptools the old king is ruling again, distribute fork has been merged
> into setuptools starting 0.7x, so lets move to use it as well
>

This fails dramatically on the autobuilder with the core error being:

ERROR: Nothing PROVIDES 'python-setuptools-native' (but
virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm64/build/meta/recipes-devtools/python/
python-git_1.0.1.bb DEPENDS on or otherwise requires it). Close matches:
  python3-setuptools-native
  python3-setuptools
  python-scons-native

Ross

--001a114996704bb762051e25327e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 24 August 2015 at 21:03, Khe=
m Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:so=
lid;padding-left:1ex"><span class=3D"">setuptools</span> the old king is ru=
ling again, distribute fork has been merged<br>
into <span class=3D"">setuptools</span> starting 0.7x, so lets move to use =
it as well<br></blockquote></div><div class=3D"gmail_extra"><br></div>This =
fails dramatically on the autobuilder with the core error being:</div><div =
class=3D"gmail_extra"><br>ERROR: Nothing PROVIDES &#39;python-setuptools-na=
tive&#39; (but virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-wo=
rker/nightly-arm64/build/meta/recipes-devtools/python/<a href=3D"http://pyt=
hon-git_1.0.1.bb">python-git_1.0.1.bb</a> DEPENDS on or otherwise requires =
it). Close matches:<br>=C2=A0 python3-setuptools-native<br>=C2=A0 python3-s=
etuptools<br>=C2=A0 python-scons-native<br></div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114996704bb762051e25327e--
