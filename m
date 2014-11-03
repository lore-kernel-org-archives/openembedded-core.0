Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id CF7216017E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 23:17:04 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id n8so9210118qaq.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 15:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=35pl1HRqhZD6zIU1M0MNhBQ6+XtUhJd5yduNAqpX5dI=;
	b=JBeExH9OFRbFPbOXL4YymVJdN606loHonp/8SM8utv06YBHkeclxn3ogVeI6csZ3tl
	uZrgaiz75ohOpJi54u7BL3OfkXmRk4nW1KXGQ/84ZgMjXuOyS4OA2b0QtnmFobpel9b2
	a6yivXo7xPpLTX7J62YBAO9nlxDlqurVtpBG7A4MEBADdyJhdvyZyjUGwb/+Ul4xkY92
	LN3kGDn7vcWgAMVy3Q9qW7LA/v1ZfcuohL5TgOWajz0WSLmerWmisUIkejGfY/ob2Fhr
	wusaE0vDM1ZhG//THDiez9L+79u1L6We7An4HPgk4kgjWWYTwgk/MB1LgE8IZx5WFtTY
	1Hig==
X-Gm-Message-State: ALoCoQl3Wy4RnlzbFWt8rUXgrsbXyeBJqoIaqwYS5U3Wu2jF4pcSVlNNtV73OJPmF1lFkKJrANRy
X-Received: by 10.140.17.67 with SMTP id 61mr65427394qgc.59.1415056623131;
	Mon, 03 Nov 2014 15:17:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Mon, 3 Nov 2014 15:16:42 -0800 (PST)
In-Reply-To: <20141103125522.623ba486@e6410-2>
References: <1414861479-5493-1-git-send-email-pab@pabigot.com>
	<20141103125522.623ba486@e6410-2>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Nov 2014 23:16:42 +0000
Message-ID: <CAJTo0Lb75BvySv3bw-7p=9pYBUyo8PS+C_x5P2cXbjrDUSuAfw@mail.gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] prevent pseudo host passwd/group contamination
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
X-List-Received-Date: Mon, 03 Nov 2014 23:17:13 -0000
Content-Type: multipart/alternative; boundary=001a11c0fa285c15370506fc8bdb

--001a11c0fa285c15370506fc8bdb
Content-Type: text/plain; charset=UTF-8

On 3 November 2014 18:55, Peter Seebach <peter.seebach@windriver.com> wrote:

> > The new patches use --without-passwd-fallback, preventing contamination
> > from the host files during the early build stages when the target
> > versions from base-passwd aren't yet available.
>
> I like these, and will see whether I can free up time to work on this. If I
> can't, though, I have no objections to these (and the previous set) being
> added to oe-core as local patches until next time I have a free day or two
> to
> study the password code.


Thanks Peter(s), these are now  in my staging branch for master.

Ross

--001a11c0fa285c15370506fc8bdb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 November 2014 18:55, Peter Seebach <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:peter.seebach@windriver.com" target=3D"_blank">peter.seebach@windriver=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">&gt; The new patches use --without-passwd-fallback, preventing contamina=
tion<br>
&gt; from the host files during the early build stages when the target<br>
&gt; versions from base-passwd aren&#39;t yet available.<br>
<br>
</span>I like these, and will see whether I can free up time to work on thi=
s. If I<br>
can&#39;t, though, I have no objections to these (and the previous set) bei=
ng<br>
added to oe-core as local patches until next time I have a free day or two =
to<br>
study the password code.</blockquote></div><br>Thanks Peter(s), these are n=
ow =C2=A0in my staging branch for master.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c0fa285c15370506fc8bdb--
