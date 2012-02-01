Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RshSM-0006QA-43
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 22:11:06 +0100
Received: by lahc1 with SMTP id c1so898918lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 13:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=zWNW4yGOIA/pz0WDuMUDEfWnuX7tENN0+7VB+1B9038=;
	b=i1ne2mZJfG0+6tQ39q7UxhRwJ8K4et/X5oF9tXmPzvshJpJa28zD5kuaPGrKwfDFgz
	d20lguc5iqsCm0f9FlK52vOHZsaLnLB1wQaIowpB5YMdPqeoTopL/4kWmpt3wjz7r7qa
	l0OjzbnsUvpa6KRX2sBTt1bJwcer2skk7WVzQ=
MIME-Version: 1.0
Received: by 10.152.112.41 with SMTP id in9mr83406lab.27.1328130190789; Wed,
	01 Feb 2012 13:03:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.46.199 with HTTP; Wed, 1 Feb 2012 13:03:10 -0800 (PST)
In-Reply-To: <1328129972.2716.158.camel@x121e.pbcl.net>
References: <cover.1328127940.git.otavio@ossystems.com.br>
	<cc36eb9f3e699b9c4478e4de0939e50eb317446f.1328127940.git.otavio@ossystems.com.br>
	<1328129972.2716.158.camel@x121e.pbcl.net>
Date: Wed, 1 Feb 2012 19:03:10 -0200
X-Google-Sender-Auth: cyKCpVxJ80juKk_TE1f91lNetXU
Message-ID: <CAP9ODKrUM0B46Sm2-oNHJwa0hET+TRkV4UmP8ym4EEYeRAOiJA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] rootfs_ipk.bbclass: fix detection of script runtime requirement
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
X-List-Received-Date: Wed, 01 Feb 2012 21:11:06 -0000
Content-Type: multipart/alternative; boundary=f46d040710133ccb2704b7ed68eb

--f46d040710133ccb2704b7ed68eb
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 1, 2012 at 18:59, Phil Blundell <philb@gnu.org> wrote:

> On Wed, 2012-02-01 at 20:27 +0000, Otavio Salvador wrote:
> > The code has been broken by 2feba313c991170747381c7cf821a45c2cd04632
> > that changed the way this detection has being done.
>
> What was the failure?  It isn't immediately obvious to me that this
> patch will make any functional difference (except for adding the -q
> argument to grep which was indeed missing).
>

Nothing where setting runtime_script_required as 0 in case it worked. So it
would never in fact remove the info files, even if read-only-fs where being
in use and functional.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d040710133ccb2704b7ed68eb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Feb 1, 2012 at 18:59, Phil Blundell <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org">philb@gnu.org</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Wed, 2012-02-01 at 20:27 +0000, Otavio Salvador wrote:=
<br>
&gt; The code has been broken by 2feba313c991170747381c7cf821a45c2cd04632<b=
r>
&gt; that changed the way this detection has being done.<br>
<br>
</div>What was the failure? =A0It isn&#39;t immediately obvious to me that =
this<br>
patch will make any functional difference (except for adding the -q<br>
argument to grep which was indeed missing).<br></blockquote><div><br></div>=
<div>Nothing where setting runtime_script_required as 0 in case it worked. =
So it would never in fact remove the info files, even if read-only-fs where=
 being in use and functional.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--f46d040710133ccb2704b7ed68eb--
