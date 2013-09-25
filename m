Return-Path: <raj.khem@gmail.com>
Received: from mail-qe0-f48.google.com (mail-qe0-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id C79EE60FE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 15:50:13 +0000 (UTC)
Received: by mail-qe0-f48.google.com with SMTP id nd7so4344069qeb.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2Uf2Nsej2Bh6GCwYqZ07sBrP7hYGY8OVXvxvyArNoDY=;
	b=ndbIV5qqGjVPul4T1/4M2VNVc5+PPG3MDT3y0sSiK1GN8hKXs3Cq11CcIExusjwPKs
	qtWUG1ZdoKh3qjKe/oVyVKeUpWU9isygAUup0JIKsfM54i9WrSeOSH8copnn+2IEhlJr
	b1OBz2jiGSd+opTaR75cOPfRT+Ta2XPLsvr+s+r8I4KaKXFTwbIRBZyz4qOg010VBMMO
	NAMJ/HMqkj67y6NNOg4uYVV+eOEfHKfTbIbJQnX2C2t/QERZSbhHE6ifkVJEc57DFLNP
	E4FyxjQjBbdzK/iHWzwSYxCD94ErtlyJlsXUFdr+QLeAq7dW335XCMyaL4+nmiRPO2BZ
	Kg4Q==
MIME-Version: 1.0
X-Received: by 10.49.30.227 with SMTP id v3mr2986882qeh.92.1380124214847; Wed,
	25 Sep 2013 08:50:14 -0700 (PDT)
Received: by 10.224.10.201 with HTTP; Wed, 25 Sep 2013 08:50:14 -0700 (PDT)
In-Reply-To: <1380120910.18603.333.camel@ted>
References: <1380088716-12512-1-git-send-email-rongqing.li@windriver.com>
	<CAMKF1srAiBKPz15vALjs-X+pZojUq=y=zGeoAj1zj-s-oHQW6w@mail.gmail.com>
	<1380120910.18603.333.camel@ted>
Date: Wed, 25 Sep 2013 08:50:14 -0700
Message-ID: <CAMKF1sqM6T9h9aiDjFhHDaeG8FtB2jNMHCcoMAkYWzU3bpurkA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] makedevs: rectify the exit codes and handle the invalid parameter
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
X-List-Received-Date: Wed, 25 Sep 2013 15:50:14 -0000
Content-Type: multipart/alternative; boundary=047d7bd767ae926edd04e73735f1

--047d7bd767ae926edd04e73735f1
Content-Type: text/plain; charset=UTF-8

On Wednesday, September 25, 2013, Richard Purdie wrote:

> On Wed, 2013-09-25 at 07:27 -0700, Khem Raj wrote:
> > On Tuesday, September 24, 2013, wrote:
> >         From: Roy Li <rongqing.li@windriver.com <javascript:;>>
> >
> >         It is correct behaviours to output help and version
> >         information,
> >         and should return 0;
> >         When input parameter is invalid, print help information and
> >         exit.
>
> >
> > This can cause gripes for systems who have scripted the old behavior
> > And since it's a user visible change I would suggest to get it
> > accepted upstream before
> > It's applied in openembedded
> >
> I think we have our own copy of this particular C file so we are the
> upstream...


Likewise you can have copies of anything and call it upstream this file
also exists in busybox
And I would think there are people using that version too. If others are
syncing from this version
Then it's fine otherwise people migrating to oe will have yet another thing
to deal with.


> Cheers,
>
> Richard
>
>
>

--047d7bd767ae926edd04e73735f1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, September 25, 2013, Richard Purdie  wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On Wed, 2013-09-25 at 07:27 -0700, Khem Raj wrote:<=
br>

&gt; On Tuesday, September 24, 2013, wrote:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 From: Roy Li &lt;<a href=3D"javascript:;" =
onclick=3D"_e(event, &#39;cvml&#39;, &#39;rongqing.li@windriver.com&#39;)">=
rongqing.li@windriver.com</a>&gt;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 It is correct behaviours to output help an=
d version<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 information,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 and should return 0;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 When input parameter is invalid, print hel=
p information and<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit.<br>
<br>
&gt;<br>
&gt; This can cause gripes for systems who have scripted the old behavior<b=
r>
&gt; And since it&#39;s a user visible change I would suggest to get it<br>
&gt; accepted upstream before<br>
&gt; It&#39;s applied in openembedded<br>
&gt;<br>
I think we have our own copy of this particular C file so we are the<br>
upstream...</blockquote><div><br></div><div>Likewise you can have copies of=
 anything and call it upstream this file also exists in busybox</div><div>A=
nd I would think there are people using that version too. If others are syn=
cing from this version</div>
<div>Then it&#39;s fine otherwise people migrating to oe will have yet anot=
her thing to deal with.</div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote>

--047d7bd767ae926edd04e73735f1--
