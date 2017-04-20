Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3C06A72F21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 15:53:01 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id y63so19808173qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 08:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2a+LgcDS6VSR2UTZh1pHEYXXU9w+j+3GKO/brRwVMNY=;
	b=n/wPdWMq9ByQmJWh9V8JyHqUaaOxrdNwuEviQ26TYU4qSxHE7b8Z4ldr4noaOSMhCt
	JtCAAr5S4DRh0pwERxbMMEvgyc7S2+UBsg58Mv/KtQLqg4Vs+S7PS+5I+fnFzIMKraI0
	4LASrlM9b1BQ9X6p5YigA22FXXVX6NKye+IPan/DAiIWu2Vh/iQ4ScvvQK3jg1ohGqog
	ShDI8CN0A+qycM2UaOOTU1cqgDbz1KnLn+RkVpj6EFQtU8xk6EhyOxiBSDCh2awcSgyd
	d6lwlTpKm3v/1MJZT4aV05u95TukugZW1nwCM2pRHqMos3szSaQMJFZKGNTcdVnLCo1d
	j9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2a+LgcDS6VSR2UTZh1pHEYXXU9w+j+3GKO/brRwVMNY=;
	b=DPc/+YOGpYRec/h2TAJgTPIz0mP3g23OGeDzTOL4LI9aXCulxul5eOup6yIKW7bo1l
	PLoAmG4TV28CiAzyuKe8jWVpIqOIXotpaYNRGEABdfwAhp9oJBJXEAqrioOjad31jh6F
	vtCwCxof9SM8JgYV4FrUC3ZxaNT/86oZHwS4DQK/uzRj+z93Kbfe6qPiqE3LzKzEjesX
	dVhY20SXEzPHrZuc7Km1mGhZ4ScdBqi3ALy3XVxsmb0Ql+ivvlbgwo2SFi7tzWSnLRZT
	EtGo3apxMhj+BBZd8YjkTEFQ6DAwsUirraNM1UfIJr12/WA2mnETNoKS4NO9hbhC0CGD
	D5CQ==
X-Gm-Message-State: AN3rC/65rWOdofB4V3vj0PNOCUFhK9iBv4fk6dznBklu7s4rNxaCYdve
	WolrkvaPy+O9zSMS+tEbWbRlFcyoNBfS
X-Received: by 10.55.93.193 with SMTP id r184mr7955595qkb.221.1492703583245;
	Thu, 20 Apr 2017 08:53:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 20 Apr 2017 08:52:42 -0700 (PDT)
In-Reply-To: <603b4ff2-3bdd-4987-a4d5-5d79155db477@siemens.com>
References: <c2cca2c5-c122-e738-0008-4ff3119259bb@siemens.com>
	<603b4ff2-3bdd-4987-a4d5-5d79155db477@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Apr 2017 16:52:42 +0100
Message-ID: <CAJTo0LYpPHETuBbBpR0ObEngGzaN4RzzK0bKrYBExKKOCFTC3A@mail.gmail.com>
To: Gernot Hillier <gernot.hillier@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] tcf-agent: fix machine setting for arm64 build
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
X-List-Received-Date: Thu, 20 Apr 2017 15:53:02 -0000
Content-Type: multipart/alternative; boundary=001a114ed8eed5bdd3054d9b2294

--001a114ed8eed5bdd3054d9b2294
Content-Type: text/plain; charset=UTF-8

On 20 April 2017 at 09:15, Gernot Hillier <gernot.hillier@siemens.com>
wrote:

>  EXTRA_OEMAKE = "MACHINE=${MAKE_ARCH} OPSYS=${MAKE_OS} 'CC=${CC}'
> 'AR=${AR}'"
>

Please use git-send-email to submit patches, because this line arrived
wrapped when it shouldn't be which meant the patch had to be applied
manually.

Ross

--001a114ed8eed5bdd3054d9b2294
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 April 2017 at 09:15, Gernot Hillier <span dir=3D"ltr">&lt;<a href=3D"=
mailto:gernot.hillier@siemens.com" target=3D"_blank">gernot.hillier@siemens=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2j=
u" class=3D"a3s aXjCH m15b8a7efd2c1442e">=C2=A0EXTRA_OEMAKE =3D &quot;MACHI=
NE=3D${MAKE_ARCH} OPSYS=3D${MAKE_OS} &#39;CC=3D${CC}&#39;<br>
&#39;AR=3D${AR}&#39;&quot;<br></div></blockquote><div><br></div><div>Please=
 use git-send-email to submit patches, because this line arrived wrapped wh=
en it shouldn&#39;t be which meant the patch had to be applied manually.</d=
iv><div><br></div><div>Ross</div></div><br></div></div>

--001a114ed8eed5bdd3054d9b2294--
