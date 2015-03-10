Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id C158973A6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 16:06:06 +0000 (UTC)
Received: by qcxm20 with SMTP id m20so3040039qcx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 09:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=q8E+nJ7itgwOf5tteoAN9GCthTI2D0TAqdgu5jysJus=;
	b=IzcldxCCdIM5w2cnPjkhRbK4TQilVBmsMOI7YvaaS1JYL+izJj7t9VMp5j7zp6y78I
	epXJN3pRDrdHR8DWsXRAaz7RfakSd0mhmWlnV4r+8LxTGX9ZIR1KhXh83XxkJ8y10At7
	RTg9zNzsXVeSefnCus4TEbOBBrnSVzlhBehMW+hYnEm5nt+2lHMiiDNAZMXi0PJ02w0L
	B8fEN6s50XTxpyins/uF0clzgsdC59J8Rhdcmq61mxMXfH1G+WmETU8bcsxH7P57SyFD
	rTxgr4AeniOPofNFdpKjbDBUjSJz80TmEvLEPGrZsAAi549riX20gI68oTm/L1g2HPul
	TcEg==
X-Gm-Message-State: ALoCoQkTxTKV5owIwjKkgepffLcp44qA6OLl64A2AIGIvTCxzEllEG8ZyEkxR3Q3rznuC+SVIXBV
X-Received: by 10.55.24.160 with SMTP id 32mr49448007qky.23.1426003567805;
	Tue, 10 Mar 2015 09:06:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 10 Mar 2015 09:05:47 -0700 (PDT)
In-Reply-To: <1425945178-14806-3-git-send-email-rob.woolley@windriver.com>
References: <1425945178-14806-1-git-send-email-rob.woolley@windriver.com>
	<1425945178-14806-3-git-send-email-rob.woolley@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Mar 2015 16:05:47 +0000
Message-ID: <CAJTo0LYTFRQVdH9XFcUJ4_CLRoH0Fa8JeDCeKRohe_8zNxwdxA@mail.gmail.com>
To: Rob Woolley <rob.woolley@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/3] nfs-utils: Identify CONFFILES
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
X-List-Received-Date: Tue, 10 Mar 2015 16:06:07 -0000
Content-Type: multipart/alternative; boundary=001a114414621b9f9c0510f154ef

--001a114414621b9f9c0510f154ef
Content-Type: text/plain; charset=UTF-8

On 9 March 2015 at 23:52, Rob Woolley <rob.woolley@windriver.com> wrote:

> +CONFFILES_${PN}-client += "${localstatedir}/lib/nfs/etab \
> +                          ${localstatedir}/lib/nfs/rmtab \
> +                          ${localstatedir}/lib/nfs/xtab \
> +                          ${localstatedir}/lib/nfs/statd/state \
> +                          ${sysconfdir}/nfsmount.conf"
>

NFS puts configuration files in /var/lib?  Are files called "state" really
configuration files?

Ross

--001a114414621b9f9c0510f154ef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 March 2015 at 23:52, Rob Woolley <span dir=3D"ltr">&lt;<a href=3D"mail=
to:rob.woolley@windriver.com" target=3D"_blank">rob.woolley@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":28m" cla=
ss=3D"a3s" style=3D"overflow:hidden">+CONFFILES_${PN}-client +=3D &quot;${l=
ocalstatedir}/lib/<span class=3D"il">nfs</span>/etab \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${localstatedir}/lib/<span class=3D"il">nfs</span>/rmtab =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${localstatedir}/lib/<span class=3D"il">nfs</span>/xtab \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${localstatedir}/lib/<span class=3D"il">nfs</span>/statd/=
state \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${sysconfdir}/nfsmount.conf&quot;</div></blockquote></div=
><br>NFS puts configuration files in /var/lib?=C2=A0 Are files called &quot=
;state&quot; really configuration files?</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></div>

--001a114414621b9f9c0510f154ef--
