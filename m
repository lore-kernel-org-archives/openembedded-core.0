Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RiF9z-0003pl-IZ
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:56:55 +0100
Received: by eaal1 with SMTP id l1so15162537eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2012 16:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Uzec+GcflnJ9zfzwJXqvqsg5Hk7yrAjP9tdwceMtzDw=;
	b=P11Y5MLmiViVZKVPzy0gLctjj/mWDECIp2B2yHE6xLn22m8a98QYk1lXbYsrOdQ9qY
	uvoekft76ESx33+Hwz+9YnODEp54cxDPkDz7NyaE1rTWCFUSn+4XFbi0ynLMUiz/91NS
	75aBO2ZpDqqdNJwjNLQVpqp+PqNwcicNLa3dQ=
MIME-Version: 1.0
Received: by 10.204.10.65 with SMTP id o1mr12479004bko.19.1325638173162; Tue,
	03 Jan 2012 16:49:33 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.79 with HTTP; Tue, 3 Jan 2012 16:49:33 -0800 (PST)
In-Reply-To: <20120102183808.GB3749@jama.jama.net>
References: <cover.1325101673.git.otavio@ossystems.com.br>
	<fde24903e4f56091470e1e7f2fc00a63a8b86f22.1325101673.git.otavio@ossystems.com.br>
	<4F01F60D.4000304@linux.intel.com>
	<20120102183808.GB3749@jama.jama.net>
Date: Tue, 3 Jan 2012 22:49:33 -0200
X-Google-Sender-Auth: Rj7TI02kCvYA9-zipPSnq1JCX0Y
Message-ID: <CAP9ODKqVQhvjvy9_VLH3a8SqDCpuQZG3qXA9p-0ff1ovTzYHjw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/16] qt4-graphics-system: add
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
X-List-Received-Date: Wed, 04 Jan 2012 00:56:55 -0000
Content-Type: multipart/alternative; boundary=0015175cd132697c2d04b5a930fc

--0015175cd132697c2d04b5a930fc
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 2, 2012 at 16:38, Martin Jansa <martin.jansa@gmail.com> wrote:

> > We don't have an xserver-common in oe-core, what does it provide?
>
> that's x11-common equivalent in meta-oe, VIRTUAL_RUNTIME should be used
> here like in meta/recipes-sato/tasks/task-core-x11.bb
>
> # xserver-common, x11-common
> VIRTUAL-RUNTIME_xserver_common ?= "x11-common"


Done locally; will send an update patchset with this.


> > Is this something that we need to merge over?
>
> xserver-common added functionality (like xinput-calibrator) should be
> merged
> to x11-common and then xserver-common dropped from meta-oe, but I'm
> still busy with other stuff and daywork..
>

It would be awesome if you could look on that soon; this would reduce
another set of delta between OE-Core and Meta-OE.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0015175cd132697c2d04b5a930fc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Jan 2, 2012 at 16:38, Martin Jansa <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gma=
il.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">&gt; We don&#39;t have an xserver-c=
ommon in oe-core, what does it provide?<br>
<br>
</div></div>that&#39;s x11-common equivalent in meta-oe, VIRTUAL_RUNTIME sh=
ould be used<br>
here like in meta/recipes-sato/tasks/<a href=3D"http://task-core-x11.bb" ta=
rget=3D"_blank">task-core-x11.bb</a><br>
<br>
# xserver-common, x11-common<br>
VIRTUAL-RUNTIME_xserver_common ?=3D &quot;x11-common&quot;</blockquote><div=
><br></div><div>Done locally; will send an update patchset with this.</div>=
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">
&gt; Is this something that we need to merge over?<br>
<br>
</div>xserver-common added functionality (like xinput-calibrator) should be=
 merged<br>
to x11-common and then xserver-common dropped from meta-oe, but I&#39;m<br>
still busy with other stuff and daywork..<br></blockquote><div><br></div><d=
iv>It would be awesome if you could look on that soon; this would reduce an=
other set of delta between OE-Core and Meta-OE.=A0</div></div><div><br></di=
v>
-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" t=
arget=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossys=
tems.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--0015175cd132697c2d04b5a930fc--
