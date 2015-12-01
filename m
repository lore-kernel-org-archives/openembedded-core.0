Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id C6F44606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 16:52:59 +0000 (UTC)
Received: by iouu10 with SMTP id u10so16171533iou.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 08:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WlAAowEDYi8tjd6J3VW2bCFG4JfnLS9xBjNmDeVR8j4=;
	b=d/6Jn/oR7bTNt2J+eEimojvJBX6dxVDopr1frFoJxcb7qCpL4HFoyBtFGc6E4dhjXQ
	T2mOjk9r9Ujxa2Ao8Z/BiBsg3ApdSTNO/EEdMyH6KqCsh7/J+kiFP9drsGpvcfEiZ51K
	8iC9jOhIgbp9Bb+tI3dJIZzz3erhZrNscCSZpwPVyRy5F4Y4OEQiRp2HvUu4njrqhe2m
	wG8OdFd2mev3UNvEBgoTPK3N+7I6B3JzmdLInI9+i3oLUGwP1zTF+18KWMzZJvU+/HCw
	rM2gY/TSoIK1VOdWXA1k+aJ/nMhXxEpgjGHU/jAawsIL5ni/4H7S1/gG2aQJzRvK5v+Q
	tcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WlAAowEDYi8tjd6J3VW2bCFG4JfnLS9xBjNmDeVR8j4=;
	b=RxS13L3TexoR4jtZpVlFV4gJj+X7aNUSlRa7zHQi69RAfd+7lLt1iAfHWkRto/qe3M
	fuFFz+1SDm/nl8O7KE+ZKLunxrLpWdIQh8PYiJ7o9X2i8RIuUg5bGOt45GXGt6MOhaGJ
	JkU3vz1tseMDU8dH8NYmUVeAMntAjOyt/+8m/emNsPKWTMK64A6p4R4Eb8YBs2ZJMggP
	BShwy1lKogo4BikxSOudqLXUmDc4Q/OUMGKMTqTIsV9KPeQ0Pa93iKa9Ne4Yg06WDnHv
	s30jFNSXJAgB4qHEmYem7D5ggSAnwfJxOyZNGJkIi7GaZLfip11F7YnuZpkP3dAj+UFb
	aLyQ==
X-Gm-Message-State: ALoCoQn1BbtjZTF/egWSH1CFVXRAi8mEM/oxF6Sy8gia+1RaVOEJdy3JQPNInwc91dz2azmQ8R5a
X-Received: by 10.107.130.155 with SMTP id m27mr71992209ioi.133.1448988780583; 
	Tue, 01 Dec 2015 08:53:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 1 Dec 2015 08:52:41 -0800 (PST)
In-Reply-To: <da664b4c789caa9fa847568ed11f21539f2052fb.1448625307.git.jussi.kukkonen@intel.com>
References: <cover.1448625307.git.jussi.kukkonen@intel.com>
	<da664b4c789caa9fa847568ed11f21539f2052fb.1448625307.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Dec 2015 16:52:41 +0000
Message-ID: <CAJTo0LYaiLUi0oR-2PMBxXTrV_Jupv8H-FbNMLYxVmqkK_GEVw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/10] dropbear: Upgrade 2015.68 -> 2015.70
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
X-List-Received-Date: Tue, 01 Dec 2015 16:53:00 -0000
Content-Type: multipart/alternative; boundary=001a113ecd948cf3ae0525d8fdc9

--001a113ecd948cf3ae0525d8fdc9
Content-Type: text/plain; charset=UTF-8

