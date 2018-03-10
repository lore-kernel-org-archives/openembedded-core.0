Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 122EE788DA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 04:20:51 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id z10so2091528pfh.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 20:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=v78H1U/M41gbVAHZi5yF9Am9kaomYX2aCMayeSiZtMs=;
	b=bBIk15FlhCAg6S+y2FTvjt303mBzXw9r9a6Xy1AOIvqa8XVIG1lQd94uXauLZU6APC
	jQ9c3aEj3NlSeVWb74J0D2m/ITfvHgINAXPjqVEsIa9BicaclVXdb1amYGf34k0UVgil
	t1RjX/+Uiz/Ku3DLDMFZ+eQOMXvqh9ubuXBqaeHLQWyxa4macvAVn24vkKfi0Dhe/8Rb
	BX2J5uBaSuSVJyqVxq2oE323f/eUbCvlDwBK2qvPNj3JuYmS2jZScL68La/mWSrqkDrN
	pdje+oQ7gUBJdq0t/O5OI36iduRFn4RK4PC8B8Xp11Xk+62qLNorjPrknC2siph6idhP
	KyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=v78H1U/M41gbVAHZi5yF9Am9kaomYX2aCMayeSiZtMs=;
	b=kpWvUg8YO4zGcHRiJ2d89ReXWLQgS+6Kyhx1de0tav04sWYD2nNAOHNzJURyPNTJc9
	ml3kH7lnSE9/XuTWlXZReeWahtwac0RedtOTkR2jwkdh5vv9u8GHfhSzhqvF9tGbbErm
	zGGWKRU13Ul4OXQOs37Aj/32pZ4oGWBeRdpMBmcLLRMy/G/tV2tv+3B8qR1IkDx7EhwY
	QKrKNEmvYh7FWL1vfLoLw9Qa20ZHxftqMD2vnvffd88J/HLPdai7wrZuyVV4yc+1I5uN
	SUqHVi4VPYTFBvYlR6vglTHTZeRBW30t94bgO1cTR2xqHgF0JfLAIw0ggIDj40oJLX5K
	2gcw==
X-Gm-Message-State: AElRT7Fl+xnMr4vfFrzI8xM7SjeOi4eG76VviwU0EJ+mySviKfI1uvpn
	UWAYcv6kxMjFCBMa18Oq+vqPVpRrOfNanqqhQkQ=
X-Google-Smtp-Source: AG47ELv8K8x+v8ktKQ+4mGNDeTfl1yaq//Mcwq5YDxzT42pGU5RRxf+bYXo1omCrR+nxjTRk8clPpXAb3ePs7PeTo/M=
X-Received: by 10.99.170.73 with SMTP id x9mr704481pgo.393.1520655653122; Fri,
	09 Mar 2018 20:20:53 -0800 (PST)
MIME-Version: 1.0
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1sqVAhoAK-Op+fg+kkA2HvH3h_acvEN=qckH3A5-tJEF8A@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B64C66B28D@ORSMSX112.amr.corp.intel.com>
	<CAJ86T=VUgB7mWM7mrSGpHPipWy5v6bir3Puz6Wz2C7QAD2cJ3g@mail.gmail.com>
In-Reply-To: <CAJ86T=VUgB7mWM7mrSGpHPipWy5v6bir3Puz6Wz2C7QAD2cJ3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Mar 2018 04:20:42 +0000
Message-ID: <CAMKF1sq9wfRTcgo-vZLW2pVSVu2mbq9qtuAfK5WxFv5GRbrQKQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH v2] gcc6.4 upgrade
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
X-List-Received-Date: Sat, 10 Mar 2018 04:20:52 -0000
Content-Type: multipart/alternative; boundary="94eb2c1bfbbc07b7440567073cd6"

