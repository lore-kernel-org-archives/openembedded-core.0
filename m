Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 744276DF25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:34:37 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id p9so1635036lbv.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 08:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Rhd0/BPMr5MdoF68zAlxljp4g5B+Nz25wMXYek06fdw=;
	b=PMwfWOXemfMoS/YGd4N4xnZDWTQq5V90fk8NO/yyZ7yo4sn/dK/wkIO8spxJxKmV2l
	+ReIrJBZuz2JCfzJtXMycLXiiyMd0dGE1R/s92PmFG1Io5YXdVM+aohO0PBSTIZp8Tm7
	WWUgjSpYigvnbf3I+Ahh34p6E2DeuEBGVSkmf11gneFRP2jHWOqIzcfIKmsI/8k21ItC
	tb5Sw41dLtys+Mw3EW9Zj/qy6kMbEAJpuN+5U5ICsO59v3eDsFrhkBzCNI2wVU5DzbDF
	DkUER6oBMlnZqFXSppOViQmGNi13XBy4aXQHAMg9fUwYCQ3OyagheuYVO97hygDlBuBU
	uhvg==
X-Received: by 10.152.210.70 with SMTP id ms6mr54547775lac.5.1395848078081;
	Wed, 26 Mar 2014 08:34:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.194 with HTTP; Wed, 26 Mar 2014 08:34:18 -0700 (PDT)
In-Reply-To: <1395826233.24890.81.camel@ted>
References: <1395826233.24890.81.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 26 Mar 2014 08:34:18 -0700
X-Google-Sender-Auth: viuIL1PdgEC6FTcBzD0q9jeGi5k
Message-ID: <CABcZANkY+HBcQf4mxQkyFkmT+1RvyGOuQG_zKKbmzBoOGMNGwg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/3] base.bbclass: Run oe_import before other INHERITs
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
X-List-Received-Date: Wed, 26 Mar 2014 15:34:39 -0000
Content-Type: multipart/alternative; boundary=001a11380ac4dac31104f5843432

--001a11380ac4dac31104f5843432
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 26, 2014 at 2:30 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> +# We need the oe module name space early (before INHERITs get added)
> +# and whilst ugly, abusing inherit like this is quite effective
> +BASEIMPORTS = "${@oe_import(d)}"
> +inherit ${BASEIMPORTS}
>

Wouldn't OE_IMPORTED := "${@oe_import(d)}" work as well, or am I missing
something?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11380ac4dac31104f5843432
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Mar 26, 2014 at 2:30 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":1zh" class=3D"a3s" style=3D"over=
flow:hidden">+# We need the oe module name space early (before INHERITs get=
 added)<br>


+# and whilst ugly, abusing inherit like this is quite effective<br>
+BASEIMPORTS =3D &quot;${@oe_import(d)}&quot;<br>
+inherit ${BASEIMPORTS}</div></blockquote></div><br>Wouldn&#39;t OE_IMPORTE=
D :=3D &quot;${@oe_import(d)}&quot; work as well, or am I missing something=
?<br>-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - B=
itBake, OpenEmbedded, OpenZaurus<br>

Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--001a11380ac4dac31104f5843432--
