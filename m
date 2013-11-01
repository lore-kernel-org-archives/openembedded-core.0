Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 375186CC79
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 16:32:01 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id as1so7918402iec.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 09:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YIOqBtXSIba/K8UoZCz2x3o+Erwu/dyp5MNXQ9NJezY=;
	b=JhqxqOedaJ+xdkLNJiUpEqTNagYNg9dEA8OCNIbgdX9RGNqtzYxKpG58WkdKwNFil5
	azIDbvIHG0AH+L90xj2CRLd3uyILRF3s0E1dbPS6IX6Mhxmo61wrWOMvBIDO0mIl2QcG
	apTCxLTtytVVLHjFO+q7L/Nyyrc8CX9aF5bW3scizMEQqThsmsFvxr63bpZuMtNdK47z
	LqDX6JJkYmEN5F1H2fuOTThBlXVS/FqZMo4EFqsya7mDpnhRPA+4udTUzQSICWSpeg+l
	oPpcUdU8jCmALEaEeCVUYwxbuCGwWiiVeeiSypvTtYYbwER05txT/ATjE62hNMeYcY+B
	jN8Q==
MIME-Version: 1.0
X-Received: by 10.43.161.65 with SMTP id mf1mr809234icc.66.1383323522704; Fri,
	01 Nov 2013 09:32:02 -0700 (PDT)
Received: by 10.50.219.195 with HTTP; Fri, 1 Nov 2013 09:32:02 -0700 (PDT)
In-Reply-To: <CAJTo0LbjScOrHHBW5HK_WcOCnYabRvwP2CnYpHuSDJGxVqny3Q@mail.gmail.com>
References: <cover.1383197850.git.blloyd@familyhonor.net>
	<2e9cfab0ee89692c85b78802b1804aa3e7856ef8.1383197850.git.blloyd@familyhonor.net>
	<CAJTo0LbjScOrHHBW5HK_WcOCnYabRvwP2CnYpHuSDJGxVqny3Q@mail.gmail.com>
Date: Fri, 1 Nov 2013 09:32:02 -0700
Message-ID: <CAMKF1sox9M+4v72sCWQafa0wWjLQMo5bgEYc4AEmRLxArS2uTg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Enhancements to allow core file debugging to work properly from devices
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
X-List-Received-Date: Fri, 01 Nov 2013 16:32:01 -0000
Content-Type: multipart/alternative; boundary=001a11c2f7742e304704ea201b92

--001a11c2f7742e304704ea201b92
Content-Type: text/plain; charset=UTF-8

On Friday, November 1, 2013, Burton, Ross wrote:

> On 31 October 2013 06:54, blloyd <blloyd@familyhonor.net <javascript:;>>
> wrote:
> > +FILES_gcore = "${bindir}/gcore"
>
> Why can't this script just be added to the gdb package?


actually if we have it as a separate package then all those new rrcommends
baggage can be added to gcore package instead of gdb proper


>
> Ross
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c2f7742e304704ea201b92
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, November 1, 2013, Burton, Ross  wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On 31 October 2013 06:54, blloyd &lt;<a href=3D"javascript=
:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;blloyd@familyhonor.net&#39;)"=
>blloyd@familyhonor.net</a>&gt; wrote:<br>

&gt; +FILES_gcore =3D &quot;${bindir}/gcore&quot;<br>
<br>
Why can&#39;t this script just be added to the gdb package?</blockquote><di=
v><br></div><div>actually if we have it as a separate package then all thos=
e new rrcommends baggage can be added to gcore package instead of gdb prope=
r</div>
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Ross<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote>

--001a11c2f7742e304704ea201b92--
