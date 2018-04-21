Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id A8C9A745FC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 18:09:43 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id a13so1098697pgu.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 11:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cBuvrZg8EEJFjLta9gIdLXmaoH7RCNIDiDJYF8AJ/wI=;
	b=PF5RNgO1HpqA6tCHhV5jK9gtCCAobyO1MMjkFSXdpcSZBGdI0KllM9wvc4ANiGl2C8
	i9Ux9kjyPXDHy1qIpU9utAI58sxiLRPG0ZDEsDr5q6mtoy0T40vKCmqnU6ID7beDHo7r
	3YWLKWcAiQufNd60sKc7Y/VkUsAjehlacLl7CRMWnQfdQaqYxW2cWpZyouQKwGqGaFIW
	OOe88WhivJYSZMsLrwLMf7haK9cBS5WkGpa0XolfuASmCiA7A6vKXBM1JO3puLhDfwQW
	sstSgDK30Ebe2OePLV13F8sjYM1wsomIvKDqg+gSnAkCuH9sCrekLq9eouIClxpf7wRh
	0bRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cBuvrZg8EEJFjLta9gIdLXmaoH7RCNIDiDJYF8AJ/wI=;
	b=Gfr96B/wjaISPFGHaw/RblV26/4dT0gVGikNEnWvdFFdpoiIuy5O2/cZYrzidBe0SV
	GG2MKaerWmyIqQITEuiHGWZCaU78wCN//A5YHftuuoyaLSbjUxVZTxl8vW6H57HHIIfz
	q4FmN3MW8UcYYJnIVzj6QDg4xZmvKhJWKemBTqUFblHCBboW5CeZW8thDnPHqVEfHzfu
	coTeauYZyUvWyFwKTWtOasf8wz1LhR2RblrylPEc/H7oxsT2Hz7R1DGjI0VDuvaiW0LA
	1qZvM81ELtk1u2kX+vwE7C5CT7yOvwzGmfbXXeMVad32VekOqBKVciUm4dMxZt3oa6kt
	c0Jw==
X-Gm-Message-State: ALQs6tDKEh4AjVLpFzW1Zr54CTLxKWOnLhkjvCI4ydhu0sKTzwS2721g
	VzlyBGStHijeFt32WPLBwc4alT9elRi4bt39Xic=
X-Google-Smtp-Source: AIpwx4+cV4hsL4LDiesTryV31Sdr8xc7txLc2AQhMWhWtsrXmug8bki1hIotgyY/wFVgtJKxoEnt0QBN/VMWju1MMhw=
X-Received: by 2002:a17:902:59ce:: with SMTP id
	d14-v6mr12636387plj.253.1524334184400; 
	Sat, 21 Apr 2018 11:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAJTo0LYPdtHXqbKR5nm_EVzQ07Pju476n3Tahxp_zf=STW=LRw@mail.gmail.com>
	<CAJ86T=VfGDpng=GRuZVDBLm_2Pgh6pEKm3+1KpeN+kXAweLyvg@mail.gmail.com>
In-Reply-To: <CAJ86T=VfGDpng=GRuZVDBLm_2Pgh6pEKm3+1KpeN+kXAweLyvg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Apr 2018 18:09:33 +0000
Message-ID: <CAMKF1srnf-2H_W33odQMo7-oMg1TVLim0AzKsZxby+gvPfQn_Q@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of Sumo
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
X-List-Received-Date: Sat, 21 Apr 2018 18:09:43 -0000
Content-Type: multipart/alternative; boundary="000000000000948d35056a5fb568"

--000000000000948d35056a5fb568
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 20, 2018 at 3:09 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Fri, Apr 20, 2018 at 2:57 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > Hi,
> >
> > We'll hopefully be firing the 2.5 RC build on Monday, so I did a build
> > today to see where we stand. As is typical we got two new failures on
> > the autobuilder...  My test build included the pseudo bump which
> > caused an almost complete rebuild, which is a great way to shake out
> > intermittent failures.
> >
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=12704
> > Go appears to be using the target CFLAGS when using the host compiler,
> > with predictable failures when the host is old and doesn't support new
> > flags.
>
> Maybe worth resurrecting something like:
>
>
> http://lists.openembedded.org/pipermail/openembedded-core/2016-February/118212.html
>
> to flush out similar issues?


The issue at hand is a bit different where portions
Are built using native compiler in target recipe itself simple fix would be
to pass right c flags

This patch in itself does have merits and we could consider this for 2.6 it
would be intrusive but would result in cleanup

>
>
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=12705
> > u-boot build failure
> >
> > CC'ing the usual maintainers of those two recipes, if you get a moment
> > to look at these then that would be much appreciated.
> >
> > I'll also say that if you have any outstanding patches that *need* to
> > be in 2.5 and can't wait for 2.5.1 then say so now, or forever hold
> > your peace (and submit them for master/backport to 2.5.1).
> >
> > Regards,
> > Ross
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000948d35056a5fb568
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Fri, Apr 20, 2018 =
at 3:09 PM Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccur=
dy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri,=
 Apr 20, 2018 at 2:57 PM, Burton, Ross &lt;<a href=3D"mailto:ross.burton@in=
tel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; We&#39;ll hopefully be firing the 2.5 RC build on Monday, so I did a b=
uild<br>
&gt; today to see where we stand. As is typical we got two new failures on<=
br>
&gt; the autobuilder...=C2=A0 My test build included the pseudo bump which<=
br>
&gt; caused an almost complete rebuild, which is a great way to shake out<b=
r>
&gt; intermittent failures.<br>
&gt;<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12704" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D12704</a><br>
&gt; Go appears to be using the target CFLAGS when using the host compiler,=
<br>
&gt; with predictable failures when the host is old and doesn&#39;t support=
 new<br>
&gt; flags.<br>
<br>
Maybe worth resurrecting something like:<br>
<br>
=C2=A0 <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core=
/2016-February/118212.html" rel=3D"noreferrer" target=3D"_blank">http://lis=
ts.openembedded.org/pipermail/openembedded-core/2016-February/118212.html</=
a><br>
<br>
to flush out similar issues?</blockquote><div dir=3D"auto"><br></div><div d=
ir=3D"auto">The issue at hand is a bit different where portions</div><div d=
ir=3D"auto">Are built using native compiler in target recipe itself simple =
fix would be to pass right c flags=C2=A0</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">This patch in itself does have merits and we could conside=
r this for 2.6 it would be intrusive but would result in cleanup</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><br>
<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12705" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D12705</a><br>
&gt; u-boot build failure<br>
&gt;<br>
&gt; CC&#39;ing the usual maintainers of those two recipes, if you get a mo=
ment<br>
&gt; to look at these then that would be much appreciated.<br>
&gt;<br>
&gt; I&#39;ll also say that if you have any outstanding patches that *need*=
 to<br>
&gt; be in 2.5 and can&#39;t wait for 2.5.1 then say so now, or forever hol=
d<br>
&gt; your peace (and submit them for master/backport to 2.5.1).<br>
&gt;<br>
&gt; Regards,<br>
&gt; Ross<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000948d35056a5fb568--
