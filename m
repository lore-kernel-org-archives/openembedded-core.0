Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 641D960030
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 18:01:32 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id dc16so10480164qab.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 10:01:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=edQFaarYlnhDM31SBXu7c0DJ/EZjx4eBhc6mmu/R3No=;
	b=VrvWjeeCjO9WMoOt1stpdg0U2dXRG6GZAxIoZvS318clgFOEEbETtsfb5wmdbllmPU
	yZE33VGnFPfcARMNycLz5yV6O8kGFyQAe7Q35yBphxYyLmqpWBeGDPTNHpylQdgZ68zP
	QfoaDc5T5VhZIKHrzwR7VvGsaz6RPuekd3vGvswGfhQEFizzoa0WXDSpgXIrWuepLi+A
	xepRGyPCMim1/GgOnSOHQLfzSdINS0fVLdT5+RSQGkZ1BOADayLbIGCl0so1jGVqy2tC
	tF6RRquvsoLM0lI6AxMffmbRoU81M4QEFrRC19jWj6uXWXuENVdvj8zqtvd1vcTpNe9a
	ZExQ==
X-Gm-Message-State: ALoCoQkM1r9/JOswiF+TRlbWdc2/cNr6dapu+KrmvVzOb3NytQ4QQDGWyMFkbxH5maE4qVuCr1Jb
X-Received: by 10.140.38.170 with SMTP id t39mr9508138qgt.15.1417629213870;
	Wed, 03 Dec 2014 09:53:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 3 Dec 2014 09:53:13 -0800 (PST)
In-Reply-To: <eb3ae98cd6b06ffc14d00686460aaf2072a12b96.1417413565.git.Qi.Chen@windriver.com>
References: <cover.1417413565.git.Qi.Chen@windriver.com>
	<eb3ae98cd6b06ffc14d00686460aaf2072a12b96.1417413565.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Dec 2014 17:53:13 +0000
Message-ID: <CAJTo0LZ3qUxLn=3=GygyXFSB0vW6_jpNz+7X_FwzmmkGhTevTA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] packaging: allow globs in CONFFILES
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
X-List-Received-Date: Wed, 03 Dec 2014 18:01:39 -0000
Content-Type: multipart/alternative; boundary=001a11c12196b7665d05095385e6

--001a11c12196b7665d05095385e6
Content-Type: text/plain; charset=UTF-8

On 1 December 2014 at 06:01, Chen Qi <Qi.Chen@windriver.com> wrote:

> +def get_conffiles(pkg, d):
>

Presumably this function is mostly a copy-and-paste of the FILES_* globbing
code also in package.bbclass.  Can the common code be extracted into a
shared function so that the two copies don't diverge?

Ross

--001a11c12196b7665d05095385e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 December 2014 at 06:01, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":90v" class=3D"a3s=
" style=3D"overflow:hidden">+def get_conffiles(pkg, d):<br></div></blockquo=
te></div><br>Presumably this function is mostly a copy-and-paste of the FIL=
ES_* globbing code also in package.bbclass.=C2=A0 Can the common code be ex=
tracted into a shared function so that the two copies don&#39;t diverge?</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a11c12196b7665d05095385e6--
