Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 669AC78358
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 09:59:26 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id r199so48581751vke.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 02:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qVhvbpvsz6f2CbZgN63HQLKaL32bh1dfC+cyMUnpG0c=;
	b=SrvsXiEBMV8d6xc6SS5XDaILfiHu/cyCXcRqf/SyAJMhE2z1Y+htlz1OC4AlNL2ipS
	Bq2WkLVT10irjLdNbM9PrSIiE0l0h1vZBbCMyXt8lxjfC3WD6H+WsMMW7xtVcXDOHG3m
	wWEFNEhraYJFP9BeTRquqgVT/5NNdXECDhvjhzvtKy3cgIPviE/JWU3eJVnCct8bRD8d
	kCPZtnnR8w2Fx8/Hq2FX2Vr5twRHwG2ELsL/yLrwDWZA9EYwlxA55iZF7woiziMSkhqO
	5Ro+2sWagD4tY57FUSCL9nRsUq1RoZgzztqtTR/bT+fN/q3hLZhFcbNgj7D2/JkZkQYq
	LtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qVhvbpvsz6f2CbZgN63HQLKaL32bh1dfC+cyMUnpG0c=;
	b=Z298ZHVisJLtvrJg3WHgw9M0t3eRAbv51LPJwyCUdcGg7GWcMyrW6s3KyJGSvbSk5t
	8xUTsN2f910NGNYQqfRpDRD138ejo1wXhNas6WtywW8QbUJtk9PEh45nYQvC6983cw90
	LpoDE+np1QZ0ZEY5/VNv4MLSGH0R6r4oVg6hz+Ee5XmkUzCca8qMF0nBANGwWx6yzuYY
	xWvUQzJUJo5PH5qKtFtkau2EFNu56LpOn6ABZ/D9/3rg6PE9KcwJeBJIumMir3DeebtU
	CJwmcETXS8qf7lH+9xQZGFMPjnPfPvBrmJ/Hl9auUEVUTLxbg7Yleg6W+LUr/jAk6KnD
	0wLw==
X-Gm-Message-State: AHYfb5in3jHs77MrRPTXwYhjfSEzvKuyRQO278irdCz45nkoMYcsU8hr
	uH+k1meoh8ZrlJ1iUEsxbSaWUYnzdg==
X-Received: by 10.31.184.66 with SMTP id i63mr7677229vkf.122.1503309568320;
	Mon, 21 Aug 2017 02:59:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Mon, 21 Aug 2017 02:59:27 -0700 (PDT)
In-Reply-To: <1503307787.32591.59.camel@linuxfoundation.org>
References: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
	<1502969638.13978.209.camel@linuxfoundation.org>
	<CA+chaQcZKA=x1_O88h=Akjh=Cr2Rtt_8GqgRrm61fuLnT_myRw@mail.gmail.com>
	<d2851cd0-1a15-f5aa-1e9b-dda654978178@linux.intel.com>
	<CAMKF1sryybJQXYvkQVbSEciBhYY1s7Xc-k+qhFJSRbbRxi1DJQ@mail.gmail.com>
	<fe1575c3-4e74-1a5d-b48e-86c6908b2e63@linux.intel.com>
	<CAMKF1soQw0VVy0RKe4w-qsCwPh_OTgatYLrx6mPpapBGooy-Ew@mail.gmail.com>
	<CA+chaQcQNkYbnSpVzA5xceo=CTpWDnKd8n3WaZM6zbUOe5m_XA@mail.gmail.com>
	<1503307787.32591.59.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 21 Aug 2017 11:59:27 +0200
Message-ID: <CA+chaQe=9FwaSM8tPoociMkGOJtvssqn6omivh89bBVjzA0mfA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Mon, 21 Aug 2017 09:59:27 -0000
Content-Type: multipart/alternative; boundary="001a1143a716ceacc905574088b2"

--001a1143a716ceacc905574088b2
Content-Type: text/plain; charset="UTF-8"

Yes, the 'revert' works for me, thanks.

On Mon, Aug 21, 2017 at 11:29 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2017-08-18 at 19:29 +0200, Martin Jansa wrote:
> > Even with that patch to rename openssl10 back to openssl we still
> > need to solve the openssl-native which wasn't reverted back to 1.0.
> >
> > Upstream nodejs isn't going to be openssl-1.1 for a bit longer as
> > explained:
> > https://github.com/nodejs/node/pull/14761
> > https://github.com/nodejs/node/pull/11828
> > so it would make sense to revert native and nativesdk versions as
> > well - if it isn't done in oe-core, I'll do it in our own layers to
> > keep the builds going.
>
> Hopefully we have a working 'revert' back to 1.0 in master now as there
> was simply too much breakage for this release.
>
> I would ask that people do try and figure out how to solve some of the
> 1.1 issues in the meantime, hopefully people can enable 1.1 with some
> PREFERRED_VERSION tweaks.
>
> Cheers,
>
> Richard
>

--001a1143a716ceacc905574088b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, the &#39;revert&#39; works for me, thanks.</div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Aug 21, 2017 a=
t 11:29 AM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.=
purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundatio=
n.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On Fri, 2017-08-18 at 19:29 +0200, Martin Jansa wrote:<br>
&gt; Even with that patch to rename openssl10 back to openssl we still<br>
&gt; need to solve the openssl-native which wasn&#39;t reverted back to 1.0=
.<br>
&gt;<br>
&gt; Upstream nodejs isn&#39;t going to be openssl-1.1 for a bit longer as<=
br>
&gt; explained:<br>
&gt; <a href=3D"https://github.com/nodejs/node/pull/14761" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/nodejs/<wbr>node/pull/14761</a><br>
&gt; <a href=3D"https://github.com/nodejs/node/pull/11828" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/nodejs/<wbr>node/pull/11828</a><br>
&gt; so it would make sense to revert native and nativesdk versions as<br>
&gt; well - if it isn&#39;t done in oe-core, I&#39;ll do it in our own laye=
rs to<br>
&gt; keep the builds going.<br>
<br>
</span>Hopefully we have a working &#39;revert&#39; back to 1.0 in master n=
ow as there<br>
was simply too much breakage for this release.<br>
<br>
I would ask that people do try and figure out how to solve some of the<br>
1.1 issues in the meantime, hopefully people can enable 1.1 with some<br>
PREFERRED_VERSION tweaks.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>

--001a1143a716ceacc905574088b2--
