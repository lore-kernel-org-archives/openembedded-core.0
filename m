Return-Path: <andrei@gherzan.ro>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4789977DA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 14:08:53 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id u99so679927uau.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 06:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=36k3i0S1qku4HmovpZwB0+tXvmhQ1fuY3+va7x0VqU8=;
	b=t5P1MY9Nf37hJypAjeNS2oWLPvIkEka+INJ6u4urMOIcr3uLyHffzP+CWgdTi4VQ45
	bepoVQhHKy3ymsXR98Vv/q86feNZi69KH13MyEjWSwfnifLU3BhTMEOggmM+YrSAPT9p
	dysMDjsx49OnaPH1mYorzFTPptIEZOvViHbSNwjY9xxrNwdeZHcn3C2GwQhzOhyyxkUa
	hUVPDyfz9vczomEK+BftmfOzba+OiWr4BLrj38oGkKlmGwLLsDaqTKgDY3x8wrkVmXmQ
	7xGGphucoEQkDXSySKjmgxPoOYln3IiqrJ10qLJ4Bvm5MnL9pBOhw08Yo35HFVPwP4c/
	7i8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=36k3i0S1qku4HmovpZwB0+tXvmhQ1fuY3+va7x0VqU8=;
	b=dEpQez+oBU0nar6PFp/5WvdcOgIFc26P+olk/VtUe9zuuBTeticYHGKJWyarjIGuds
	BbTTSxJLDDWyx5Dw0HcpuEjDPIXZtnMJqSV7hbFlwirI+F/7HOTqInULDTbgQYhiEpzl
	SgauWOq67jWRrHf5ykiQpSvI1iRu6jI71uU6n9AEkN7c0vv0HCo7FZIl32/izH5kPcu+
	rv3vy0o3k5agA1EoWpBikxwzEJsmQ/zyKTbFDTtzoRYqOVcTumw4A2c30z9+gWgYgYM+
	Be59DPPyqzfM2tz0oCzG34dVYrBx/g8eFWnl/a92soZBfnONgcqtW4QnXnSeWfWWdeYC
	I27Q==
X-Gm-Message-State: APf1xPDJQ3KUKVwrtJ8ni5NxUbqN26QeN7XXi5SCp2z+gSS8ZVqkPhyw
	mVegK+Gc+k9YCDEB+x2R/mWk5hfeCZ5tf1ZWzz+VwA==
X-Google-Smtp-Source: AH8x224X62IpYdbqfsU167UIf92UghMiSNyyxrhnM4GDegFq7FDs4f+gFU35FH0paI7WxOpxsL7yQ4D/B+HOXGvC18A=
X-Received: by 10.176.81.131 with SMTP id g3mr4915360uaa.69.1518790134860;
	Fri, 16 Feb 2018 06:08:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.21.226 with HTTP; Fri, 16 Feb 2018 06:08:14 -0800 (PST)
X-Originating-IP: [86.140.154.245]
In-Reply-To: <EBAEBC3AA1B73F4887F286A6723535236597E79C@BGSMSX102.gar.corp.intel.com>
References: <CAK18fxEEZRnHzobX=Lt2By_VYgEzi36nSU+X_94Etegh8E81mg@mail.gmail.com>
	<cc978b8d-afa0-5ea2-ba5d-9700bab26fdc@linux.intel.com>
	<EBAEBC3AA1B73F4887F286A6723535236597E79C@BGSMSX102.gar.corp.intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 16 Feb 2018 14:08:14 +0000
Message-ID: <CAK18fxGNk3vxKeLVpoa7TCuuCq_jkkmMmj3D6Z-hM494ASF5kA@mail.gmail.com>
To: "Palleti, Avinash Reddy" <avinash.reddy.palleti@intel.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: Linux firmware for iwlwifi 8000c disappeared in pyro
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
X-List-Received-Date: Fri, 16 Feb 2018 14:08:54 -0000
Content-Type: multipart/alternative; boundary="94eb2c19255e7a2f05056554e2c8"

--94eb2c19255e7a2f05056554e2c8
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 16, 2018 at 1:48 PM, Palleti, Avinash Reddy <
avinash.reddy.palleti@intel.com> wrote:

>  I submitted a fix sometime back,
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2018-February/147291.html
>
>
Great. We have the fix available and approved by Saul. Shall we merge?


