Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8755070A84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 11:00:02 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id m20so3451163qcx.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 04:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dbkSyaOqibCsgcIpgqEJRh6taepp6ENBCWcmWOEpY5g=;
	b=BLCovYZAo5n1zQqQa8UgVyAnLIMOXuws1gP4CJHJeE3xrDx5Icdo1G7u9QmLYgd1e6
	XtzY7WwLR2BFnEchMvmOBDbjkZlm4xqiVwxMENY+npych/2TbSHpmjKxMgb0el7i7orS
	g/XmOIMxkRpsoBUDP/ki126t9/tqJVDi2tQbr7eOvOlR7yVHrXANyOAXHLLw+TDfNxc5
	/U68+U9KgSVyZs4+kT8+K9BLZy2Q7aMgHhLZleQ0q7kMGMd28NotzqrAfDzQqTS46aRc
	uWLRT83tAQAtME5jaL7cdWSwbide5OCqm29y61izAzCDG2X+bTigFsIQG2QjMO/MXcMY
	qjDQ==
X-Gm-Message-State: ALoCoQnwx1wrKg8oFLFWeiWRH7Njj1Oct/Q/iipxe5Xudfcd39pdcBqRjWJAks3fwSLzQql4bWYO
X-Received: by 10.140.109.244 with SMTP id l107mr8415770qgf.80.1414407603284; 
	Mon, 27 Oct 2014 04:00:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.92.179 with HTTP; Mon, 27 Oct 2014 03:59:40 -0700 (PDT)
In-Reply-To: <1414336254-22707-1-git-send-email-koen@dominion.thruhere.net>
References: <1414336254-22707-1-git-send-email-koen@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Oct 2014 10:59:40 +0000
Message-ID: <CAJTo0LagpRtefUvm_rrOcEyj6hTZRkySk9fVzcYGm+UFFYe_rQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base bbclass: add support for tar.lz
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
X-List-Received-Date: Mon, 27 Oct 2014 11:00:06 -0000
Content-Type: multipart/alternative; boundary=001a113b7e50c2fc1e0506656efa

--001a113b7e50c2fc1e0506656efa
Content-Type: text/plain; charset=UTF-8

On 26 October 2014 15:10, Koen Kooi <koen@dominion.thruhere.net> wrote:

> +    # Not endswith because of "*.patch.lz;patch=1". Need
> bb.fetch.decodeurl in future
> +    if '.lz' in srcuri:
>

I think it's time to implement that todo, as oe-core now fails to build:

ERROR: Nothing PROVIDES 'lzip-native'. Close matches:
  zip-native
  lzop-native
  gzip-native
ERROR: Nothing RPROVIDES 'lzop-dev' (but
/home/ross/Yocto/poky/meta/recipes-support/lzop/lzop_1.03.bb RDEPENDS on or
otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'lzop-dev'
NOTE: Runtime target 'lzop-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['lzop-dev']
ERROR: Nothing RPROVIDES 'lzop' (but
/home/ross/Yocto/poky/meta/recipes-support/lzop/lzop_1.03.bb RDEPENDS on or
otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'lzop'
NOTE: Runtime target 'lzop' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['lzop']

Because:

SRC_URI = "http://www.lzop.org/download/${BP}.tar.gz \

Ross

--001a113b7e50c2fc1e0506656efa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 October 2014 15:10, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:koen@dominion.thruhere.net" target=3D"_blank">koen@dominion.thruhere.net</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D":hl" class=3D"" style=
=3D"overflow:hidden">+=C2=A0 =C2=A0 # Not endswith because of &quot;*.patch=
.lz;patch=3D1&quot;. Need bb.fetch.decodeurl in future<br>
+=C2=A0 =C2=A0 if &#39;.lz&#39; in srcuri:<br></div></blockquote><div><br><=
/div><div>I think it&#39;s time to implement that todo, as oe-core now fail=
s to build:</div><div><br></div><div>ERROR: Nothing PROVIDES &#39;lzip-nati=
ve&#39;. Close matches:</div><div>=C2=A0 zip-native</div><div>=C2=A0 lzop-n=
ative</div><div>=C2=A0 gzip-native</div><div>ERROR: Nothing RPROVIDES &#39;=
lzop-dev&#39; (but /home/ross/Yocto/poky/meta/recipes-support/lzop/<a href=
=3D"http://lzop_1.03.bb">lzop_1.03.bb</a> RDEPENDS on or otherwise requires=
 it)</div><div>ERROR: No eligible RPROVIDERs exist for &#39;lzop-dev&#39;</=
div><div>NOTE: Runtime target &#39;lzop-dev&#39; is unbuildable, removing..=
.</div><div>Missing or unbuildable dependency chain was: [&#39;lzop-dev&#39=
;]</div><div>ERROR: Nothing RPROVIDES &#39;lzop&#39; (but /home/ross/Yocto/=
poky/meta/recipes-support/lzop/<a href=3D"http://lzop_1.03.bb">lzop_1.03.bb=
</a> RDEPENDS on or otherwise requires it)</div><div>ERROR: No eligible RPR=
OVIDERs exist for &#39;lzop&#39;</div><div>NOTE: Runtime target &#39;lzop&#=
39; is unbuildable, removing...</div><div>Missing or unbuildable dependency=
 chain was: [&#39;lzop&#39;]=C2=A0</div><div><br></div><div>Because:</div><=
div><br></div><div>SRC_URI =3D &quot;<a href=3D"http://www.lzop.org/downloa=
d/${BP}.tar.gz">http://www.lzop.org/download/${BP}.tar.gz</a> \<br></div><d=
iv><br></div><div>Ross</div></div></div></div>

--001a113b7e50c2fc1e0506656efa--
