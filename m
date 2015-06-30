Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 24FE472D64
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 15:39:38 +0000 (UTC)
Received: by qget71 with SMTP id t71so5702717qge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 08:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9cLzBdnAS6DkkJDJFpVLrU1gJQdINOXapSaSvmy6+l8=;
	b=YSk0WDP9G2LstIm/aYM8uwQIIQiy2BSBqsXyTcC727d8BQfZ5WePgT2S6vdfzS6UDI
	KxlOho81DY8cHUEC2xz5CyLVY1S98JW5gqpobG1UySxSH/OdlpDhuJLu+My95H47mwzD
	MeY8VIqpeutV/rfK1jg4F4uIsDrX/5JelOq7ScaJehWCEtv3xPLpnFwBpy8RE4NjQSQl
	oKd2HoghLq6qskq9ao6tC/RNeYMVV6KZb3XCgOBw8KVsWJscJ7DtTsYq+EDCb+Wtn8SX
	AVxlXLMz3CJfy/WbQZeH6l51NMy9cV3yNGBd54bTl0euQedO+Ern+EgwEQnbPJoT9c8G
	cuKA==
X-Gm-Message-State: ALoCoQkzyoR+KgXXZYOjPWafLiRkDH89GPdfA1AbrNNrPxeruo/DwA3VoTefCsVwa+K0fOAt5aqQ
X-Received: by 10.140.43.199 with SMTP id e65mr26634066qga.80.1435678778692;
	Tue, 30 Jun 2015 08:39:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 30 Jun 2015 08:39:19 -0700 (PDT)
In-Reply-To: <f695a9f8ea4c35b040d98d2793153fba91771ec5.1434464336.git.jussi.kukkonen@intel.com>
References: <cover.1434464336.git.jussi.kukkonen@intel.com>
	<f695a9f8ea4c35b040d98d2793153fba91771ec5.1434464336.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jun 2015 16:39:19 +0100
Message-ID: <CAJTo0LaNMDtNSrOad5=Vd6ZqJ_MCiT0oez7e-3zmn4BjWfkVpw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 5/6] sato-icon-theme: Inherit Adwaita, not gnome-icon-theme
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
X-List-Received-Date: Tue, 30 Jun 2015 15:39:41 -0000
Content-Type: multipart/alternative; boundary=001a113a9baa9daa840519be03b5

--001a113a9baa9daa840519be03b5
Content-Type: text/plain; charset=UTF-8

On 16 June 2015 at 15:22, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> -+Inherits=gnome
> ++Inherits=Adwaita
>

Doesn't this also need a RDEPENDS on adwaita-icon-theme?

Ross

--001a113a9baa9daa840519be03b5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 June 2015 at 15:22, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2uw" cl=
ass=3D"a3s" style=3D"overflow:hidden">-+Inherits=3Dgnome<br>
++Inherits=3DAdwaita</div></blockquote></div><br>Doesn&#39;t this also need=
 a RDEPENDS on adwaita-icon-theme?</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a113a9baa9daa840519be03b5--
