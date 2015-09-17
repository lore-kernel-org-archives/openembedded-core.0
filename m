Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 08EF577010
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 14:33:10 +0000 (UTC)
Received: by qgev79 with SMTP id v79so14052240qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 07:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FvESrG4DXKCgQ9y0h3DOp28SUSiHxXYN6//iIHnLU2s=;
	b=KAmG+Xd5aPnZYXubWliYwryYNmdwlplzDyFqzUOh9DUtrRVcfMN+MdRgdAOMyOOQzX
	kCrFOtb4yswhtZCiBRfar11RjBtgiucOGUEeJg2cUjrnYAwxEg4cd9uB/162h9OtA/M5
	crWu17PetglnoUV5j6m3Xwn/DTeVXScOxV+Gkbi+mcc3YtpTJHc4UzaEZ8WzQU2EkDwr
	1J/6c9tVmI2M0ThpOnUbtPiR46RVMzJK9J39ClytmSrRWevBh4/0rADrJef2oa1977Mg
	6ewmGhMbRsY3Z89j3YyEsdnL5vod5T9UFMe+T68MfbLqhr/ZgBKKLoDS3doda8fWRExS
	3ykA==
X-Gm-Message-State: ALoCoQlb3TZEQRRE2BB/QrkOXNshIqCYigXRsl6SczVZ/STKLGO8zY91hGOmjvZqeE2zi59nKZSr
X-Received: by 10.140.235.147 with SMTP id g141mr52078950qhc.22.1442500390207; 
	Thu, 17 Sep 2015 07:33:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 17 Sep 2015 07:32:50 -0700 (PDT)
In-Reply-To: <449d22e4acbad6a99a1a7372181c815e528a579f.1442475786.git.liezhi.yang@windriver.com>
References: <cover.1442475786.git.liezhi.yang@windriver.com>
	<449d22e4acbad6a99a1a7372181c815e528a579f.1442475786.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Sep 2015 15:32:50 +0100
Message-ID: <CAJTo0Lb=Osg5hn1vvgXKCRn6RFhJZngP=iAeLJB=ADBdGHnHRQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] meta: fix build with gettext 0.16.1
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
X-List-Received-Date: Thu, 17 Sep 2015 14:33:12 -0000
Content-Type: multipart/alternative; boundary=001a11376e6e58e74c051ff24b47

--001a11376e6e58e74c051ff24b47
Content-Type: text/plain; charset=UTF-8

On 17 September 2015 at 08:46, Robert Yang <liezhi.yang@windriver.com>
wrote:

> -DEPENDS = "gtk+ dbus-glib intltool-native"
> +DEPENDS = "gtk+ dbus-glib intltool-native gettext-native"
>

Shouldn't this be "inherit gettext"?

Ross

--001a11376e6e58e74c051ff24b47
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 September 2015 at 08:46, Robert Yang <span dir=3D"ltr">&lt;<a href=3D=
"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":87"=
 class=3D"a3s" style=3D"overflow:hidden">-DEPENDS =3D &quot;gtk+ dbus-glib =
intltool-native&quot;<br>
+DEPENDS =3D &quot;gtk+ dbus-glib intltool-native gettext-native&quot;</div=
></blockquote></div><br>Shouldn&#39;t this be &quot;inherit gettext&quot;?<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--001a11376e6e58e74c051ff24b47--
