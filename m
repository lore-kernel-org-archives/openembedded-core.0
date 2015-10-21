Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 161FA73CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 08:54:15 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so63841782wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 01:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4nU3mdx7DXx+XXC180JRRXe9w51aMIeNuYGeHbgR1xA=;
	b=mb31ql1blUoU+/qGa/I1XIrD15H6D3zPsmb+BeRFADUnisKYPs9nUT/DNwnyTWy8S0
	iUKSTdMFBo6LE90sWZeN3kFCdJ0imoMA11GzteEj1NQJd90pr9rlWg0uIQNXeaB5I5Ha
	RJcuuc2HrCSER71Gxqo3tGibJ8dmaYKdzDmzR7jWC5BPFL+tXHSKqSM7QDGU4+2mhT/o
	jr/bDK/Te6uSuguys6Y8uP0VEDAW3cuTJmZ+s1yk35jHovU38VevMNM9ZV6ROjd8s6na
	Xh6+PVwNtrWy7CPhRFcTc1sfSaD3Xq7NXWMLe8gDHBmEGZ/n8q/Jtp659Bc2oruSmNJd
	b/Yg==
X-Gm-Message-State: ALoCoQllIhgT0VibYyUJoW0CCfsWEQHvF33gvSVSwbql4H2mg9b9hVfJsJoyynW4GTSx8lpDd7uc
X-Received: by 10.194.156.166 with SMTP id wf6mr8807912wjb.130.1445417655186; 
	Wed, 21 Oct 2015 01:54:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.186.69 with HTTP; Wed, 21 Oct 2015 01:53:45 -0700 (PDT)
In-Reply-To: <CAJTo0LYxvYLQpeqVyR4HhzRJywUY5Ve_cHfsYo4VkV9otvJ5cA@mail.gmail.com>
References: <cover.1445415749.git.jussi.kukkonen@intel.com>
	<34b6f876ffd9463779923ec2297e060e893034f4.1445415749.git.jussi.kukkonen@intel.com>
	<CAJTo0LYxvYLQpeqVyR4HhzRJywUY5Ve_cHfsYo4VkV9otvJ5cA@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 21 Oct 2015 11:53:45 +0300
Message-ID: <CAHiDW_Ep2_tkctPDR_A09EqG-15NS=pnC3w9evd7WiwZYnqdKA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gtk+3: Do not try to initialize GL without libgl
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
X-List-Received-Date: Wed, 21 Oct 2015 08:54:17 -0000
Content-Type: multipart/alternative; boundary=089e0122e972e3d3ad052299855e

--089e0122e972e3d3ad052299855e
Content-Type: text/plain; charset=UTF-8

On 21 October 2015 at 11:43, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 21 October 2015 at 09:34, Jussi Kukkonen <jussi.kukkonen@intel.com>
> wrote:
>
>> +PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
>>
>
> This adds a RDEPENDS of libgl to libgtk3, so the explicit RDEPENDS on
> gtk3-demo isn't required.  As GTK+ explicitly checks for GLX at startup I
> guess you want to remove the explicit RDEPENDS on gtk3-demo and the advice
> that applications should rdepend on libgl?
>

The -demo RDEPENDS was now RRECOMMENDS but otherwise I guess that sounds
correct for now: I imagine the gtk RDEPENDS will disappear once this is
properly fixed upstream.

Thanks, I'll wait a moment for any other comments and send V2,

  Jussi

--089e0122e972e3d3ad052299855e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
1 October 2015 at 11:43, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mail=
to:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</=
span> wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_extra"><div class=3D"gmail_quote">On 21 October 2015 at 09:34, Jussi K=
ukkonen <span dir=3D"ltr">&lt;<a href=3D"mailto:jussi.kukkonen@intel.com" t=
arget=3D"_blank">jussi.kukkonen@intel.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div style=3D"overflow:hidden">+PACKAGECONFIG[glx] =
=3D &quot;--enable-glx,--disable-glx,,libgl&quot;<br></div></blockquote></d=
iv><br>This adds a RDEPENDS of libgl to libgtk3, so the explicit RDEPENDS o=
n gtk3-demo isn&#39;t required.=C2=A0 As GTK+ explicitly checks for GLX at =
startup I guess you want to remove the explicit RDEPENDS on gtk3-demo and t=
he advice that applications should rdepend on libgl?</div></div></blockquot=
e><div><br></div><div>The -demo RDEPENDS was now RRECOMMENDS but otherwise =
I guess that sounds correct for now: I imagine the gtk RDEPENDS will disapp=
ear once this is properly fixed upstream.</div><div><br></div><div>Thanks, =
I&#39;ll wait a moment for any other comments and send V2,</div><div><br></=
div><div>=C2=A0 Jussi</div><div><br></div></div></div></div>

--089e0122e972e3d3ad052299855e--