--94eb2c1bfbbc07b7440567073cd6
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 9, 2018 at 6:55 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Fri, Mar 9, 2018 at 6:25 PM, Bystricky, Juro
> <juro.bystricky@intel.com> wrote:
> > This was morty upgrade, which did not have those patches to begin with,
> I did not remove them.  The patches were not in rocko either, in the end I
> got them from master  (gcc6.4 was eventually removed completely),
> > Backporting of ARM specific patches was not the objective. ( I was not
> aware that 6.4 had an ARM specific regression which broke the pi3 builds).
> > Long story short, all patches should be there now, please review them,
> see the commit message for more details.
> > I'll make sure all other gcc6 upgrades contain the ARM patches as well.
>
> Comparing my morty branch (with update to gcc 6.4 by backporting
> incremental gcc updates from master) and today's morty-next (which
> updates gcc 6.2 -> 6.4 with a single commit) the only differences are:
>
>  - My branch lacks all the new x86 specific patches (OK, since they
> are appearing here first)
>
>  - Today's morty-next is lacking one patch, which was added to oe-core
> master as a backport (from gcc master) to gcc 6.3:
>
>
> http://git.openembedded.org/openembedded-core/commit/?id=d2631f45a057c53797b7ba657662f35f66a2b04e
>
> I don't have any strong opinions on the patch, but presumably it fixed
> some issue Khem was seeing, it still applies cleanly to gcc 6.4 and we
> have it in rocko so on balance I'd say it should probably be in morty
> too.
>

Yes this patch fixes an arm regression

>
> Overall this looks great though and I'm very happy to see gcc updates
> landing in the release branches. Thanks Juro!
>

--94eb2c1bfbbc07b7440567073cd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Fri, Mar 9, 2018 a=
t 6:55 PM Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurd=
y@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, =
Mar 9, 2018 at 6:25 PM, Bystricky, Juro<br>
&lt;<a href=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.byst=
ricky@intel.com</a>&gt; wrote:<br>
&gt; This was morty upgrade, which did not have those patches to begin with=
, I did not remove them.=C2=A0 The patches were not in rocko either, in the=
 end I got them from master=C2=A0 (gcc6.4 was eventually removed completely=
),<br>
&gt; Backporting of ARM specific patches was not the objective. ( I was not=
 aware that 6.4 had an ARM specific regression which broke the pi3 builds).=
<br>
&gt; Long story short, all patches should be there now, please review them,=
 see the commit message for more details.<br>
&gt; I&#39;ll make sure all other gcc6 upgrades contain the ARM patches as =
well.<br>
<br>
Comparing my morty branch (with update to gcc 6.4 by backporting<br>
incremental gcc updates from master) and today&#39;s morty-next (which<br>
updates gcc 6.2 -&gt; 6.4 with a single commit) the only differences are:<b=
r>
<br>
=C2=A0- My branch lacks all the new x86 specific patches (OK, since they<br=
>
are appearing here first)<br>
<br>
=C2=A0- Today&#39;s morty-next is lacking one patch, which was added to oe-=
core<br>
master as a backport (from gcc master) to gcc 6.3:<br>
<br>
=C2=A0 <a href=3D"http://git.openembedded.org/openembedded-core/commit/?id=
=3Dd2631f45a057c53797b7ba657662f35f66a2b04e" rel=3D"noreferrer" target=3D"_=
blank">http://git.openembedded.org/openembedded-core/commit/?id=3Dd2631f45a=
057c53797b7ba657662f35f66a2b04e</a><br>
<br>
I don&#39;t have any strong opinions on the patch, but presumably it fixed<=
br>
some issue Khem was seeing, it still applies cleanly to gcc 6.4 and we<br>
have it in rocko so on balance I&#39;d say it should probably be in morty<b=
r>
too.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes this patch f=
ixes an arm regression=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Overall this looks great though and I&#39;m very happy to see gcc updates<b=
r>
landing in the release branches. Thanks Juro!<br>
</blockquote></div></div>

--94eb2c1bfbbc07b7440567073cd6--
