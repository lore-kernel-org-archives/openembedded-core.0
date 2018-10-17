Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 986E479AB1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 14:50:29 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 193-v6so2480661wme.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 07:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NqVh6X7Go+J7hRDNbkgaMLYleaH9j/nWQVAS/NT0iMw=;
	b=Nf8SwPpXPfm2QiwB5YPmPvHeGC9rmUc0jHZ/+afjPNFUqaqRRqP9KGixgShD4y/2AH
	A5RoLEI9jvGrJuwKApYWksfhC02/TSzl9So+1007T4pnR7wCRWyZQHi79/d/PE4aRjKT
	RTl1MaELyDiKjdRCKeeLusLsRI/kV63l5aChCJlb+JdL1sCv80RiRu/hzoEbZwmGIdVC
	jAl/QI1D+XLgFZsjXLW8catwNJtCV4nRWhanLoJyrrwjJCjymPR4xGZvXr9thh79xSsT
	17/55LNTHj1FTpGXnXKZn1e34tYtNXDtQ2r1HMTtLRVVrVPDU0dwV1+52R/WCuaYkcpW
	Leng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NqVh6X7Go+J7hRDNbkgaMLYleaH9j/nWQVAS/NT0iMw=;
	b=IaRPI+yak1MsuYc1qLkdUgooNsmCkqeiD8ix9VMgoTaDF2Lkf6W6dAw+dNl0F5VSbO
	AVR+YlQRXAgXEkZRCC2d2n/2+3fKA/tFJaqL6Bkc8zhHrzE+WWN0cIW8rlE+7A/HtJsx
	Q1xfLkorgdhZ/gGm64xqqqPddbwE06sUtEyJIXf/gzIv2b1uKrM/I1CByEe0hXn2zdC+
	ItrJ4316Bd5w00AZ0JXsQgm5m1eczkmtUkCOohKSnvbgZPpyhp92yjMCpOzNCq4zcAfZ
	BOJbKo6xPM+TL7afeAxNH2ar8Ysk2RFfLZcqMLJPpqI5VfnkjWux3sQZ8PHA5F5eWlOF
	w3nw==
X-Gm-Message-State: ABuFfojU+lc8IaZAqWLzT2MWNlEfgLMCmQ7/YgMMuyXo0MWYccszLqTy
	G4fe1KO2ek/KDoR1JGSV396t8bITbqkliof2dTY=
X-Google-Smtp-Source: ACcGV60/dyOm3UNeE5lcpEzliYOG1ss+Xkemn21l32l8oaEeDO1z1BBAlLHrLPYuBxdZLXjQtmuiW5MpclM2Ngvudn4=
X-Received: by 2002:a1c:ce02:: with SMTP id e2-v6mr3088536wmg.85.1539787830227;
	Wed, 17 Oct 2018 07:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20181015182128.13115-1-kamensky@cisco.com>
	<CAJTo0LYWG7O+VryaFi9r4kc5JagPtuynWHi9gV6nV+cLPUw+SQ@mail.gmail.com>
	<9f182627633f75c8383901510cc11e4b87349084.camel@linuxfoundation.org>
	<alpine.LRH.2.00.1810162250430.53155@sjc-ads-6991.cisco.com>
	<118f12f46497b3b4fda287b64c5e432afde9b6d9.camel@linuxfoundation.org>
In-Reply-To: <118f12f46497b3b4fda287b64c5e432afde9b6d9.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 Oct 2018 16:50:18 +0200
Message-ID: <CA+chaQcjv6-2v8oC25=7fapKKg5XapC21+6K1oN28Kk9MJF2zw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemtap: 3.3 -> 4.0
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
X-List-Received-Date: Wed, 17 Oct 2018 14:50:30 -0000
Content-Type: multipart/alternative; boundary="000000000000a6771805786dca01"

--000000000000a6771805786dca01
Content-Type: text/plain; charset="UTF-8"

There seems to be one more issue in current master (for which I haven't
seen a fix in master-next or ML):

ERROR: systemtap-4.0-r0 do_package: QA Issue: systemtap:
Files/directories were installed but not shipped in any package:
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/stap-exporter.service
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
systemtap: 4 installed and not shipped files. [installed-vs-shipped]



On Wed, Oct 17, 2018 at 1:59 PM <richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2018-10-16 at 22:56 -0700, Victor Kamensky wrote:
> > In the long term it would be beneficial that those issues be
> > fixed in SystemTap itself, correct? If so, I can look at creating
> > proper patches and pushing them into SystemTap.
>
> Yes, fixing those upstream would be very helpful, probably through
> adding the ability to configure the systemd unit path and fixing the
> file installation method.
>
> > Also on my todo list is to attempt to push few existing
> > OE systemtap patches into SystemTap upstream source. I believe
> > they look like quite legit issues and I hope they could be
> > upstreamed.
>
> That kind of work is very much appreciated and makes everyone's life
> easier in the future!
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000a6771805786dca01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There seems to be one more issue in current master (for wh=
ich I haven&#39;t seen a fix in master-next or ML):<div><br></div><div><pre=
 style=3D"box-sizing:border-box;white-space:pre-wrap;margin-top:0px;margin-=
bottom:0px;color:rgb(51,51,51);font-size:13px">ERROR: systemtap-4.0-r0 do_p=
ackage: QA Issue: systemtap: Files/directories were installed but not shipp=
ed in any package:
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/stap-exporter.service
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.
systemtap: 4 installed and not shipped files. [installed-vs-shipped]</pre><=
pre style=3D"box-sizing:border-box;white-space:pre-wrap;margin-top:0px;marg=
in-bottom:0px;color:rgb(51,51,51);font-size:13px"><br></pre></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 17, 2018 at 1:59 P=
M &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@=
linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
On Tue, 2018-10-16 at 22:56 -0700, Victor Kamensky wrote:<br>
&gt; In the long term it would be beneficial that those issues be<br>
&gt; fixed in SystemTap itself, correct? If so, I can look at creating<br>
&gt; proper patches and pushing them into SystemTap.<br>
<br>
Yes, fixing those upstream would be very helpful, probably through<br>
adding the ability to configure the systemd unit path and fixing the<br>
file installation method.<br>
<br>
&gt; Also on my todo list is to attempt to push few existing<br>
&gt; OE systemtap patches into SystemTap upstream source. I believe<br>
&gt; they look like quite legit issues and I hope they could be<br>
&gt; upstreamed.<br>
<br>
That kind of work is very much appreciated and makes everyone&#39;s life<br=
>
easier in the future!<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000a6771805786dca01--
