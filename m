Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 28C6760169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 20:48:58 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id i17so11796639qcy.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 12:48:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EZBLawzdzEhJ+sla/ltTqxTeKRM80zTjsc2odH5QxLI=;
	b=kCfQOf1sMXW8pg6DIETeRChSi1S1+7ZQMTNk7UxiLuk96ckgRBWb4wiaH2yypQJV5K
	z7CUr9B5iKxSnLzSkluaD3Y5LOhRlou6DjBIjBbQ7lH2wfDj++S3cgk4t9g8/let9Sjd
	NF9UfMVLPIgCvlVsU9C5Xi6Q3j/RS+VTEs02li9I97BJIh5L+RkcaT7V1JV94SOHwIDK
	1Up38fzLA31a/0A1Uw0RHtOdJao+fiEuWrMo80jj2nDOfMO5pOOfw4tSJlWUkclil7nf
	7frYujvTutekVjVBQHyf0kc8GxgdbVpU3QRLhTDNc4iKZ4wAsqkOQkndj+GtLb4+XP84
	yo8A==
X-Gm-Message-State: ALoCoQlqkQfry/NhdFVDI4gdwqJI+Q07LY/XDkxuVdA69nNdMj5QeQOylncRrZ5x8F2wh5UTaKJq
X-Received: by 10.224.60.74 with SMTP id o10mr4180646qah.22.1417639738603;
	Wed, 03 Dec 2014 12:48:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 3 Dec 2014 12:48:38 -0800 (PST)
In-Reply-To: <eb3ae98cd6b06ffc14d00686460aaf2072a12b96.1417413565.git.Qi.Chen@windriver.com>
References: <cover.1417413565.git.Qi.Chen@windriver.com>
	<eb3ae98cd6b06ffc14d00686460aaf2072a12b96.1417413565.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Dec 2014 20:48:38 +0000
Message-ID: <CAJTo0Lag8Oh1_qFar3D5Ac70A_pDNHsF7bv3caRS9-tbKnGG4A@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Dec 2014 20:49:03 -0000
Content-Type: multipart/alternative; boundary=001a11c3f53e0a1117050955f90b

--001a11c3f53e0a1117050955f90b
Content-Type: text/plain; charset=UTF-8

On 1 December 2014 at 06:01, Chen Qi <Qi.Chen@windriver.com> wrote:

> Allow globs in CONFFILES and default CONFFILES to '${sysconfdir}'.
>

If I apply this patch and build core-image-sato with package_ipk:

| *** Error: CONTROL/conffiles mentions conffile /etc/depmod.d which does
not exist
| *** Error: CONTROL/conffiles mentions conffile /etc/modprobe.d which does
not existERROR: Task 1120 (/home/ross/Yocto/poky/meta/recipes-kernel/kmod/
kmod_git.bb, do_package_write_ipk) failed with exit code '1'

| *** Error: CONTROL/conffiles mentions conffile /etc/udev/hwdb.d which
does not exist
ERROR: Task 558 (/home/ross/Yocto/poky/meta/recipes-core/systemd/
systemd_216.bb, do_package_write_ipk) failed with exit code '1'

Ross

--001a11c3f53e0a1117050955f90b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 December 2014 at 06:01, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex"><div id=3D":4ng" class=3D"" style=3D"overfl=
ow:hidden">Allow globs in CONFFILES and default CONFFILES to &#39;${sysconf=
dir}&#39;.<br></div></blockquote></div><div class=3D"gmail_extra"><br></div=
>If I apply this patch and build core-image-sato with package_ipk:</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"=
gmail_extra">| *** Error: CONTROL/conffiles mentions conffile /etc/depmod.d=
 which does not exist</div><div class=3D"gmail_extra">| *** Error: CONTROL/=
conffiles mentions conffile /etc/modprobe.d which does not existERROR: Task=
 1120 (/home/ross/Yocto/poky/meta/recipes-kernel/kmod/<a href=3D"http://kmo=
d_git.bb">kmod_git.bb</a>, do_package_write_ipk) failed with exit code &#39=
;1&#39;</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">| *** Error: CONTROL/conffiles mentions conffile /etc/udev/hwdb.d which d=
oes not exist<br></div><div class=3D"gmail_extra">ERROR: Task 558 (/home/ro=
ss/Yocto/poky/meta/recipes-core/systemd/<a href=3D"http://systemd_216.bb">s=
ystemd_216.bb</a>, do_package_write_ipk) failed with exit code &#39;1&#39;<=
br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div></div>

--001a11c3f53e0a1117050955f90b--
