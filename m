Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id F0E7C73243
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 20:21:47 +0000 (UTC)
Received: by qgev79 with SMTP id v79so48125473qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 13:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WTglZgwKeQAAwY7EgJyJLX6+2aOsxzCnYc+zKg5AxI8=;
	b=bgPOhBKOvhBGT3fKD4nQy+JHeiaizI6nq8G09/+Ezv6f022jfv1LZVA9CnaysDIxhh
	0LH3IuJ6HMN3qpRuKiyeZ4wuLbyhKN1XD4UtPLO7+a92ofveEnsxIv6WvE6o90oTun6Z
	q/X5dYqzOSXTbxYzz+Y6QgJp854cZXlhLDXSVVm4o0x2taPv6Fzlrp7CiOlgg6MVkRaO
	9J7BrtifuY/aDaXLOY4RrOrEvRBAak6yZwN0Gw5aFZ2Gztf61MCA8Mh45zCXNlUctcjv
	fg/9rhynRxtdx7wD0ksGuJRYdxzhq8syg8H9m3f/kclBE8RfIqdqiCsY+Wy8BzHIjoci
	jlKA==
X-Gm-Message-State: ALoCoQlQZaOhAxyFquSA53D8uoAcUbiGVDGG2wWnbiJFKIeuqwOtliu2ptQwSO7hIxo9K/lMcN7a
X-Received: by 10.140.235.147 with SMTP id g141mr8927931qhc.22.1442607707413; 
	Fri, 18 Sep 2015 13:21:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 18 Sep 2015 13:21:28 -0700 (PDT)
In-Reply-To: <0a11e2878fd22572867a93a8e31e26524cab11c1.1442248108.git.raj.khem@gmail.com>
References: <cover.1442248108.git.raj.khem@gmail.com>
	<0a11e2878fd22572867a93a8e31e26524cab11c1.1442248108.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Sep 2015 21:21:28 +0100
Message-ID: <CAJTo0LYSh=oCR54d_A-j8u5Uy2O4sjuL8beULX=Knb+P9hAZkQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/12] waffle: upgrade waffle_1.5.1.bb -> waffle_1.5.2.bb
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
X-List-Received-Date: Fri, 18 Sep 2015 20:21:49 -0000
Content-Type: multipart/alternative; boundary=001a11376e6ef3749b05200b4767

--001a11376e6ef3749b05200b4767
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 14 September 2015 at 17:31, Khem Raj <raj.khem@gmail.com> wrote:

>  .../waffle/{waffle_1.5.1.bb => waffle_1.5.2.bb}    |  8 ++--
>

Sorry but you missed the M3 build, can you backport the fixes to 1.5.1
instead?

Ross

--001a11376e6ef3749b05200b4767
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Khem,</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote">O=
n 14 September 2015 at 17:31, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":432" class=3D"a3s" st=
yle=3D"overflow:hidden">=C2=A0.../<span class=3D"il">waffle</span>/{<a href=
=3D"http://waffle_1.5.1.bb" rel=3D"noreferrer" target=3D"_blank">waffle_1.5=
.1.bb</a> =3D&gt; <a href=3D"http://waffle_1.5.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">waffle_1.5.2.bb</a>}=C2=A0 =C2=A0 |=C2=A0 8 ++--<br></div></=
blockquote></div><br>Sorry but you missed the M3 build, can you backport th=
e fixes to 1.5.1 instead?</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a11376e6ef3749b05200b4767--