On 27 November 2015 at 12:10, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> --- a/meta/recipes-core/dropbear/dropbear_2015.68.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require dropbear.inc
> -
> -SRC_URI[md5sum] = "7664ac10f7cc2301c530eb80c756fc5d"
> -SRC_URI[sha256sum] =
> "55ea7c1e904ffe4b1cdbe1addca8291a2533d7d285fd22ac33608e9502a62446"
> diff --git a/meta/recipes-core/dropbear/dropbear_2015.70.bb
> b/meta/recipes-core/dropbear/dropbear_2015.70.bb
> new file mode 100644
> index 0000000..3da8d5f
> --- /dev/null
> +++ b/meta/recipes-core/dropbear/dropbear_2015.70.bb
> @@ -0,0 +1,5 @@
> +require dropbear.inc
> +
> +SRC_URI[md5sum] = "0b0a1d9be6a094710d884209562a626c"
> +SRC_URI[sha256sum] =
> "62a8cc3df1d0f136d46f50d4f8d92f7ab7ce1addac76b25446b3f6aaf80bf257"
>

ERROR: Command Error: exit status: 1  Output:
Applying patch 0005-dropbear-enable-pam.patch
patching file options.h
Hunk #1 FAILED at 192.
1 out of 1 hunk FAILED -- rejects in file options.h
Patch 0005-dropbear-enable-pam.patch does not apply (enforce with -f)

(I do builds with PAM enabled, which isn't the case for plain poky).

Ross

--001a113ecd948cf3ae0525d8fdc9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 November 2015 at 12:10, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div id=3D":3rj" class=3D"" =
style=3D"overflow:hidden">--- a/meta/recipes-core/<span class=3D"">dropbear=
</span>/<a href=3D"http://dropbear_2015.68.bb" rel=3D"noreferrer" target=3D=
"_blank">dropbear_2015.68.bb</a><br>
+++ /dev/null<br>
@@ -1,4 +0,0 @@<br>
-require <span class=3D"">dropbear</span>.inc<br>
-<br>
-SRC_URI[md5sum] =3D &quot;7664ac10f7cc2301c530eb80c756fc5d&quot;<br>
-SRC_URI[sha256sum] =3D &quot;55ea7c1e904ffe4b1cdbe1addca8291a2533d7d285fd2=
2ac33608e9502a62446&quot;<br>
diff --git a/meta/recipes-core/<span class=3D"">dropbear</span>/<a href=3D"=
http://dropbear_2015.70.bb" rel=3D"noreferrer" target=3D"_blank">dropbear_2=
015.70.bb</a> b/meta/recipes-core/<span class=3D"">dropbear</span>/<a href=
=3D"http://dropbear_2015.70.bb" rel=3D"noreferrer" target=3D"_blank">dropbe=
ar_2015.70.bb</a><br>
new file mode 100644<br>
index 0000000..3da8d5f<br>
--- /dev/null<br>
+++ b/meta/recipes-core/<span class=3D"">dropbear</span>/<a href=3D"http://=
dropbear_2015.70.bb" rel=3D"noreferrer" target=3D"_blank">dropbear_2015.70.=
bb</a><br>
@@ -0,0 +1,5 @@<br>
+require <span class=3D"">dropbear</span>.inc<br>
+<br>
+SRC_URI[md5sum] =3D &quot;0b0a1d9be6a094710d884209562a626c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;62a8cc3df1d0f136d46f50d4f8d92f7ab7ce1addac76b=
25446b3f6aaf80bf257&quot;</div></blockquote></div><br><div class=3D"gmail_e=
xtra">ERROR: Command Error: exit status: 1 =C2=A0Output:</div><div class=3D=
"gmail_extra">Applying patch 0005-dropbear-enable-pam.patch</div><div class=
=3D"gmail_extra">patching file options.h</div><div class=3D"gmail_extra">Hu=
nk #1 FAILED at 192.</div><div class=3D"gmail_extra">1 out of 1 hunk FAILED=
 -- rejects in file options.h</div><div class=3D"gmail_extra">Patch 0005-dr=
opbear-enable-pam.patch does not apply (enforce with -f)</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">(I do builds with PAM en=
abled, which isn&#39;t the case for plain poky).</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a113ecd948cf3ae0525d8fdc9--
