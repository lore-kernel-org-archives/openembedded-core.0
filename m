Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SHdfl-0007zq-OH
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 18:12:01 +0200
Received: by wera1 with SMTP id a1so3318603wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 09:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=uJrOlybgk2vkhTt/ejccPodp+5bw9eTx5spbt6jZ7lE=;
	b=mbW+PUeRG3pZcGc9ZjPFJKXFcNIVlPrvhwrRjCPhtIym1KuUl2NsCNTimGRpzeEE4X
	7YaY+itbWuMoYi+OZetzw3XYd4QbY5n4n67pmAiN9J2uyQEuPYe7ARV7hpRf8wRMbTUI
	N3R7A6VXrrDSTLfbPixcxAv7zd7nWFvCyzl57e5RB8jwjkXVBPdo/zlvp+RSjrgJ1XAW
	l8/LbvjH2KemaCOF8DJbEbLcotu/3ll2LMkgKIYjlQfZ/Bo3OYQmRRDqidY5oUwH7xxL
	49aF3T/Eur5cOCNxp3QpUmp4Cq3soEpy4JaDvvRxOZVPXo5O86RiHOQXV6OSS4wQFq+2
	PeKQ==
Received: by 10.180.107.101 with SMTP id hb5mr8361295wib.7.1334073763982; Tue,
	10 Apr 2012 09:02:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.227.158.16 with HTTP; Tue, 10 Apr 2012 09:02:23 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <20120410152244.GA2852@deadlock.dhs.org>
References: <CAK18fxFb3xkxbiyCDBncgpyvqOVCgOvzViveLa=aw3CyQPKiQA@mail.gmail.com>
	<20120410152244.GA2852@deadlock.dhs.org>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 10 Apr 2012 19:02:23 +0300
Message-ID: <CAK18fxHsg0974jsk9yicybcqgCVBuj_qDAbj9R3v1LMsu0S2pw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkgir3Y7kLJ5QGLzTcjdkf68jZCty66qMhwhX97Tr73VlMYaJnz3ryBWf8+mXBXPGPDxex1
Cc: Saul Wold <saul.wold@intel.com>
Subject: Re: js 185 -> js186_1.0.0
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
X-List-Received-Date: Tue, 10 Apr 2012 16:12:01 -0000
Content-Type: multipart/alternative; boundary=e89a8f3bb0cfce6d7304bd55401a

--e89a8f3bb0cfce6d7304bd55401a
Content-Type: text/plain; charset=ISO-8859-1

Thank you very much for this clarification.

@Saul, about upgrading js. This upgrade will break web, web-webkit and
maybe more. How do you want to solve this issue? I compiled js180.

@g


On Tue, Apr 10, 2012 at 18:22, Sergey 'Jin' Bostandzhyan
<jin@mediatomb.cc>wrote:

> Hi,
>
> On Tue, Apr 10, 2012 at 06:14:58PM +0300, Andrei Gherzan wrote:
> > Have a problem while updating js to version 185. This version renames the
> > library in libmozjs185. What to do in order to avoid breaking packages
> which
> > need libjs? Another interesting thing is that js is now called
> js185_1.0.0
> > which seems to be actually another package / implementation? I will try
> to test
> > this using symlinks while compiling web package.
>
> JS 1.8.5 is not backwards compatible! This is the reason why they renamed
> the
> libs, you can not link older software against JS 1.8.5 without adaptions,
> the
> new version has a new API.
>
> Kind regards,
> Jin
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--e89a8f3bb0cfce6d7304bd55401a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thank you very much for this clarification.=A0<div><br></div><div>@Saul, ab=
out upgrading js. This upgrade will break web, web-webkit and maybe more. H=
ow do you want to solve this issue? I compiled js180.<br><div><br></div><di=
v>

@g<br>
<br><br><div class=3D"gmail_quote">On Tue, Apr 10, 2012 at 18:22, Sergey &#=
39;Jin&#39; Bostandzhyan <span dir=3D"ltr">&lt;jin@mediatomb.cc&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">

Hi,<br>
<div><div class=3D"h5"><br>
On Tue, Apr 10, 2012 at 06:14:58PM +0300, Andrei Gherzan wrote:<br>
&gt; Have a problem while updating js to version 185. This version renames =
the<br>
&gt; library in libmozjs185. What to do in order to avoid breaking packages=
 which<br>
&gt; need libjs? Another interesting thing is that js is now called js185_1=
.0.0<br>
&gt; which seems to be actually another package / implementation? I will tr=
y to test<br>
&gt; this using symlinks while compiling web package.<br>
<br>
</div></div>JS 1.8.5 is not backwards compatible! This is the reason why th=
ey renamed the<br>
libs, you can not link older software against JS 1.8.5 without adaptions, t=
he<br>
new version has a new API.<br>
<br>
Kind regards,<br>
Jin<br>
<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br></div></div>

--e89a8f3bb0cfce6d7304bd55401a--
