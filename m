Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5388E78812
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 17:19:00 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id x4so9396034wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 09:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BIftQhXglAC3ZCcQqApIxpUVA8xHPMqYAWFhmVAmzlk=;
	b=okfIr5lgymxF9tEnH4OX4sufHBug8cDUTU4DRawYBNI99auaagp5hPL5DN1QcpBNtI
	RFl+OKiOikJw/WinemfB6YjImd+SmTfEy30FmRuMp+wpVykEJr0/7FDwFMhXBpiKi4qP
	oFEgWEkszz7fxvVLf0aUIwWix3JMksEGjelMqDPVEcjsIpYA1uslnHtfo+aeDxF4W8rk
	niB5/cPUQWZTmnWBEZSJieuNuBN8VZ+jolaT4ibW1DmaJozeByQ3FQC7DxlEuMiDJ0Z5
	h2NwIiTFK07ZSZd3Wh0ph1Z6GTE5A00Yy15SL2DUuTXZjKamiCtNXqNlxk848GOItufx
	/nDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BIftQhXglAC3ZCcQqApIxpUVA8xHPMqYAWFhmVAmzlk=;
	b=EVZzS4hpVc/vFjlGD7DMtk8fxHEB0/MjTL7AwBnJ7Y4zvr3yxFXV3BRp2betgMLmjI
	FKru2y/zSaBaudHfmTjI6uYzYdFJOp4L+0EWR4ohWznA2udxDFudhsGX5DwDlL2mzknF
	yS2wL4ACJ+mzRy9T8RJsmMYW7NZkkoRoh6UHCWBRndeG19dTPFUiCMNIgVxaCroX65z8
	QtYwKSM4Gcm1KojWI3790cNcGEhVwtrawuvNLik8K5xC6IR0iy1nmHuhZKxel9cZno47
	RP64dXWAhdtSrpDCK/7o7XUuWT1zfXFlRgiuPQlKbCtI76dHck/p1x7dEjS71NMQSVQX
	6row==
X-Gm-Message-State: AKwxytdK14IrJp1EjP2eiZ9LLA2uyIRnW/3dVz+XyRKjA/m6KMvCD/Iz
	rM1YacS79OaMmKMUC58QNN/6E4zd5hYO1yiEgnA=
X-Google-Smtp-Source: AH8x226cEAxhNr1B2xnvtv+ALMjfHkoinn3HmtWB+CsLQgghmEjK4jI2AGrCkN1RvHVOebSbpy9GaI/CdEaOGGq5S8s=
X-Received: by 10.28.191.19 with SMTP id p19mr22957201wmf.142.1517419142160;
	Wed, 31 Jan 2018 09:19:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Wed, 31 Jan 2018 09:19:01 -0800 (PST)
In-Reply-To: <CAJTo0LYe7qU66tBRbyDfWkg=PJm2aPXg5fhCVP5rp2PwbyFnfw@mail.gmail.com>
References: <20180130083003.39-1-Martin.Jansa@gmail.com>
	<CAJTo0LYmP0iqbm5X50FPi80=LB+tUD90JVzYPf8uah=c0ysiew@mail.gmail.com>
	<CA+chaQc57j=7JQx3iNHfomkjVXmZX7Lm+yLED+xzMg7uhrVa8w@mail.gmail.com>
	<CALbNGRSkvxi3AWkzZcsipSspQnEjsdZ4VKwbFGRN0o9tY4G2-A@mail.gmail.com>
	<CA+chaQdBgGX-K3fb15L6LR6f=iFZUkvb250xK5+4pjPyrYbf4w@mail.gmail.com>
	<CA+chaQc+r5U7_W=rhKRzxaG16Lk6SYBBD=UBvdqNvbZ2N74Bjw@mail.gmail.com>
	<1517418291.31752.85.camel@gmail.com>
	<CA+chaQcD1Xt04c4A=1J3eNS-vd_1Bw04A0aV=oQ211ONo1ZAuQ@mail.gmail.com>
	<CAJTo0LYe7qU66tBRbyDfWkg=PJm2aPXg5fhCVP5rp2PwbyFnfw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 31 Jan 2018 18:19:01 +0100
Message-ID: <CA+chaQex47NDXaeBFcFF-_fsa5QLSobP7xfavCC5d0DCoUEypA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Joe Slater <jslater@windriver.com>, Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] waf.bbclass: check that waf exists before trying to execute it
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
X-List-Received-Date: Wed, 31 Jan 2018 17:19:01 -0000
Content-Type: multipart/alternative; boundary="001a114e2782f1a67c056415ac67"

--001a114e2782f1a67c056415ac67
Content-Type: text/plain; charset="UTF-8"

But shouldn't it at least show different error message in case when
${S}/waf doesn't exist and when it fails to execute it for whatever reason?

On Wed, Jan 31, 2018 at 6:16 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 31 January 2018 at 17:07, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> What about the recipes which don't have ${S}/waf at all (and might
>> inherit waf from possibly wrong reasons), like all those waf-samba recipes
>> mentioned before?
>>
>
> If a recipe inherits waf but doesn't use waf I'm absolutely fine with it
> erroring out.  Its always bothered me that autotools.bbclass doesn't object
> if configure can't be found.
>
> Ross
>

--001a114e2782f1a67c056415ac67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">But shouldn&#39;t it at least show different error message=
 in case when ${S}/waf doesn&#39;t exist and when it fails to execute it fo=
r whatever reason?</div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Wed, Jan 31, 2018 at 6:16 PM, Burton, Ross <span dir=3D"ltr">&lt;=
<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"l=
tr"><span class=3D"">On 31 January 2018 at 17:07, Martin Jansa <span dir=3D=
"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">marti=
n.jansa@gmail.com</a>&gt;</span> wrote:<br></span><div class=3D"gmail_extra=
"><div class=3D"gmail_quote"><span class=3D""><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div dir=3D"ltr">What about the recipes which don&#39;t have ${S}/waf at =
all (and might inherit waf from possibly wrong reasons), like all those waf=
-samba recipes mentioned before?</div></blockquote><div><br></div></span><d=
iv>If a recipe inherits waf but doesn&#39;t use waf I&#39;m absolutely fine=
 with it erroring out.=C2=A0 Its always bothered me that autotools.bbclass =
doesn&#39;t object if configure can&#39;t be found.</div><span class=3D"HOE=
nZb"><font color=3D"#888888"><div><br></div><div>Ross</div></font></span></=
div></div></div>
</blockquote></div><br></div>

--001a114e2782f1a67c056415ac67--
