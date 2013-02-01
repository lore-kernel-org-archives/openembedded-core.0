Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1U1E95-0006jq-UQ
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 11:47:03 +0100
Received: from mail-bk0-f71.google.com ([209.85.214.71])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 02:30:11 -0800
Received: by mail-bk0-f71.google.com with SMTP id jk13so4378313bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 02:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=u8kULUpp3T59N2K7YaGMW8CGsZvjICYiGymfXRc6vbs=;
	b=GKwcwlpvvfDkxSzxGcKLWBrz5tgW0G8+QHixXFzOWOLKkk6iZNAzhvoHhzGp9d6/7H
	WdFQXX2OiMMw8ADya/IX/ebsC4OFaDcal1zqWVEtbkKFi7yLsPTV+o/M6UMm4I3oxtHC
	W74ycZsIv3NL16ABJADeNg3e21WC27U6yqj7vyhCgcCuhJ0mX4ebpQs9dCj1ManCSZZQ
	8vh51Ke1ft+94+cm1wADYXKaKzHnvRSIJQXavyztLR64QWgPfq86gfG+ASDO0kEXWh6m
	TtBS3P+qi3ZkRh1HHUSL/W1uFDfhmP3wpCFA4wgtel/77UcxORvqN2HjPesp82QXIDHK
	rAyQ==
X-Received: by 10.194.108.101 with SMTP id hj5mr20782184wjb.6.1359714609032;
	Fri, 01 Feb 2013 02:30:09 -0800 (PST)
X-Received: by 10.194.108.101 with SMTP id hj5mr20782169wjb.6.1359714608913;
	Fri, 01 Feb 2013 02:30:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.93.229 with HTTP; Fri, 1 Feb 2013 02:29:48 -0800 (PST)
In-Reply-To: <1359649807.14071.48.camel@ted>
References: <1359633187-28629-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1359649807.14071.48.camel@ted>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Fri, 1 Feb 2013 12:29:48 +0200
Message-ID: <CAMZjud1kH9o5iv+LU2QtaeSebftwXp+-vLF-ztSyxAOwktC8WA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQnqj1nZ3/5J5Hdx8wPU2sUVdW+/TyO5nxWCeQI6T/n3xBQa3JuwuZYao8mvyu5AX8X30g2JQA8F6dzCQn8TP4B9BaY1GW52jD4QXJ118SsrsjtuChY4Gc67dJ+USF8Cse76i7cknA0+RTFX0gvQp2TEbC0xuMS3xRZl7tyqJ/HKtNFQDSkxsNZdUtQ/JrGs7KJ+e5Nv
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] flex: updated to 2.5.37
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 10:47:06 -0000
Content-Type: multipart/alternative; boundary=047d7bf10a36429b6e04d4a73a48

--047d7bf10a36429b6e04d4a73a48
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 31, 2013 at 6:30 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2013-01-31 at 13:53 +0200, Bogdan Marinescu wrote:
> > Removed the patches to flex, because they are now applied to the
> > latest version.
> >
> > Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> > ---
> >  .../flex/flex/avoid-FORTIFY-warnings.patch         |   59
> --------------------
> >  .../flex/int-is-not-the-same-size-as-size_t.patch  |   42 --------------
> >  meta/recipes-devtools/flex/flex_2.5.35.bb          |   11 ----
> >  meta/recipes-devtools/flex/flex_2.5.37.bb          |    8 +++
> >  4 files changed, 8 insertions(+), 112 deletions(-)
> >  delete mode 100644
> meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
> >  delete mode 100644
> meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch
> >  delete mode 100644 meta/recipes-devtools/flex/flex_2.5.35.bb
> >  create mode 100644 meta/recipes-devtools/flex/flex_2.5.37.bb
>
> This failed to build for me:
>

What image are you building? I am unable to reproduce this problem locally.

Thanks,
Bogdan

--047d7bf10a36429b6e04d4a73a48
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Thu, Jan 31, 2013 at 6:30 PM, Richard=
 Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span=
> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Thu, 2013-01-31 at 13:5=
3 +0200, Bogdan Marinescu wrote:<br>
&gt; Removed the patches to flex, because they are now applied to the<br>
&gt; latest version.<br>
&gt;<br>
&gt; Signed-off-by: Bogdan Marinescu &lt;<a href=3D"mailto:bogdan.a.marines=
cu@intel.com">bogdan.a.marinescu@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0.../flex/flex/avoid-FORTIFY-warnings.patch =A0 =A0 =A0 =A0 | =A0 59=
 --------------------<br>
&gt; =A0.../flex/int-is-not-the-same-size-as-size_t.patch =A0| =A0 42 -----=
---------<br>
&gt; =A0meta/recipes-devtools/flex/<a href=3D"http://flex_2.5.35.bb" target=
=3D"_blank">flex_2.5.35.bb</a> =A0 =A0 =A0 =A0 =A0| =A0 11 ----<br>
&gt; =A0meta/recipes-devtools/flex/<a href=3D"http://flex_2.5.37.bb" target=
=3D"_blank">flex_2.5.37.bb</a> =A0 =A0 =A0 =A0 =A0| =A0 =A08 +++<br>
&gt; =A04 files changed, 8 insertions(+), 112 deletions(-)<br>
&gt; =A0delete mode 100644 meta/recipes-devtools/flex/flex/avoid-FORTIFY-wa=
rnings.patch<br>
&gt; =A0delete mode 100644 meta/recipes-devtools/flex/flex/int-is-not-the-s=
ame-size-as-size_t.patch<br>
&gt; =A0delete mode 100644 meta/recipes-devtools/flex/<a href=3D"http://fle=
x_2.5.35.bb" target=3D"_blank">flex_2.5.35.bb</a><br>
&gt; =A0create mode 100644 meta/recipes-devtools/flex/<a href=3D"http://fle=
x_2.5.37.bb" target=3D"_blank">flex_2.5.37.bb</a><br>
<br>
</div>This failed to build for me:<br></blockquote><div><br></div><div>What=
 image are you building? I am unable to reproduce this problem locally.</di=
v><div><br></div><div>Thanks,</div><div>Bogdan</div><div><br></div></div>


--047d7bf10a36429b6e04d4a73a48--
