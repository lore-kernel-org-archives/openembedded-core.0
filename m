Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0F8D46FFA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 21:39:40 +0000 (UTC)
Received: by iouu10 with SMTP id u10so143089453iou.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 13:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=T6XEvAUCjVqy2305YsIrDwu2PeFQQHjgp2/LkxSFiXo=;
	b=vMg49PBF1NGJlbAl8EQYiMD5LbzNK4xKpXJ0SWZb+gZSHi2Qsi2aWcTlWWZp/4F/EE
	GF3VZ/35I1Cy6AQmGBhBk/F5BkRD2keHEuUF5JkkC57ASi/7n4gG4waJ7qhO8K1PBetg
	ePvw1oX+RbaO0dybJy7CHd+GOCpKDaQ2h0/eYhrgqbQECVX/Q7FcJWhWJmVcCLU+49te
	Fd6HqKFshzPrnF5JQTHaMjsYwZPMkjArU6vlm4OpWF2EeRUYrCzGfEC7EmvFuCXhtZ6C
	cXN27/jEML3H5QT99cCX/ooNVztMFQ0T+Chy60wO+FH6wvAAD1iQl/3wQlnT4dlR65/f
	hegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=T6XEvAUCjVqy2305YsIrDwu2PeFQQHjgp2/LkxSFiXo=;
	b=e+3fyo5Q7o7mng6hD12AGBsQZop4xvTGlUAK3Gu+nGpExJdpDM792NLuMEgHNCRr17
	mJVVM1MgW2WJ85JnSow2vdborHbbO2SznF1W6LQyIcJNgJf5vpOTKYUAc9blt0UQtBQC
	ypGd+w2c2z9bGKP2EdI4u9FwQAn1ZV8rCNCwJGaXLOENgVwGR/VQxN5NGk9Jf70Dh61o
	qo5dy5O0RMOOtdQIP3wjNZfvSIYaiHmGGoX0DCgz3UOnX/h+b7tUaUHQqDLlwlT8y52N
	ZCOLQvpB6D4IFzXuhPJnaCe58NvhBkQF/X3RbWtsUvO9YNR73QDt7gyJqYVLI/GNcU/n
	VrMg==
X-Gm-Message-State: ALoCoQlkcG6IP9RqFbDMvsDwa0wEUV9H7/CMkWeR6KJ4f+FTw/T0XTbWbgAVSo7pc+XeDrmTJ9LIGXDw7uwNJFjU9hOdhBy346bQK38swWNweGVuXhY80NQ=
X-Received: by 10.107.130.155 with SMTP id m27mr20966464ioi.133.1449869981180; 
	Fri, 11 Dec 2015 13:39:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Fri, 11 Dec 2015 13:39:21 -0800 (PST)
In-Reply-To: <11321f065e34ca094a0aff494291662852f05805.1445522417.git.andrew.shadura@collabora.co.uk>
References: <CAJTo0LZ4eNqiyX0JzPEb=FLAk=k=2p2c2+c5mKd77a0zquepAw@mail.gmail.com>
	<94093E93-77C6-403A-9E9F-69C02C6C8D11@collabora.co.uk>
	<CAJTo0Lada89cW8Hs=P65aHfRKiiZuu13jDu3PO=3NkJq_Wt7xA@mail.gmail.com>
	<c64105ff4adca9a4e05280aa52644919d646d660.1445449278.git.andrew.shadura@collabora.co.uk>
	<11321f065e34ca094a0aff494291662852f05805.1445522417.git.andrew.shadura@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Dec 2015 21:39:21 +0000
Message-ID: <CAJTo0LbyG07bauQnVJeHYCcZ9=zhjFZdj44E1vS-kXHMVuq0BQ@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] cups: update systemd support
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
X-List-Received-Date: Fri, 11 Dec 2015 21:39:43 -0000
Content-Type: multipart/alternative; boundary=001a113ecd9432f67c0526a6293d

--001a113ecd9432f67c0526a6293d
Content-Type: text/plain; charset=UTF-8

On 22 October 2015 at 15:00, Andrew Shadura <andrew.shadura@collabora.co.uk>
wrote:

> Add PACKAGECONFIG for systemd, enable it when systemd is enabled
> in DISTRO_FEATURES. Pass the correct path to systemd units,
> ensure they're installed into the package.
>
> Drop custom systemd unit files, use those shipped by the upstream
> instead.
>

Sorry for the delay in looking at this.  buildhistory-diff reports this:

packages/corei7-64-poky-linux/cups/cups: FILELIST: removed
"/etc/rc2.d/S81cups /lib/systemd/system/cups.service /etc/rc5.d/S81cups
/etc/rc5.d/K36cups /etc/rc0.d/K36cups /etc/rc2.d/K36cups /etc/rc3.d/S81cups
/etc/rc3.d/K36cups /lib/systemd/system/cups.socket
/lib/systemd/system/cups.path /etc/init.d/cups" added
"/lib/systemd/system/org.cups.cupsd.socket
/lib/systemd/system/org.cups.cupsd.service
/lib/systemd/system/org.cups.cups-lpd@.service
/lib/systemd/system/org.cups.cupsd.path
/lib/systemd/system/org.cups.cups-lpd.socket"

Looks like if systemd is enabled it removes the sysvinit files, but we
still need those installed if sysvinit is in DISTRO_FEATURES.

Also the configure script checks for libsystemd-daemon which we don't build
by default, so we'll either need to enable compat in systemd or patch
configure to look for the new library name.  To be honest so much is
silently breaking that I think we should enable compat in systemd...

Ross

--001a113ecd9432f67c0526a6293d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 October 2015 at 15:00, Andrew Shadura <span dir=3D"ltr">&lt;<a href=
=3D"mailto:andrew.shadura@collabora.co.uk" target=3D"_blank">andrew.shadura=
@collabora.co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:=
rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div style=3D"ov=
erflow:hidden">Add PACKAGECONFIG for systemd, enable it when systemd is ena=
bled<br>
in DISTRO_FEATURES. Pass the correct path to systemd units,<br>
ensure they&#39;re installed into the package.<br>
<br>
Drop custom systemd unit files, use those shipped by the upstream<br>
instead.</div></blockquote></div><div class=3D"gmail_extra"><br></div>Sorry=
 for the delay in looking at this. =C2=A0buildhistory-diff reports this:</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">packages=
/corei7-64-poky-linux/cups/cups: FILELIST: removed &quot;/etc/rc2.d/S81cups=
 /lib/systemd/system/cups.service /etc/rc5.d/S81cups /etc/rc5.d/K36cups /et=
c/rc0.d/K36cups /etc/rc2.d/K36cups /etc/rc3.d/S81cups /etc/rc3.d/K36cups /l=
ib/systemd/system/cups.socket /lib/systemd/system/cups.path /etc/init.d/cup=
s&quot; added &quot;/lib/systemd/system/org.cups.cupsd.socket /lib/systemd/=
system/org.cups.cupsd.service /lib/systemd/system/org.cups.cups-lpd@.servic=
e /lib/systemd/system/org.cups.cupsd.path /lib/systemd/system/org.cups.cups=
-lpd.socket&quot;<br></div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Looks like if systemd is enabled it removes the sysvinit f=
iles, but we still need those installed if sysvinit is in DISTRO_FEATURES.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Also t=
he configure script checks for libsystemd-daemon which we don&#39;t build b=
y default, so we&#39;ll either need to enable compat in systemd or patch co=
nfigure to look for the new library name.=C2=A0 To be honest so much is sil=
ently breaking that I think we should enable compat in systemd...</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--001a113ecd9432f67c0526a6293d--
