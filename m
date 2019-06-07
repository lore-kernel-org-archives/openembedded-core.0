Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF737E513
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 16:23:57 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id w196so1832528oie.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 09:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wxZ9q5BkUe+L6ClBucM1ILBdsq0ECe3lgBhqyyB5ziw=;
	b=bgt128KpjYetYOhIagbBtwuML7fSHUtW5WtP0fTn8AMB+5PrNkRVPubKZzK8MzCRqZ
	EGxZigglGTBeU1Fet85uAO8uRxnqN8qSvOoCBYH3YDvbAQX7pVX/e5Z1LZY5lPpymPb8
	jula45y/WKys/D++BjmyxmB4xh+OfMiKkW9RwOG9mSSgTbEVDph4SMIYTByw0lVa5xQ8
	F6fiC4ul0KSl68w3abqgEEaAByQk31/WyHW/HhESyrcZFWvMbbeDr2LieWwo/tuwMerr
	JFF53IlSh9V5vVSwafCHo7EZOF0T12qt74CspCKJt1OmlQT/kLZN3UgaLXfdMIMq58Tg
	D1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wxZ9q5BkUe+L6ClBucM1ILBdsq0ECe3lgBhqyyB5ziw=;
	b=dU2H2l7t7yx/pVTx4Imck0+U3y9jS6BIu+qbPNUH/+pvguiNB3tOFZIDSKnQUGaCpB
	Z834PnJnaTJC9CAtK8V6Vn/7hlqwthoMgdFnjX58+mm92IHmkK96+frZcWdwa+VzXyRA
	sibFrY7PxKPJ64GC7OZAj+n94Wf1KkkIHcWfOXH77ucvTmoqT0iJkUCkLmYtdeIHFsEB
	UTbLvPUN9axPDi+5Y6N+wXQkShZnzlX7FrYNV2OUW0e2MhDQ2grd3iI19T1L/Ptbesey
	V7tHnZvAhjpZkd9UJJIKMN7FCcYtaoo0UbFiueVv4BtRJ5Ollmw41aLvu9X9MRQ9l+we
	wmJg==
X-Gm-Message-State: APjAAAXWhWStSoJiq4b54EbbiOdxLa3BE6SrX1WMEPxQZ8ak9f0usbPT
	C1FQxne0r4vAGDmM3yPVpk3JdEMr2CGurx92gwY=
X-Google-Smtp-Source: APXvYqxcItqDv8dcrm+Dqp7hQKEa3qPHDNYiJOlZFehGbzsgf8e9BrGJ03H8bwKcgLJXPfh7JKFE+L3J9nR5aAI1iZ4=
X-Received: by 2002:aca:aa88:: with SMTP id t130mr2244937oie.70.1559924638978; 
	Fri, 07 Jun 2019 09:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190607121954.116898-1-alex.kanavin@gmail.com>
	<7249681b3f030618eb01d15a597a01c1f3a10cfe.camel@linuxfoundation.org>
In-Reply-To: <7249681b3f030618eb01d15a597a01c1f3a10cfe.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 7 Jun 2019 18:23:47 +0200
Message-ID: <CANNYZj8KtBGkrzCVzB8NYxswQj4w_ksNvgrCny4ubnsR-zUojA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] glib-2.0: udpate 2.58.3 -> 2.60.3
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
X-List-Received-Date: Fri, 07 Jun 2019 16:23:58 -0000
Content-Type: multipart/alternative; boundary="000000000000fb9569058abe4177"

--000000000000fb9569058abe4177
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Jun 2019 at 16:03, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> So far we've seen:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/682
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/680
>
>
Both are the same issue, and a rather bizarre one: instead of starting the
build, ninja goes into a loop trying
to re-run the configuration step and recreate build.ninja (its equivalent
of Makefile) and not being happy when it finishes.

The issue is specific to opensuse/tumbleweed builders, and I was able to
reproduce it locally by setting
meson.build's modification time one week into the future ("touch -d 'next
Thursday' meson.build").

Which brings me to a question: is the system date and time set correctly on
those builders?

Alex

--000000000000fb9569058abe4177
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 7 Jun 2019 at 16:03, Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_bla=
nk">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
So far we&#39;ve seen:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/46/build=
s/682" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/46/builds/682</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/40/build=
s/680" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/40/builds/680</a><br>
<br></blockquote><div><br></div>Both are the same issue, and a rather bizar=
re one: instead of starting the build, ninja goes into a loop trying</div><=
div class=3D"gmail_quote">to re-run the configuration step and recreate bui=
ld.ninja (its equivalent of Makefile) and not being happy when it finishes.=
</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">The i=
ssue is specific to opensuse/tumbleweed builders, and I was able to reprodu=
ce it locally by setting</div><div class=3D"gmail_quote">meson.build&#39;s =
modification time one week into the future (&quot;touch -d &#39;next Thursd=
ay&#39; meson.build&quot;).</div><div class=3D"gmail_quote"><br></div><div =
class=3D"gmail_quote">Which brings me to a question: is the system date and=
 time set correctly on those builders?<br></div><div class=3D"gmail_quote">=
<br></div><div class=3D"gmail_quote">Alex<br></div><div class=3D"gmail_quot=
e"><div><pre class=3D"m_8777065863766801137m_-6314178930964745888gmail-sele=
ct-content m_8777065863766801137m_-6314178930964745888gmail-log"><div class=
=3D"m_8777065863766801137m_-6314178930964745888gmail-logline m_877706586376=
6801137m_-6314178930964745888gmail-ng-scope"><span class=3D"m_8777065863766=
801137m_-6314178930964745888gmail-no-wrap m_8777065863766801137m_-631417893=
0964745888gmail-log_o"><span class=3D"m_8777065863766801137m_-6314178930964=
745888gmail-"><br></span></span></div><div class=3D"m_8777065863766801137m_=
-6314178930964745888gmail-logline m_8777065863766801137m_-63141789309647458=
88gmail-ng-scope"><span class=3D"m_8777065863766801137m_-631417893096474588=
8gmail-no-wrap m_8777065863766801137m_-6314178930964745888gmail-log_o"><spa=
n class=3D"m_8777065863766801137m_-6314178930964745888gmail-"><br></span></=
span></div></pre> </div></div></div>

--000000000000fb9569058abe4177--
