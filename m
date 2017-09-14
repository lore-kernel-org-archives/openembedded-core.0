Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1D17835B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 09:01:39 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id e189so6529779ioa.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DlVvWBNIAOdrIsBP9/g6FE71YOD+F8bkQWWlxAhpMZQ=;
	b=RaxG+7kc9fEbKt40qpI0cpNmqlDLUzFBuhzQya1+OXTFTqXqLW23czJ0G2aoh5WSf0
	QzjiKhp87x8mf7aNywwjhGSy99ApXjNva9xNq3lN9WUq1mjqOh0TRnWp7FF6UmrR7J4U
	uFnJ0v9OxsuAxqvRiCSUp1KSd/LS/IuA9CU4y/5X0WN+PAFutwhp2dui9CAyxDP6MvZh
	2xw1f2+ZzUAWV9NcXYvluJNXfM/ecQ6Jsxnmuym0Uz8NK6bti6iIOfIiAXBCggx7IAe5
	s70xx7MMAEgm7Y0YvMSsF7ydCQuCluGJQrPOzR5k82yb8aEcQew9jAmzT3/KLHiNDuxQ
	b/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DlVvWBNIAOdrIsBP9/g6FE71YOD+F8bkQWWlxAhpMZQ=;
	b=oV9dxY/PE2TtVkhs1op5GRURhHfOEN7NF8WMDi7pX8Q8wGvpvkKRuSlECJXMzBNJn4
	aZGKAbADB9tPTqKliW88Es3ZdchNWrqWOtZLLcROo7LO5ao8ltLOw/YYERTKrItyYKbJ
	HCbZLHTRjEayJkl2VtzoVTutjzCVHL+579s98KTUt1RXji5dF1kDI15eZE5Lq8wXYoFH
	nFyNh8B6xUU8V8DYNcpslva4NJXqJZdy+dep0VEzXcDzdq3tC3TgnOd+kzZEQGczZgGP
	/Si790OcXzbDi26dTJED8CxI/0wiRxyJ00IJoAO95nEY8gzx9qbRwSt3/2fG59g8omyG
	5ChA==
X-Gm-Message-State: AHPjjUhDPV2WYzl9zK3sAJNVn/KnU7oB8JGFJTY5oPNIy2TRoA8gdbOu
	qF48PtU/50Q5Vz0bVicpSwUv2RfV4/59xbi+MpWmUQ==
X-Google-Smtp-Source: AOwi7QDNy2cy3wNV5wS6TPwzwGsE4U2bmwLN8FuezIqkQ9xblEvkIPHwp5FDnqNJajtgvkWpt/1yFEQBO39UMScro1s=
X-Received: by 10.107.133.92 with SMTP id h89mr1478700iod.208.1505379701051;
	Thu, 14 Sep 2017 02:01:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Thu, 14 Sep 2017 02:01:20 -0700 (PDT)
In-Reply-To: <113edd5bbb1fc884d416783db2d2dfe5@iwavesystems.com>
References: <df4d255a017af31c177f2f6d19cf5724@iwavesystems.com>
	<CAJTo0LZ7G2easoj9mgdv7VjsE40_Zp8bF6WeMNnitYr2vGBexw@mail.gmail.com>
	<113edd5bbb1fc884d416783db2d2dfe5@iwavesystems.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Sep 2017 10:01:20 +0100
Message-ID: <CAJTo0LaXUQqxnp4AmRfhcdxD5iX7rJPktDNB5iEA3HMOg3UDTw@mail.gmail.com>
To: anjalik@iwavesystems.com
Cc: john@iwavesystems.com, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Matchbox in 240x320 LCD Display
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
X-List-Received-Date: Thu, 14 Sep 2017 09:01:40 -0000
Content-Type: multipart/alternative; boundary="001a113ff7d0556a64055922865b"

--001a113ff7d0556a64055922865b
Content-Type: text/plain; charset="UTF-8"

On 14 September 2017 at 08:59, <anjalik@iwavesystems.com> wrote:

>  Is there any other Window manager instead of matchbox which supports QVGA
> theme in Yocto 1.8?
>
For a screen that small matchbox is the only real option for behaviour, you
just need to customise the theme.

Ross

--001a113ff7d0556a64055922865b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 14 September 2017 at 08:59,  <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:anjalik@iwavesystems.com" target=3D"_blank">anjalik@iwavesyst=
ems.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div style=3D"font-size:10pt;fon=
t-family:Verdana,Geneva,sans-serif">
<p><span style=3D"font-size:10pt">=C2=A0Is there any other Window manager i=
nstead of matchbox which supports QVGA theme in Yocto 1.8?</span></p></div>=
</blockquote><div>For a screen that small matchbox is the only real option =
for behaviour, you just need to customise the theme.</div><div><br></div><d=
iv>Ross</div></div></div></div>

--001a113ff7d0556a64055922865b--
