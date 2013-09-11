Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id C8D2361855
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 13:02:07 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hm2so2126879wib.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 06:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ywo+t97yXqET9HPmsQhgrICy2OB9Pol5RuI5QiIiE2o=;
	b=h9pEFTg0kTiEss760dsz3enhnyfqPuroilGsiLJ/VDgSh6mv+TWAwTf5FLAyICDo0V
	T2bXe17x6hP6C6P+g8nIMzRs1d9zY4BKXWT54BjJ6NwshJP/KM1Zm8M0JQq+54M950lp
	hd40NyeiiWwsIhxuo+0TSGVbu4MkGG/G8v53zd4VjioUh+GPZ41RznS7Bftvgg1mrpr1
	EZxI41USZjSA7bhEZOfOSuWLgIsgQWBT395A/xo84SpR0bJM5z6B6GkL1qq3iiofxwmG
	5jS9Jnc/KBpX1q6tWA7dlfWdbF11avu2Vs9ADLNSCMsoFWF/GoCtzA5ZPyIfiSPdkTKO
	VlKA==
X-Gm-Message-State: ALoCoQme+rypPGgzi6F5qdzRwIYV1+lgtB25MHFoXpO3OAQaLV1NCnmEMLwBgazwDMvKcQH5goOG
X-Received: by 10.180.21.170 with SMTP id w10mr247640wie.62.1378904526202;
	Wed, 11 Sep 2013 06:02:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.180.218.200 with HTTP; Wed, 11 Sep 2013 06:01:46 -0700 (PDT)
In-Reply-To: <1378900852.3484.179.camel@ted>
References: <CAP71Wjynkd=CGry-YKvEetsuGvoXmhwhVAF1rXuOuo-nh7V2CQ@mail.gmail.com>
	<1378900852.3484.179.camel@ted>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 11 Sep 2013 15:01:46 +0200
Message-ID: <CAP71Wjw7-7FX39-baCq+opPry1rpV9UqNDjX8MZRrJ6+qAKtSw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Linaro Dev <linaro-dev@lists.linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE gcc-cross with builtin sysroot, BUG?
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
X-List-Received-Date: Wed, 11 Sep 2013 13:02:09 -0000
Content-Type: multipart/alternative; boundary=047d7bb70cb076bbe604e61b3a6d

--047d7bb70cb076bbe604e61b3a6d
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 11, 2013 at 2:00 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > So, of course we shouldn't ignore the CFLAGS from OE, and the CFLAGS
> > would set the right sysroot, and of course we fixed our software so
> > that we don't ignore CFLAGS anymore... but that still looks like a bug
> > to me.
> >
> Not really, its actually intentionally designed like this since its
> pointless rebuilding gcc-cross multiple time just because we want to use
> it with a different sysroot. We therefore just pass in the arguments to
> the compiler to ensure it uses the right one. If you remove them, you
> hit the problems you describe.
>
> We should probably compile in a bogus sysroot so it never works and
> makes this kind of issue more visible.
>

hmm. ok. i see. it would certainly help to have a better 'error' message...
i suppose that not having a builtin sysroot at all, would be an even bigger
problem as it would default to /usr/include...

--047d7bb70cb076bbe604e61b3a6d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Sep 11, 2013 at 2:00 PM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"im">=
&gt; So, of course we shouldn&#39;t ignore the CFLAGS from OE, and the CFLA=
GS<br>


&gt; would set the right sysroot, and of course we fixed our software so<br=
>
&gt; that we don&#39;t ignore CFLAGS anymore... but that still looks like a=
 bug<br>
&gt; to me.<br>
&gt;<br>
</div></div>Not really, its actually intentionally designed like this since=
 its<br>
pointless rebuilding gcc-cross multiple time just because we want to use<br=
>
it with a different sysroot. We therefore just pass in the arguments to<br>
the compiler to ensure it uses the right one. If you remove them, you<br>
hit the problems you describe.<br>
<br>
We should probably compile in a bogus sysroot so it never works and<br>
makes this kind of issue more visible.<br></blockquote></div><br>hmm. ok. i=
 see. it would certainly help to have a better &#39;error&#39; message... i=
 suppose that not having a builtin sysroot at all, would be an even bigger =
problem as it would default to /usr/include...=A0</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><br></div><=
/div>

--047d7bb70cb076bbe604e61b3a6d--
