Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Sfbr7-0002T6-Hh
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 21:06:49 +0200
Received: by yenl13 with SMTP id l13so2532513yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 11:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=+ezmuFijqfdHhh1FX5uN/O7DmftYL/HSejSS8rlrbI0=;
	b=Exkj3XgCvBh6JWYwYtCXrXgkdai3gK8dbn/fveVi7+jjEzeTFF0e5Jlabz2BsWniYx
	dtfsS8YLEYj4+DTLJpd65UncqAVNvJ1ZfrV2dB/sL4sCn2Mbg7r/+ol6s2GP1MT/5vwb
	uYCW74DpafMfwniiwJKuhc1F1KRTlbLX3kV2B3+Mt/2DAEr5oo7MBP4sUYpWc4OGsOwL
	u8s0zTK5VyDk275bqFRnJ3eFjXBZBq0MSAefsYMUJ4UfZo87SQJ4usLfcKsBnLYqtOym
	O2ZFr9XNbxpYP9HHz0Pg/tXMw3Q3xAndOD27LQhMUWxQeSgFQpxW/k6mwF+YWfwtyNEw
	c0Fw==
Received: by 10.50.196.195 with SMTP id io3mr3021467igc.39.1339786570052; Fri,
	15 Jun 2012 11:56:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.42.103 with HTTP; Fri, 15 Jun 2012 11:55:49 -0700 (PDT)
X-Originating-IP: [79.117.123.32]
In-Reply-To: <CAP9ODKrkmDNCzXcK3wDqypxZW6Le44004rcO7e5CiW4HD5o-AA@mail.gmail.com>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
	<4FDB57DB.5090407@gmail.com>
	<CAP9ODKrkmDNCzXcK3wDqypxZW6Le44004rcO7e5CiW4HD5o-AA@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 15 Jun 2012 21:55:49 +0300
Message-ID: <CAK18fxGOAi40Tzduw99=fQMf_cn9sySqr=dvJzRncNCutjjyaw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnA7kLxKmfpqm8MpmyVNMszw9LYFOEobMTbEJMVnxVkucEj62LGmvSW/RCZ0ZrQ7p7I3Q8K
Subject: Re: Proposal: Creating meta-networking
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
X-List-Received-Date: Fri, 15 Jun 2012 19:06:49 -0000
Content-Type: multipart/alternative; boundary=14dae934119395343004c2875ea6

--14dae934119395343004c2875ea6
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 15, 2012 at 9:08 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Fri, Jun 15, 2012 at 12:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > I think creating a networking layer is fine idea, alongside meta-oe,
> > as a separate layer in meta-openembedded repo. Reshuffling recipes
> > from meta-oe into different layers is fine. I would like to avoid copies.
>
> I'd prefer if it used another git repository; people needing to use it
> shouldn't be forced to clone whole meta-oe.
>
> This would be my proposal as well. To have this as a separate layer.

@g

--14dae934119395343004c2875ea6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote">On Fri, Jun 15, 2012 at 9:08 PM, Otavio Salv=
ador <span dir=3D"ltr">&lt;<a href=3D"mailto:otavio@ossystems.com.br" targe=
t=3D"_blank">otavio@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">

On Fri, Jun 15, 2012 at 12:42 PM, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; I think creating a networking layer is fine idea, alongside meta-oe,<b=
r>
&gt; as a separate layer in meta-openembedded repo. Reshuffling recipes<br>
&gt; from meta-oe into different layers is fine. I would like to avoid copi=
es.<br>
<br>
I&#39;d prefer if it used another git repository; people needing to use it<=
br>
shouldn&#39;t be forced to clone whole meta-oe.<br><br></blockquote><div>Th=
is would be my proposal as well. To have this as a separate layer.=A0</div>=
<div><br></div><div>@g=A0</div></div><br>

--14dae934119395343004c2875ea6--
