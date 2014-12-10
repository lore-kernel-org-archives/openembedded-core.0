Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8E9DC72579
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 11:34:09 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id m20so1944437qcx.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 03:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0XeieIk+2dKb/VLyeuE0YN/uoUbzKn/MmA82nKzz9Iw=;
	b=QR26ERIMt220NVI4gPORHnYjvWiq+CUOHlUWtqTsBLWuVTNSmXiIgaLRF3N81KEWn9
	O+CNZ1lU9M85Ef+0ctirqE1cPYZ+UwzAmYDDkqLaYwBWTRnBbBlhBe6/0axel4JZiSOl
	0IkM33TtWa3+4tBAvpQ1gyhBj2nToEWCN/rmtsM3HE9FpjKgLxDu2B7yFt85HZb2JCd8
	GyfvrCcYa34/6nF+tvV28xnbB9RPr+V47Af80liglx8yhTHCGyCxmnkVnY/v243iB+mj
	et83wUgg6Sy+gNWdU8y8737yEn50GJ74pAirSYO9c1MUNOG8JEmtbR2MWnvPuNblc1me
	rMXQ==
X-Gm-Message-State: ALoCoQlQrqTBFZdsk5bIuwcTA24hR2S7lfbLoiKCTA8K0M8Ys6bnKeqgBQb/Bo29HDmvm65ioxwX
X-Received: by 10.140.40.209 with SMTP id x75mr6731482qgx.80.1418211250137;
	Wed, 10 Dec 2014 03:34:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 10 Dec 2014 03:33:48 -0800 (PST)
In-Reply-To: <CAP71Wjx+daT278dn2-JF-Epn+WJ8FcE55NMLRXV2dJNSP9wawA@mail.gmail.com>
References: <cover.1417734782.git.anibal.limon@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C7CF45250@ORSMSX103.amr.corp.intel.com>
	<54873BE9.9030905@linux.intel.com>
	<CAJTo0LbVEYT9=fo_gKAk0wRSg1H9_-vE5dd5N-SMrMXM38Lbvw@mail.gmail.com>
	<CAP71Wjx+daT278dn2-JF-Epn+WJ8FcE55NMLRXV2dJNSP9wawA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Dec 2014 11:33:48 +0000
Message-ID: <CAJTo0LZ8jovfFTrJr0MNO5UBaOPFaX-KqMWyBCNi=X3PXX9-iQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 0/3] Upgrades for comply Intel Graphics Stack Release 2014Q3
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
X-List-Received-Date: Wed, 10 Dec 2014 11:34:17 -0000
Content-Type: multipart/alternative; boundary=001a11c12836c806460509db0960

--001a11c12836c806460509db0960
Content-Type: text/plain; charset=UTF-8

On 10 December 2014 at 08:08, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> are you using the oe-core piglit recipe for testing? i didn't realize
> we had such recipe.. just want to make sure that the one we have is
> ok, then I can run it on my hw as well.
>

Yes, the piglit in oe-core.  It needs updating to a newer release at some
point, but as upstream believes you run it from a source tree upgrading
isn't trivial.

Ross

--001a11c12836c806460509db0960
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 December 2014 at 08:08, Nicolas Dechesne <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne=
@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1fi" class=3D"a3s" style=3D"overflow:hidden">are you using the oe-core=
 piglit recipe for testing? i didn&#39;t realize<br>
we had such recipe.. just want to make sure that the one we have is<br>
ok, then I can run it on my hw as well.<br></div></blockquote></div><br>Yes=
, the piglit in oe-core.=C2=A0 It needs updating to a newer release at some=
 point, but as upstream believes you run it from a source tree upgrading is=
n&#39;t trivial.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a11c12836c806460509db0960--
