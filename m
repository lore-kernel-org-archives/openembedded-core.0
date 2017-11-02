Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3A0F5600EB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 15:28:50 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id 17so4869649pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Nov 2017 08:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zFyfzMxhsaXhivsBVVa92VYqjcRW3/e5huMlXtf0sKk=;
	b=AUXKQF4Wt6O7OuwYNNfeGpb72Gu8eWKe88MShT8Hhpz9xgUwSOBzLLFW/qWRtZiVEE
	D4nfpRwXujqzODhkmj2bVsf0o9nPs7TjjqhWxnpvxug6w5P1mScLohEfpBo7IHw7dbUO
	VlEW4aujIJGH8+Lln7gUeKOpe83CbxAhWJIOK2m2uE0tP0K3Eji1CPBSbqMRyPHE8yzp
	zMnxfXuKIh6UqxXrPbLG+JLP6jQ2Hvq0rIVspz+HbWTu/v+ZHn/fuyOlCBQtzetc+v8u
	eyR4bbANvCpanFBLl1z8GUzLJcGybtzub8fWOxyHmTY48NOz2JM4fVsK8nqGad4AbOLM
	qLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zFyfzMxhsaXhivsBVVa92VYqjcRW3/e5huMlXtf0sKk=;
	b=a9h+mtAcB7wsZvlZybErmfdU77Mc8eGe9TBYBoxDkXyfCrmVnXPqCc6vVRrZe01J7h
	S0mS76+woCRv8u2ySk006SYVQkNw16bRwvK5KDwV6yOzdXeqRebtSkoOs6rlana+yoPn
	Xu9Q/ok5uvZ4FPZPEYH6a+Il4H1zVo3EDd3a+Gzt2iU2mrg8rKaEMmYc+O2/JEUP/CHO
	f8UJLoEeajOFD4zlgboQQNh7SdHqeyZ1rmNG3RfzgIo7GXT/xMeAjbWKamowUUrV+4S0
	YMuxCLDvGgpYU0GLi7NfOAr2lutIz9X+J8M8EoY5J/DnhOI/2yp7lC2S4fqJmpWsYVmV
	BeXQ==
X-Gm-Message-State: AMCzsaVRnfwajJFEw0G7WsVezm3UuXPBqf2M+oE3Q2jSUsEDuiHeYFIM
	mUfS5WUw/QQUo3P0zzKq/gpNhxy3UDqoxdbpuWI=
X-Google-Smtp-Source: ABhQp+QkUqsOQh77bBlX1dxC0SVPUAz7aYald325hidqv4FFhf1QG82OTFhECI9iMN+7KqM08pLhpGlxpAq0smU9O3g=
X-Received: by 10.101.74.129 with SMTP id b1mr3984759pgu.341.1509636532039;
	Thu, 02 Nov 2017 08:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20171102053922.33426-1-raj.khem@gmail.com>
	<44258d74-acbd-45cf-0a00-c82554be03ec@linux.intel.com>
	<CAP9ODKqKMjmPLm0yP91ojS3OX5rLkEW34uwrvR02V5rcs4VWGA@mail.gmail.com>
	<e7b239be-9c34-18b1-7b63-006334d7d2db@linux.intel.com>
In-Reply-To: <e7b239be-9c34-18b1-7b63-006334d7d2db@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 02 Nov 2017 15:28:40 +0000
Message-ID: <CAMKF1soe__AzR_0O4YHMup1hd1U4jdc6Vq8O-Jt4Fc87HwAnHQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] musl: Update to 1.1.18
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
X-List-Received-Date: Thu, 02 Nov 2017 15:28:51 -0000
Content-Type: multipart/alternative; boundary="089e082528843b749c055d01a56e"

--089e082528843b749c055d01a56e
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 2, 2017 at 5:24 AM Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 11/02/2017 02:21 PM, Otavio Salvador wrote:
> > On Thu, Nov 2, 2017 at 10:19 AM, Alexander Kanavin
> > <alexander.kanavin@linux.intel.com> wrote:
> >> On 11/02/2017 07:39 AM, Khem Raj wrote:
> >>
> >>> Changes since v2: Move to 1.1.18 release
> >>> -PV = "1.1.16+git${SRCPV}"
> >>> +PV = "1.1.18+git${SRCPV}"
> >>
> >>
> >> Can you drop this, and simply rename the recipe to musl_1.1.18.bb
> please?
> >
> > Why? keeping it on _git makes sense to me.
>

We always use a given srcrev always this time
It just happens to match with release

>
> Only if it's a random development revision (e.g. 1.1.18 plus a bunch of
> commits) - if the version taken is a pristine tagged release, it should
> be indicated as such, regardless of whether it's taken from a tarball or
> a git checkout.
>
> Alex
>

--089e082528843b749c055d01a56e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Thu, Nov 2, 2017 a=
t 5:24 AM Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@linux.i=
ntel.com">alexander.kanavin@linux.intel.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On 11/02/2017 02:21 PM, Otavio Salvador wrote:<br>
&gt; On Thu, Nov 2, 2017 at 10:19 AM, Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_bl=
ank">alexander.kanavin@linux.intel.com</a>&gt; wrote:<br>
&gt;&gt; On 11/02/2017 07:39 AM, Khem Raj wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; Changes since v2: Move to 1.1.18 release<br>
&gt;&gt;&gt; -PV =3D &quot;1.1.16+git${SRCPV}&quot;<br>
&gt;&gt;&gt; +PV =3D &quot;1.1.18+git${SRCPV}&quot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Can you drop this, and simply rename the recipe to <a href=3D"http=
://musl_1.1.18.bb" rel=3D"noreferrer" target=3D"_blank">musl_1.1.18.bb</a> =
please?<br>
&gt;<br>
&gt; Why? keeping it on _git makes sense to me.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">We always use a =
given srcrev always this time</div><div dir=3D"auto">It just happens to mat=
ch with release=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Only if it&#39;s a random development revision (e.g. 1.1.18 plus a bunch of=
<br>
commits) - if the version taken is a pristine tagged release, it should<br>
be indicated as such, regardless of whether it&#39;s taken from a tarball o=
r<br>
a git checkout.<br>
<br>
Alex<br>
</blockquote></div></div>

--089e082528843b749c055d01a56e--
