Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0775E6093A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 13:28:57 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id 85so1216598ith.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 06:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LbJk4RpLlEYmbBppKGkWQFBtXyN8BFYUd46Rh661SzQ=;
	b=HKZy78Lp8TRQ3NfyB/Hw32fSiJlQjVr6IMXGbl1Eu/caT83fvm5dmVB4OV+fYneCMU
	T7H0K+HOt0nLSJ7XOFT1o+gLthAIz+eCLLxLBHjfDYf3Ao/lMCTI0quWo7q7aDuO8yMF
	Co75w1gQVClWsEktw12hja+WVOTdMB3Fpo8+UhKKseb5+Uvib/j0SDETCQqDagI63yIv
	DfXWAeaF1GIkP9t3xUrvXVBczib8JhmG7wc65Sqvr71mHYhpZn4MZHFAw+3ViFhC0mPm
	agLvFQssr4jRkq+tqi8vjLgCcJLkbpIoHWBx/djEsZfNp/jpJPYJsQdBrjmhwT3X5sct
	k8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LbJk4RpLlEYmbBppKGkWQFBtXyN8BFYUd46Rh661SzQ=;
	b=FXPlqY9HRb7tCCQWAg+YQqFpFnv3oz4h5brwbZPcYJtkjDbpKyGWdv6esymTc770bO
	8gulYnNbitq++8rvkfdw81DuC/qAMzrxhstTRTzqOo9uxx6TZyc8SFbbNG00n0JwjFiF
	nJE7GBvHo+gAbcfE6ya4DOnXKpgQVLZ4nhI5hc8x1bsrpDKfxfTuKHdjYaLUIE4CePor
	tgPulbLWcW02qj5+SoE8pHPJK7hkkb96b6WJoaknTtZ8IaDa1nI8d935Wrv4OxJKS/EQ
	UfIFFgvNgnw3gYPN2z/eD6T5JeMVGrASdXw4PfRXEY5gAroep5gt9tLpJ5nDBDyEYwd5
	qTYA==
X-Gm-Message-State: AHPjjUiWT7yOoR2OoTT/IkD+Tt5X5KoPZB+XjyZvt3Ipd0PFpVitPnzC
	5gf89YnBokfoHxxlJNLEuPbqPK7TOgbNLiOntfzarg==
X-Google-Smtp-Source: AOwi7QCdZgzJkwUKwljzgBDAqedNxC6T1gryuHWZYHOSOmVntpI49hGi/Z8L99nHgIq5S0Rcx8zW7nynw/ZuuProd2Q=
X-Received: by 10.36.162.67 with SMTP id o3mr1620930iti.27.1506605339116; Thu,
	28 Sep 2017 06:28:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Thu, 28 Sep 2017 06:28:38 -0700 (PDT)
In-Reply-To: <1506545019-4144-1-git-send-email-libertad.cruz@intel.com>
References: <1506545019-4144-1-git-send-email-libertad.cruz@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Sep 2017 14:28:38 +0100
Message-ID: <CAJTo0LaLdMPpsypShHpxfdQRfBrxwgVSBUAFNS+mPKkohFVbDw@mail.gmail.com>
To: Libertad Cruz <libertad.cruz@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] dpky.py: Adds testcases for dpkg package manager
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
X-List-Received-Date: Thu, 28 Sep 2017 13:28:58 -0000
Content-Type: multipart/alternative; boundary="f403045fb2a20e4a9c055a3fe4a2"

--f403045fb2a20e4a9c055a3fe4a2
Content-Type: text/plain; charset="UTF-8"

On 27 September 2017 at 21:43, <libertad.cruz@intel.com> wrote:

> From: libertad <libertad.cruz@intel.com>
>
> Adds dpkg testcases for testing basic operation functionality for the dpkg
> packgage manager.Adds new assert function to verify expected results given
> by the dpkg package
>

Basic functionality of a package manager is list packages, add packages,
remove packages.

Whereas the bulk of this this test verifies that four combinations of
--help or --version work, which isn't actually testing anything beyond "is
dpkg installed".

Can we just remove all of them?  I don't see the point in cluttering
testopia and the source with test cases that don't actually test anything.

     @OETestID(1812)
>      def test_dpkg_status(self):
> -        self.dpkg('dpkg -s dpkg')
> +        self.dpkg('dpkg -s dpkg',"Package: dpkg")
>

I'd suggest also verifying the status.  It should be 'Status: install ok
installed'.


>      @OETestID(1814)
>      def test_dpkg_list(self):
> -        self.dpkg('dpkg -l')
> +        self.dpkg('dpkg -l',"Desired=Unknown/Install/Remove/Purge/Hold")
>

If dpkg -l crashes immediately after outputting the header (say, the
database parser was broken) then this test would pass.

Either search it for some essential packages ("ii dpkg" would be a good
start), or remove the test.

Ross

--f403045fb2a20e4a9c055a3fe4a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 27 September 2017 at 21:43,  <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:libertad.cruz@intel.com" target=3D"_blank">libertad.cruz@inte=
l.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,=
204,204);padding-left:1ex"><div class=3D"gmail-HOEnZb"><div class=3D"gmail-=
h5">From: libertad &lt;<a href=3D"mailto:libertad.cruz@intel.com">libertad.=
cruz@intel.com</a>&gt;<br>
<br>
Adds dpkg testcases for testing basic operation functionality for the dpkg =
packgage manager.Adds new assert function to verify expected results given =
by the dpkg package</div></div></blockquote><div><br></div><div>Basic funct=
ionality of a package manager is list packages, add packages, remove packag=
es.</div><div><br></div><div>Whereas the bulk of this this test verifies th=
at four combinations of --help or --version work, which isn&#39;t actually =
testing anything beyond &quot;is dpkg installed&quot;.</div><div><br></div>=
<div>Can we just remove all of them?=C2=A0 I don&#39;t see the point in clu=
ttering testopia and the source with test cases that don&#39;t actually tes=
t anything.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;bord=
er-left-color:rgb(204,204,204);padding-left:1ex"><div class=3D"gmail-HOEnZb=
"><div class=3D"gmail-h5">
=C2=A0 =C2=A0 =C2=A0@OETestID(1812)<br>
=C2=A0 =C2=A0 =C2=A0def test_dpkg_status(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.dpkg(&#39;dpkg -s dpkg&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.dpkg(&#39;dpkg -s dpkg&#39;,&quot;Package=
: dpkg&quot;)<br></div></div></blockquote><div><br></div><div>I&#39;d sugge=
st also verifying the status.=C2=A0 It should be &#39;Status: install ok in=
stalled&#39;.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex"><div class=3D"gmail-HO=
EnZb"><div class=3D"gmail-h5">
=C2=A0 =C2=A0 =C2=A0@OETestID(1814)<br>
=C2=A0 =C2=A0 =C2=A0def test_dpkg_list(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.dpkg(&#39;dpkg -l&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.dpkg(&#39;dpkg -l&#39;,&quot;Desired=3DUn=
known/Install/<wbr>Remove/Purge/Hold&quot;)<br></div></div></blockquote><di=
v><br></div><div>If dpkg -l crashes immediately after outputting the header=
 (say, the database parser was broken) then this test would pass.</div><div=
><br></div><div>Either search it for some essential packages (&quot;ii dpkg=
&quot; would be a good start), or remove the test.</div><div><br></div><div=
>Ross=C2=A0</div></div></div></div>

--f403045fb2a20e4a9c055a3fe4a2--
