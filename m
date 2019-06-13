Return-Path: <mike@foundries.io>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 850DA7E1AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 05:00:02 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r21so17725554otq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 22:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=izsdo5N5qDXuobYnjyaXXUKvu/Ln0XKl2QZiRaf5r1U=;
	b=eLS1Yr4o0A6JRdEuqAdXUzPTinXroLY519AoGp/yzjCz9tHsX0sYFCvlY7kW/7PNIn
	sBc4v69WL4HffSD4Z6RyjnR0QvyvTgkn+9cM7A2BgCgt+oE50fW1ImJgjXKvPrIVuu/y
	N+Qb/3+Amn3OHtfSnZFKpAz5NOc1XlOMhW47o4B5XmoBYhobU4KvKcbyJmL2FH4zPlPw
	JxzUgeeTQF3Xn5VJLwN3cefEckGTVMFkfRaEl7V7j+aXCNTn1JlxTlKFX8b9zbbJtzGV
	csGQjQ3IHdvEcxKQxVCpYJsbQKB7z/qmztcOB50ZJVzcmE/Yp6RCkshvgcNZxJhk6OAd
	Lywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=izsdo5N5qDXuobYnjyaXXUKvu/Ln0XKl2QZiRaf5r1U=;
	b=IJHtLxtppRyNzjdh9dV8CBCE141jf5qX/XZ+WtczDWfLUDwNCV6GvpPf/90ZUkyaL4
	3Z9mCaSeHH8/3ms26GURwdqnLNraJcy2+JYjNriOCKYc+2QxFvkmkMC/LnS8WO2NIdu+
	u+mIWxY0BVNja6SGsnH8qJu7QgpfR4fiPtlxXwULVWlVUXXYoWq5NKAhrowoxtWmfegB
	adw/kmryAG1Lf9lh6dXD/8KpnEXjfHXGLPwK8HU77blpeIoSbR0Gqn/6K539GUKD6xzQ
	D7vtKfzvZTW2HeoAyR0eOTEW8HK2OIZeNs1xMWGXoHGRKiuP+nO/FEi56EneBGo81ESp
	XNfQ==
X-Gm-Message-State: APjAAAUGX0poqHD3Kh9U4veL6aiyD8DmCWqp1k6GCaxlTtcU2gQ0LsKd
	sRq2pXYYkfEif1O6EtOEp4aiYKnLr/25ph+tbPsS6g==
X-Google-Smtp-Source: APXvYqwMB1okp+l/ex9hR8RMhw+5l7DzjgpzX+xMcFi7VON6haUBgSjEYu4ncMw3rI1mKwSm9rB5f1HvVe+0Y6AuWA0=
X-Received: by 2002:a05:6830:164e:: with SMTP id
	h14mr323999otr.186.1560402003361; 
	Wed, 12 Jun 2019 22:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190612081559.5102-1-alex.kiernan@gmail.com>
	<51dc74acacf2f1daa52a012d083ca2ca56b67bd8.camel@linuxfoundation.org>
	<CAO5Uq5SBNF025u6metFbzeNfSWYOXiYTP5ePR_u1Z9++L_ds8A@mail.gmail.com>
	<9cbbc692-2702-f3f4-199d-ec06cc0f212c@foundries.io>
	<37f5b95f5e9972f1acea72c332c8069f56d7f7a0.camel@linuxfoundation.org>
	<656d17dd-5b77-d3f7-3764-efa5fe5f98e5@foundries.io>
	<CAO5Uq5Sg6BfL4MeuN8BqbYRNwW2h3A5ZDPJxTD7jhWqjuEA_0w@mail.gmail.com>
In-Reply-To: <CAO5Uq5Sg6BfL4MeuN8BqbYRNwW2h3A5ZDPJxTD7jhWqjuEA_0w@mail.gmail.com>
From: Michael Scott <mike@foundries.io>
Date: Wed, 12 Jun 2019 21:59:50 -0700
Message-ID: <CAOBVRDbUJfiEhjXZCbbrmm9OND4GRFszC0r-C48Xo2_Y7juoFA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: uboot-sign: Check UBOOT_DTB_BINARY before adding deps
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
X-List-Received-Date: Thu, 13 Jun 2019 05:00:02 -0000
Content-Type: multipart/alternative; boundary="0000000000001e12fa058b2d672a"

--0000000000001e12fa058b2d672a
Content-Type: text/plain; charset="UTF-8"

Hi Alex and Richard,

On Wed, Jun 12, 2019, 9:06 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:

> Hi Mike
>
> On Wed, Jun 12, 2019 at 11:59 PM Michael Scott <mike@foundries.io> wrote:
> >
> >
> > On 6/12/19 3:21 PM, richard.purdie@linuxfoundation.org wrote:
> > > On Wed, 2019-06-12 at 14:17 -0700, Michael Scott wrote:
> > >> Actually, you can ignore this patch.  We debugged the actual race
> > >> condition contributing to the confusion, and that developer will
> > >> submit a new patch with that fix.  We can review if that patch makes
> > >> more sense (even without tests).
> > > Well, this patch merged earlier this evening as tested passed. Is that
> > > a problem?
> >
> > Not a problem at all.  I believe we also kept this change when we
> > debugged the actual race condition.
> >
>
> Wrong patch you're pointing to here? I'm guessing you meant
> https://patchwork.openembedded.org/patch/161440/


You are 100% correct.  I was checking email on the phone and it trimmed the
subject line.

Please ignore my comments with regard to this patch.

Richard: You are still correct in that the u-boot signing process needs
tests.

My apologies,

- Mike

>
>
> --
> Alex Kiernan
>

--0000000000001e12fa058b2d672a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Alex and Richard,<br><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 12, 2019, 9:06 PM Alex=
 Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com">alex.kiernan@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Mike<br>
<br>
On Wed, Jun 12, 2019 at 11:59 PM Michael Scott &lt;<a href=3D"mailto:mike@f=
oundries.io" target=3D"_blank" rel=3D"noreferrer">mike@foundries.io</a>&gt;=
 wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 6/12/19 3:21 PM, <a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg" target=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfoundation.org=
</a> wrote:<br>
&gt; &gt; On Wed, 2019-06-12 at 14:17 -0700, Michael Scott wrote:<br>
&gt; &gt;&gt; Actually, you can ignore this patch.=C2=A0 We debugged the ac=
tual race<br>
&gt; &gt;&gt; condition contributing to the confusion, and that developer w=
ill<br>
&gt; &gt;&gt; submit a new patch with that fix.=C2=A0 We can review if that=
 patch makes<br>
&gt; &gt;&gt; more sense (even without tests).<br>
&gt; &gt; Well, this patch merged earlier this evening as tested passed. Is=
 that<br>
&gt; &gt; a problem?<br>
&gt;<br>
&gt; Not a problem at all.=C2=A0 I believe we also kept this change when we=
<br>
&gt; debugged the actual race condition.<br>
&gt;<br>
<br>
Wrong patch you&#39;re pointing to here? I&#39;m guessing you meant<br>
<a href=3D"https://patchwork.openembedded.org/patch/161440/" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://patchwork.openembedded.org/patch/=
161440/</a></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">You are 100% correct.=C2=A0 I was checking email on the phone and it=
 trimmed the subject line.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Please ignore my comments with regard to this patch.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Richard: You are still correct in that the =
u-boot signing process needs tests.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">My apologies,</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">- Mike</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><br>
<br>
-- <br>
Alex Kiernan<br>
</blockquote></div></div></div>

--0000000000001e12fa058b2d672a--
