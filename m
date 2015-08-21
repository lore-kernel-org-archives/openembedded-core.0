Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3671A60557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 12:57:46 +0000 (UTC)
Received: by qkbm65 with SMTP id m65so31017445qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 05:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=efQRcqKEZWKLiCce8WFxqAQe9g/ZWnIAmN15tVs+fwI=;
	b=W1kJx95OE27iJchRZ6RCuChI7vtgMp10Iim/gOexnzLC+Zy5ImDCuy8Dlwl+7GiXBR
	7efxp55Ko4XEbLbT706B/fTkclnfTKVQFUUP+IdDY4eHqNWjCBJKqBCKzcrkvo2BE2Nc
	Y53Jc+2BJZXeSyU2yTbcrCLPcsJQDKPqJDPxVa4unXyQpfv/XnodMgdcgrIERo9g5X9N
	O1nC+ZGiFlEqr+UL2zbcFTbAVyKz8F3FWJRltTRTw4bk3c7Fmll23KAvvWKhAGbY3mBn
	3CmULqOfoOJmzduXKtbeTjuiGYrFvjrqTPQQCWFl6uw+dDVLOY+4igX52mNA0S7OCEha
	7DYA==
X-Gm-Message-State: ALoCoQn3sCE5R6PK9aSbJEHPv+FR4S5SiFZJ9hHAQbnddeyhKJEQFZCSLd5KpH6e1qGPN427E3gm
X-Received: by 10.55.53.193 with SMTP id c184mr16880489qka.62.1440161866307;
	Fri, 21 Aug 2015 05:57:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Fri, 21 Aug 2015 05:57:26 -0700 (PDT)
In-Reply-To: <1440157069-9790-1-git-send-email-costin.c.constantin@intel.com>
References: <1440157069-9790-1-git-send-email-costin.c.constantin@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Aug 2015 13:57:26 +0100
Message-ID: <CAJTo0LZ0_Dp4Y_8YmY37qcTSy=YZGg58FxuHEixcLr33zDmORw@mail.gmail.com>
To: Costin Constantin <costin.c.constantin@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/oetest.py: add better pkg. search for hasPackage()
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
X-List-Received-Date: Fri, 21 Aug 2015 12:57:47 -0000
Content-Type: multipart/alternative; boundary=001a11476f1475ee66051dd1d02b

--001a11476f1475ee66051dd1d02b
Content-Type: text/plain; charset=UTF-8

On 21 August 2015 at 12:37, Costin Constantin <costin.c.constantin@intel.com
> wrote:

> +        for item in oeTest.tc.pkgmanifest.split('\n'):
> +            if re.match(pkg, item):
> +                return True
> +                break
> +        else:
> +            return False
>

I just had to look up the for/else syntax as I'd never seen it before.
Whilst this works, the fact that the break statement is never executed (as
it returns beforehand) makes it a bit odd.  Personally I'd have done:

for item in ...:
  if re.match():
    return True
return False

Ross

--001a11476f1475ee66051dd1d02b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 August 2015 at 12:37, Costin Constantin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:costin.c.constantin@intel.com" target=3D"_blank">costin.c.consta=
ntin@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":4oh" class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 for item in oeTest.tc.pkgmanifest.split(&#39;\n&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if re.match(pkg, item):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False</div></blockquote><=
/div><br>I just had to look up the for/else syntax as I&#39;d never seen it=
 before.=C2=A0 Whilst this works, the fact that the break statement is neve=
r executed (as it returns beforehand) makes it a bit odd.=C2=A0 Personally =
I&#39;d have done:</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">for item in ...:</div><div class=3D"gmail_extra">=C2=A0 if re.=
match():</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 return True</div><di=
v class=3D"gmail_extra">return False</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Ross</div></div>

--001a11476f1475ee66051dd1d02b--
