Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id D3EA173A59
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 20:00:36 +0000 (UTC)
Received: by qgdz60 with SMTP id z60so4892871qgd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 13:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eVmXurlVM9aADuyXpxwxqdoO0FiVLH1drHPBTaWfQjc=;
	b=c9AbB3U6p6G8/EW2w+H5IKsTQa9DxWpTqXdi6upT80OVKXLpi9BwmSg1ai0Vhigyxd
	QmY82FCDNQJfG/KsusNHGBxfNmjldyKIQiP6BGm9qu7kDaGrsHiwQR1c2yzoxyqn/x2S
	Vaf06p+h44QwJe1c/wCWSRMDdFS2QFvQldcT61PJ4lWu8pun9pV5ebsd8Blyuv4E+tLp
	dstAd/9mYSXeki1tdRRXBe5iFae6BILmUP2PNw2I13IyINgoGWeEd8dI2DtWtugXrfit
	PVdvBHt0T8ighPfVESLwYh3Rl0DZYJ7M87BkrZq85k04nm3nBYa57oSxfmGpblZTEbf6
	TBwg==
X-Gm-Message-State: ALoCoQk55VOxMjMD18iEHYrJJAJW1JSwjSPK0cqCYfhuwfccdBNKwQws7ET7OOlABeSaDgzaI1+v
X-Received: by 10.55.31.10 with SMTP id f10mr34867027qkf.58.1426017636787;
	Tue, 10 Mar 2015 13:00:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 10 Mar 2015 13:00:16 -0700 (PDT)
In-Reply-To: <CAP9ODKpFX=p4Jr6eORVRAA0vmD+8dRiZhMz00=YPCDQVT_UsbA@mail.gmail.com>
References: <1426009857-1224-1-git-send-email-ross.burton@intel.com>
	<CAJ86T=WcRjnrPt89mRyK_O80r5MyyjA6ifwJ+pGSDewxP+JsgQ@mail.gmail.com>
	<CAP9ODKpFX=p4Jr6eORVRAA0vmD+8dRiZhMz00=YPCDQVT_UsbA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Mar 2015 20:00:16 +0000
Message-ID: <CAJTo0LatJw62GBabg9NbZk7fEMAA2WsZXQfx6QLzor0xXsJFjA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devshell: start in ${B} not ${S}
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
X-List-Received-Date: Tue, 10 Mar 2015 20:00:39 -0000
Content-Type: multipart/alternative; boundary=001a1147ebdaaf3b040510f49adc

--001a1147ebdaaf3b040510f49adc
Content-Type: text/plain; charset=UTF-8

On 10 March 2015 at 19:53, Otavio Salvador <otavio@ossystems.com.br> wrote:

> > Just my opinion, but I'd vote against this change. Running
> > "../temp/run.do_compile" works from either directory but editing
> > sources and running "quilt refresh" etc only works from ${S}.
>
> +1


Clearly I'm the only person who mainly does build testing and not source
patching in a devshell :)

Ross

--001a1147ebdaaf3b040510f49adc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 March 2015 at 19:53, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D=
"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&g=
t; Just my opinion, but I&#39;d vote against this change. Running<br>
&gt; &quot;../temp/run.do_compile&quot; works from either directory but edi=
ting<br>
&gt; sources and running &quot;quilt refresh&quot; etc only works from ${S}=
.<br>
<br>
</span>+1</blockquote><div><br></div><div>Clearly I&#39;m the only person w=
ho mainly does build testing and not source patching in a devshell :)</div>=
<div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1147ebdaaf3b040510f49adc--
