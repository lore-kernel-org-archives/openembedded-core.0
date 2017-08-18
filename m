Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 203177843D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 17:29:17 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id q42so17565480uad.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 10:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TXI5QtWgIMVHdt7EAGHDlsCE5S3CQ5lWKO4zOLo8Y8E=;
	b=DFEP7iMOa3J4n7IBfsdX/1amYwbuEReDOW3zcuXk9nJ9Krk5awLeCtb3IVG8N2xjkD
	jhI4rbBqgVlnQWNc87YBW5X5+B6z9euStZKZr5aYusp5/W1ITp4Gl51fcoVpO9dqPr2d
	q3RQe8GGCIchtysXDgioOx+G/wqiZ7JaPeq/fML+FFxx09PlITkiqAorAUaD/HDMGgzw
	VxGjmIHSRCPbCAim1sGxmUnQcDy1tnLnFVmvSagnlV4LFV/4Yb/cE5Xr4DVMuAzxv2Et
	or4nqXvLBvl0oX2ypBOLxKrDrIK2oW4af54Z3/K7yEoDmfyANpekS+jHXtrgRk7tOOGI
	A4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TXI5QtWgIMVHdt7EAGHDlsCE5S3CQ5lWKO4zOLo8Y8E=;
	b=Ji0STAsA3CrSb/SMoI6a1tq1MpCe/iUKJ2cknof7oWpZ7lmtasMV50zQR908A1JoQF
	F9gWFMaQXo0JqLZEQCCMd0IZ24wdaIPBC3RJxvAmU4vCUQSxnT+rfdMuecbvV/jObXWA
	ux/9CmlFPvv5U4rdrbfIH81X43jKzbFZHfJkw6qRArxcpC6rUGHRFvKM1a+1g0mSa8Vt
	u7fl2nGi4IewZScXbzXTM94ufmlT6M+ZJls2SjFyYcTwBIEx0cI6VNBTxS7MbMpouvGa
	/WiGS010V7fO61XqfVRn873lxWYeucFV2sA0y/ANYukIZnCVnOtxntSwaktWCOl8AGXq
	o0/w==
X-Gm-Message-State: AHYfb5jnyVCFYY0mtpewsud9vFGMivn7rg93qggJyqxiVRdEDzBpPlbL
	nAzC0rkaE9BclQMqlDH+EY7dO3p9Ow==
X-Received: by 10.159.32.97 with SMTP id 88mr6624042uam.102.1503077358878;
	Fri, 18 Aug 2017 10:29:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Fri, 18 Aug 2017 10:29:18 -0700 (PDT)
In-Reply-To: <CAMKF1soQw0VVy0RKe4w-qsCwPh_OTgatYLrx6mPpapBGooy-Ew@mail.gmail.com>
References: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
	<1502969638.13978.209.camel@linuxfoundation.org>
	<CA+chaQcZKA=x1_O88h=Akjh=Cr2Rtt_8GqgRrm61fuLnT_myRw@mail.gmail.com>
	<d2851cd0-1a15-f5aa-1e9b-dda654978178@linux.intel.com>
	<CAMKF1sryybJQXYvkQVbSEciBhYY1s7Xc-k+qhFJSRbbRxi1DJQ@mail.gmail.com>
	<fe1575c3-4e74-1a5d-b48e-86c6908b2e63@linux.intel.com>
	<CAMKF1soQw0VVy0RKe4w-qsCwPh_OTgatYLrx6mPpapBGooy-Ew@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 18 Aug 2017 19:29:18 +0200
Message-ID: <CA+chaQcQNkYbnSpVzA5xceo=CTpWDnKd8n3WaZM6zbUOe5m_XA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: openssl10 unusable for many components
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
X-List-Received-Date: Fri, 18 Aug 2017 17:29:18 -0000
Content-Type: multipart/alternative; boundary="94eb2c04ca980bc60f05570a78b5"

--94eb2c04ca980bc60f05570a78b5
Content-Type: text/plain; charset="UTF-8"

Even with that patch to rename openssl10 back to openssl we still need to
solve the openssl-native which wasn't reverted back to 1.0.

Upstream nodejs isn't going to be openssl-1.1 for a bit longer as explained:
https://github.com/nodejs/node/pull/14761
https://github.com/nodejs/node/pull/11828
so it would make sense to revert native and nativesdk versions as well - if
it isn't done in oe-core, I'll do it in our own layers to keep the builds
going.

