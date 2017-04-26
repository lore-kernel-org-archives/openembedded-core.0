Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8862677C39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 13:04:03 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id c45so164906321qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7/aAOYB2hzqhiyihKod79jMjI9pn6L2EW/6Gh1VL7hY=;
	b=j/yphKItREbh2JfWDaoWyf4VQQpFzMYqiT0bu7wtN5ekX5F/73K1vmSdjPFQEcSTZR
	iSH97AaXDazlHgGIYLzCz2S6q4aHp0UixNldhC99k7x057/UThDf/g/vY8ouvbDYp0rz
	G48JeYNm8fKGuZUGLRYD/gE7JV3y4haslGoTZZS6F7h606SDoYydCwlchGpL3zcQbV+S
	okc5gH0AtuUm5P1qWxZ4RuWIuu12Yj7JPx6fPZkKt5hIWQ9hmwGblqRLgJON4gOz0tuu
	AV+jvXSBfpDO73rLJEZ+RjnpSdQdH4QYUBvHDKXGoSQ49MaEKqC3gH/GyduNPIKde2wu
	Gx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7/aAOYB2hzqhiyihKod79jMjI9pn6L2EW/6Gh1VL7hY=;
	b=FdFajrTB4Bv+L2IOOJGO2arxderq7OtTlVmLTDiObA8Pqn+Q/VKCHbOdEQ4/TyAyjP
	zbOflnnWJ87nw2puSqClk8BleZwM+zBSI/XYyyOEy2l4LDN6Xwu9lT8Ebm2jb1g60Eg3
	ajW9Dbo7rThLv4r7FJYaOIDh6AIDXoa9ZxKeQn9OyQusO6g2KV7lds5ssR/wOPvroVNo
	U3srK5Ah56FOyl4NanCxaK4Q3l1xuU6EBswRmqFcbOeTdS/0YMqFY8BkGCd31PD9biH8
	zNoodHrLOeqxCxB/jCQHeHtB9OGilZaJSXcufV8ZGJhnr0/bzDZlueizh95Lrf8vx/2i
	mpvQ==
X-Gm-Message-State: AN3rC/4ZVoIe3tkbKkiCwyuXF1Nt3A8j18nJL1EsGW47fWdFM0kp0u46
	doD3OnjjJCfGS45kg0j67QWEbPV/raw3
X-Received: by 10.200.46.26 with SMTP id r26mr39282550qta.197.1493211844453;
	Wed, 26 Apr 2017 06:04:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 26 Apr 2017 06:03:43 -0700 (PDT)
In-Reply-To: <20170426103415.GA4637@tng>
References: <20170421121145.9797-1-andreas.reichel@tngtech.com>
	<20170421121145.9797-3-andreas.reichel@tngtech.com>
	<CAJTo0LaJWXe_QfhbOi-Xi9WPYpwgL0Z59=A+PLy-TJRLf+fu5A@mail.gmail.com>
	<20170426103415.GA4637@tng>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Apr 2017 14:03:43 +0100
Message-ID: <CAJTo0LbOktwwffU12DB1B1VNtv=gNDXVr7Q_vOh-5jkeWeYmDg@mail.gmail.com>
To: Andreas Reichel <Andreas.Reichel@tngtech.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Andreas Reichel <andreas.reichel.ext@siemens.com>,
	Daniel Wagner <daniel.wagner@siemens.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [wic patch 2/5] wic: Use argparse instead of optparse
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
X-List-Received-Date: Wed, 26 Apr 2017 13:04:04 -0000
Content-Type: multipart/alternative; boundary=001a114708cc90422c054e117946

--001a114708cc90422c054e117946
Content-Type: text/plain; charset=UTF-8

On 26 April 2017 at 11:34, Andreas Reichel <Andreas.Reichel@tngtech.com>
wrote:

> - Change the code to keep current return values / behavior
> - Adapt the unit test to fit the new code
> - Write a less complex patch for just adding the option
>   "--keep-partition-images" without migration to argparse
>

It looks like the exit 2 is deeply nested into the argparse code, so I
guess the test should be updated.  The test could be made more resilient by
checking that the output wasn't 0 instead of was 1.

Ross

--001a114708cc90422c054e117946
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 April 2017 at 11:34, Andreas Reichel <span dir=3D"ltr">&lt;<a href=3D=
"mailto:Andreas.Reichel@tngtech.com" target=3D"_blank">Andreas.Reichel@tngt=
ech.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
m_431930197207790266:zk" class=3D"m_431930197207790266a3s m_431930197207790=
266aXjCH m_431930197207790266m15ba9d21cc8fe7ac">- Change the code to keep c=
urrent return values / behavior<br>
- Adapt the unit test to fit the new code<br>
- Write a less complex patch for just adding the option<br>
=C2=A0 &quot;--keep-partition-images&quot; without migration to argparse<br=
></div></blockquote></div><br>It looks like the exit 2 is deeply nested int=
o the argparse code, so I guess the test should be updated.=C2=A0 The test =
could be made more resilient by checking that the output wasn&#39;t 0 inste=
ad of was 1.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a114708cc90422c054e117946--
