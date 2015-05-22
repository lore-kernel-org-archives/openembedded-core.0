Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7F933609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 08:56:52 +0000 (UTC)
Received: by qgew3 with SMTP id w3so5222163qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 01:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eiwBsxEgUCn7CoIJGZQ6mj3QUv+DqTJU8Ftg7KCzEJY=;
	b=KwMI8i3xEU/XE8KWZXfI6kPSf5EdZWcQztWCsKyTOpp8lqoh3wew8sUpzwz/RxEN0m
	eH0fHF7MFM/gmaqZeRP6MAVaRUW4nCQlbdmG7vFFsp46c80nbfJFgcuFk6ryTREbfppv
	eKQbEybmbfFiQlGsJe9LZ/3oyQCBGvUt9T7TVkFMuc1CD5SSztnFUwKAjT4L66hOVia8
	hvJt3CnOtey9CHJPoyfCFZL9x0MtVtsUBAFPEq0F+KcWdq/SXmenXcPBnKTG4wquLH+v
	uo30hZpRFszmmqagON+o3dN/T3oAkQhjbFsfud2mHgoDgas1DxB+g4Y4BlaoQUhnDHEr
	EClg==
X-Gm-Message-State: ALoCoQlA9ACQMt3r53jY1XZ7LfjM9LzcIeb5htWscUYwolnfIhELOu+uU8o+eIhMCz7IOwWewD95
X-Received: by 10.140.235.77 with SMTP id g74mr10003412qhc.64.1432285013173;
	Fri, 22 May 2015 01:56:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 22 May 2015 01:56:32 -0700 (PDT)
In-Reply-To: <555ED05A.6050102@topic.nl>
References: <555ED05A.6050102@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 May 2015 09:56:32 +0100
Message-ID: <CAJTo0Lb5HwZdVn0CdTWshR1xsOmoMoujuMJWW6pbYxDTEA4DvQ@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>, 
	Alexander Kanavin <alexander.kanavin@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: "packagegroup-core-qt4e" broken?
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
X-List-Received-Date: Fri, 22 May 2015 08:56:53 -0000
Content-Type: multipart/alternative; boundary=001a11354a006d7dd60516a7d767

--001a11354a006d7dd60516a7d767
Content-Type: text/plain; charset=UTF-8

On 22 May 2015 at 07:44, Mike Looijmans <mike.looijmans@topic.nl> wrote:

> When building (just for having something on my display) "qt4e-demo-image",
> it bailed out with the following error:
>
>  * satisfy_dependencies_for: Cannot satisfy the following dependencies for
> packagegroup-core-qt4e:
>  *      qt4-embedded-plugin-phonon-backend-gstreamer *
>  * opkg_install_cmd: Cannot install package packagegroup-core-qt4e.
>
> I guess this is related to all the gstreamer changes lately?
>

I wonder how did the world build I did *yesterday* worked? :/

Ross

--001a11354a006d7dd60516a7d767
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 May 2015 at 07:44, Mike Looijmans <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.nl</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1oo" class=
=3D"a3s" style=3D"overflow:hidden">When building (just for having something=
 on my display) &quot;qt4e-demo-image&quot;, it bailed out with the followi=
ng error:<br>
<br>
=C2=A0* satisfy_dependencies_for: Cannot satisfy the following dependencies=
 for packagegroup-core-qt4e:<br>
=C2=A0*=C2=A0 =C2=A0 =C2=A0 qt4-embedded-plugin-phonon-backend-gstreamer *<=
br>
=C2=A0* opkg_install_cmd: Cannot install package packagegroup-core-qt4e.<br=
>
<br>
I guess this is related to all the gstreamer changes lately?</div></blockqu=
ote><div><br></div><div>I wonder how did the world build I did *yesterday* =
worked? :/</div><div><br></div><div>Ross<br></div></div></div></div>

--001a11354a006d7dd60516a7d767--
