Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2622276FFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 10:53:18 +0000 (UTC)
Received: by qgx61 with SMTP id 61so65775752qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 03:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sBcT90k0VW0AF/Q42x/xUG4vKHHLrihuo3UIhmzaBuA=;
	b=dCEEBXBqiWmZvYalgL5xhNkE7BvjHNafZTBC9TupMmzRBPtvIKi3xe5FsIfDmNqzQY
	UeFyktGH1GDT4zZXTm2IM64KA0OXezODjUkb6PqEa0xeZ2NSyDty42yMY+XuJQIj39vF
	zUtyE3pYmX0bURTnR5q6FaoXlOmr4Rrzu4Z1Q/iDxgHwhLSrlwWqtz53Evdn5DsZl2Au
	oEuJGAai4VqWilJ/wFDd33sQtZHXuzpqHdOmMJ2a5xw0E2ZWMl9pSACvWLCIganURkSa
	jkXBbN6Yz/df+7MI6SFWfC2hxTulbIZPrsAbF5gvMYzyD+YiCIuFZl0bDA52iz0vdbFP
	ZxNw==
X-Gm-Message-State: ALoCoQmt0vwa0MHBfuD8Rlrhw5Ru+D+Vzbc727V1/uDLyGfBV7ZoFW3YRC760CMnm8exOFfuyv5L
X-Received: by 10.140.232.150 with SMTP id d144mr5387010qhc.17.1443178399163; 
	Fri, 25 Sep 2015 03:53:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 25 Sep 2015 03:52:59 -0700 (PDT)
In-Reply-To: <56052034.4000702@windriver.com>
References: <1443092679-216053-1-git-send-email-wenzong.fan@windriver.com>
	<CAHiDW_FZtt9v_tGJT-m_LcEqBS-YThPTE=zoFpr=aQVt7aGPtQ@mail.gmail.com>
	<CAJTo0LaJeeLRqmADYQ2DNGWs9VxwJMCRViwSvEX84FEbqVVTYA@mail.gmail.com>
	<56052034.4000702@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Sep 2015 11:52:59 +0100
Message-ID: <CAJTo0LbKPTvbRj4uUW=+D3g2Dz8v9_aeXJc64QvQMXe8TzsjEA@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnutls: cleanup buildpaths from gnutls.pc
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
X-List-Received-Date: Fri, 25 Sep 2015 10:53:22 -0000
Content-Type: multipart/alternative; boundary=001a11354852d4b983052090276a

--001a11354852d4b983052090276a
Content-Type: text/plain; charset=UTF-8

On 25 September 2015 at 11:21, wenzong fan <wenzong.fan@windriver.com>
wrote:

> I'll investigate more about that. Do you know where the difference from?
>

I'd immediately suspect the lib/lib64 path confusing pkg-config's logic on
automatic library path removal.  In the non-multilib case it generates a
-L[long path] but determines that the path is in the default search path so
can remove it.

Ross

--001a11354852d4b983052090276a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 September 2015 at 11:21, wenzong fan <span dir=3D"ltr">&lt;<a href=3D=
"mailto:wenzong.fan@windriver.com" target=3D"_blank">wenzong.fan@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":660=
" class=3D"a3s" style=3D"overflow:hidden">I&#39;ll investigate more about t=
hat. Do you know where the difference from?<br></div></blockquote></div><br=
>I&#39;d immediately suspect the lib/lib64 path confusing pkg-config&#39;s =
logic on automatic library path removal.=C2=A0 In the non-multilib case it =
generates a -L[long path] but determines that the path is in the default se=
arch path so can remove it.</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a11354852d4b983052090276a--