On Fri, Aug 18, 2017 at 4:41 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Aug 18, 2017 at 3:53 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
> > On 08/18/2017 08:56 AM, Khem Raj wrote:
> >
> >> I was trying nodejs and it seems its also broken by this openssl
> >> upgrade. Meta-oe alone has amost 50 recipes that are broken. there are
> >> hundreds of other layers.
> >> Many large packages in external layers are now broken, and the fact
> >> that openssl10
> >> is almost useless since some package will pull in openssl11 and cause
> >> conflicts. This
> >> is not a a good solution at least it seems to early for release. It
> >> might take a bit for packages to get working with openssl11, We should
> >> have carefully thought and considered postponing using it as default
> >> until next release ( april 2018). Its fine to keep it in if needed but
> >> keep openssl 1.0 as default preferred version, I don't think whole
> >> ecosystem is ready for it and we don't have man power to fix
> >> everything. This alone has a potential to make
> >> October release quite weak as far as external layers are concerned
> >
> >
> > FWIW, nodejs from meta-oe does build just fine with openssl10 dependency.
>
> no it doesnt try building nodejs-native.
>
>  So
> > it's not exactly useless. And no one has established how many of the
> other
> > 50 packages can be fixed by either doing that, or updating them to latest
> > upstream releases.
>
> Thats not going to solve everything. Neither does pointing to fedora
> patches.
>
> >
> > I'll send a patch that renames openssl10 recipe back to openssl and sets
> > that as a preferred version, so anyone can experiment with 1.1 without
> > widespread breakage.
> >
> > But at the start of next development cycle this will be reverted back; no
> > more complaining then please, we have to do this at some point, and just
> > after a new cycle has started is as good time as it gets.
>
> Just putting random deadlines is not going to solve this, there has to
> be some look
> at upstream packages and other distros switching to openssl11 and
> dropping openssl10
> completely. People have fielded products to support and they need some
> assurance of
> forward path, their ecosystem might involve a lot larger package set
> then just oe-core.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c04ca980bc60f05570a78b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Even with that patch to rename openssl10 back to openssl w=
e still need to solve the openssl-native which wasn&#39;t reverted back to =
1.0.<div><br></div><div>Upstream nodejs isn&#39;t going to be openssl-1.1 f=
or a bit longer as explained:</div><div><a href=3D"https://github.com/nodej=
s/node/pull/14761">https://github.com/nodejs/node/pull/14761</a><br></div><=
div><a href=3D"https://github.com/nodejs/node/pull/11828">https://github.co=
m/nodejs/node/pull/11828</a><br></div><div>so it would make sense to revert=
 native and nativesdk versions as well - if it isn&#39;t done in oe-core, I=
&#39;ll do it in our own layers to keep the builds going.</div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Aug 18, 2017 at=
 4:41 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><span class=3D"">On Fri, Aug 18, 2017 at 3:53 AM, Ale=
xander Kanavin<br>
&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com">alexander.kanavin@=
linux.<wbr>intel.com</a>&gt; wrote:<br>
&gt; On 08/18/2017 08:56 AM, Khem Raj wrote:<br>
&gt;<br>
&gt;&gt; I was trying nodejs and it seems its also broken by this openssl<b=
r>
&gt;&gt; upgrade. Meta-oe alone has amost 50 recipes that are broken. there=
 are<br>
&gt;&gt; hundreds of other layers.<br>
&gt;&gt; Many large packages in external layers are now broken, and the fac=
t<br>
&gt;&gt; that openssl10<br>
&gt;&gt; is almost useless since some package will pull in openssl11 and ca=
use<br>
&gt;&gt; conflicts. This<br>
&gt;&gt; is not a a good solution at least it seems to early for release. I=
t<br>
&gt;&gt; might take a bit for packages to get working with openssl11, We sh=
ould<br>
&gt;&gt; have carefully thought and considered postponing using it as defau=
lt<br>
&gt;&gt; until next release ( april 2018). Its fine to keep it in if needed=
 but<br>
&gt;&gt; keep openssl 1.0 as default preferred version, I don&#39;t think w=
hole<br>
&gt;&gt; ecosystem is ready for it and we don&#39;t have man power to fix<b=
r>
&gt;&gt; everything. This alone has a potential to make<br>
&gt;&gt; October release quite weak as far as external layers are concerned=
<br>
&gt;<br>
&gt;<br>
&gt; FWIW, nodejs from meta-oe does build just fine with openssl10 dependen=
cy.<br>
<br>
</span>no it doesnt try building nodejs-native.<br>
<span class=3D""><br>
=C2=A0So<br>
&gt; it&#39;s not exactly useless. And no one has established how many of t=
he other<br>
&gt; 50 packages can be fixed by either doing that, or updating them to lat=
est<br>
&gt; upstream releases.<br>
<br>
</span>Thats not going to solve everything. Neither does pointing to fedora=
 patches.<br>
<span class=3D""><br>
&gt;<br>
&gt; I&#39;ll send a patch that renames openssl10 recipe back to openssl an=
d sets<br>
&gt; that as a preferred version, so anyone can experiment with 1.1 without=
<br>
&gt; widespread breakage.<br>
&gt;<br>
&gt; But at the start of next development cycle this will be reverted back;=
 no<br>
&gt; more complaining then please, we have to do this at some point, and ju=
st<br>
&gt; after a new cycle has started is as good time as it gets.<br>
<br>
</span>Just putting random deadlines is not going to solve this, there has =
to<br>
be some look<br>
at upstream packages and other distros switching to openssl11 and<br>
dropping openssl10<br>
completely. People have fielded products to support and they need some<br>
assurance of<br>
forward path, their ecosystem might involve a lot larger package set<br>
then just oe-core.<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c04ca980bc60f05570a78b5--
