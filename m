Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sidebranch.openembedded@gmail.com>)
	id 1S1k0S-0001hw-8q for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 20:43:41 +0100
Received: by bkcjg15 with SMTP id jg15so651426bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 11:35:15 -0800 (PST)
Received-SPF: pass (google.com: domain of sidebranch.openembedded@gmail.com
	designates 10.205.130.12 as permitted sender)
	client-ip=10.205.130.12; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	sidebranch.openembedded@gmail.com designates 10.205.130.12 as
	permitted sender) smtp.mail=sidebranch.openembedded@gmail.com;
	dkim=pass header.i=sidebranch.openembedded@gmail.com
Received: from mr.google.com ([10.205.130.12])
	by 10.205.130.12 with SMTP id hk12mr1966758bkc.76.1330284915075
	(num_hops = 1); Sun, 26 Feb 2012 11:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4kbRjoiRYZpp+CXaYnCLuADMCgKIrPZt6u3TDFh0xAI=;
	b=N3nTSsKKuZRu56DD6ZiBHLi0/J/Pin1osKiTs9MqK1eKL4Dt3HtpOeLaLo8PB46PC0
	YATN9eS4PFrtsJpqgC61JXbNSH93mCJV5fkXTZboPrkm9j5c9jD1VZJHsiRc8uP+NhEg
	2OK7AWwVMlJdDn/qrxTIUsrHNXxd8VuGaEspY=
MIME-Version: 1.0
Received: by 10.205.130.12 with SMTP id hk12mr1589519bkc.76.1330284914999;
	Sun, 26 Feb 2012 11:35:14 -0800 (PST)
Received: by 10.204.225.70 with HTTP; Sun, 26 Feb 2012 11:35:14 -0800 (PST)
In-Reply-To: <1330261561.31855.6.camel@ted>
References: <CAMvUbCwy5UL3YWXS=2SkeKff2WDQE9EX7-CGUv9s5SH+9uSK1g@mail.gmail.com>
	<1330261561.31855.6.camel@ted>
Date: Sun, 26 Feb 2012 20:35:14 +0100
Message-ID: <CAMvUbCybn5jKbVJMdsrY7SpUoGjku3MwgOU+0WvQ+4LBituWvA@mail.gmail.com>
From: Leon Woestenberg <sidebranch.openembedded@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bitbake parsing of IMAGE_INSTALL += # tslib mtd-utils" extremely user unfriendly.
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
X-List-Received-Date: Sun, 26 Feb 2012 19:43:41 -0000
Content-Type: multipart/alternative; boundary=0015173fea7acf015004b9e3177e

--0015173fea7acf015004b9e3177e
Content-Type: text/plain; charset=ISO-8859-1

Hello Richard,

On Sun, Feb 26, 2012 at 2:06 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2012-02-20 at 23:00 +0100, Leon Woestenberg wrote:
> > bitbake can really braindump on us when we insert typo's.  The result
> > of bitbake 1.14 parsing this one wasn't pleasant:
> >
> > IMAGE_INSTALL += # tslib mtd-utils"
> >
> > (Yes, it's a typo. No, I wouldn't expect bitbake to give me that much
> > output :) )
>
> I agree we need to fix that. I've proposed a patch to bitbake which
> would allow detection and a better error message for something like this
> by enforcing quoting of variables. It is a major change in bitbake's
> behaviour though so I'm taking feedback on whether we should make the
> change.
>

If we focus on our user interface view, that would mean this will no longer
work:

SOME_BINARY_VARIABLE = 1

but that might be a better compromise than what we currently have.

Regards,

Leon.

--0015173fea7acf015004b9e3177e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Richard,<br><br><div class=3D"gmail_quote">On Sun, Feb 26, 2012 at 2:=
06 PM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;</span> wr=
ote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Mon, 2012-02-20 at 23:0=
0 +0100, Leon Woestenberg wrote:<br>
</div><div><div class=3D"h5">&gt; bitbake can really braindump on us when w=
e insert typo&#39;s. =A0The result<br>
&gt; of bitbake 1.14 parsing this one wasn&#39;t pleasant:<br>
&gt;<br>
&gt; IMAGE_INSTALL +=3D # tslib mtd-utils&quot;<br>
&gt;<br>
&gt; (Yes, it&#39;s a typo. No, I wouldn&#39;t expect bitbake to give me th=
at much<br>
&gt; output :) )<br>
<br>
</div></div>I agree we need to fix that. I&#39;ve proposed a patch to bitba=
ke which<br>
would allow detection and a better error message for something like this<br=
>
by enforcing quoting of variables. It is a major change in bitbake&#39;s<br=
>
behaviour though so I&#39;m taking feedback on whether we should make the<b=
r>
change.<br></blockquote><div><br>If we focus on our user interface view, th=
at would mean this will no longer work:<br><br>SOME_BINARY_VARIABLE =3D 1<b=
r><br>but that might be a better compromise than what we currently have.<br=
>
<br>Regards,<br><br>Leon.<br><br></div></div><br>

--0015173fea7acf015004b9e3177e--
