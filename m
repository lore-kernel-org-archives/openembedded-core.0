Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 870017653B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 16:14:06 +0000 (UTC)
Received: by qgev79 with SMTP id v79so72993235qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 09:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qcpWKy9wN1KB6/kkFa157/crdcFFOfNohT0kDPTePa8=;
	b=FaEqiryLsu4nOJ5XO6bgFVqedXVltK7zrbMX6u8nW0a8n+OZBtLNirq5YTj9y0Pdgu
	40IlsgU5wpf5ClMlCmnsVhDyad5lWRsJWVh4Pv3M0DQQ/LxNlx2MlTgXFxsedLm9MSJ2
	HzXNwvU6IX85COgu6qzg1limbAqRJBOiA4U3NIa1hCqvzAvGKHUryYGiPCt9MJmBSEV7
	6Ti6eEDusAk2InTiDr6nI6/vGhBDWZlZdX93YMCSHf1FBVciKhy39Mxsz42tcu+pO+ZS
	RqwAFAGt7EFedIuCjiibk1ltFOSIl7KMn/Av1Ta5bRTHLAumi1bgX++jaeL3FqdU7dUK
	g3Xg==
X-Gm-Message-State: ALoCoQlRUSo6bRSYC+w7GvujfLFzjkzYbIz/7pLBwFEtWOofILlcUskHF7P42HROvVz+nfSmf+Py
X-Received: by 10.140.232.150 with SMTP id d144mr7470805qhc.17.1443197646482; 
	Fri, 25 Sep 2015 09:14:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 25 Sep 2015 09:13:47 -0700 (PDT)
In-Reply-To: <560570E8.7040808@opendreambox.org>
References: <aa28a5439d5375728b83962d6814045053f9fdd6.1443179044.git.jussi.kukkonen@intel.com>
	<6aa4eaa74c5e4d96f92c0b6bd022deb13a2e8be9.1443179044.git.jussi.kukkonen@intel.com>
	<560570E8.7040808@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Sep 2015 17:13:47 +0100
Message-ID: <CAJTo0LZTAwNEiXwHU=Js3-Vv3rSdj05u9-BW3_PFdHCk6EP9VQ@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] connman: Don't use a blanket "allow" D-Bus policy
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
X-List-Received-Date: Fri, 25 Sep 2015 16:14:06 -0000
Content-Type: multipart/alternative; boundary=001a113548520f5e92052094a375

--001a113548520f5e92052094a375
Content-Type: text/plain; charset=UTF-8

On 25 September 2015 at 17:06, Andreas Oberritter <obi@opendreambox.org>
wrote:

> Here you can see that it really is poky's distro policy that slipped
> into OE-Core. How about removing ROOTLESS_X and xuser from OE-Core and
> putting it into a layer that actually sets the variable?
>

There's nothing about Poky here.  meta-intel used to set it for several
BSPs, in the consolidation that happened recently that obviously got lost.
Part of me does want to get ROOTLESS_X removed and have it done properly,
but it's far too late for that.

Ross

--001a113548520f5e92052094a375
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 September 2015 at 17:06, Andreas Oberritter <span dir=3D"ltr">&lt;<a =
href=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3i7" c=
lass=3D"a3s" style=3D"overflow:hidden">Here you can see that it really is p=
oky&#39;s distro policy that slipped<br>
into OE-Core. How about removing ROOTLESS_X and xuser from OE-Core and<br>
putting it into a layer that actually sets the variable?<br></div></blockqu=
ote></div><div class=3D"gmail_extra"><br></div>There&#39;s nothing about Po=
ky here. =C2=A0meta-intel used to set it for several BSPs, in the consolida=
tion that happened recently that obviously got lost.=C2=A0 Part of me does =
want to get ROOTLESS_X removed and have it done properly, but it&#39;s far =
too late for that.</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--001a113548520f5e92052094a375--
