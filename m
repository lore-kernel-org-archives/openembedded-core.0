Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 83DF870621
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 17:34:48 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id s18so2034060lam.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 10:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RfZ2FmKKTS0GUbpXMISlim9IOf3OA4xzYf2Dte9KuUY=;
	b=HOb9+hYGFv74PJWkQJOK0a/OK20/Fd8ClBCinQX/8X52uYYZlNM7sHanM/UPlzglYQ
	AZJyVFhz8mG4+5GtkOxETASD5ZtT7tBZlxGV2e7Oi92NxB2qDceGcGg5oKJI9G4NnYsz
	2aFmAvbGgl8+S8dYPNrd+pfAJiFikbn547LSFAOI6aIoagWi0BLUPCigPGIMpvrBsOLl
	H3NQghNs/IlMcbJGKocKhPbJlSF2lK/o5M9nb1guiiA/jjjVZVuocRTxZQnNS+uqjRSq
	oc/DyaFYtoQW5iUsqZRKT+7TDxSCUbKWbhFEK0ulMwlgt6M2vYdSyyKMwkVLPSM+PbLd
	u/DA==
MIME-Version: 1.0
X-Received: by 10.112.144.162 with SMTP id sn2mr26850491lbb.49.1405618489451; 
	Thu, 17 Jul 2014 10:34:49 -0700 (PDT)
Received: by 10.114.216.35 with HTTP; Thu, 17 Jul 2014 10:34:49 -0700 (PDT)
In-Reply-To: <CAOLEWZXde+2T1bS4ARKMv0cy4KGEZtXHVhtaab0E--49q6wsHA@mail.gmail.com>
References: <CAOLEWZXde+2T1bS4ARKMv0cy4KGEZtXHVhtaab0E--49q6wsHA@mail.gmail.com>
Date: Thu, 17 Jul 2014 10:34:49 -0700
Message-ID: <CANx9H-BaAyDGhz15XdeGZED9=9inevH_00ctZW_vo05aB8FytA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Stephen Arnold <stephen.arnold42@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libgcrypt workaround
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
X-List-Received-Date: Thu, 17 Jul 2014 17:34:56 -0000
Content-Type: multipart/alternative; boundary=047d7b3a8776c0f3b904fe670e8c

--047d7b3a8776c0f3b904fe670e8c
Content-Type: text/plain; charset=UTF-8

Steve,

That workaround fixes the problem, but I think there is something
fundamentally wrong deeper in. Looks like the culprit is pkgconfig.patch
for libgpg-error. Testing and will send patch.


On Wed, Jul 16, 2014 at 6:47 PM, Stephen Arnold <stephen.arnold42@gmail.com>
wrote:

> OE-devs/Tim:
>
> Here's the basic recipe patch; not sure if I should submit it formally or
> not.  Maybe a configure patch is preferred?  Feedback welcome.
>
> Thanks, Steve
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--047d7b3a8776c0f3b904fe670e8c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Steve,<br><br></div>That workaround fixes the problem=
, but I think there is something fundamentally wrong deeper in. Looks like =
the culprit is pkgconfig.patch for libgpg-error. Testing and will send patc=
h.<br>
</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed,=
 Jul 16, 2014 at 6:47 PM, Stephen Arnold <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:stephen.arnold42@gmail.com" target=3D"_blank">stephen.arnold42@gmail.=
com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div>OE-devs/Tim:<br><=
br></div>Here&#39;s the basic recipe patch; not sure if I should submit it =
formally or not.=C2=A0 Maybe a configure patch is preferred?=C2=A0 Feedback=
 welcome.<br>
<br></div>Thanks, Steve<br>
</div>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></blockquote></div><br></div>

--047d7b3a8776c0f3b904fe670e8c--
