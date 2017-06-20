Return-Path: <zeenix@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7C6EF78082
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 21:58:15 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id a199so68801023qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 14:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5mTItvOfZlisH8PD+4AmLVQdFXUU7DLwze9sAqoXCZw=;
	b=kASep37sFgMNgOfsSrVkQoEZHFs5UX9kle71EjkrP3Un+TzvB5SnlNZ4FntM20zVRw
	A2odC/clUqIVBaZAEfi3vvBmct0ZRvB5a9vEL9cgdn76G0H7aVV5qP3nJGYh0jk3ijOv
	rnDIy89hM91I3mkC1l5dE1d5e/eWASec5VpO0FWO6oS9PASbMQhrQWXccJS0WBcyt0mT
	uFzPPM5MBnxXDoXpovriQUIlCkdVds1KRPu80JfASz1d0FUTz3upKL/NBDHDwfjdWvee
	+aONA7HPuJ/vT7W5R3egQunU76nJwjB+Xz91cNfOegHwmRQ0ACbYux5HSG5Lqdz6lMgN
	DhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5mTItvOfZlisH8PD+4AmLVQdFXUU7DLwze9sAqoXCZw=;
	b=K+qLto0y1l6KqJlZq4aO5/CXa0fBCjgEsYcPnVMIWhyYJC6h06wVDh6f3971QmwfCv
	SB0xn+Sm0KxMyKeMmkB+/Avo6ZwKtI//TfBVPi251aeKuC5T8JqeAm1VOMqq1HVU6y6T
	Yo+MVKYohnaDBq1v4pDFbQ7xOkH+oy6XashqHd/5NnC/XRAtUfVxWOk+vhHRWzDjGSRG
	K8V7xQdMAdFHvgzf9rLClhcSBHwZgQ6ucO4XY0JB8/Xj74Dy3ollldz62HrHuegubjfp
	Te/+wIyIOCMIrxyZsHn1XdygW6nPzyJyxnfKwctvUrKN2rkLzBj6BzQEkc4qcwQsB3/X
	fb9g==
X-Gm-Message-State: AKS2vOx9IJEYPydXoePWQWONUIVkprYXEfgAoSs1YOpJsj+feAHA3mNP
	FhmQMUCwgZfz6WBCJ4yagLj14bil4w==
X-Received: by 10.55.45.198 with SMTP id t189mr37263357qkh.108.1497995897084; 
	Tue, 20 Jun 2017 14:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20170619151210.7692-1-zeenix@gmail.com>
	<20170619153127.1043.10102@do.openembedded.org>
	<20170620213413.GA88738@scetola-mac01.local>
In-Reply-To: <20170620213413.GA88738@scetola-mac01.local>
From: Zeeshan Ali <zeenix@gmail.com>
Date: Tue, 20 Jun 2017 21:58:05 +0000
Message-ID: <CAAa3hFMLLYX3KGS+Uy01J0B-_k711byjYRv7Nccqz5FggQ89sA@mail.gmail.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG9lcWE6IGZpeCBydW50aW1lIHRlc3RpbmcgdXNpbmcgc3lzdGVtZC1ib290IHRhcmdldCAocmV2Mik=?=
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
X-List-Received-Date: Tue, 20 Jun 2017 21:58:17 -0000
Content-Type: multipart/alternative; boundary="001a114f50b052214e05526b595d"

--001a114f50b052214e05526b595d
Content-Type: text/plain; charset="UTF-8"

Hi Stephano,

Thanks. I'm already on my 2 weeks vacation so if you could kindly rebase
the patch series, that'd be very nice. Otherwise, I'll just do it after I
return. Thanks.

On Tue, 20 Jun 2017, 23:34 Stephano Cetola, <stephano.cetola@linux.intel.com>
wrote:

