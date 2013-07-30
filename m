Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id CD6D36B478
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 18:23:02 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id w10so3186597lbi.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 11:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=2f2oVSCR8ktiTDFy9tYglmw1WBn031pm2gzUlEXmNZ0=;
	b=n0pJprAsrDDBnfVYhmM/SeYN/78ZZILwFrVS+3P5jZfLbiQMvA9V+uoG3FtK6O9ylc
	wT0t+WdIWQm9DdSF6vWijhbAjJ3iiOBvGc+pqaTqIjXSux36uBBIS8Z20lfEg+Bc1T8+
	gdXkolAUrQbVl6+0GWoaV1AMt3+CBbHw94UEFk/JyC8hC4zpY61qMQnUqp8JhlO/IqUZ
	zkbkXMgvKLGHaZglx4ueFWVGuAM1Gpp7q7zIv+NxBYUxVWowf8nJDpDBUm6AFjE997l2
	G48uus6szMIDHrv6VRQX8hVKN6arXwmI5HxcJzpzDRkcJyCz1qK5OFR96GMeENYmZbM+
	Km4A==
X-Received: by 10.112.33.11 with SMTP id n11mr9139848lbi.76.1375208582334;
	Tue, 30 Jul 2013 11:23:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.17.67 with HTTP; Tue, 30 Jul 2013 11:22:42 -0700 (PDT)
In-Reply-To: <CABcZANn+uBWBLLqoTUc0KSD6YtWsyuMgMUXX7EfQuGJqJOQmNg@mail.gmail.com>
References: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
	<51F092C5.3060906@windriver.com>
	<CABcZANn+uBWBLLqoTUc0KSD6YtWsyuMgMUXX7EfQuGJqJOQmNg@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 30 Jul 2013 11:22:42 -0700
X-Google-Sender-Auth: VSU5PglXM07NNi4_TMnxbPSSVIU
Message-ID: <CABcZANmm5UTmf5RofpOgGX8NP6-QUpKtmy0d+MPkcPDKLXq76Q@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: meta-ro-rootfs approach and volatiles vs tmpfiles.d
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
X-List-Received-Date: Tue, 30 Jul 2013 18:23:03 -0000
Content-Type: multipart/alternative; boundary=14dae94735910ad11a04e2beb321

--14dae94735910ad11a04e2beb321
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 30, 2013 at 11:17 AM, Chris Larson <clarson@kergoth.com> wrote:

> I've read though this thread carefully, but still can't get a clear
> picture about this RFC.
> Could you please give me a link to your patchset, if convenient?
>

This is interesting, I didn't notice this in your branch until just now:

"Make this directory writable in case of a read-only rootfs.
Note that if the ssh keys are pregenerated, they will not be lost,
as there's a copying process before bind mounting."

That's quite interesting, and is a definite point in the favor of this
approach, as that's something that isn't really easily doable via
tmpfiles.d and symlinks, only via the bind mounts.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--14dae94735910ad11a04e2beb321
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jul 30, 2013 at 11:17 AM, Chris Larson <span dir=3D"ltr">&lt;<a href=3D=
"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&gt;<=
/span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div>I&#39;ve read though this thread carefully, but still=
 can&#39;t get a
      clear picture about this RFC.<br>
      Could you please give me a link to your patchset, if convenient?</div=
></blockquote></div><br>This is interesting, I didn&#39;t notice this in yo=
ur branch until just now:</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">

&quot;Make this directory writable in case of a read-only rootfs.<div class=
=3D"gmail_extra">Note that if the ssh keys are pregenerated, they will not =
be lost,</div><div class=3D"gmail_extra">as there&#39;s a copying process b=
efore bind mounting.&quot;</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra" style>That&=
#39;s quite interesting, and is a definite point in the favor of this appro=
ach, as that&#39;s something that isn&#39;t really easily doable via tmpfil=
es.d and symlinks, only via the bind mounts.</div>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--14dae94735910ad11a04e2beb321--
