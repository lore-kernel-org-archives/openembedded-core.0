Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3ED286059F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 20:13:03 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id i200so5254571ioa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 13:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vz+7fW4iECiqXy13j9k5ZWjReItfunM/iP7Y5iQwKaI=;
	b=XhmIzIz8rWslGnOjAiCbcMBaDWAj6U+gShjycf98jEJ+7htO0zUJVz21b7FwPh22ou
	t9t0NNTvAKoHY6jOvRP/RVJj0/poa5b7pbTg+sx4z0JT8wsofpuiLqWlsHJBG7KWROqh
	V6U6FFaQIaTvXofntqca2M1oHhxrgvMp7l6HKboT53ZtMawFOLxaSyOMsfyGKSan4nit
	OQcdXM0Xqp/RthqkrIfiv1YIYENCbm376w9qd63Q3rgOBsV8Qc5XFxz6ANaNFo4QCUir
	a7iWLGJgEistJmAj49n4LLkv9ZzU8LtbyURWRTywUU4wg7KAhAf/BEkYU5GHS7QNOYeb
	uxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vz+7fW4iECiqXy13j9k5ZWjReItfunM/iP7Y5iQwKaI=;
	b=f0ey4RPPR1azD61KUZWre2RjO9OGa9k8Y3JUxgytTHyKc5KOMXBg/TisLEd0kgEnS5
	Y9Xkbae98/9mLdiMxzo/+Gs3zt68mlO7gnNEPAKAbNpVpnKn8CRNSdDiBfOHLK5C3KVr
	ytmNPYAxMUG0frvsKwAeegUf0c2emtJz9vz+1yua5KbIUTxqmRIzKsPPlWKRIttfcunJ
	hS/e5r6RibK2iWseY9UZ5p0Y1WdmiTKG9WkyBCiFmNXyeIzo8ubWJaHFKB2sW2ALLash
	sQENggtmn6I9qhU1urTie0BfoTdkNesP3Wf9IZRZrrqCx6A6zr+ml+eMbivvFpB449VE
	MFLA==
X-Gm-Message-State: AHPjjUi34eaiyp9kHq6QIv+oOYditOTrRnpXajO4JsZ/XCrwZa33MzVZ
	2owRYrKU1rmwXhmCjJ4rDWgcE2CTCEQY
X-Google-Smtp-Source: ADKCNb7RuADnOCJclSsf84mxxJ8UBE6CFkZmhyrJzs6qnqkM9iq3GpZW6Pv39pR/1S75Z6rxAApCZuNC5AGh7v7e5/g=
X-Received: by 10.107.142.13 with SMTP id q13mr1706850iod.153.1504555985403;
	Mon, 04 Sep 2017 13:13:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Mon, 4 Sep 2017 13:12:44 -0700 (PDT)
In-Reply-To: <CAMKF1srd9CWxX7gxAUfNxjw6kkk_bcLoVr6UZqGeD8v7FWaTQQ@mail.gmail.com>
References: <20170904051224.37668-1-jose.alarcon@ge.com>
	<20170904051224.37668-2-jose.alarcon@ge.com>
	<CAMKF1srd9CWxX7gxAUfNxjw6kkk_bcLoVr6UZqGeD8v7FWaTQQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Sep 2017 21:12:44 +0100
Message-ID: <CAJTo0LZ8UWNkC6td+UYbwB6RENqLx6JFZEakzfWHt6esRGwOyA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] rootfs-postcommands: add test for unsatisfied RRECOMMENDS
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
X-List-Received-Date: Mon, 04 Sep 2017 20:13:04 -0000
Content-Type: multipart/alternative; boundary="94eb2c05c5ec0e188d055862bd2c"

--94eb2c05c5ec0e188d055862bd2c
Content-Type: text/plain; charset="UTF-8"

On 4 September 2017 at 21:10, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Sep 3, 2017 at 10:12 PM, Jose Alarcon <jose.alarcon@ge.com> wrote:
> > The do_rootfs log contains a number of unsatisfied package
> > recommendations. At the moment those are only visible when
> > reviewing the rootfs log.
> >
> > This patch adds an extra check to surface any unsatisfied
> > recommendation  as WARNINGS to the build output.
> >
>
> I think a note is more appropriate here.


As it's opt-in, I agree that warning is relevant.  If the user didn't care
for this, they wouldn't have opted in.

Ross

--94eb2c05c5ec0e188d055862bd2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 4 September 2017 at 21:10, Khem Raj <span dir=3D"ltr">&=
lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Sun, Sep 3, 2017 =
at 10:12 PM, Jose Alarcon &lt;<a href=3D"mailto:jose.alarcon@ge.com">jose.a=
larcon@ge.com</a>&gt; wrote:<br>
&gt; The do_rootfs log contains a number of unsatisfied package<br>
&gt; recommendations. At the moment those are only visible when<br>
&gt; reviewing the rootfs log.<br>
&gt;<br>
&gt; This patch adds an extra check to surface any unsatisfied<br>
&gt; recommendation=C2=A0 as WARNINGS to the build output.<br>
&gt;<br>
<br>
</span>I think a note is more appropriate here.</blockquote><div><br></div>=
<div>As it&#39;s opt-in, I agree that warning is relevant.=C2=A0 If the use=
r didn&#39;t care for this, they wouldn&#39;t have opted in.</div><div><br>=
</div><div>Ross</div></div></div></div>

--94eb2c05c5ec0e188d055862bd2c--
