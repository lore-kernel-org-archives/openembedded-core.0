Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id CE54F73BE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 10:39:08 +0000 (UTC)
Received: by qgez102 with SMTP id z102so52543899qge.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 03:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PVfCJ1sLljC1TLjNujp0hvq8l0EWf89teCLKNwfMNiY=;
	b=gvLsvmaESEMuIBgOK5sKJ3d4YSERtKcvThAZP0t+f4yNMxEunqfJyUFSwbDOQi0ege
	VuvmUV+v1BaLo7ntoh5Mm026g90YYuaOu7czFEDZBVKWnsvAyx0Fqpg9wIxuaAhUa8oT
	DYKcSPFKLTnmNgTq/esB2x1RWt7pf1r4wb/7VTT6AFrnedrFZtqXwOopEDfIJXsqQ9rg
	sbsnwfm2HKOtGmNgWo+D4fjgUbaOIeCtOM3DwCABEYa18ON0uA2Ff+qIsm/PMUz/SouI
	Gjn7Oj9mc0uq6WJel7k9T+6pn7UYmClQZdDy/tOU0BEg/jm1ub5P7Eyl0IUrsiOPnj3/
	PTFg==
X-Gm-Message-State: ALoCoQkt3uV0vWeT6FeBKTOVIgptbRdKVj56lUdT0s7+Jg/0c0HHRFgJSyfpEPGbA+JJsTVrzEUg
X-Received: by 10.55.15.30 with SMTP id z30mr131740055qkg.87.1427107149510;
	Mon, 23 Mar 2015 03:39:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 23 Mar 2015 03:38:49 -0700 (PDT)
In-Reply-To: <1427102643-19366-1-git-send-email-george.l.musat@intel.com>
References: <1427102643-19366-1-git-send-email-george.l.musat@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Mar 2015 12:38:49 +0200
Message-ID: <CAJTo0LYhHBzr_pzzLSALuMsPh+WBcPu2KyLh+hfUKddEXBnR7Q@mail.gmail.com>
To: Lucian Musat <george.l.musat@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/selftest: New auto bitbake test for poky tiny.
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
X-List-Received-Date: Mon, 23 Mar 2015 10:39:12 -0000
Content-Type: multipart/alternative; boundary=001a113ad648b40c1e0511f246cd

--001a113ad648b40c1e0511f246cd
Content-Type: text/plain; charset=UTF-8

On 23 March 2015 at 11:24, Lucian Musat <george.l.musat@intel.com> wrote:

> The test builds a poky-tiny image, boots it in background and
> tries to comunicate with it via serial.
>

Would this be better as a test hooked into the usual post-build testimage
support?

Ross

--001a113ad648b40c1e0511f246cd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 March 2015 at 11:24, Lucian Musat <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:george.l.musat@intel.com" target=3D"_blank">george.l.musat@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6b6" cla=
ss=3D"a3s" style=3D"overflow:hidden">The test builds a poky-tiny image, boo=
ts it in background and<br>
tries to comunicate with it via serial.<br></div></blockquote></div><br>Wou=
ld this be better as a test hooked into the usual post-build testimage supp=
ort?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a113ad648b40c1e0511f246cd--
