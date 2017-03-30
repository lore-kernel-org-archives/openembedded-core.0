Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f172.google.com (mail-yb0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id C0DBB77C3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:14:17 +0000 (UTC)
Received: by mail-yb0-f172.google.com with SMTP id m133so5521907ybb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HgEMjbYr7XBbR80dMv7lnHkRSSnwUHfX5ND0HDFPc1E=;
	b=nqZhGrTcnxT7jqJlwbbqq/NjSTnM+ObjGP6qAvFQ3WYxFGaWNKR3y6Nxb6b16amqQK
	JkSxPsG0ZMKGh6OiS98tdAegMN+UG/B8zriRf2GYNYsUKx29oGZqjDa3izc+0QHlByYy
	QlLGxdUM2U1RPl/2efvZOYfGHOKSQDxnBTdj+Szb8XelzSG5yN5AB375FPHSTGRO7owH
	qhhUQDO1l40su+W9opPWRHz4xhI7ND/W9FQpsTixhQhX6lM6MMquEAY2h/x9DHU5rAm+
	jskM4qLRQuhUU/7eJVRkL8Ia4nToogI4ANh4JElZZhlKS7dRY/eASdhMxG26uF+Wbxpj
	mGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HgEMjbYr7XBbR80dMv7lnHkRSSnwUHfX5ND0HDFPc1E=;
	b=ZsBboVr4PmOI1R0YRx3g6Tnj7ypwlZdDfcpy3zPfujBP2sBtCxbjogXvaQW8AlYj9x
	u3m51fC8n181C5ItXNDmABPpqawHG2YOFY3ykudK6ktSWH/ONGTAPk8GprZDwJGPnrT/
	QS2K3btXCWiknIuka0yXRhdYKi3RvKSCUddxdgoj49Om3kTDHnkkVLlA3NKMWy5lN8bZ
	EtQxyAtrP5aw0/OM0lPqYZfz0DZtAr29Q2icaC+6H/G+ILv0NkHVqCrlUvvroQfXcIr3
	VPaqwQ/CSnXAV7EDa9IzZg4ijzXPDqAxawOEZS36xqGWM+Ovq/AYWuRh5ujl7kAufgG7
	A5Tw==
X-Gm-Message-State: AFeK/H1y6viYy2Jcr0XNDo6r2txVifbn4NpHk+ttdskNRm9qRc5NCbK38oHbEn40iaubF+iMAXRBBEW3d9QqHlgw
X-Received: by 10.37.221.134 with SMTP id u128mr5660496ybg.51.1490861658543;
	Thu, 30 Mar 2017 01:14:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Thu, 30 Mar 2017 01:13:48 -0700 (PDT)
In-Reply-To: <CAJTo0LZAWTAuC_GjBifQRzL_bMJCw52qZm-Jvo4S4QYaba8H8Q@mail.gmail.com>
References: <699e3efa-95bb-fc2c-ba12-5a5e7807acb9@mindchasers.com>
	<CAJTo0LZAWTAuC_GjBifQRzL_bMJCw52qZm-Jvo4S4QYaba8H8Q@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 30 Mar 2017 11:13:48 +0300
Message-ID: <CAHiDW_H72mKYRcbQJen92Pxc=RPbcOJ_Bj3neb6FQXLwAf6j9g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: mlauer@vanille-media.de, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: python: manifest files have a bad link to "Embedded Systems Site"
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
X-List-Received-Date: Thu, 30 Mar 2017 08:14:18 -0000
Content-Type: multipart/alternative; boundary=001a114bcea4912f5d054bee4778

--001a114bcea4912f5d054bee4778
Content-Type: text/plain; charset=UTF-8

On 29 March 2017 at 17:50, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 29 March 2017 at 13:49, Bob Cochran <openembedded@mindchasers.com>
> wrote:
>
>> These files: python-2.7-manifest.inc  python-3.5-manifest.inc
>> python-native-2.7-manifest.inc  python-native-3.5-manifest.inc
>>
>> all have:
>>
>> "Visit the Python for Embedded Systems Site =>
>> http://www.Vanille.de/projects/python.spy"
>>
>> That URL returns a 404
>>
>> Someone want to fix the link?
>>
>> Otherwise, I'll be happy to submit a patch if provided guidance on what
>> site these files should now reference.
>>
>
> Wow, that must be about a decade old now.
>
> As the scripts are part of openembedded, I don't think this needs a link
> anymore.  Feel free to just delete that comment block.
>

... but please modify the scripts that produce these generated files, and
run the scripts to regenerate these files.

Jussi

--001a114bcea4912f5d054bee4778
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 29 March 2017 at 17:50, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote">On =
29 March 2017 at 13:49, Bob Cochran <span dir=3D"ltr">&lt;<a href=3D"mailto=
:openembedded@mindchasers.com" target=3D"_blank">openembedded@mindchasers.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_-37=
17858896427123241:qs" class=3D"m_-3717858896427123241a3s m_-371785889642712=
3241aXjCH m_-3717858896427123241m15b1a3c6066340a8">These files: python-2.7-=
manifest.inc=C2=A0 python-3.5-manifest.inc python-native-2.7-manifest.inc<w=
br>=C2=A0 python-native-3.5-manifest.inc<br>
<br>
all have:<br>
<br>
&quot;Visit the Python for Embedded Systems Site =3D&gt; <a href=3D"http://=
www.Vanille.de/projects/python.spy" rel=3D"noreferrer" target=3D"_blank">ht=
tp://www.Vanille.de/projects<wbr>/python.spy</a>&quot;<br>
<br>
That URL returns a 404<br>
<br>
Someone want to fix the link?<br>
<br>
Otherwise, I&#39;ll be happy to submit a patch if provided guidance on what=
 site these files should now reference.</div></blockquote></div><br></span>=
Wow, that must be about a decade old now.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">As the scripts are part of openembedded=
, I don&#39;t think this needs a link anymore.=C2=A0 Feel free to just dele=
te that comment block.</div></div></blockquote><div><br></div><div>... but =
please modify the scripts that produce these generated files, and run the s=
cripts to regenerate these files.</div><div>=C2=A0</div><div>Jussi</div></d=
iv></div></div>

--001a114bcea4912f5d054bee4778--
