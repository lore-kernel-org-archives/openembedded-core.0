Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id B977A78254
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 11:52:06 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id u12so122126681qth.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 04:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jEo5Z7ExL1zohOnMrSvZP1LtLjW/HANtRiGIELCt2aA=;
	b=TesuD5wEQve6tmLTrNjbxWj9gJpLqn2bnwrRXNn6fD4EYCNB/hMQnWGtk+swCPXNQa
	sdueX1WaS9qPVASABPIwK2SDP1S8pEVhSida+vszJb9A1rLapCdY96RO9DsdNVmAK250
	k8mOjAUfL8kJkFv/wjBpbl1cLrXGs9JFoPt6D0t6frW+MR58I8/7S4dWxfzfmdWBDqS3
	ZMujDQiryCkiydjlWOLFTnabC4xvWc9ZtmeK46dnABl0swNHg+YHrVrJgH0aT9GQi5PF
	f69PqqfTWPJsXoSyPv9N7M0hrPSZT6ub6ITqWuXiz0YnZCtVBVjr6DA5jzW/4T1bpRFT
	nWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jEo5Z7ExL1zohOnMrSvZP1LtLjW/HANtRiGIELCt2aA=;
	b=elaT5RF9TktDN2ZaWv1etKRQbDDU3vdLD3oqX2BVRqHqebAhLeL4z6JVahKPiNLUTC
	TkSO2U0ne/9jkCmV5lgMSrWtHpaTOHM3bJm4odosg7rUxSebCv2NIPXQxiJ3lHgxnHGa
	xopuSHym5FuVyD57ZN9/EM8Lk/gjGyQCtpzyrnPnKoZtCfZwJPkoYGOlhKOVkFlj1/3E
	b/H8yqfHqGhHqjqWrX625vJiQmm5+KSHYaGQlYoXTwqWbbq3QyAaRV8ZI7fmKAo6rDb/
	jYuJxR28oYe08B8E0YhkjullVvIVidRTshD7sfZSjD7dEvE+iWFVs/vioHY5ZARErhcK
	C1Rg==
X-Gm-Message-State: AKS2vOzhr/YBamWq0MFpINU5CX2VB0WGHEzTqDLCcGR2Wp6dQRwLYQ03
	9f+MmZHEwqT1RRPz3BrAvkfo7KLQCMcm
X-Received: by 10.200.58.38 with SMTP id w35mr41290333qte.93.1497268327603;
	Mon, 12 Jun 2017 04:52:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Mon, 12 Jun 2017 04:51:47 -0700 (PDT)
In-Reply-To: <1497265861-2562-1-git-send-email-changhyeok.bae@gmail.com>
References: <1497265861-2562-1-git-send-email-changhyeok.bae@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Jun 2017 12:51:47 +0100
Message-ID: <CAJTo0LY_O+BctxPoraFsYpSnTBksq+Cz7e=UZT2bHYyzpt94aw@mail.gmail.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] openssl: Upgrade 1.0.2k -> 1.0.2l
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
X-List-Received-Date: Mon, 12 Jun 2017 11:52:07 -0000
Content-Type: multipart/alternative; boundary="94eb2c0ca10cccf4400551c1f256"

--94eb2c0ca10cccf4400551c1f256
Content-Type: text/plain; charset="UTF-8"

On 12 June 2017 at 12:11, Changhyeok Bae <changhyeok.bae@gmail.com> wrote:

> +do_install_ptest() {
> +    # exclude binary files or the package won't install
> +    for d in ssltest_old v3ext x509aux; do
> +        rm -rf ${D}${libdir}/${PN}/ptest/test/$d
> +    done
> +}
>

I think you meant do_install_ptest_append here?

Ross

--94eb2c0ca10cccf4400551c1f256
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 June 2017 at 12:11, Changhyeok Bae <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:changhyeok.bae@gmail.com" target=3D"_blank">changhyeok.bae@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5n1" cl=
ass=3D"a3s aXjCH m15c9c011b8ab5e36">+do_install_ptest() {<br>
+=C2=A0 =C2=A0 # exclude binary files or the package won&#39;t install<br>
+=C2=A0 =C2=A0 for d in ssltest_old v3ext x509aux; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${libdir}/${PN}/ptest/<wbr>test/$d<=
br>
+=C2=A0 =C2=A0 done<br>
+}<div class=3D"yj6qo ajU"><div id=3D":5o9" class=3D"ajR" tabindex=3D"0"></=
div></div></div></blockquote></div><br>I think you meant do_install_ptest_a=
ppend here?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--94eb2c0ca10cccf4400551c1f256--
