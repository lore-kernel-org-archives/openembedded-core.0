Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 603F8786AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 16:57:22 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id d21so7932065ioe.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 08:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sqaTxNqLiIyqEY7WPV80/RoEVUa4ISGUFxxX8jimACU=;
	b=NIF3ZCuwhnzi99kN3gjDNujUJc+vwsXGtoLPN4ec8WV5U4gnEtqj6cF7TdSpNO3+fR
	OSihbvkM4cLd1ghoFpeJBsfqyIB1X1a7JQvCoA9BhGIauzwozftfV1BwAnni3DkT4Htd
	hdX2+ex3nDUbd3FOQZw0vPbH2MYxnjkga4mEU/kb30Bfjemj/0VoBEVmbv74UTQa0hGV
	RG38PO08DQXsIbZXGJzrY64KchSbprr/c42ML+MuhJsPWjvaykfEAnmhaxUoVUjDGnYM
	jFValXE+RG9xZzB9jQ8VM90SY2RLEB7pcmGc9HRmDPxf8g9ClWxGBt92Fp4lIvh28cOX
	bP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sqaTxNqLiIyqEY7WPV80/RoEVUa4ISGUFxxX8jimACU=;
	b=NVCxx/B7D1GMrkTfe8cK/DpR2JhZISNaCgVj0mV5j6lU3QQY4Wyem1oxZn20GIdG3B
	BCB0xtZLs85KVJ7sElekTh0ZxMWlPmCpwqLZpTzuluC6eXq8SmOqSRCMQQ6uFHG87uxg
	MN0vZK4i9U0s4NEtZNwhUDeV1ooUDacBrdKpjpm4zF7KQDYlSAqS1a8Kp8Ac1dr/iG6j
	ojyNMUa9J9gKyedvag+jLVYjC+xtxThQ9MRe5toLmtUyskeSuCP1T59TK9PxgEhy6N6V
	Dr6dCjHRH5iU6h2UTSen/uf/O54cvg1V7E5GI7sHDN63Um09Wl+1hYYBoGABWEappV9y
	kOVQ==
X-Gm-Message-State: AJaThX6ZsrIDbgc+7hNk+GQIXEDHU18jr2EDtZeAFaNJvG69710WUPDe
	/QE2FHRocewjys+Q1/ua5swCUFKU+Oafg7CSsEa9oA==
X-Google-Smtp-Source: AGs4zMZ02cAK57M0AKLSAzEpUdNe2ev3l845v9qMnut89vAoTUD1bjGiU0wj5r5GluaZAOdQwrFOBC4J8Iqp7hTMxyk=
X-Received: by 10.107.32.18 with SMTP id g18mr31146822iog.227.1511542644486;
	Fri, 24 Nov 2017 08:57:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Fri, 24 Nov 2017 08:57:04 -0800 (PST)
In-Reply-To: <0bddac7569ccd37263ce4d59d0ec3c4e2787246f.1508360667.git.alejandro.hernandez@linux.intel.com>
References: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
	<0bddac7569ccd37263ce4d59d0ec3c4e2787246f.1508360667.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Nov 2017 16:57:04 +0000
Message-ID: <CAJTo0LYbuVyB_sqG4L-yTK0JwgRRaSpun01NR_-q=HaE4BiVmA@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] python: Restructure python packaging and replace it with autopackaging
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
X-List-Received-Date: Fri, 24 Nov 2017 16:57:23 -0000
Content-Type: multipart/alternative; boundary="001a1141b498634be0055ebd72f5"

--001a1141b498634be0055ebd72f5
Content-Type: text/plain; charset="UTF-8"

diff --git a/meta/recipes-devtools/python/python/sitecustomize.py
b/meta/recipes-devtools/python/python/sitecustomize.py

> index 273901898a0..4c8b5e2ba3d 100644
> --- a/meta/recipes-devtools/python/python/sitecustomize.py
> +++ b/meta/recipes-devtools/python/python/sitecustomize.py
> @@ -27,19 +27,11 @@ def __enableReadlineSupport():
>      except IOError:
>          pass
>
> -def __enableDefaultEncoding():
> -    import sys
> -    try:
> -        sys.setdefaultencoding( "utf8" )
> -    except LookupError:
> -        pass
> -
>  import sys
>  try:
>      import rlcompleter, readline
>  except ImportError:
>      pass
>  else:
> -    __enableDefaultEncoding()
>      __registerExitHandler()
>      __enableReadlineSupport()
>

This change isn't explained in the commit log.

Ross

--001a1141b498634be0055ebd72f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">diff --git a/meta/recipes-devtools/<wbr>python/python/site=
customize.py b/meta/recipes-devtools/<wbr>python/python/sitecustomize.py<br=
><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
index 273901898a0..4c8b5e2ba3d 100644<br>
--- a/meta/recipes-devtools/<wbr>python/python/sitecustomize.py<br>
+++ b/meta/recipes-devtools/<wbr>python/python/sitecustomize.py<br>
@@ -27,19 +27,11 @@ def __enableReadlineSupport():<br>
=C2=A0 =C2=A0 =C2=A0except IOError:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
<br>
-def __enableDefaultEncoding():<br>
-=C2=A0 =C2=A0 import sys<br>
-=C2=A0 =C2=A0 try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.setdefaultencoding( &quot;utf8&quot; )<br>
-=C2=A0 =C2=A0 except LookupError:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
-<br>
=C2=A0import sys<br>
=C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0import rlcompleter, readline<br>
=C2=A0except ImportError:<br>
=C2=A0 =C2=A0 =C2=A0pass<br>
=C2=A0else:<br>
-=C2=A0 =C2=A0 __enableDefaultEncoding()<br>
=C2=A0 =C2=A0 =C2=A0__registerExitHandler()<br>
=C2=A0 =C2=A0 =C2=A0__enableReadlineSupport()<br></blockquote><div><br></di=
v><div>This change isn&#39;t explained in the commit log.</div><div><br></d=
iv><div>Ross=C2=A0</div></div></div></div>

--001a1141b498634be0055ebd72f5--
