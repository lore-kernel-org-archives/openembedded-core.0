Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SeSEf-0000Ul-6y
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 16:38:21 +0200
Received: by ggnp4 with SMTP id p4so3243524ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 07:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=zg3EUNTjsmadKxhbpJBWP3TLAKePJcixx1OmTj4aZIc=;
	b=FIraq2N5FWpKbVnrGSwxlEHIyyXJ6ype5wKhmeAfvogfmVW88OiCsLYnt1bK4KnMPT
	4fFiG5fEcTj5P3ZvFiz+JlyUIJwj62San+p4JGG/g4+HVLLSk/UbvdWDoxo1Y4w2r9m7
	fUKg2g+PDyZhv4M9GaVuxB3Gt2J0RC7XfHdFXQGFZVYiECILnIQkxQOvfTWX4uBygNKD
	nVmAopQRtVB+RT874ViCQFKwu3l4TSM91f5OelZpoxS8PbNkD5ldU4D/1df214fXDHo5
	gNmBbTVlil6XfZQx5ktddbgrejZpCPuTRuIbzVOJ9QVx897GpzXx8XN4JnyrbhFgfYUF
	W4xA==
Received: by 10.50.135.1 with SMTP id po1mr8369972igb.67.1339511265662; Tue,
	12 Jun 2012 07:27:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.162.166 with HTTP; Tue, 12 Jun 2012 07:27:25 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <CAMKF1so63e0OB6Q9JzbJQc_4LOqPpHjcugH_0U70bRki3_kfDA@mail.gmail.com>
References: <1339508359-6581-1-git-send-email-andrei@gherzan.ro>
	<CAMKF1so63e0OB6Q9JzbJQc_4LOqPpHjcugH_0U70bRki3_kfDA@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 12 Jun 2012 17:27:25 +0300
Message-ID: <CAK18fxGah6b5pwm_r8NuAXju8iKuDDcVZSRNMiFbaxj6HdW2Ew@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnfL6VtO+dXGphMOVuMOxGzkagjNuZyJ/CBmL72xoLvK21jdsUjns3e6BbhiQotygokbYBk
Subject: Re: [PATCH] eglibc-package: Reorder PACKAGES to avoid having static libraries in dev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jun 2012 14:38:21 -0000
Content-Type: multipart/alternative; boundary=e89a8f6432c229980004c24745df

--e89a8f6432c229980004c24745df
Content-Type: text/plain; charset=ISO-8859-1

I realized now that these are needed by sdk. Thank you for the hint. Patch
can be dropped.

@g


On Tue, Jun 12, 2012 at 5:06 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Jun 12, 2012 at 6:39 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > Move ${PN}-dev at the end of $PACKAGES to avoid having some static
> libraries
> > in dev and let staticdev have those libraries packaged first.
>
> did you compare buildhistory output before and after this patch ?
> *_nonshared.a is special e.g. it should not go into staticdev
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--e89a8f6432c229980004c24745df
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>I realized now that these are needed by sdk. Thank you for the hint. P=
atch can be dropped.=A0</div><div><br></div>@g<br>
<br><br><div class=3D"gmail_quote">On Tue, Jun 12, 2012 at 5:06 PM, Khem Ra=
j <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">

On Tue, Jun 12, 2012 at 6:39 AM, Andrei Gherzan &lt;<a href=3D"mailto:andre=
i@gherzan.ro">andrei@gherzan.ro</a>&gt; wrote:<br>
&gt; Move ${PN}-dev at the end of $PACKAGES to avoid having some static lib=
raries<br>
&gt; in dev and let staticdev have those libraries packaged first.<br>
<br>
did you compare buildhistory output before and after this patch ?<br>
*_nonshared.a is special e.g. it should not go into staticdev<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br>

--e89a8f6432c229980004c24745df--
