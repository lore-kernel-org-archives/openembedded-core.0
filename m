Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA7672810
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 14:48:56 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id c9so3346133qcz.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 06:48:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JLGFRuYgTXBhi4AgC6weKLnfv2pfblkB+z2yismAPDg=;
	b=RfgRYIsSEqYIQNLK+xHL96Rz435IPU/AGddC5MmaXeQ1sMFjPMkd9LmB476qmdOEZf
	vEF1jh4H55KqegmZ/KUPIMm7TIZLtNNaELfAUPn4Id/+o+Oh8NTtS1Zjt5s/ax0qDe7c
	6ZU9Q/zT1+xvu4HZAgcQyPNZnnAs/39BsKVpLzpl979NpfXtyCY41qWydeBR/nUXUBcf
	5E32FXjySK4TvXQVEH5OrD8VBKeYxMEOl8IB53a40+aU1mzNvmOxB3oTP/K+derkttlj
	H4R0FLTwJfdA8GFU+sMBTC/7eGUgM6ffC9Vfj0Y+Ovg/dFXGLwQ21iqt2iIXjqO0xW/r
	nPfQ==
X-Gm-Message-State: ALoCoQmxk8Uex3dsNtg4C0WtswKHI2NJgCWCvXT5Og8/mAhwdH/LocNS99NoBe0T0/JqBeX5hhF+
X-Received: by 10.229.249.137 with SMTP id mk9mr36959688qcb.4.1419259737129;
	Mon, 22 Dec 2014 06:48:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 22 Dec 2014 06:48:36 -0800 (PST)
In-Reply-To: <1419224101-24900-1-git-send-email-akuster808@gmail.com>
References: <1419224101-24900-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Dec 2014 14:48:36 +0000
Message-ID: <CAJTo0LaOaz=vsqPPCy-f47vuAHx-rfgd7zZpLXNd3Qyhi36rww@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] [RFC] Move packages from meta-oe to core for X11
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
X-List-Received-Date: Mon, 22 Dec 2014 14:48:59 -0000
Content-Type: multipart/alternative; boundary=001a11334d9079df4e050acf28f9

--001a11334d9079df4e050acf28f9
Content-Type: text/plain; charset=UTF-8

On 22 December 2014 at 04:54, Armin Kuster <akuster808@gmail.com> wrote:
>
> This fixes 'core-image-x11' image dependancy on meta-oe packages
> since xinit requires xterm, xclock and twm to 'startx'.
>

Why can't we just make core-image-x11 start Matchbox instead?  Adding twm
and xclock to oe-core seems crazy.

Ross

--001a11334d9079df4e050acf28f9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
2 December 2014 at 04:54, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</s=
pan> wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":6r2" class=3D"a3s" st=
yle=3D"overflow:hidden">This fixes &#39;core-image-x11&#39; image dependanc=
y on meta-oe packages<br>
since xinit requires xterm, xclock and twm to &#39;startx&#39;.</div></bloc=
kquote></div><br>Why can&#39;t we just make core-image-x11 start Matchbox i=
nstead?=C2=A0 Adding twm and xclock to oe-core seems crazy.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11334d9079df4e050acf28f9--
