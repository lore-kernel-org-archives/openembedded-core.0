Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA4D6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 14:07:28 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id v1so5004577yhn.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 07:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=iTWnkcaXlGSYW3geRTHshSaIN0ofF7TVWlf/MvKygRs=;
	b=OHB+lsxGcq+8o8qhksU5HFjsMuRRa4HeYmwOVfGdbi4k7IOnZ7lJR6A4wLTVXzlELf
	9UGdaoYneiVCyhQakp9Ir1Hk4ecqBBOnEUoRGJtcD4UP1hVXOcgZJjiCWXADTb/sm4Ci
	+R435ULDNf8jMR01IZ5O4OV9UfUXdmcZjZNvPd1rBq308mkHi/kxuMvMVWBNnbK3fkpy
	Pm9sQymHjlHqMgyhG5EzEZs4MzAQxSdCrKzmcRzp/gjVAxh7w5/8thy5RL5q+ognclCF
	m3XTA7ngGo2OEOl7EWmBF2jFkttGPiwJo3kc5Pxzf+ClKXyu8yBgvgopNjE5YCzHPufr
	ypOw==
MIME-Version: 1.0
X-Received: by 10.236.44.102 with SMTP id m66mr3708683yhb.136.1413295650095;
	Tue, 14 Oct 2014 07:07:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Tue, 14 Oct 2014 07:07:28 -0700 (PDT)
In-Reply-To: <aae9562924c34959bdc266d1bbfbfd81@CY1PR0301MB0700.namprd03.prod.outlook.com>
References: <1412522062-31211-1-git-send-email-otavio@ossystems.com.br>
	<aae9562924c34959bdc266d1bbfbfd81@CY1PR0301MB0700.namprd03.prod.outlook.com>
Date: Tue, 14 Oct 2014 11:07:28 -0300
X-Google-Sender-Auth: xDW40Zpxep2aPHSQhRaJ-Fld1ck
Message-ID: <CAP9ODKqKhP_Ea4=+GFQN3bUVvK4B3ZhZ=htd+GuOttABeKYC1g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Lauren Post <Lauren.Post@freescale.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: Reverse runtime symlinks should be tied to package generation
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
X-List-Received-Date: Tue, 14 Oct 2014 14:07:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Lauren,

On Tue, Oct 14, 2014 at 10:23 AM, Lauren Post <Lauren.Post@freescale.com> w=
rote:
> This patch is breaking our imx6slevk builds which do not support gles2.  =
  I can build slevk on its own but not after another machine that supports =
gles.  I get an error with the runtime-reverse pkgdata for imx6slevk lookin=
g for gles2 which is not provided on this machine.
>         imx6slevk/pkgdata/runtime-reverse/libgles2-mx6
>
> Without this patch they work fine building after other imx machines that =
do support gles2 before building imx6slevk.
>
> I know Otavio needs this for mx53 but it needs more work for inclusion wi=
th machines that do not support gles2.

I don't need it, it is a bug which needs to be fixed instead of
reverting it and changing the point of failure.

I reproduced the issue but couldn't yet find a fix.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