>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:
> openembedded-core-bounces@lists.openembedded.org] On Behalf Of Alexander
> Kanavin
> Sent: Friday, February 16, 2018 6:54 PM
> To: Andrei Gherzan <andrei@gherzan.ro>; openembedded <
> openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] Linux firmware for iwlwifi 8000c disappeared in pyro
>
> On 02/16/2018 01:42 PM, Andrei Gherzan wrote:
> > This happened because the removal of the 8000c-19 firmware patch in
> > pyro removes the package completely as well
> > (http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/
> meta/recipes-kernel/linux-firmware/linux-firmware_git.bb?h=pyro&id=
> 3e4b382c0c687a76f824cd84b478c4f778e15e3e).
> > While the patch that ended up in master only removed that specific
> > firmware
> > (http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/
> meta/recipes-kernel/linux-firmware/linux-firmware_git.bb?id=
> 8d2e66817a6e5cea5a0146f2804e703402de44dc).
> >
> > Any idea why this happened? Can we bring back the package in pyro as
> well?
>
> This looks like a simple mistake. Prepare (and test :) a patch to correct
> it, and send it here with [pyro] prefix.
>

That's what I suspected too. But wasn't sure as it could have been that we
intentionally moved it to misc package. Anyway looks simple and fixed
already.

--
Andrei Gherzan

--94eb2c19255e7a2f05056554e2c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Feb 16, 2018 at 1:48 PM, Palleti, Avinash Reddy <span dir=3D"ltr">&lt;<=
a href=3D"mailto:avinash.reddy.palleti@intel.com" target=3D"_blank">avinash=
.reddy.palleti@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">=C2=A0I submitted a fix sometime back,<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2018-F=
ebruary/147291.html" rel=3D"noreferrer" target=3D"_blank">http://lists.open=
embedded.org/<wbr>pipermail/openembedded-core/<wbr>2018-February/147291.htm=
l</a><br>
<div><div class=3D"h5"><br></div></div></blockquote><div><br></div><div>Gre=
at. We have the fix available and approved by Saul. Shall we merge?</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5">
<br>
-----Original Message-----<br>
From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.org">o=
penembedded-core-bounces@<wbr>lists.openembedded.org</a> [mailto:<a href=3D=
"mailto:openembedded-core-bounces@lists.openembedded.org">openembedded-core=
-<wbr>bounces@lists.openembedded.org</a><wbr>] On Behalf Of Alexander Kanav=
in<br>
Sent: Friday, February 16, 2018 6:54 PM<br>
To: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro">andrei@gherzan.=
ro</a>&gt;; openembedded &lt;<a href=3D"mailto:openembedded-core@lists.open=
embedded.org">openembedded-core@lists.<wbr>openembedded.org</a>&gt;<br>
Subject: Re: [OE-core] Linux firmware for iwlwifi 8000c disappeared in pyro=
<br>
<br>
On 02/16/2018 01:42 PM, Andrei Gherzan wrote:<br>
&gt; This happened because the removal of the 8000c-19 firmware patch in<br=
>
&gt; pyro removes the package completely as well<br>
&gt; (<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta=
/recipes-kernel/linux-firmware/linux-firmware_git.bb?h=3Dpyro&amp;id=3D3e4b=
382c0c687a76f824cd84b478c4f778e15e3e" rel=3D"noreferrer" target=3D"_blank">=
http://git.yoctoproject.org/<wbr>cgit/cgit.cgi/poky/commit/<wbr>meta/recipe=
s-kernel/linux-<wbr>firmware/linux-firmware_git.<wbr>bb?h=3Dpyro&amp;id=3D<=
wbr>3e4b382c0c687a76f824cd84b478c4<wbr>f778e15e3e</a>).<br>
&gt; While the patch that ended up in master only removed that specific<br>
&gt; firmware<br>
&gt; (<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta=
/recipes-kernel/linux-firmware/linux-firmware_git.bb?id=3D8d2e66817a6e5cea5=
a0146f2804e703402de44dc" rel=3D"noreferrer" target=3D"_blank">http://git.yo=
ctoproject.org/<wbr>cgit/cgit.cgi/poky/commit/<wbr>meta/recipes-kernel/linu=
x-<wbr>firmware/linux-firmware_git.<wbr>bb?id=3D<wbr>8d2e66817a6e5cea5a0146=
f2804e70<wbr>3402de44dc</a>).<br>
&gt;<br>
&gt; Any idea why this happened? Can we bring back the package in pyro as w=
ell?<br>
<br>
This looks like a simple mistake. Prepare (and test :) a patch to correct i=
t, and send it here with [pyro] prefix.</div></div></blockquote><div><br></=
div><div>That&#39;s what I suspected too. But wasn&#39;t sure as it could h=
ave been that we intentionally moved it to misc package. Anyway looks simpl=
e and fixed already.</div><div><br clear=3D"all" style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:small;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><div style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:small;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial"><div class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div dir=3D"ltr"><div>--</div>Andrei Gherzan</div></div=
></div></div></div>=C2=A0</div></div></div></div>

--94eb2c19255e7a2f05056554e2c8--
