Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SwxS1-0003f0-9j
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 17:36:37 +0200
Received: by wgbdr1 with SMTP id dr1so7221861wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 08:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=tGyz/dEb9mNfWLnuN4nhx9CCipH8J4b+luGg7VXO/HQ=;
	b=UpjCtX8ei2yf+t+gKoW2TMwIZ7ryDwwFO7vgLtx2CpixrvAg7a3k9QlVANBWDlCTVX
	jb9OgXgx/0Tvzr8lxpyOlWBO70g1im8EOdkOb1QM+1F68RRkZ0v5SOizm2uS1GRykNzh
	lZ6cRjwNlMPd3Uq5nCDbiUI7N1n12F2/F2BNQ414p6Cgllsve2HMoEPUgTFdCURk29BR
	HRaUs28FYV8m57SZTCCsBpAONZ0n9WDP/Iel/+44+WcHJEWXkgK656bB/CFIwLFN4I03
	ihmEy6s4GLtZqA+q4FLljr+ioPIZAwGbR8zPH7dUEL18wdupLVypVLSnoi8NIYtHwl4x
	toiQ==
Received: by 10.50.195.234 with SMTP id ih10mr3311142igc.0.1343921097017; Thu,
	02 Aug 2012 08:24:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.139.164 with HTTP; Thu, 2 Aug 2012 08:24:36 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <0AF90D68-14FE-4555-9293-75450B061A51@dominion.thruhere.net>
References: <1343909173-2161-1-git-send-email-radu.moisan@intel.com>
	<CD1E2BF4-09A1-4800-8191-553B40E4CF6B@dominion.thruhere.net>
	<CAJTo0LakdrRqVVx+jAeUK7Upx570=jLo=PYONZ63=xDNiwD5jA@mail.gmail.com>
	<0AF90D68-14FE-4555-9293-75450B061A51@dominion.thruhere.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 2 Aug 2012 18:24:36 +0300
Message-ID: <CAK18fxEEkJaqtOhBh=H5NSf62i6S+rOM_XXQwanLUWowiRbRLQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkGPYWEOL8CfBzmE3tQ/IS/rueQcF932L6ugPOzyMr6oralqbyz/X4p23QXbkQtL83zC+8M
Subject: Re: [PATCH v2] usbutils: Upgrade usbutils to upstream v006
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
X-List-Received-Date: Thu, 02 Aug 2012 15:36:37 -0000
Content-Type: multipart/alternative; boundary=14dae934125b98082504c64a03db

--14dae934125b98082504c64a03db
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 2, 2012 at 5:14 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

>
> Op 2 aug. 2012, om 15:55 heeft "Burton, Ross" <ross.burton@intel.com> het
> volgende geschreven:
>
> > On 2 August 2012 14:50, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >> That's the default value, so you can drop this hunk
> >
> > Can we settle this once and for all?  Sure, it's the default, but it's
> > also going to be added back in again the moment there's a change...
> > I'm a fan of leaving a PR in there, even at r0, so its not constantly
> > being added and removed.
>
> The complete PR field is scheduled to get removed, so the more recipes
> without it being said to that stupid default value, the better.
>
>
Agreed.

ag

--14dae934125b98082504c64a03db
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Aug 2, 2012 at 5:14 PM, Koen Kooi <span =
dir=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net" target=3D"_bl=
ank">koen@dominion.thruhere.net</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

<br>
Op 2 aug. 2012, om 15:55 heeft &quot;Burton, Ross&quot; &lt;<a href=3D"mail=
to:ross.burton@intel.com">ross.burton@intel.com</a>&gt; het volgende geschr=
even:<br>
<div class=3D"im"><br>
&gt; On 2 August 2012 14:50, Koen Kooi &lt;<a href=3D"mailto:koen@dominion.=
thruhere.net">koen@dominion.thruhere.net</a>&gt; wrote:<br>
&gt;&gt; That&#39;s the default value, so you can drop this hunk<br>
&gt;<br>
&gt; Can we settle this once and for all? =A0Sure, it&#39;s the default, bu=
t it&#39;s<br>
&gt; also going to be added back in again the moment there&#39;s a change..=
.<br>
&gt; I&#39;m a fan of leaving a PR in there, even at r0, so its not constan=
tly<br>
&gt; being added and removed.<br>
<br>
</div>The complete PR field is scheduled to get removed, so the more recipe=
s without it being said to that stupid default value, the better.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><div>=
=A0</div><div>Agreed.</div><div><br></div><div>ag</div></div>

--14dae934125b98082504c64a03db--
