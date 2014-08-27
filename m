Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id D965F60169
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 16:19:42 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id w7so762400lbi.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 09:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=SkGVZh5ATAy5H5lStwiDc8/W08Mc7fy3KNv1tqejODY=;
	b=w4ltB+hib6c0XOI7Gu2sIS7Ge2LKRtGqY+6sdFD7DR2xXiDH3b7h0SNdlfl8hA1N8H
	ZzwjGKujyYw1shJgkWpRae4WqwpoF1IkdzPm7nLOy+fIdLSsBVwhlTD7PLRX0xpwUtTC
	q/UMlyR7czxS+ODetQRjPB+85AjkbvegZfl4bdLmenSO6qxRtN4R9lO9E3AOL3ejWBWi
	0NT/tkKD0/cuQ70TUmrmjgRabVKQ8jDuqip6TwEzh9VQEuOzr07xN3KCSSMBv7TxyexR
	tQps6S9u3m2ShYofeMRy21fxXvYUzTeOLihUn8KN2Vegr0pBX/Ijs99RTcJvBaZlgypF
	YJ2Q==
X-Received: by 10.112.55.238 with SMTP id v14mr4073353lbp.93.1409156382446;
	Wed, 27 Aug 2014 09:19:42 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.42 with HTTP; Wed, 27 Aug 2014 09:19:22 -0700 (PDT)
In-Reply-To: <CAJTo0LZK3uY+-hZb34ZHWyEumwb1AqWY0Epy45r+eBg7bmwJVA@mail.gmail.com>
References: <1408983725-45864-1-git-send-email-fahad_usman@mentor.com>
	<1408983725-45864-2-git-send-email-fahad_usman@mentor.com>
	<CAJTo0LZK3uY+-hZb34ZHWyEumwb1AqWY0Epy45r+eBg7bmwJVA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 27 Aug 2014 09:19:22 -0700
X-Google-Sender-Auth: qbMuEaq2bnxsCTnanB8-_r7VLm4
Message-ID: <CABcZAN=FQ_z4vdYAjoR7DPT0n5OQZKnAF_-wVb-NZCK+28p16w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] logrotate: add packageconfigs
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
X-List-Received-Date: Wed, 27 Aug 2014 16:19:45 -0000
Content-Type: multipart/alternative; boundary=001a1133c9669bdc6705019ec909

--001a1133c9669bdc6705019ec909
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 27, 2014 at 8:52 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 25 August 2014 17:22, Fahad Usman <fahad_usman@mentor.com> wrote:
> > +    ${@base_contains('PACKAGECONFIG', 'acl', 'WITH_ACL=yes', '', d)} \
> > +    ${@base_contains('PACKAGECONFIG', 'selinux', 'WITH_SELINUX=yes',
> '', d)} \
>
> Should this have WITH_XXX=no for clarity and safety?


Yeah, that'd be a good idea, so we don't rely on the default behavior of
the underlying buildsystem, which could change in future releases. We can
submit an additional patch to improve that.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1133c9669bdc6705019ec909
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Aug 27, 2014 at 8:52 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On 25 August 2014 17:22, Fahad Usman &l=
t;<a href=3D"mailto:fahad_usman@mentor.com" target=3D"_blank">fahad_usman@m=
entor.com</a>&gt; wrote:<br>



&gt; +=C2=A0 =C2=A0 ${@base_contains(&#39;PACKAGECONFIG&#39;, &#39;acl&#39;=
, &#39;WITH_ACL=3Dyes&#39;, &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 ${@base_contains(&#39;PACKAGECONFIG&#39;, &#39;selinux&=
#39;, &#39;WITH_SELINUX=3Dyes&#39;, &#39;&#39;, d)} \<br>
<br>
</div>Should this have WITH_XXX=3Dno for clarity and safety?</blockquote></=
div><br></div><div class=3D"gmail_extra">Yeah, that&#39;d be a good idea, s=
o we don&#39;t rely on the default behavior of the underlying buildsystem, =
which could change in future releases. We can submit an additional patch to=
 improve that.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a1133c9669bdc6705019ec909--
