Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3347F7F444
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 19:08:08 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id r17so4788306vso.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 12:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=61p9Ko3GmrYof++3JTTu/fCTNT1XkBeBX7+St9I+PCg=;
	b=J1nodRcYkZM0TZu8bkDAsYSn9B392xEzFnSV73D0UZD2J9+B8xruzOd148QeU28yx3
	bgD80TSWYpbSrfwbm2nZt2wocV4Hg3F0tqb67N2Mirn7tJYfM3XmVmFMjrCundy3w978
	zT9QikZiMfnMi8mynAu0Yd8zU7zQuNKBKfLFsdix+L1Y8vsJcnpkLAfLzC10i9bwHRSR
	GNYBqoY/VeMY5Ai5UivxGu5bUi/tY4Q52Rz9AKj7ucQpHPIPM3xZDVYT3MTfgaZnp3wJ
	kvD4F/HbnQF5tNEWvCo+TBodu6Mdwe2etVtyDbg/d/+8a06OmAWLC2h8YPVaXPCJLMz6
	f1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=61p9Ko3GmrYof++3JTTu/fCTNT1XkBeBX7+St9I+PCg=;
	b=onborvJMQDIbI9+yqKb/5KvNKlPtaFrhDxoHYGx4Iv9NOdvJhBNrpeZeJ7nY9RNr4J
	yxrQFa5PlxPF9aCeh1ST+vISmUJrPSzIdhYkdECrHglWA+ZjlOPU0aOAHkZd88MP+U25
	kxDBCUQbaSEJ9GCAVeS4dkMRl4Ak9RiJXRsSjb6e4prXb+CugbQf6IiuUsK5HzBH3QwM
	b/6mATYX8MvPgNvNlj+0bdHI8LkczyuWdBOcAbNZPdsxpEEoaiiHqCETd/qnSe80WJ0d
	HlLfLPM/eu1Y+K363mBD+R8DoUZvs7YGWjZerT4zjkqP5xnZx+tPH13HAywaeIRF4QkM
	2A6w==
X-Gm-Message-State: APjAAAVb7J1YIrRPQWSj3Rr9JjsiQ6zhb2eKPOC8AHNZ0ACOkRfS5oGv
	GDRLcDF+B3GnQoHY4fhbMXfDRwgIR21eYPJBMJh2hsKc
X-Google-Smtp-Source: APXvYqydCo0E0+zYKUUymDSoIi6dCET5aWO37G9FbwBhRiWgwfyiE1+QsGFUdWrylFcOhDITq8Mqmfr1kApivaaUHDY=
X-Received: by 2002:a67:2c43:: with SMTP id s64mr5733759vss.94.1567796889083; 
	Fri, 06 Sep 2019 12:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184727.552-1-fabio.berton@ossystems.com.br>
In-Reply-To: <20190906184727.552-1-fabio.berton@ossystems.com.br>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Sep 2019 21:07:57 +0200
Message-ID: <CANNYZj8jseQc9Lnt8r1SuDdh4q_xUJy5FkpUukpLzUbVn5vW2g@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade 19.1.1 -> 19.1.6
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
X-List-Received-Date: Fri, 06 Sep 2019 19:08:08 -0000
Content-Type: multipart/alternative; boundary="000000000000a762000591e728a5"

--000000000000a762000591e728a5
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Sep 2019 at 20:47, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

> +Subject: [PATCH] Revert "meson: Improve detection of Python when using
> Meson
> + >=0.50."
> +Organization: O.S. Systems Software LTDA.
> +
> +This reverts commit cb3072488cd327155206e92d1ad8eb72a23ab04e.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +This change need to be fix upstream. As a workaround revert this
> +commit to prevent blocking update mesa recipe.
> +
> +Without this we get this error:
> +
> +/-----------------------------------------------------------------------
> +|meson.build:765:2: ERROR: <ExternalProgram 'python3' ->
> +|['../build/tmp/work/cortexa9hf-neon-imx-oel-linux-gnueabi/
> +|mesa/2_19.1.6-r0/recipe-sysroot-native/usr/bin/python3-native/python3']>
> +|is not a valid python or it is missing setuptools
> +\-----------------------------------------------------------------------
>

As I had previously suggested... can you try adding 'python3' to DEPENDS of
mesa, and see if that helps please? I think that would allow avoiding this
patch altogether.

Alex

--000000000000a762000591e728a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 6 Sep 2019 at 20:47, Fabio Berton=
 &lt;<a href=3D"mailto:fabio.berton@ossystems.com.br">fabio.berton@ossystem=
s.com.br</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">+Subject: [PATCH] Revert &quot;meson: Im=
prove detection of Python when using Meson<br>
+ &gt;=3D0.50.&quot;<br>
+Organization: O.S. Systems Software LTDA.<br>
+<br>
+This reverts commit cb3072488cd327155206e92d1ad8eb72a23ab04e.<br>
+<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
+<br>
+This change need to be fix upstream. As a workaround revert this<br>
+commit to prevent blocking update mesa recipe.<br>
+<br>
+Without this we get this error:<br>
+<br>
+/-----------------------------------------------------------------------<b=
r>
+|meson.build:765:2: ERROR: &lt;ExternalProgram &#39;python3&#39; -&gt;<br>
+|[&#39;../build/tmp/work/cortexa9hf-neon-imx-oel-linux-gnueabi/<br>
+|mesa/2_19.1.6-r0/recipe-sysroot-native/usr/bin/python3-native/python3&#39=
;]&gt;<br>
+|is not a valid python or it is missing setuptools<br>
+\-----------------------------------------------------------------------<b=
r></blockquote><div><br></div><div><div>As I had previously suggested... ca=
n you try adding &#39;python3&#39; to DEPENDS of <span class=3D"gmail-il">m=
esa</span>, and see if that helps please? I think that would allow avoiding=
 this patch altogether.</div><div><br></div><div>Alex<br></div>=C2=A0</div>=
<div>=C2=A0</div></div></div>

--000000000000a762000591e728a5--
