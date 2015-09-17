Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 21D3B76E2E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 20:01:27 +0000 (UTC)
Received: by qgez77 with SMTP id z77so22534276qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 13:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WOa3M0qhSaXhHIXSkKTM2ZwmvLAxVJTGBSa4xVxHNao=;
	b=QFFWfwyjzfYQSq39437UHzv0Vd3zc9y869bRfqM+Vy0fhCg/QbVBwQQy1NEKAm2ASW
	a1v/sIzxNPOLCv4ngK0Yzs77N3eiLwmh6LhrdwcKNQW62YHaIimpvs/uJPWNNO8vcIn+
	lLiUQJ/plFubz1Y8b2507loh2eVkzwUfqCJrlboGnap6hVYuUerCLXir1NlL42EYZdtH
	14I9lJFeajBbwl8doHwfmF2eeFYbmK3zP/hOQfuFpk/IuZQH+e0WDyPaQ8YdtCNzzEq5
	2MueQe/4bESWV4ycqhtiPYtg9XlbyvbEPjF+wSX8XH9DyJksHFwOSuyOD41MnJDAgas4
	ovbw==
X-Gm-Message-State: ALoCoQnBkNWygiqorkd827baIoZAH+ubOlK1+14EjYqx36PcsH5vzqWHtrUmJ+8trzF/jHypLvBC
X-Received: by 10.140.165.196 with SMTP id l187mr1840681qhl.93.1442520087579; 
	Thu, 17 Sep 2015 13:01:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 17 Sep 2015 13:01:08 -0700 (PDT)
In-Reply-To: <bfec72e383e99ef94ded6164ae7a313853c5240e.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<bfec72e383e99ef94ded6164ae7a313853c5240e.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Sep 2015 21:01:08 +0100
Message-ID: <CAJTo0LZVqV-nzRRB-H1v=KOms-OOSyEL5J3QgwwA7k7e+AcmAA@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] prserv/db: Use DELETE instead of WAL journal mode
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
X-List-Received-Date: Thu, 17 Sep 2015 20:01:28 -0000
Content-Type: multipart/alternative; boundary=001a1134f67466f4bf051ff6e1e1

--001a1134f67466f4bf051ff6e1e1
Content-Type: text/plain; charset=UTF-8

On 15 September 2015 at 15:59, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> -        self.connection.execute("PRAGMA journal_mode = WAL;")
> +        self.connection.execute("PRAGMA journal_mode = DELETE;")
>

Richard probably has a better memory than me but I seem to recall that WAL
was a pretty serious speed improvement for the local host case.  Did you
benchmark the impact this change has?

Ross

--001a1134f67466f4bf051ff6e1e1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 September 2015 at 15:59,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leo=
nardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandova=
l.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D":1u3" class=3D"a3s" style=3D"overflow:hidden">-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 self.connection.execute(&quot;PRAGMA journal_mode =3D =
WAL;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.connection.execute(&quot;PRAGMA journal_m=
ode =3D DELETE;&quot;)</div></blockquote></div><br>Richard probably has a b=
etter memory than me but I seem to recall that WAL was a pretty serious spe=
ed improvement for the local host case.=C2=A0 Did you benchmark the impact =
this change has?</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a1134f67466f4bf051ff6e1e1--
