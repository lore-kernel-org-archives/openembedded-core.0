Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id E19D67626F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:28:58 +0000 (UTC)
Received: by qgeh16 with SMTP id h16so23676514qge.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 06:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gKW59xj0KPtFxLT5EcCew38O2gBfw84JuNyWBBgy4g0=;
	b=N+2swdjP7iWPiVaTwi6JW82zW/BTwe7YEv0cAsRIre4ML6GaJfeq/BORD0RZcJ4Bhl
	3Q+VHuXa1s0DFZtddLxIBafjz7U33wz6vSx8d1BX6Wc10ioxkDtN2q+UdjKLmCVN63+0
	tr7oxrUAHbnqiKmcXYNfcd+1L8PJElhHhm0/jwJGJTeRD0J71ZdRW7XrOeUGWtL2ketx
	aS2nQSG3OcbYMwpvMNXu+UZsGYjw+xk2aJxGNRpd+nrj21cFHv4CCbwqAz0QZw1HVtG2
	tDIQ6ly7FcSA093ZGl2fvOA+nrSjdKHfnkHk3giD6tDQ/I0YGSZaoXdM6XHucm7lWKwj
	jbnQ==
X-Gm-Message-State: ALoCoQlxq6s2DvSjdwSdP4a2taI4guRjApTZXUI10KTnNy/IuPLfVIPCjQlZIDJYEdp8+EVAWJbk
X-Received: by 10.140.147.137 with SMTP id 131mr5562250qht.17.1438262938532;
	Thu, 30 Jul 2015 06:28:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Thu, 30 Jul 2015 06:28:39 -0700 (PDT)
In-Reply-To: <1438199407-19848-1-git-send-email-humberto.ibarra.lopez@intel.com>
References: <1438199407-19848-1-git-send-email-humberto.ibarra.lopez@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Jul 2015 14:28:39 +0100
Message-ID: <CAJTo0LYX2-=PqSBHcj0OTL+TpPa_Es56ZhDeeN8n=z+8VJdw-w@mail.gmail.com>
To: humberto.ibarra.lopez@intel.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [scripts][PATCH] yocto-layer: Stops duplication of "meta-" prefix
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
X-List-Received-Date: Thu, 30 Jul 2015 13:29:01 -0000
Content-Type: multipart/alternative; boundary=001a113564648baa90051c17affe

--001a113564648baa90051c17affe
Content-Type: text/plain; charset=UTF-8

On 29 July 2015 at 20:50, <humberto.ibarra.lopez@intel.com> wrote:

> The yocto-layer script puts an extra "meta-" prefix to the given layer
> name even when the prefix is already there. This fix avoids
> duplicating the prefix in these situations.
>

If the scripts expects the layer name to not have a meta- prefix, should it
also strip a prefix if its present before passing it to
yocto_layer_create()?

Ross

--001a113564648baa90051c17affe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 July 2015 at 20:50,  <span dir=3D"ltr">&lt;<a href=3D"mailto:humberto=
.ibarra.lopez@intel.com" target=3D"_blank">humberto.ibarra.lopez@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":ic" cla=
ss=3D"a3s" style=3D"overflow:hidden">The yocto-layer script puts an extra &=
quot;meta-&quot; prefix to the given layer<br>
name even when the prefix is already there. This fix avoids<br>
duplicating the prefix in these situations.</div></blockquote><div><br></di=
v><div>If the scripts expects the layer name to not have a meta- prefix, sh=
ould it also strip a prefix if its present before passing it to yocto_layer=
_create()?</div><div><br></div><div>Ross</div></div></div></div>

--001a113564648baa90051c17affe--
