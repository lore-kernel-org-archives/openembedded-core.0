Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 07C17605BE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 16:16:49 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id n21so350999816qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 08:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t4yPNTYFX2d0LieZeSF5ApF6pU4j23u6WHNX+vZu9Wg=;
	b=wy+8XvC35ugwFa7XBEvHUs6QJCu/P+mSmKprK5SwWNV6Lj7qMiNRs7vV9q4fQy+t7b
	omPZmnOrBmvjTu6hE2ik7D3q2rDpN9MWyXE4JCQoUrmd4OdoIpPXhlDOCZv/8/N3NyEA
	urkBnNle9NTBhlKsVn8tgYq+EWqktNNMsgvDicx4ZFZg7qgejsztErVz/hgMK7C1obLM
	UuptwLddihd7zlKZ92R/01dKRZSvRskx0c7+VdjClukpG+45o/ktqiCe4O0P5GwcfspD
	BFUBYPO9O4T+ZWYFjilS9DWj4wKpgkgsxj0o5ahioR33sDHDZk4t7Nuk7UIjLYOQ+EnZ
	g4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t4yPNTYFX2d0LieZeSF5ApF6pU4j23u6WHNX+vZu9Wg=;
	b=W6i6BMpXAmNC8rq3iDHKR6rdLKVHozLt4itngucjNZM11MbFeFPgy32GuQqL63kS2J
	2isK6WSts5AGituwDN3vj3q4hX6IM9uPNBlNEB2ACPjS5FxKGlAY4Tzu23Yu4pqNbN90
	pMAlGr0DuLRB1JLxdc8PRcndncTD+WeRaBrOvKL3pos91SWxEYXjC4goCNvPy5yRW2aO
	/zfby63Q3JB7gFTeze2Cfl6oycJ4bsZMMUZXfM5UeRP5yHe0S0NKNtdEUca+X9PG7GPm
	Iv8esOQMmWS7fASj6nJI0sVfmkbsvIhXPy/Q40QlTIfn83WN9+yHySzlPdMtLuODgyvs
	pTtQ==
X-Gm-Message-State: AKaTC03DTxHJD6vEPgNubhhJwZ5xjjrgVGA6hyCKoJK0ZTF/ugA+F6V2D+lw/oLiix9uS+RJEyF9st+6mkVwHB+a
X-Received: by 10.55.31.157 with SMTP id n29mr48574212qkh.221.1480954610940;
	Mon, 05 Dec 2016 08:16:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 5 Dec 2016 08:16:30 -0800 (PST)
In-Reply-To: <1480508551-26893-1-git-send-email-obi@opendreambox.org>
References: <1480508551-26893-1-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Dec 2016 16:16:30 +0000
Message-ID: <CAJTo0Lb-snEZi_qqFW1_onvjK+_tJz47tDJtbAC4G3fum=DGmA@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] connman: Simplify and fix packaging of VPN plug-ins
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
X-List-Received-Date: Mon, 05 Dec 2016 16:16:51 -0000
Content-Type: multipart/alternative; boundary=001a1147f22883ba670542eb9de7

--001a1147f22883ba670542eb9de7
Content-Type: text/plain; charset=UTF-8

On 30 November 2016 at 12:22, Andreas Oberritter <obi@opendreambox.org>
wrote:

> - Use simple static packaging.
> - Move VPN runtime dependencies from connman to the individual plug-ins.
> - Create a connmann-ppp package containing libppp-plugin.so, which is
>   a shared library needed by l2tp and pptp plug-ins.
> - Let connman suggest VPN packages instead of recommending them, so they
>   don't get installed by default.
> - Remove unknown configure options (--with-pptp --with-l2tp)
>

Lines like this break with just oe-core:

+RDEPENDS_${PN}-plugin-vpn-l2tp = "${PN}-vpn ${PN}-ppp xl2tpd"

ERROR: Nothing RPROVIDES 'vpnc' (but
/home/ross/Yocto/poky/meta/recipes-connectivity/connman/connman_1.33.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'vpnc' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['vpnc']
ERROR: Required build target 'connman' has no buildable providers.
Missing or unbuildable dependency chain was: ['connman', 'vpnc']

(repeat for all the other RDEPENDS that are not in oe-core).

Ross

--001a1147f22883ba670542eb9de7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 November 2016 at 12:22, Andreas Oberritter <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:2lp" class=3D"g=
mail-a3s gmail-aXjCH gmail-m158b536ee4095b43">- Use simple static packaging=
.<br>
- Move VPN runtime dependencies from connman to the individual plug-ins.<br=
>
- Create a connmann-ppp package containing libppp-plugin.so, which is<br>
=C2=A0 a shared library needed by l2tp and pptp plug-ins.<br>
- Let connman suggest VPN packages instead of recommending them, so they<br=
>
=C2=A0 don&#39;t get installed by default.<br>
- Remove unknown configure options (--with-pptp --with-l2tp)</div></blockqu=
ote></div><div class=3D"gmail_extra"><br></div>Lines like this break with j=
ust oe-core:</div><div class=3D"gmail_extra"><br>+RDEPENDS_${PN}-plugin-vpn=
-l2tp =3D &quot;${PN}-vpn ${PN}-ppp xl2tpd&quot;<br></div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">E=
RROR: Nothing RPROVIDES &#39;vpnc&#39; (but /home/ross/Yocto/poky/meta/reci=
pes-connectivity/connman/<a href=3D"http://connman_1.33.bb">connman_1.33.bb=
</a> RDEPENDS on or otherwise requires it)</div><div class=3D"gmail_extra">=
NOTE: Runtime target &#39;vpnc&#39; is unbuildable, removing...</div><div c=
lass=3D"gmail_extra">Missing or unbuildable dependency chain was: [&#39;vpn=
c&#39;]</div><div class=3D"gmail_extra">ERROR: Required build target &#39;c=
onnman&#39; has no buildable providers.</div><div class=3D"gmail_extra">Mis=
sing or unbuildable dependency chain was: [&#39;connman&#39;, &#39;vpnc&#39=
;]</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(re=
peat for all the other RDEPENDS that are not in oe-core).</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div=
>

--001a1147f22883ba670542eb9de7--
