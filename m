Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 81A0960088;
	Sat,  2 Jul 2016 18:19:22 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id q132so95347807lfe.3;
	Sat, 02 Jul 2016 11:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=umqEB3tn+K2RqG4lSp8+xKwCAEVL7+EGsj52H5iMKkA=;
	b=xc3Jb69KSjxkbkQ6y2IGS7sMaSYyMvKeVeyaj3r2LRVzqpw/g9La6oSowE6PTepe7R
	d2XI9CJaJro7BVeOINYiP8tfja/O4sbqjSsAU8asqqjE/NKYGU5wEiW3eNHD1ZqFSrFw
	vDOI7pgrzh/+YyXXfN0x2AUkg7zc6X7ceYUKqzaCno+VzZqhzzDBwu38prpVOlQCEnPc
	C4iSjdxnr7OYdGwnFhYYP1887hIsQhF2FqYk7U0X2O2D7NjtmirF4FjqjRe1AbJvrrP0
	fp3vmTXAjHYXrJe19ujM+VDsPiqMDrVqxkvOMTrDsl5wmjXP3WYS+hWhpIEGxKKbWolV
	6bDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=umqEB3tn+K2RqG4lSp8+xKwCAEVL7+EGsj52H5iMKkA=;
	b=gMwD58x9zoh5q43pbdrWww1mgO/EVTi5TPVlNAsJFrJU6oGiG6miMm92+nQZC/svcb
	P+Cr2v088S5Jl9r9t2N2n5cF7mKYZtRwW1Q2mFMwyMsbkW6fv5nIrSFSuitaygslVLkd
	CjEg+IuzkEB2IXAzxMXiwtObpYBjVYmeLk+vJTGner2Cim7JrRjOStgHDyype9ivYt/S
	XMdrhWyy9O23Xm6kmVUCaj1hJYvhwFqOrJiOfSnNi04GUgJu3NJpKjyQKf4INnptPqbF
	+oe9v6DJrc/3xCXWWIymqz9MG5bSzQaTDTlTHsaEIazFVbdZfUfZZu1hKUWzGgKBQ3EV
	bh3Q==
X-Gm-Message-State: ALyK8tIJrxm+tytfEiEKWsXZBlUdxyKDReV1FHKOaKCdpabK3kwT7VLkQUdL5snh6XbXIx/lMUHByvAbwdsBVw==
X-Received: by 10.25.21.32 with SMTP id l32mr808633lfi.229.1467483562775; Sat,
	02 Jul 2016 11:19:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.23.39 with HTTP; Sat, 2 Jul 2016 11:19:21 -0700 (PDT)
In-Reply-To: <4128fb32-07bb-94d1-6b77-acb8984635fd@linux.intel.com>
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
	<c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
	<CAJTo0LZnh1+tvznjgKKFrSoP-ie0vMD0m_5AtTEi0DcrpFjX6g@mail.gmail.com>
	<33320.10.7.198.51.1465487815.squirrel@linux.intel.com>
	<CAHPquwP2RDW3T5hiizow6=1xJzwgCPDDs=z+OHgaEedcXTh6bg@mail.gmail.com>
	<CAJTo0LZhrKJvg=m05_SUPktikELaDRq8gTvvtjfhaj_9Uq+vPw@mail.gmail.com>
	<4128fb32-07bb-94d1-6b77-acb8984635fd@linux.intel.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 2 Jul 2016 11:19:21 -0700
Message-ID: <CANx9H-D1+8-2q9PvnYCJjSSO1iFXMqeh_TUkqCecN=jh_ox5uQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] the fate of Vala in OE
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
X-List-Received-Date: Sat, 02 Jul 2016 18:19:24 -0000
Content-Type: multipart/alternative; boundary=001a1140826e791c7a0536ab242b

--001a1140826e791c7a0536ab242b
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 10, 2016 at 6:21 AM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 06/09/2016 07:36 PM, Burton, Ross wrote:
>
>     We do use Vala for internal gstreamer-related projects so I would
>>     volunteer to support it in oe-core.
>>
>>
>> Would you volunteer to maintain it in a separate layer if possible?  If
>> nothing in core uses it and it can be maintained out of core then I
>> think it should be moved out.  Currently, vala support is in oe-core but
>> nothing in oe-core uses it... so the autobuilder can't tell if it works.
>>
>
> How about?
>
> 1) vala compiler recipe and support for generating library bindings stays
> in oe-core
>
> 2) we take care of updating the vala recipe to latest stable upstream
> version
>
> 3) we make sure that vala recipe builds correctly and library bindings are
> generated without error for libraries that are in oe-core
>
> 4) any other issues, such as compiler not working properly, or issues with
> bindings for things that are not in oe-core are handled by 'the community'.
>
>
Excellent compromise. I volunteer to help with that.
 --Tim

>
>
> Alex
>
>

--001a1140826e791c7a0536ab242b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jun 10, 2016 at 6:21 AM, Alexander Kanavin <span dir=3D"ltr">&l=
t;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">al=
exander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On 06/09/2016 07:36 PM, Burton, Ross wrote:<=
br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 We do use Vala for internal gstreamer-related projects so I w=
ould<br>
=C2=A0 =C2=A0 volunteer to support it in oe-core.<br>
<br>
<br>
Would you volunteer to maintain it in a separate layer if possible?=C2=A0 I=
f<br>
nothing in core uses it and it can be maintained out of core then I<br>
think it should be moved out.=C2=A0 Currently, vala support is in oe-core b=
ut<br>
nothing in oe-core uses it... so the autobuilder can&#39;t tell if it works=
.<br>
</blockquote>
<br></span>
How about?<br>
<br>
1) vala compiler recipe and support for generating library bindings stays i=
n oe-core<br>
<br>
2) we take care of updating the vala recipe to latest stable upstream versi=
on<br>
<br>
3) we make sure that vala recipe builds correctly and library bindings are =
generated without error for libraries that are in oe-core<br>
<br>
4) any other issues, such as compiler not working properly, or issues with =
bindings for things that are not in oe-core are handled by &#39;the communi=
ty&#39;.<br>
<br></blockquote><div><br></div><div>Excellent compromise. I volunteer to h=
elp with that.<br></div><div>=C2=A0--Tim<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
<br>
<br>
Alex<div class=3D"HOEnZb"><div class=3D"h5"><br>
</div></div></blockquote></div><br></div></div>

--001a1140826e791c7a0536ab242b--
