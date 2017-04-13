Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id A986377E4E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 15:58:07 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id n46so49153701qta.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 08:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3MbHSnUdtQbLbl19TMRv7FIteU2yzWsmwMzBj7UH93E=;
	b=sgtiM8t4VMLtsbwFFm8iHsG0ISPDX1Gpfxi26uGasoFgyEUTpKBwq65GzvHkdqxu1W
	INJboyHQiivwb2ju/xpheg5LcTqkN6gWW0nPewT24hM/pqloZp5JS1AlaK9Vsu6aqIes
	YYbT0DQagJH7juS/xeeDWmB2s09eY+Y1ltilEUkkZbPTjwek7jG+t0htX3fUCb0mi1ry
	JtBSQmXeL8sV6rnrhLk3dJhzYaRi6T0AP53c2GBxvmJgitoaHWHqOSnugNNOhY2blIq6
	cNijjDxi0G0CN92yqRydtdWYSbMgEnME+pAxoZ7eg8SRaAPFT1oqHoK2xZGUuiK98Lc0
	EbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3MbHSnUdtQbLbl19TMRv7FIteU2yzWsmwMzBj7UH93E=;
	b=aV4tacNlztYd5vF/txklafH0TIc+UEYt153E7mdPUnpCV1bpqlYnikyE82bRtiC+rZ
	cktrxtzzuzIRauqRss9nfcDamsRJY0rQqcIMlwMmgjFD3wPjaDz/XXDdIkNulmp0oVj9
	L3Q0/u6A14qrARRsZj4p7V2X+hrGVZv94sK7mNaDPwe/wOcO9/2KN3gBi5YwxYhUp7mC
	UjZVGre/uYbUQpYMDD7D0IuejHJi+uONXb+BPAfZiDTyeBBLFUFefde4XcpJTYCMQdwi
	kDoaGtNBaEOCGdo5MqRwPXw0htxvrEGPb8jCLmE/yqZs+aj9/VQ2cP1gscpCwHyhZ4yW
	8xqA==
X-Gm-Message-State: AN3rC/7dEmpxFtwsrIMRsikFLtz0jgFtI1fPD4i9eQ4pfLsfOb0z0KFf
	cDuX9tf9W6zaVHzH2hbaq2TRTR/LobsP
X-Received: by 10.200.3.105 with SMTP id w41mr3101035qtg.188.1492099089208;
	Thu, 13 Apr 2017 08:58:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 13 Apr 2017 08:57:48 -0700 (PDT)
In-Reply-To: <CALbNGRRoXXroY1_Kxc-2uunttn3dN+K4t68WWb1m0WwMvnrUBg@mail.gmail.com>
References: <20170413154453.24792-1-schnitzeltony@googlemail.com>
	<CABcZANnmLud2YgBd8nrNMzNrBGXULfhqs0rYg9YqTAi74T6kpw@mail.gmail.com>
	<CA+chaQf+NQpGT9s8P8rgYShP0un+=A5BYRO1rY71whE5ZntSrw@mail.gmail.com>
	<CALbNGRRoXXroY1_Kxc-2uunttn3dN+K4t68WWb1m0WwMvnrUBg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Apr 2017 16:57:48 +0100
Message-ID: <CAJTo0La4Uf5VWhz0Ou7_MH2AYFnBPs2OObt-FAkKJuYhJE49KQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: add unzip to HOSTTOOLS
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
X-List-Received-Date: Thu, 13 Apr 2017 15:58:08 -0000
Content-Type: multipart/alternative; boundary=f4030435cf582eac72054d0e6471

--f4030435cf582eac72054d0e6471
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13 April 2017 at 16:53, Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>
wrote:

> OK - but why do I see this error in do_unpack?
>

What recipe and task?

Ross

--f4030435cf582eac72054d0e6471
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 April 2017 at 16:53, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@g=
ooglemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":52g" class=3D"a3s aXjCH m15b68057677ed725">OK - but why do I see thi=
s error in do_unpack?<br></div></blockquote><div><br></div><div>What recipe=
 and task?</div><div><br></div><div>Ross=C2=A0</div></div><br></div></div>

--f4030435cf582eac72054d0e6471--
