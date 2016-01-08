Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 873FA731D6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 08:46:15 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id g73so82116946ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 00:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=d249ro+a2/f5Z6dcb24RpGiTuzBTltK1np/ClO0U6eQ=;
	b=wRvEV6ZIhf2hiLXF7t6p/EUIb8g9PF3OTIEfqQieV6W0O7UMdwTnhp5LpCPkr77qou
	KSvflPyGRQOahxY6Bl55bbpRitarM5wlACvB4dSoYfSIZ+NQL4IfLHR1fQsHHqEymv3h
	/aVHBDlfzJHtOWft19doP9asMWqsSxKg+04g9HgMXVsg1UkI3AcQ5gRZvHvu1Th0QVWb
	4j/NX6ACpUSAbQTX4xCw21UxVM+HgspB5Kr/C9YdoM6cV9HJh/8s8jQ4tNvE3V15Pg63
	LSDU/MGVaTnDT5/jy99AcEfeeA2UBAuJ9poyvLhgOY3SbQZDmEuqKr7G5AZQ0i7l3ZT1
	EIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=d249ro+a2/f5Z6dcb24RpGiTuzBTltK1np/ClO0U6eQ=;
	b=QBzBjlkesYT/yn63UAHrcSxNqQaiXjEIjK1iGfOz24xpx6m+Rc9mhh8qehQn4sVY3E
	AxyuLaOipsPWgFZVXE/0BQnTCcaGZzIxVy0awggyH8gegoKKst7nrRGCS41X/+WGaw/o
	7VqTAaQOWoVqzdPMRlr91BIgmpMS1heezYawlQ4GfKRR5jGmzg3NydwXt01aWV9BZ7L/
	yCK7UKz6ydgtQjWvGDqZAh6ERPe8++dv2V++tWneesu+99JV3yLxaV+xCuwshGfDxTXC
	6L/aqZE+m1J5l8B07nIseJcw6pnPDzHAH/Nn6A3LUWmBY3+9u/K7Ab68kWptpiMfp1Hm
	dn7g==
X-Gm-Message-State: ALoCoQllNMgj0ve474z4WXE6U+HLNSS9ge0t5KF4BZRAAzTH1YPGrJcMT47pVOX34T4A7OVAIKa4xAtBE+hx97L1cBCAy91cH1TtMaDBE91kE+1XpsKBUbg=
X-Received: by 10.107.3.154 with SMTP id e26mr94106973ioi.99.1452242775944;
	Fri, 08 Jan 2016 00:46:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 8 Jan 2016 00:45:56 -0800 (PST)
In-Reply-To: <568F74AB.70102@windriver.com>
References: <cover.1449152021.git.alexander.kanavin@linux.intel.com>
	<568F74AB.70102@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jan 2016 08:45:56 +0000
Message-ID: <CAJTo0Lbyv4AeZ=fCibhmWQNgE6cB9vom8NFjNMmcY5LEa+s__Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] Move Qt4 recipes to a separate meta-qt4 layer
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
X-List-Received-Date: Fri, 08 Jan 2016 08:46:15 -0000
Content-Type: multipart/alternative; boundary=001a113ec10ac9e88d0528ce9e37

--001a113ec10ac9e88d0528ce9e37
Content-Type: text/plain; charset=UTF-8

On 8 January 2016 at 08:34, Robert Yang <liezhi.yang@windriver.com> wrote:

> There are a few recipes in meta-oe requires qmake2.bbclass which had been
> removed by this PULL:
>
> meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb:inherit qmake2
> pythonnative python-dir distro_features_check
> meta-oe/recipes-navigation/monav/monav_0.3.bb:inherit qmake2 qt4x11
> meta-oe/recipes-extended/sip/sip_4.16.4.bb:inherit qmake2 python-dir
> pythonnative distro_features_check
>
> What's the plan for these recipes, please ? Move them into meta-qt4 ?
>

Martin Jansa has queued up a patch to remove these from meta-oe:

http://cgit.openembedded.org/meta-openembedded/commit/?h=master-next&id=caf40a507907ec1125a67cdb76fc51407b82c010

The request there is that if anyone actually uses a recipe that's being
removed, they should get it added to meta-qt4.

Ross

--001a113ec10ac9e88d0528ce9e37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 January 2016 at 08:34, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204)=
;border-left-style:solid;padding-left:1ex"><div id=3D":211" class=3D"" styl=
e=3D"overflow:hidden">There are a few recipes in meta-oe requires qmake2.bb=
class which had been<br>
removed by this PULL:<br>
<br>
meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb:inherit qmake2 python=
native python-dir distro_features_check<br>
meta-oe/recipes-navigation/monav/monav_0.3.bb:inherit qmake2 qt4x11<br>
meta-oe/recipes-extended/sip/sip_4.16.4.bb:inherit qmake2 python-dir python=
native distro_features_check<br>
<br>
What&#39;s the plan for these recipes, please ? Move them into meta-qt4 ?</=
div></blockquote></div><br>Martin Jansa has queued up a patch to remove the=
se from meta-oe:</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra"><a href=3D"http://cgit.openembedded.org/meta-openembedded/commit=
/?h=3Dmaster-next&amp;id=3Dcaf40a507907ec1125a67cdb76fc51407b82c010">http:/=
/cgit.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&amp;id=3Dc=
af40a507907ec1125a67cdb76fc51407b82c010</a></div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">The request there is that if anyone a=
ctually uses a recipe that&#39;s being removed, they should get it added to=
 meta-qt4.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a113ec10ac9e88d0528ce9e37--
