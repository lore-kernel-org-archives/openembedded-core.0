Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id C28AD73CBF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Apr 2015 11:10:44 +0000 (UTC)
Received: by qgh3 with SMTP id 3so66167551qgh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Apr 2015 04:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hFIH5LqA4W8tpEXq6YTq4lik+hSCeV62keraDK/jog0=;
	b=MFu9oMrDCS1ZH1XxY8mxU8k3jtkyutUdECDsD2KGCb4WVd+biDABzrHgfviiAX6i68
	uHPfYQYhCxU5IszYMFt1pfXTfsXXk60zpZSSsF4+T6inYu3EOblNhqMTe/ZYAK+XHxl0
	nBPOG811JL7X62KzRyTT3NMSA9syELhna2/GyTPzm40vgjEi4CcTSDoXCWbXgU0uXpcp
	7rgGB+oDB3bDh+daKw5cl0I/LNlRTiX09MBVP/fye1i/M6DAw9RsP+9GrjEasA339087
	K2HDl/gRwYjIEDGSklFxMfVW+ZDwQjSIEQB6AT3VflItIaWqw8ct+RTslsG0MUTO6Jpb
	quxw==
X-Gm-Message-State: ALoCoQkynxdlzBUxawPI85VBz4pBRetS6djccPJn59IDgwaYDMoL0hjWiVIMwQ6n2xhqG6GqM0fI
X-Received: by 10.140.42.130 with SMTP id c2mr7474299qga.94.1427973045454;
	Thu, 02 Apr 2015 04:10:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 2 Apr 2015 04:10:25 -0700 (PDT)
In-Reply-To: <551CB686.5090405@windriver.com>
References: <cover.1427874748.git.liezhi.yang@windriver.com>
	<ef4bd808c72bfaa4a7615db04cd27fdb98ab38bf.1427874748.git.liezhi.yang@windriver.com>
	<20150401175921.GK14928@jama> <551CB686.5090405@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Apr 2015 12:10:25 +0100
Message-ID: <CAJTo0LYwySSjO=uE9qoh7Otk9dtMvoBEOeFBv6=D_AqeNyiqAA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] piglit: add PACKAGECONFIG for freeglut
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
X-List-Received-Date: Thu, 02 Apr 2015 11:10:45 -0000
Content-Type: multipart/alternative; boundary=001a113aa7d21f9f910512bbe24f

--001a113aa7d21f9f910512bbe24f
Content-Type: text/plain; charset=UTF-8

On 2 April 2015 at 04:24, Robert Yang <liezhi.yang@windriver.com> wrote:

> I'm afraid not since it depends on virtual/libx11.
>

So what's gained by disabling freeglut? Shouldn't we be enabling it if
possible?

Ross

--001a113aa7d21f9f910512bbe24f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 April 2015 at 04:24, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":21c" cla=
ss=3D"a3s" style=3D"overflow:hidden">I&#39;m afraid not since it depends on=
 virtual/libx11.</div></blockquote><div><br></div><div>So what&#39;s gained=
 by disabling freeglut? Shouldn&#39;t we be enabling it if possible?</div><=
div><br></div><div>Ross</div></div></div></div>

--001a113aa7d21f9f910512bbe24f--
