Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id DB35E733AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 16:53:35 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id i13so13234067qae.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:53:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FWs/GZ+8FABYIYBiCrCiwv4Q0xGgMWNH4aItD2a1qx8=;
	b=T4rj7oMVBImZUkIDbdAi6J32IOTaVCPvMxXobmaNQID4jGVQdrXCjNqWwqJYprDZlT
	ewOMbT5lWqJxAp/DL5yezsXHDigzck05h0PDTz34E0uzaikE9eu3HtfA3eLaZwpbGv9x
	3++vtA5jTpe7H/Oj2OHkOEk9w1RKO4PbY/Eybw4ZK3ya773hGSa9GQV1w9HKnOEVmjqT
	wwV+YA0dKp/qXRElKcZN/pVL3XiCP/uGWZ04W7liLWbiUoU75YSbFpGlLVGjL/e6Dn2Q
	jgjseg4yqsm6a3fBIfc5fcA8bYfLyy9gHElD9MJossI/1QFgnqHta/u7jtJsUL0d09ET
	k+lQ==
X-Gm-Message-State: ALoCoQm/yF/9ojGPPHGRa7UWCnTkJZbiAcC9aeTPjoxBEs1SVmSp3oYAUAwDmWK9KJjhaAxDoi1g
X-Received: by 10.229.190.65 with SMTP id dh1mr12389259qcb.28.1423846416705;
	Fri, 13 Feb 2015 08:53:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 13 Feb 2015 08:53:16 -0800 (PST)
In-Reply-To: <1423746097-4198-1-git-send-email-oleg.zhurakivskyy@intel.com>
References: <1423746097-4198-1-git-send-email-oleg.zhurakivskyy@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Feb 2015 16:53:16 +0000
Message-ID: <CAJTo0LasPzPxnq4Sv9CdR_OXuPxZiPhJNd2z7PxWjwxH50Mv-g@mail.gmail.com>
To: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Add libedit, neardal recipes
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
X-List-Received-Date: Fri, 13 Feb 2015 16:53:39 -0000
Content-Type: multipart/alternative; boundary=001a11339bece24076050efb139d

--001a11339bece24076050efb139d
Content-Type: text/plain; charset=UTF-8

Hi Oleg,

On 12 February 2015 at 13:01, Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com
> wrote:

> - libedit: BSD licensed command line editor library.
> - neardal: neard abstraction library.
>

As nothing else in oe-core needs there right now, I'd suggest that neardal
should be in meta-connectivity and libedit is already in meta-oe (
https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/recipes-devtools/libedit/libedit_20130712-3.1.bb)
alebit an older release so an upgrade patch would be welcome.

Ross

--001a11339bece24076050efb139d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Oleg,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 12 February 2015 at 13:01, Oleg=
 Zhurakivskyy <span dir=3D"ltr">&lt;<a href=3D"mailto:oleg.zhurakivskyy@int=
el.com" target=3D"_blank">oleg.zhurakivskyy@intel.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:sol=
id;padding-left:1ex"><div style=3D"overflow:hidden">- libedit: BSD licensed=
 command line editor library.<br>
- neardal: neard abstraction library.</div></blockquote></div><br>As nothin=
g else in oe-core needs there right now, I&#39;d suggest that neardal shoul=
d be in meta-connectivity and libedit is already in meta-oe (<a href=3D"htt=
ps://github.com/openembedded/meta-openembedded/blob/master/meta-oe/recipes-=
devtools/libedit/libedit_20130712-3.1.bb" target=3D"_blank">https://github.=
com/openembedded/meta-openembedded/blob/master/meta-oe/recipes-devtools/lib=
edit/libedit_20130712-3.1.bb</a>) alebit an older release so an upgrade pat=
ch would be welcome.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11339bece24076050efb139d--
