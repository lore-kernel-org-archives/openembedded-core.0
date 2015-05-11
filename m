Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 069616013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 11:23:07 +0000 (UTC)
Received: by qgdy78 with SMTP id y78so65728028qgd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 04:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=O1D3nC1R2U8zSblaUaHrNMX+io48lY2CnQgpifsrGsg=;
	b=m50gJz5cFEZwOFUR/TUiuck0TaCMiJEm7+7ajWIClsC3wEhJzG+rB3/HwsKN0l1avN
	t4xU7JTDdPQg0nD7ejwWr36e8lnIUqw58JjTxiXfxB5A/y0T9IlQMfDQEgwj84j8oRl3
	gP3JcWCeS+7YR0PpvJ6E2AqljD8yTpJ/Q5ZNbFawVg5KQLQ/K7ndBOilNAEmg8D99mwl
	4ThDVsQER9kUtyBTaLQJr0hDu4kztvBGAREqRFgGwr5GEphFo1O4Tpp19n2rNFmHCHLQ
	fEU+JHYPSVykjoo71+Jkd+mftyJWsvesVjiS8TyIydkmnOR0Fu3YYvcIe8y+XJNyycuO
	fCwA==
X-Gm-Message-State: ALoCoQmub6eGBl/frraAjzb4LXUouIylxgb2ZHcHkiewzMGjsWVo8MOanXwmQLOcbBd/qRZPMidi
X-Received: by 10.229.24.4 with SMTP id t4mr13224199qcb.12.1431343388626; Mon,
	11 May 2015 04:23:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 11 May 2015 04:22:48 -0700 (PDT)
In-Reply-To: <d81cfb100f102438213c54a72c1f412323a80dd2.1431333085.git.liezhi.yang@windriver.com>
References: <cover.1431333085.git.liezhi.yang@windriver.com>
	<d81cfb100f102438213c54a72c1f412323a80dd2.1431333085.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 May 2015 12:22:48 +0100
Message-ID: <CAJTo0LZ40TNQ4NiFKChiYikMsyKN3hUyZ9GjhezVeEtSQqSeVQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] xserver-xorg: disable xwayland
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
X-List-Received-Date: Mon, 11 May 2015 11:23:08 -0000
Content-Type: multipart/alternative; boundary=001a1133c12e3b295a0515cc9ab1

--001a1133c12e3b295a0515cc9ab1
Content-Type: text/plain; charset=UTF-8

On 11 May 2015 at 09:32, Robert Yang <liezhi.yang@windriver.com> wrote:

> The default is auto, we can disable it rather than depend on wayland or
> add a PACKAGECONFIG since they are two display servers.
>
> Fixed do_compile error:
> hw/xwayland/xwayland.h:36:28: fatal error: wayland-client.h: No such file
> or directory
>  #include <wayland-client.h>
>

And XWayland is the migration path from a pure X world to a pure Wayland
world.  Please add this as a PACKAGECONFIG.

Ross

--001a1133c12e3b295a0515cc9ab1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 May 2015 at 09:32, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":mm" class=
=3D"a3s" style=3D"overflow:hidden">The default is auto, we can disable it r=
ather than depend on wayland or<br>
add a PACKAGECONFIG since they are two display servers.<br>
<br>
Fixed do_compile error:<br>
hw/xwayland/xwayland.h:36:28: fatal error: wayland-client.h: No such file o=
r directory<br>
=C2=A0#include &lt;wayland-client.h&gt;</div></blockquote><div><br></div><d=
iv>And XWayland is the migration path from a pure X world to a pure Wayland=
 world.=C2=A0 Please add this as a PACKAGECONFIG.</div><div><br>Ross=C2=A0<=
/div></div></div></div>

--001a1133c12e3b295a0515cc9ab1--