> Hey Zeeshan,
>
> Let me know if you need any help with this. This probably requires
> that you do a rebase with master and resubmit a V4.
>
> Cheers,
> Stephano
>
> On 06/19, Patchwork wrote:
> > == Series Details ==
> >
> > Series: oeqa: fix runtime testing using systemd-boot target (rev2)
> > Revision: 2
> > URL   : https://patchwork.openembedded.org/series/6953/
> > State : failure
> >
> > == Summary ==
> >
> >
> > Thank you for submitting this patch series to OpenEmbedded Core. This is
> > an automated response. Several tests have been executed on the proposed
> > series by patchtest resulting in the following failures:
> >
> >
> >
> > * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head]
> >   Suggested fix    Rebase your series on top of targeted branch
> >   Targeted branch  master (currently at 1d9a88f635)
> >
> >
> >
> > If you believe any of these test results are incorrect, please reply to
> the
> > mailing list (openembedded-core@lists.openembedded.org) raising your
> concerns.
> > Otherwise we would appreciate you correcting the issues and submitting a
> new
> > version of the patchset if applicable. Please ensure you add/increment
> the
> > version number when sending the new version (i.e. [PATCH] -> [PATCH v2]
> ->
> > [PATCH v3] -> ...).
> >
> > ---
> > Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114f50b052214e05526b595d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Stephano,</p>
<p dir=3D"ltr">Thanks. I&#39;m already on my 2 weeks vacation so if you cou=
ld kindly rebase the patch series, that&#39;d be very nice. Otherwise, I&#3=
9;ll just do it after I return. Thanks.</p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, 20 Jun 2017, 23:34 =
Stephano Cetola, &lt;<a href=3D"mailto:stephano.cetola@linux.intel.com">ste=
phano.cetola@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">Hey Zeeshan,<br>
<br>
Let me know if you need any help with this. This probably requires<br>
that you do a rebase with master and resubmit a V4.<br>
<br>
Cheers,<br>
Stephano<br>
<br>
On 06/19, Patchwork wrote:<br>
&gt; =3D=3D Series Details =3D=3D<br>
&gt;<br>
&gt; Series: oeqa: fix runtime testing using systemd-boot target (rev2)<br>
&gt; Revision: 2<br>
&gt; URL=C2=A0 =C2=A0: <a href=3D"https://patchwork.openembedded.org/series=
/6953/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.openembedded=
.org/series/6953/</a><br>
&gt; State : failure<br>
&gt;<br>
&gt; =3D=3D Summary =3D=3D<br>
&gt;<br>
&gt;<br>
&gt; Thank you for submitting this patch series to OpenEmbedded Core. This =
is<br>
&gt; an automated response. Several tests have been executed on the propose=
d<br>
&gt; series by patchtest resulting in the following failures:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; * Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Series does not=
 apply on top of target branch [test_series_merge_on_head]<br>
&gt;=C2=A0 =C2=A0Suggested fix=C2=A0 =C2=A0 Rebase your series on top of ta=
rgeted branch<br>
&gt;=C2=A0 =C2=A0Targeted branch=C2=A0 master (currently at 1d9a88f635)<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; If you believe any of these test results are incorrect, please reply t=
o the<br>
&gt; mailing list (<a href=3D"mailto:openembedded-core@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core@lists.openembedded.org</a>) raising=
 your concerns.<br>
&gt; Otherwise we would appreciate you correcting the issues and submitting=
 a new<br>
&gt; version of the patchset if applicable. Please ensure you add/increment=
 the<br>
&gt; version number when sending the new version (i.e. [PATCH] -&gt; [PATCH=
 v2] -&gt;<br>
&gt; [PATCH v3] -&gt; ...).<br>
&gt;<br>
&gt; ---<br>
&gt; Test framework: <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/p=
atchtest" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/=
cgit/cgit.cgi/patchtest</a><br>
&gt; Test suite:=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/=
cgit/cgit.cgi/patchtest-oe" rel=3D"noreferrer" target=3D"_blank">http://git=
.yoctoproject.org/cgit/cgit.cgi/patchtest-oe</a><br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a114f50b052214e05526b595d--
