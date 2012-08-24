Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T519H-0006WF-VF
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 23:10:36 +0200
Received: by iaky10 with SMTP id y10so4160206iak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 13:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=b+Q+cuV2euiu6QK6SRL8MjROQ8LEVUFvAU66fzOSq+o=;
	b=fJ7nla1f0gNWbXXJKmwLvqHZHSY9oyfzTwOMqVNeNtwHIxVi798G8ADN3en+ym+q9L
	7rTTRgskDg3MiZLUW2zHWszRwY6hVxeYgbDrbcDDEY/FmxcGeYaD7rAI7sq0nn3YbO48
	2PJdA5ENjWQxjuaatZnwgS7XC2SM5LzgXiu8bJ9tjPVIEjEqlngt5nZGvlYZF5usaLzZ
	z/6bXz1YBUSio2Be8dQFVnVAODx+QT5IDzI59UTQr/czwmUWIuVlfw/2tuUQqrW/bbDW
	n89OuS85xhedvyU8UKLw4jYMHFnDbI4EEAMGJMtZ53qPxu3H/jplxSLr9PX9DwpBSVtW
	fZHQ==
Received: by 10.50.42.229 with SMTP id r5mr3560733igl.34.1345841907510; Fri,
	24 Aug 2012 13:58:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.63.50 with HTTP; Fri, 24 Aug 2012 13:58:07 -0700 (PDT)
X-Originating-IP: [79.118.181.96]
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6171F1@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1345824924.14369.82.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A617135@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAK18fxFatWwJMUVSeQbfx18V8xsi=R0imd7zR15DWwfinEc8Ug@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6171F1@039-SN1MPN1-001.039d.mgd.msft.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 24 Aug 2012 23:58:07 +0300
Message-ID: <CAK18fxFfmfNZrvy6=Tm7zhsoow0Up2qp3OKx=-A54nU2su6VsQ@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
X-Gm-Message-State: ALoCoQl6xDhtCGy9jzbC2GqiFgu7Fp1tOlwghOc0cdgaQW3yjjkpavag9yQvSJnhPXaradr59wgy
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distutils/steuptools: Fix files layout and unbreak builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 21:10:36 -0000
Content-Type: multipart/alternative; boundary=14dae9340c09d22bca04c8093c2b

--14dae9340c09d22bca04c8093c2b
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 24, 2012 at 11:56 PM, McClintock Matthew-B29882 <
B29882@freescale.com> wrote:

> On Fri, Aug 24, 2012 at 3:51 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > Exactly my fix. Please merge.
>
> It's already been merged.


Ding! Thanks.

ag

--14dae9340c09d22bca04c8093c2b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Aug 24, 2012 at 11:56 PM, McClintock Mat=
thew-B29882 <span dir=3D"ltr">&lt;<a href=3D"mailto:B29882@freescale.com" t=
arget=3D"_blank">B29882@freescale.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">

<div class=3D"im">On Fri, Aug 24, 2012 at 3:51 PM, Andrei Gherzan &lt;<a hr=
ef=3D"mailto:andrei@gherzan.ro">andrei@gherzan.ro</a>&gt; wrote:<br>
&gt; Exactly my fix. Please merge.<br>
<br>
</div>It&#39;s already been merged.</blockquote><div><br></div><div>Ding! T=
hanks.</div><div><br></div><div>ag=A0</div></div>

--14dae9340c09d22bca04c8093c2b--
