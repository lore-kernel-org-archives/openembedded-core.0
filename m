Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0E500731A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 21:20:39 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id 186so201638017iow.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 13:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=lF/MHYWmQxaQegL6NoKtknS3KNfrFWT/9GSjaV4oybc=;
	b=DNSn5NBva7CynWWmlHP33NybpLtlWuqpxnDuGRwPA/+6C4SWzpnYoHdRkpm48IF4zi
	bwcotdo3yx3Vj/xXj6nHzPWO4/d2BYl+hmf2AwDWF0B730YcrdeVbo8j4RERUtC5T1lR
	99xCm+dQHT98Zj3EPhclI3G7PumlOWQ9GZBC9UV/YmV5Tj3TJdDuv+4MrOpvD0dhX8Ib
	FAuu+hp/sFnCwdRU00Q5Wdi/vJspQEvTi8sWdyIk6aZjBAzbTNqu6/vbmABo1nGoMVX5
	i4k0GJDOoI+wZUD/3ZXRb2jNkUNjZdWYY/jHIy1yViQveRFi5aHsW6GhJmWQm+8rqYzB
	b/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lF/MHYWmQxaQegL6NoKtknS3KNfrFWT/9GSjaV4oybc=;
	b=ZhMV023IqTOFlEiSl57aNEgPk0c9lberzZmA22+VZwxXVHAbV9cfp8IK3ddzkY6eYl
	sPMZ93TsYfB9sgzSw2QaukoD++loasR077CMMDccC6HNVJUi2ATRMl9oC2sVGcFPgJZd
	7WvHqLc7+NMn01kFM2SVj6EgbKc8Xc8zGfOJlxMPmfmD/cXhM8Ae2ORDKsyGc3Whug3f
	lfz4JmPH8F3SSt34K6oa7l8L7gtxjXhJlWWJo0d643ZjXTbWQvkE+PsjjBDV91E4Cq8A
	N63iUNT212ZjHy3JcAGspQhTZEjST3CNKk9Gxu5ti/oNG3cSK1SZkxl5SQMMwz/dyBkL
	VsdA==
X-Gm-Message-State: ALoCoQlSYiIPZiC6RNZlLYM+iSL2txds7jV1r9K4e3hSrcFuo2I08oo4pzGGZcN3vGOHXMy3OTCFeVnRu1O4OrH8XRPCNZLvgsrTyzFreW0//zaPvgVU6cM=
X-Received: by 10.107.3.154 with SMTP id e26mr26096732ioi.99.1450819239730;
	Tue, 22 Dec 2015 13:20:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 22 Dec 2015 13:20:20 -0800 (PST)
In-Reply-To: <145451D4E6785E4DA4DFA353A58CB7B2F7E4C174@OLAWPA-EXMB03.ad.garmin.com>
References: <1449718597-2085-1-git-send-email-nate.karstens@garmin.com>
	<CAJTo0LbEMPzVs6JsjtnagwfHqxuyHmTXGXyKc302gCRrb4LKAw@mail.gmail.com>
	<145451D4E6785E4DA4DFA353A58CB7B2F7E4C174@OLAWPA-EXMB03.ad.garmin.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Dec 2015 21:20:20 +0000
Message-ID: <CAJTo0LbQJFobJgJVP5qDHxATgfz3i7V+h1De1+PY627Zpgr-eQ@mail.gmail.com>
To: "Karstens, Nate" <Nate.Karstens@garmin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcpcd: add recipe for dhcpcd
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
X-List-Received-Date: Tue, 22 Dec 2015 21:20:41 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a6ae8430527832d23

--001a113ec10a6ae8430527832d23
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22 December 2015 at 17:13, Karstens, Nate <Nate.Karstens@garmin.com>
wrote:

> Based on this I can see two approaches: 1) locate all DHCP client recipes
> in the same layer because they all provide the same functionality or 2)
> include alternatives in other layers (which in this case really just mean=
s
> dhcpcd as the ISC DHCP client and busybox shouldn=E2=80=99t really be con=
sidered
> =E2=80=9Calternatives=E2=80=9D).
>
>
>
> In either case it probably makes sense to remove the old recipe from
> meta-alt-desktop-extras.
>
>
>

Definitely (2), oe-core needs *something* to provide DHCP functionality but
meta-networking is the obvious fit for an alternative choice.

Ross

--001a113ec10a6ae8430527832d23
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 December 2015 at 17:13, Karstens, Nate <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Nate.Karstens@garmin.com" target=3D"_blank">Nate.Karstens@garmin=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p class=3D"Ms=
oNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sa=
ns-serif;color:#1f497d">Based on this I can see two approaches: 1) locate a=
ll DHCP client recipes in the same layer because they all provide the same =
functionality or 2) include alternatives
 in other layers (which in this case really just means dhcpcd as the ISC DH=
CP client and busybox shouldn=E2=80=99t really be considered =E2=80=9Calter=
natives=E2=80=9D).<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">In either case it probably makes sens=
e to remove the old recipe from meta-alt-desktop-extras.<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0</span></p></blockquote>=
</div><br>Definitely (2), oe-core needs *something* to provide DHCP functio=
nality but meta-networking is the obvious fit for an alternative choice.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a113ec10a6ae8430527832d23--
