Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SXrCX-0000G5-MM
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 11:52:53 +0200
Received: by ggnp4 with SMTP id p4so707105ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 02:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=9mCO8kLlU02+HNay+SrdAZLAwSfXSanDAYy3oR4R/6o=;
	b=cf3Jy1v0CpQE7sr0wNKzt7myfx7OdseNTyuXCxskG2YDvfrvzOrkaWSjzid+WCmAQc
	1qh+ZosH2j8TcBfULMZXAdLJ1M1q8EBjbBXtBA9nJ5oCFqNsDmKnLS2nrNAnlCOjgOZb
	/n3uOpZBxoE7zFb7n6B7sLf04Ls0B5FkHhP0vrrZdACXiXiBEOZ2rFWC7bIIs/2AMUlQ
	wHIwhe8LR8p24268DgDdLhqMO2/650XhJYiCsLno1PgA4RrdpzJzT+HkH79nyUzpKIpZ
	wnU5DH/aBX0v4iJRwOhqARHGhxhTLfaJcls3SMD8mXNHknjwdC6IMAD0LQQnW8c26I/g
	og0A==
Received: by 10.50.41.196 with SMTP id h4mr1882872igl.33.1337938960918; Fri,
	25 May 2012 02:42:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.28.147 with HTTP; Fri, 25 May 2012 02:42:20 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <4FBF53DC.9000201@intel.com>
References: <cover.1337868781.git.radu.moisan@intel.com>
	<eb1e7a0ded7e26ab8f79017f20ce139de82810b0.1337868781.git.radu.moisan@intel.com>
	<20120525085103.GB3138@jama.jama.net> <4FBF5141.1070908@intel.com>
	<4FBF53DC.9000201@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 25 May 2012 12:42:20 +0300
Message-ID: <CAK18fxEktKdbTyh65J0TM+pmJR6Xsg2fdbWa3=M-pfLH=ANJDw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQl0CI+fZStT8pM8sghidm6OhbLv/XsG5bTlq5GhASSCWXyKBALNpQGr8Xn1qMd6A+Yz6hlq
Subject: Re: [PATCH 2/3] mtd-utils: Update to version 1.5.0
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
X-List-Received-Date: Fri, 25 May 2012 09:52:53 -0000
Content-Type: multipart/alternative; boundary=14dae934042b7f2a5a04c0d9306a

--14dae934042b7f2a5a04c0d9306a
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 25, 2012 at 12:41 PM, Radu Moisan <radu.moisan@intel.com> wrote:

>  one more thing about mtd-utils, is there a way I can test this package so
> that I can be sure the correct version was built?
>
> Thanks,
> Radu
>
>
In my opinion you'd need hardware for that. Read more here:
http://www.linux-mtd.infradead.org/doc/general.html
To be more specific you'd need raw flash devices to test on.

@g

--14dae934042b7f2a5a04c0d9306a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, May 25, 2012 at 12:41 PM, Radu Moisan <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:radu.moisan@intel.com" target=3D"_bla=
nk">radu.moisan@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">


 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    one more thing about mtd-utils, is there a way I can test this
    package so that I can be sure the correct version was built?<br>
    <br>
    Thanks,<br>
    Radu<br><br></div></blockquote><div><br></div><div>In my opinion you&#3=
9;d need hardware for that. Read more here:</div><div><a href=3D"http://www=
.linux-mtd.infradead.org/doc/general.html">http://www.linux-mtd.infradead.o=
rg/doc/general.html</a>=A0</div>

<div>To be more specific you&#39;d need=A0raw flash devices to test on.=A0<=
/div><div><br></div><div>@g</div></div>

--14dae934042b7f2a5a04c0d9306a--
