Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id F097E77C98
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 12:06:49 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id w94so7370862ioi.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Oct 2017 05:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VgI3YPz5T2ThZTwqk+GJrayWq7d/5TorhdwJenX5VcU=;
	b=lsJjy62Xcz78ZVtcMVVpmg7algw1CTV0ChE1jNRsNsWSaUIC8+l4rNbQbMHRMwNdDv
	crLTxxpJKKFqWTZN/P1FeycPMlWXGVUgB++4ykS4LRaqjG9RdpLhEySHns/NXJU/knhS
	wAqSY9hl1OgvA6yBsJPbECAECLBWg3A8G51OrtFUgHFTeQ6ksgZLrH6J+8tCkUBE2SM4
	Z+OZa8siCBLXbl/yg6c89Y+CmbXvxIayhQwwCfe0SzGAsyx+bEO/ADdoatkiHy2styRZ
	mhvR8nQDdRMZ9FBDd8H+anSAjELDxWwPEj+q67e6SJbFhHkFti7K49goc7vFLYuuxeDl
	5aPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VgI3YPz5T2ThZTwqk+GJrayWq7d/5TorhdwJenX5VcU=;
	b=qZnF9z6NE9Tsscdf17pkh5Xi4V0IW99Zfz6Woc/P/KArJIgECP0O0uwAqUUBUI6qr6
	yuNEaiRek/5kYo1vwX4j67DWd/H/W9Vs4J3JPmPMO1ZhZCMJ/CsaLQLpdVL90urRIPws
	Z5WcY9BMkD0S/ZUYrW4viqCP/1jxw+4mHx6WuLhQZMYdynGGOdZNPhV7wNf2vgO8bLKD
	zjepTQstDZcJTtXGjmrIVfyOiX1GoWIU7wY2XhKlladhyN+M5r3veUkQVA8XkcrleZov
	KZ9KAk8DVMRFP4xpz1+m8SuD6oJTvmR2UqELiVbrUvcQGfbEvpNEhwLABw9n5jWP7zGO
	RjCQ==
X-Gm-Message-State: AMCzsaXkblvg/APiORmkw3CcEoxtxlM7szJi/O1EYvNsT28zJofLgUmx
	qe4z1dO88vt+2+cW4M+wXlej/RmFKpqR3thzrIMYFQ==
X-Google-Smtp-Source: AOwi7QAqhY97oeV+0KMxoMtQWYg0fqb8ZT6Ne9hJ0n4RZHNIjWf6ckaT4ru5TxmeP+MgNYJUtHMRAnUwePWjaBXzYck=
X-Received: by 10.107.32.70 with SMTP id g67mr29183416iog.77.1507032411127;
	Tue, 03 Oct 2017 05:06:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.134 with HTTP; Tue, 3 Oct 2017 05:06:30 -0700 (PDT)
In-Reply-To: <FAB9E48578194042BE5C63B8BE4761033969175B@MBX.NIKO.LAN>
References: <FAB9E48578194042BE5C63B8BE47610339682897@MBX.NIKO.LAN>
	<d0e88e18-0540-2d7f-abe4-11f677d5af4e@linux.intel.com>
	<FAB9E48578194042BE5C63B8BE4761033969175B@MBX.NIKO.LAN>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Oct 2017 13:06:30 +0100
Message-ID: <CAJTo0LY6UW=G2pfVPSQH3bMdU03FDMRFACpzsXJYoW1255rPRg@mail.gmail.com>
To: Jef.Driesen@niko.eu
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Small improvement for the initscripts package
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
X-List-Received-Date: Tue, 03 Oct 2017 12:06:51 -0000
Content-Type: multipart/alternative; boundary="001a1140ae2c87de89055aa35326"

--001a1140ae2c87de89055aa35326
Content-Type: text/plain; charset="UTF-8"

On 3 October 2017 at 11:03, <Jef.Driesen@niko.eu> wrote:

>
> Note: base-files-emperor is the package with the custom init scripts. I
> added:
>
> PROVIDES = "initscripts"
>
> And in conf/machine/emperor.conf, I added:
>
> PREFERRED_PROVIDER_initscripts = "base-files-emperor"
>

If your initscripts package is a replacement for the oe-core initscripts
package, then also set RPROVIDES_${PN} += "initscripts".

Ross

--001a1140ae2c87de89055aa35326
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 3 October 2017 at 11:03,  <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Jef.Driesen@niko.eu" target=3D"_blank">Jef.Driesen@niko.eu</a>&g=
t;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><br>
Note: base-files-emperor is the package with the custom init scripts. I add=
ed:<br>
<br>
PROVIDES =3D &quot;initscripts&quot;<br>
<br>
And in conf/machine/emperor.conf, I added:<br>
<br>
PREFERRED_PROVIDER_initscripts =3D &quot;base-files-emperor&quot;<br></bloc=
kquote><div><br></div><div>If your initscripts package is a replacement for=
 the oe-core initscripts package, then also set RPROVIDES_${PN} +=3D &quot;=
initscripts&quot;.</div><div><br></div><div>Ross=C2=A0</div></div></div></d=
iv>

--001a1140ae2c87de89055aa35326--
