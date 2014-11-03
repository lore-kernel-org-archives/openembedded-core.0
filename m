Return-Path: <alexandru.damian@intel.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id C013F60E49
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 14:51:03 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id a141so7161451oig.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 06:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=K9Nohq4XP7VE2M2GW47hZZwJG0nbE4AdlwKSLBytFx0=;
	b=jo6F12inBomv9GgmJvlCMIWSjcFqo856xeYTKnT3rT9+B1RF4SmOUzdNiFT5utT6wc
	ccWvGKYIuRRleI+UPcOCP3C98oO55KjQHwMZoGCbRcG3tBb1x616MMR34MhET1bAx7Z1
	wL0quNjYn+v1Z6s9QQ4D3X+67JRea4+Hl5PDyGvj+GHBr6tunHgxM1NvoZNV4n/NXbV3
	HURSFQ95uiDY7QmKR7XahHsEN+7ggaZ40D/vzNsG8fMU7hm/4tUyjzYnx4oFYxdYmuK/
	+mdt3tUHsZ7vlCS33fsEQmXN0EyWYea8fF8p/YZ2UV7ZBNsg3z7WuLVnF1xs5qbjXaSi
	YMEA==
X-Gm-Message-State: ALoCoQnA4EUH67xh/y8aQaiSuqpI0niSOV8zS+yXZ+gc/U3Y9EhRG9ee5sYtRNGNBpCts+bKxA/t
X-Received: by 10.60.46.199 with SMTP id x7mr10074oem.86.1415026263443; Mon,
	03 Nov 2014 06:51:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.134.106 with HTTP; Mon, 3 Nov 2014 06:50:43 -0800 (PST)
In-Reply-To: <5ACFEF8D-2923-401F-B691-3CCDCA5A0608@dominion.thruhere.net>
References: <1414505359-1271-1-git-send-email-alexandru.damian@intel.com>
	<5ACFEF8D-2923-401F-B691-3CCDCA5A0608@dominion.thruhere.net>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
Date: Mon, 3 Nov 2014 14:50:43 +0000
Message-ID: <CAJ2CSBt7O4Zq2XsFkHbhYBds=NwADFoxL05ZJsBk6XWT4miY1A@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/27] toaster: add toaster layer configuration file
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
X-List-Received-Date: Mon, 03 Nov 2014 14:51:05 -0000
Content-Type: multipart/alternative; boundary=089e0149bde6c7e1f80506f57922

--089e0149bde6c7e1f80506f57922
Content-Type: text/plain; charset=UTF-8

Sorry for the mix-up, you're right.

I'll re-post to correct mail list.

Alex

On Tue, Oct 28, 2014 at 3:49 PM, Koen Kooi <koen@dominion.thruhere.net>
wrote:

>
> > Op 28 okt. 2014, om 15:09 heeft Alex DAMIAN <alexandru.damian@intel.com>
> het volgende geschreven:
> >
> > From: Alexandru DAMIAN <alexandru.damian@intel.com>
> >
> > In managed mode, Toaster tries to discover layers
> > that are being checked-out on disk.
> >
> > In base layers, the toasterconf.json file
> > describes basic configuration file for builds based
> > on that layer, like default configuration variable
> > settings, toaster-compatible branches, and the
> > layerindex URL where the base layer and
> > compatible layers are listed.
> >
> > This patch adds toasterconf.json file to the oe core layer.
> >
> > Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> > ---
> > meta/conf/toasterconf.json | 71
> ++++++++++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 71 insertions(+)
> > create mode 100644 meta/conf/toasterconf.json
> >
> > diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
> > new file mode 100644
> > index 0000000..cdc7564
> > --- /dev/null
> > +++ b/meta/conf/toasterconf.json
> > @@ -0,0 +1,71 @@
> > +{
> > +    "config": {"MACHINE": "qemux86", "DISTRO": "poky"},
>
>
> This seems to be very inappropriate for OE-core, maybe you meant to send
> it to meta-poky?




-- 
Alex Damian
Yocto Project
SSG / OTC

--089e0149bde6c7e1f80506f57922
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif">Sorry for the mix-up, you&#39;re right. <br><br>I&#39;ll re-post=
 to correct mail list.<br><br>Alex<br></div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Tue, Oct 28, 2014 at 3:49 PM, Koen Kooi=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net" target=
=3D"_blank">koen@dominion.thruhere.net</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><br>
&gt; Op 28 okt. 2014, om 15:09 heeft Alex DAMIAN &lt;<a href=3D"mailto:alex=
andru.damian@intel.com">alexandru.damian@intel.com</a>&gt; het volgende ges=
chreven:<br>
<span class=3D"">&gt;<br>
&gt; From: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@intel.co=
m">alexandru.damian@intel.com</a>&gt;<br>
&gt;<br>
&gt; In managed mode, Toaster tries to discover layers<br>
&gt; that are being checked-out on disk.<br>
&gt;<br>
&gt; In base layers, the toasterconf.json file<br>
&gt; describes basic configuration file for builds based<br>
&gt; on that layer, like default configuration variable<br>
&gt; settings, toaster-compatible branches, and the<br>
&gt; layerindex URL where the base layer and<br>
&gt; compatible layers are listed.<br>
&gt;<br>
&gt; This patch adds toasterconf.json file to the oe core layer.<br>
&gt;<br>
&gt; Signed-off-by: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian=
@intel.com">alexandru.damian@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; meta/conf/toasterconf.json | 71 ++++++++++++++++++++++++++++++++++++++=
++++++++<br>
&gt; 1 file changed, 71 insertions(+)<br>
&gt; create mode 100644 meta/conf/toasterconf.json<br>
&gt;<br>
&gt; diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json<b=
r>
&gt; new file mode 100644<br>
&gt; index 0000000..cdc7564<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/conf/toasterconf.json<br>
&gt; @@ -0,0 +1,71 @@<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 &quot;config&quot;: {&quot;MACHINE&quot;: &quot;qemux86=
&quot;, &quot;DISTRO&quot;: &quot;poky&quot;},<br>
<br>
<br>
</span>This seems to be very inappropriate for OE-core, maybe you meant to =
send it to meta-poky?</blockquote></div><br><br clear=3D"all"><br>-- <br><d=
iv class=3D"gmail_signature"><div dir=3D"ltr">Alex Damian<div>Yocto Project=
<br></div><div>SSG / OTC=C2=A0</div></div></div>
</div>

--089e0149bde6c7e1f80506f57922--
