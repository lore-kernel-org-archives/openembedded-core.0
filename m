Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF5076660
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 14:08:22 +0000 (UTC)
Received: by qgt47 with SMTP id 47so175165201qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Oct 2015 07:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=J+yqT0K+N1Zdq1h1u5RUkZSo0wctyQf6slqgH/TeXus=;
	b=g43/SWRs87qiYwnWKbZTZvguNf5isnHS/KpjbrorAWNdsFAZOmVTkDTJv56tkRzlI4
	/dVSs6K2ivl14Lya0OWha3IZHd+jhBsqtCYNnIN6kASuJK1Uop71yuoA8Z5V8tkMZ8io
	RKolPYm1puAcsq6RwUqa3Dg5dbkEoW5Yb4hPv24clo8/zFL4FuXtv/6gEe7tEmpSAfw3
	Jt1wmR3ldxm/TdZav55/gFfCVa4O5KziaTPEngosX0bH6cDipBjXAiIGD4iPfCiHwba8
	yb92sTQmPu1dXcACMLUquxG+eaCaX+FoqSIYYkMBlpPwjFzwZgSxT2LEH1ggCN/ya/I0
	2xIQ==
X-Gm-Message-State: ALoCoQn15PjtelFfnPTD6uD6S8Ibj+FH95tHeotSirR1WASpoUZawUXy8TIcmpWy8Z8ZnPug3xNd
X-Received: by 10.140.32.119 with SMTP id g110mr46529297qgg.15.1444140502903; 
	Tue, 06 Oct 2015 07:08:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 6 Oct 2015 07:08:03 -0700 (PDT)
In-Reply-To: <7d91e0a2a4abbb2e84558856e1c2fa6a@technux.se>
References: <cover.1413452836.git.kai.kang@windriver.com>
	<6958f500cac37c3534a9f58a8bc7b90cc4c94b7f.1413452836.git.kai.kang@windriver.com>
	<b64576e3c49076498b7cfb0cbf9f3963@technux.se>
	<CAJTo0LZjxvCgVLFGVhn0O2PCWTGYFOM46zZ7KG_tqOZgzd9xgQ@mail.gmail.com>
	<fb59210fb91a5209c3d3ce6dbce38ff1@technux.se>
	<CAJTo0LYiW1X+kZi0ra0JUMeywQVu4w492ULyRXcytpYFWiiwng@mail.gmail.com>
	<7d91e0a2a4abbb2e84558856e1c2fa6a@technux.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Oct 2015 15:08:03 +0100
Message-ID: <CAJTo0LYP2bZAA9Svxxi_XQbg5LSS1yXzAbdvC5HFg4dWFU-Nzw@mail.gmail.com>
To: petter@technux.se
Cc: Openembedded core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] readline: Security Advisory - readline - CVE-2014-2524
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
X-List-Received-Date: Tue, 06 Oct 2015 14:08:23 -0000
Content-Type: multipart/alternative; boundary=001a1139bc18aea5c2052170296d

--001a1139bc18aea5c2052170296d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 6 October 2015 at 14:43, Petter Mab=C3=A4cker <petter@technux.se> wrote:

> Great. As you will notice also when formatted properly it will not apply
> due to that readline63-001 and readline63-002 isn't applied so
> 'patchlevel' is incorrect. That makes me wondering what the patching
> strategy is? In my opinion we should consider adding the official
> readline-6.3 patches as well. Should I add a bug report for that or leave
> it as is (depending on the strategy...)?
>

Adding the rest of the patches would have been a sensible thing to do.
Right now, we're frozen as we're about to release 2.0, but a bug or patches
post-release would be much appreciated.

Ross

--001a1139bc18aea5c2052170296d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 October 2015 at 14:43, Petter Mab=C3=A4cker <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:petter@technux.se" target=3D"_blank">petter@technux.se</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><p>Great. As you will not=
ice also when formatted properly it will not apply due to that readline63-0=
01 and readline63-002 isn&#39;t applied so=C2=A0 &#39;patchlevel&#39; is in=
correct. That makes me wondering what the patching strategy is? In my opini=
on we should consider adding the official readline-6.3 patches as well. Sho=
uld I add a bug report for that or leave it as is (depending on the strateg=
y...)?</p>
<div class=3D"gmail_extra"></div></blockquote></div><br>Adding the rest of =
the patches would have been a sensible thing to do.=C2=A0 Right now, we&#39=
;re frozen as we&#39;re about to release 2.0, but a bug or patches post-rel=
ease would be much appreciated.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--001a1139bc18aea5c2052170296d--
