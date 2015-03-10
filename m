Return-Path: <naresh.bhat@linaro.org>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6AFC4739C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 09:24:20 +0000 (UTC)
Received: by lbdu14 with SMTP id u14so350448lbd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 02:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=WcsRIETrjVat7oO4eIcg0X5+CepQ2bEQj11zKM3uJGM=;
	b=TV3Q79k0YcoIY0Ex4It9oaR2oOIlyQhLH+vNP5IhbGFiBRgBXf3dbvLys1jtEN8fr9
	g7aAEyrWMOPwa+8DzfnKR8twJMbTeLzZCYCz6AgBZiRqt9QTCCWWK+stu1kDH+4oK/vs
	RTPa3t/wgApJeUjeHUDarIFeAz25ehQrHp2/s82ie58EnQhKZvuOLeRTgNThQpKFJ4/h
	zG0xdvcEvqs14az0Nfhzsv8iNUj/HoVnY2Uh7ZNZeM+JgN+4U8n1hH5bB/Una/WFy/Li
	6uTHeKf+cWf1EzbW2Cu2FoIT/bbaI+k90UDeN3GPAnnWtnwkcUNYJrtc0DBhHsysi0HB
	yBcw==
X-Gm-Message-State: ALoCoQm2hnw/1J0hTypPIHukOnvWQ9cWXh9Tq2TRrok0L0bzPUQZH4VsSv8EcH7flgabIW/K9aaC
MIME-Version: 1.0
X-Received: by 10.112.11.136 with SMTP id q8mr28994881lbb.30.1425979459892;
	Tue, 10 Mar 2015 02:24:19 -0700 (PDT)
Received: by 10.112.5.73 with HTTP; Tue, 10 Mar 2015 02:24:19 -0700 (PDT)
In-Reply-To: <A5F8DCD5-DA8E-4995-8D54-33F6801CD020@gmail.com>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-4-git-send-email-naresh.bhat@linaro.org>
	<CAC1BbcSv-o_=GD9LJkZJyX38TbAmyXkmtJY+NBZ0-xqSDNeUBA@mail.gmail.com>
	<CAFoFrHZnnK+SuTcVVn7JSZE_A0DKBy2+9R9wtubWBf5zupPhnw@mail.gmail.com>
	<081F4A97-C2A2-4221-9A7F-CFC1022D71A1@gmail.com>
	<CAFoFrHYSHJfyWWfgaVGk6cukkVECzTv7TA+4Ur4BnfE2aC=mrA@mail.gmail.com>
	<CAC1BbcRkNO_U+XFmzoLwDUV+7Gn8NC5-JUXOqfVTwHOt_osrag@mail.gmail.com>
	<CAFoFrHbNUfefWimW+jO9ts+rpKJ5ax0eD4FJEfsF3tUpAGjnyQ@mail.gmail.com>
	<A5F8DCD5-DA8E-4995-8D54-33F6801CD020@gmail.com>
Date: Tue, 10 Mar 2015 14:54:19 +0530
Message-ID: <CAFoFrHZXHpGUFNgxobWhvz24Ynhyb4_+Q2CCvPCrx+O-mjS2mg@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core Yocto PATCH 3/4] bootimg: Skip build iso image for aarch64
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
X-List-Received-Date: Tue, 10 Mar 2015 09:24:23 -0000
Content-Type: multipart/alternative; boundary=001a11c3b61e2a0c5b0510ebb7e6

--001a11c3b61e2a0c5b0510ebb7e6
Content-Type: text/plain; charset=UTF-8

On 10 March 2015 at 14:42, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
wrote:

> On March 9, 2015 9:11:29 AM GMT+01:00, Naresh Bhat <naresh.bhat@linaro.org>
> wrote:
>
> >today/tomorrow.  Can we please continue the discussion on my next
> >series.  Probably you can give me few more points on my next patch
> >series.
>
> Please CC me so i do not overlook the new series, TIA.
>
Oops my apologies I forgot to CC you..:(  I have already posted the v1
series @oe-core.  I will keep in mind while posting next series.

--001a11c3b61e2a0c5b0510ebb7e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 10 March 2015 at 14:42, Bernhard Reutner-Fischer <span dir=3D"ltr">&=
lt;<a href=3D"mailto:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On March 9, 2015 9:11:29 AM GMT+01:00, Naresh Bhat &lt;<a href=3D"=
mailto:naresh.bhat@linaro.org">naresh.bhat@linaro.org</a>&gt; wrote:<br>
<br>
&gt;today/tomorrow.=C2=A0 Can we please continue the discussion on my next<=
br>
&gt;series.=C2=A0 Probably you can give me few more points on my next patch=
<br>
&gt;series.<br>
<br>
</span>Please CC me so i do not overlook the new series, TIA.<br></blockquo=
te><div>Oops my apologies I forgot to CC you..:(=C2=A0 I have already poste=
d the v1 series @oe-core.=C2=A0 I will keep in mind while posting next seri=
es.<br></div></div><br></div></div>

--001a11c3b61e2a0c5b0510ebb7e6--
