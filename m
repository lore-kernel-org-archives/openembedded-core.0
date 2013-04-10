Received: from mail-we0-f180.google.com ([74.125.82.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UPyb5-0006AV-RT
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 19:14:15 +0200
Received: by mail-we0-f180.google.com with SMTP id r5so521008wey.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 09:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=d6kgCVU3CR8Fam6NiDGYLMgJqZbcwdSgbF3gXbGYAgA=;
	b=IM2yfuZndBZSZni5O/hBTBHaQXz1neDudSWS8gATjy6EOj6ZeH4N/R89kEUmU8x5uU
	WVA/6Cd+vlNoy1ZkAPuJRUnxnJPJYXmox7nBRe4GbBS245hbunqGjYjV649a3aHapBSS
	4KgE/LKoLiCvkutDgwXjaRGPoqiVaKcxuE5b8SYINLONAw3fEXGmTejC91O5d7t47/jh
	Qu4KMw9Rsdov2VGzQSeW0pfszgZHHQAos2d49AoAJh5INlXaOH+lc2kT+QV5uytuXKHz
	7ZTUTOSwFlDrlA/vxcMn8pD7JGvc/cvjrYRURhYbbbbybJaSq7qMrfFxhoRmrv+6Rdj4
	PiuQ==
MIME-Version: 1.0
X-Received: by 10.180.73.6 with SMTP id h6mr27977491wiv.27.1365613010087; Wed,
	10 Apr 2013 09:56:50 -0700 (PDT)
Received: by 10.194.167.73 with HTTP; Wed, 10 Apr 2013 09:56:50 -0700 (PDT)
In-Reply-To: <929FF6AF-2956-41F0-92E5-E08C5C966909@dominion.thruhere.net>
References: <1365517275-30955-1-git-send-email-m.cavallini@koansoftware.com>
	<CAJTo0LZ6tKy0pDvPzdNw+z80NkXHB0kX7HxntsY_Hd+u3pUPwg@mail.gmail.com>
	<20130409174646.GD2474@jama>
	<C59D9F91-BDCD-496F-B6DA-8C6BB5990939@dominion.thruhere.net>
	<20130409190616.GE2474@jama>
	<929FF6AF-2956-41F0-92E5-E08C5C966909@dominion.thruhere.net>
Date: Wed, 10 Apr 2013 12:56:50 -0400
Message-ID: <CAHUNapRiB5a6XPwSC_geg+QML4raP2LHHfDCUe__U0hc=WDRSA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Marco Cavallini <m.cavallini@koansoftware.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe][meta-oe][PATCH 2/4] xterm: add latest version of xterm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 17:14:17 -0000
Content-Type: multipart/alternative; boundary=f46d043c7f045df8c104da048ef0

--f46d043c7f045df8c104da048ef0
Content-Type: text/plain; charset=ISO-8859-1

This whole thread has me thoroughly confused. Isn't xterm_277.bb already
part of meta-openembedded?

$ find . -name "*xterm*" -print
./meta-openembedded/meta-oe/recipes-graphics/xorg-app/xterm_277.bb

And from what I can tell, it was added over a year ago by Koen:

$ git log meta-oe/recipes-graphics/xorg-app/xterm_277.bb
commit a38efd953c0bfef80fd6819c8339c1d1e79364b3
Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date:   Thu Dec 13 10:35:26 2012 +0000

    xterm: added gnu-configize for AArch64 support

    Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

commit 253b1d7bc35c5a2a12dd6a7f2f0c034a34bfae18
Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri Jan 13 09:41:51 2012 +0100

    xterm: update to 277

    License checksum changed due to date changes

    Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

--f46d043c7f045df8c104da048ef0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This whole thread has me thoroughly confused. Isn&#39;t <a=
 href=3D"http://xterm_277.bb">xterm_277.bb</a> already part of meta-openemb=
edded?<div><br></div><div><div>$ find . -name &quot;*xterm*&quot; -print</d=
iv>
<div>./meta-openembedded/meta-oe/recipes-graphics/xorg-app/<a href=3D"http:=
//xterm_277.bb">xterm_277.bb</a></div></div><div><br></div><div style>And f=
rom what I can tell, it was added over a year ago by Koen:</div><div style>
<br></div><div style><div>$ git log meta-oe/recipes-graphics/xorg-app/<a hr=
ef=3D"http://xterm_277.bb">xterm_277.bb</a></div><div>commit a38efd953c0bfe=
f80fd6819c8339c1d1e79364b3</div><div>Author: Marcin Juszkiewicz &lt;<a href=
=3D"mailto:marcin.juszkiewicz@linaro.org">marcin.juszkiewicz@linaro.org</a>=
&gt;</div>
<div>Date: =A0 Thu Dec 13 10:35:26 2012 +0000</div><div><br></div><div>=A0 =
=A0 xterm: added gnu-configize for AArch64 support</div><div>=A0 =A0=A0</di=
v><div>=A0 =A0 Signed-off-by: Marcin Juszkiewicz &lt;<a href=3D"mailto:marc=
in.juszkiewicz@linaro.org">marcin.juszkiewicz@linaro.org</a>&gt;</div>
<div>=A0 =A0 Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa=
@gmail.com">Martin.Jansa@gmail.com</a>&gt;</div><div><br></div><div>commit =
253b1d7bc35c5a2a12dd6a7f2f0c034a34bfae18</div><div>Author: Koen Kooi &lt;<a=
 href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.thruhere.net</a>&=
gt;</div>
<div>Date: =A0 Fri Jan 13 09:41:51 2012 +0100</div><div><br></div><div>=A0 =
=A0 xterm: update to 277</div><div>=A0 =A0=A0</div><div>=A0 =A0 License che=
cksum changed due to date changes</div><div>=A0 =A0=A0</div><div>=A0 =A0 Si=
gned-off-by: Koen Kooi &lt;<a href=3D"mailto:koen@dominion.thruhere.net">ko=
en@dominion.thruhere.net</a>&gt;</div>
</div></div>

--f46d043c7f045df8c104da048ef0--
