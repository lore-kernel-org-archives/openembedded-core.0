Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4FFC06017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 12:35:58 +0000 (UTC)
Received: by qcxm20 with SMTP id m20so49969818qcx.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2015 04:35:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GXdSm10J0nwRyl02eUywrS06gRNwrQ23/9amDEmC4bo=;
	b=LDBWNbZce+Zx2URTcwkUaA/atWeavUEwmk0/+IvwPCAGgCvFrxGQScR6pZWM11DPoW
	tNsx8fcSu/Rv98qadIbmO/f1oRj4ddynHU1UPqKnbxhusr2TYKGQ6xSYV+5yyl0+QyfD
	gaqBQ6QrO8r48KxVTnBmy8kO8xMqMbXnVqaXt0TVrSmXwOwqmrkFUPJ3M/G6vNCTW0EB
	HweFh7MjgUgw/g/tTxQ7eXgUR6Rf6R09znzT0ntnrO61Vwx4dXz0rx6R4AKp0Ba6qGzR
	01/0+jlTmcij+5ivGxNEp/klzulQzeYyxRSQNG2r0Za7JKmOXvjAT3xb+TmtV9GgPLP7
	ieSQ==
X-Gm-Message-State: ALoCoQk/b6zjnRul4IqbcxZq3SPWP6w+ueWOLChmlpecyAkWWr8fBed4aarKPmvNLXKgCyOrrGc/
X-Received: by 10.140.233.79 with SMTP id e76mr19320327qhc.100.1425645359836; 
	Fri, 06 Mar 2015 04:35:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Fri, 6 Mar 2015 04:35:39 -0800 (PST)
In-Reply-To: <1eade737f0d2e1279a75c27335e110140b28503f.1425634271.git.liezhi.yang@windriver.com>
References: <cover.1425634271.git.liezhi.yang@windriver.com>
	<1eade737f0d2e1279a75c27335e110140b28503f.1425634271.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Mar 2015 12:35:39 +0000
Message-ID: <CAJTo0La_2aZHEs5MfbaV+UZ9Bf+qLfnm0Dj=9uurcLVz9KUHvQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] apt: fix SRC_URI
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
X-List-Received-Date: Fri, 06 Mar 2015 12:36:00 -0000
Content-Type: multipart/alternative; boundary=001a113535063fc73405109ded52

--001a113535063fc73405109ded52
Content-Type: text/plain; charset=UTF-8

On 6 March 2015 at 09:32, Robert Yang <liezhi.yang@windriver.com> wrote:

> -SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/apt_${PV}.tar.gz \
> +SRC_URI = "
> https://launchpad.net/debian/+archive/primary/+files/apt_0.9.9.4.tar.gz \
>

Surely this should continue using ${PV}, especially as this is a .inc.

Ross

--001a113535063fc73405109ded52
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 March 2015 at 09:32, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":40" clas=
s=3D"a3s" style=3D"overflow:hidden">-SRC_URI =3D &quot;${DEBIAN_MIRROR}/mai=
n/a/apt/apt_${PV}.tar.gz \<br>
+SRC_URI =3D &quot;<a href=3D"https://launchpad.net/debian/+archive/primary=
/+files/apt_0.9.9.4.tar.gz" target=3D"_blank">https://launchpad.net/debian/=
+archive/primary/+files/apt_0.9.9.4.tar.gz</a> \</div></blockquote></div><b=
r>Surely this should continue using ${PV}, especially as this is a .inc.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a113535063fc73405109ded52--
