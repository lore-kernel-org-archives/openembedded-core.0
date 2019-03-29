Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 63DAC7D035
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 15:25:41 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 64so2349405otb.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 08:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JztM6jtsObVO0wiuJg6/WqALXrx8Wu/oYAvr/gbuufo=;
	b=AbkBGmKNwrO8gUDGGlG8TwhDS8OROXU/esvRn6L84WMOxOGRgCZJ+wt1uDs+PfhB49
	q865JnTZucBUP83iP+jJ6/wVjFqfz+lCQ9XAHZ8h/ijYWX816WkAjrqRrdUTCaiT7o2e
	GGdOeyZFxnge+bdtMh6Nhexa2mHdxpBXnNsx/EIAuzIp0m5mR11FjMyWh8iz2ryKUmvq
	Q2V92OsHBNuUHjSxO7UGQq9EOTVsil7CS7Z8dhERhrKu8K+LXGT7JDCzMP8zKN6CYePS
	PiArCEdubtsabW8WsZ47uYaiOxJrCJHiUXB8SAUiwCxbryyjRiJnzDJ9CNhW/SeqvbFU
	ZN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JztM6jtsObVO0wiuJg6/WqALXrx8Wu/oYAvr/gbuufo=;
	b=P2gRd2b7khS/enNwMmS+dfQl3JeaIJ8Dsar9M/4y6zE2yl+qHliou+b32RbFnrNhtl
	pDGu3BNjdZvXuU14em+zYLQAb5qpPABnkWZxR9AyW+Zb/35FXI816Q4lHiLIpTtChSLB
	8yd+JbX13wh3J4+wJ8gVowiQyJHeq5v5ZYfSxcafH6y/ctzRaJSUACFhArNPQJvTxAdl
	se+1MVL4CqzKvhRgWN5rxZ+mHgmDk82ShDy5ofHSPVABEZCgodDMqAneUZBaORCtA9ia
	znPMbwv+/zHai4bDlwcg8xb+q48vrxpWT4RsxEEsvR770lZGGXv0wapZFo3Ii+BoYPJu
	QUDw==
X-Gm-Message-State: APjAAAXjG/e5ludpo7jjg+U6XwZzO5/dzoKRYZvCuEwbDgvApIg4QSyS
	giXov023E/XA5705cd5Uca0knyBDaaFEcUNMm84=
X-Google-Smtp-Source: APXvYqxaUkx+TrSvLJBBcUSF6crMiwBfXIEnuKLNu2ZEC634BUc2NaAiA6aiAqKreSEZXCzTC9XePHFf7MtYtctZuM8=
X-Received: by 2002:a05:6830:1c5:: with SMTP id
	r5mr24257190ota.360.1553873142363; 
	Fri, 29 Mar 2019 08:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190326102919.7348-1-schnitzeltony@gmail.com>
	<CAJTo0La2G+3qUPzXOC6B0Mjwr70ygPuttHuNzfV85GRy3pZYpQ@mail.gmail.com>
	<CANNYZj8Ds1A5o-C7tQspQgWc=7rT1FaMD1ALpPMKmi51pMn5ag@mail.gmail.com>
	<CAJTo0Laq_H-C+-S5zNU+4c5urQ5Y2Hy4oSe63EoQZotnLkFsDw@mail.gmail.com>
	<CALbNGRTJYpi90K4VYtSfTq7kJj1Fukvu_iGGx=D-n6hDrNH7Pg@mail.gmail.com>
	<CAJTo0LYQHcaAg=ikVDWSQjBTgTOwTTRmtpKnNUvbuK0UjRuJWA@mail.gmail.com>
In-Reply-To: <CAJTo0LYQHcaAg=ikVDWSQjBTgTOwTTRmtpKnNUvbuK0UjRuJWA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 Mar 2019 16:25:30 +0100
Message-ID: <CANNYZj9K6oeO22gaLHrzDX=JW6Bw6TjKxPWqT5Rn6Tmmn9T05Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: add librsvg to DEPENDS
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
X-List-Received-Date: Fri, 29 Mar 2019 15:25:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Mar 2019 at 15:34, Burton, Ross <ross.burton@intel.com> wrote:
>
> On Fri, 29 Mar 2019 at 14:29, Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
> > Thought same. Are you sure that does not link - or can you explain how
> > DEPENDs fixed adwaita: If it does not link: How comes that librsvg
> > makes it into adwaita's native sysroot?
>
> I suspect historical about how the sysroot is populated for native
> things, as until very recently RDEPENDS wasn't considered.
>
> (oe-core c62520b63284927e177831c351fafa4d2768cb1f)

There is something I struggle to understand about enabling RDEPENDS for nat=
ive.

RDEPENDS is listing package names, not recipe names. Yet for native
recipes, the package list is empty, as set by the native.bbclass. How
is this supposed to work then?

A reproducer:

add
RDEPENDS_${PN} =3D 'libicuio' to libyaml recipe. (libicuio is a package
from icu recipe)

Then libyaml builds, but libyaml-native fails:

ERROR: Nothing RPROVIDES 'libicuio-native' (but
virtual:native:/home/alexander/development/poky/meta/recipes-support/libyam=
l/libyaml_0.2.2.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'libicuio-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libicuio-native']
ERROR: Required build target 'libyaml-native' has no buildable providers.
Missing or unbuildable dependency chain was: ['libyaml-native',
'libicuio-native']

Should I file a bug?

Alex

