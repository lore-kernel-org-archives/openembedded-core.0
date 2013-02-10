Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1U4NDr-0005Yn-3t
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Feb 2013 04:05:26 +0100
Received: by mail-ea0-f176.google.com with SMTP id a13so2278642eaa.35
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2013 18:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=V13xSF1MWjXYJESl6F0gm17IbNkNzzjHoxN/LtsYsMs=;
	b=WBA85ih0lNfjrtd9GSNbkJ6LnwUF0Uk+6vbM8p6ZvO2IEfIgotJbiZIp5IrRduBv0X
	YgN6J2BEiFDontULAHUV9dJoxFef0gqotAZqxDJGrsN8VFL4MSje/+gcl1zCbUfwJ1aT
	SXbLTnsyUht9xFMxrZyxJyPF9kK9NhM3pj9k2jQsaT+1G7ML4l8nvltf4tYkGyLHBrpQ
	azjKWUMo+fFdvHLOvZ+XLepG1f1lYq1twToxGQLB53EOBVTm70jLr45/fVdoc/yJ/PTz
	F2Cn8cPu4AUL9XM/+whPe8XPY7kYel0TmpSmKQaMMqZ4q+72IJx2dHwKM0XORgEc9Ztc
	7gSA==
MIME-Version: 1.0
X-Received: by 10.14.3.133 with SMTP id 5mr519799eeh.43.1360464539035; Sat, 09
	Feb 2013 18:48:59 -0800 (PST)
Received: by 10.14.207.72 with HTTP; Sat, 9 Feb 2013 18:48:58 -0800 (PST)
In-Reply-To: <CAP9ODKq0q-DXgeeehtJE_jJbMcNUuNhn5gzFR3m11e2Lmhp+mw@mail.gmail.com>
References: <cover.1360362264.git.dvhart@linux.intel.com>
	<fe2cc60ac93c64b7a6da42f876ff9befd1cf1938.1360362264.git.dvhart@linux.intel.com>
	<CAP9ODKpCZrabQt1s1=GHHhXm9s-GSMDgjq3965w8XQFka8-8ug@mail.gmail.com>
	<51168084.3080902@linux.intel.com>
	<CAP9ODKq0q-DXgeeehtJE_jJbMcNUuNhn5gzFR3m11e2Lmhp+mw@mail.gmail.com>
Date: Sat, 9 Feb 2013 21:48:58 -0500
Message-ID: <CADkTA4PvLPB9C_ornX0EAXVEQVRSX4v0VZbOfz=zTtgHai-O0A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Darren Hart <dvhart@linux.intel.com>, Poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] oe-git-proxy: Add a new comprehensive git proxy script
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
X-List-Received-Date: Sun, 10 Feb 2013 03:05:27 -0000
Content-Type: multipart/alternative; boundary=047d7b6226a494280c04d555d5bd

--047d7b6226a494280c04d555d5bd
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Feb 9, 2013 at 12:02 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Sat, Feb 9, 2013 at 2:59 PM, Darren Hart <dvhart@linux.intel.com>
> wrote:
> >
> >
> > On 02/08/2013 06:43 PM, Otavio Salvador wrote:
> >> On Fri, Feb 8, 2013 at 8:27 PM, Darren Hart <dvhart@linux.intel.com>
> wrote:
> >>> oe-git-proxy.sh is a simple tool to be used via GIT_PROXY_COMMAND. It
> >>> uses BSD netcat to make SOCKS5 or HTTPS proxy connections. It uses
> >>> ALL_PROXY to determine the proxy server, protocol, and port. It uses
> >>> NO_PROXY to skip using the proxy for a comma delimited list of hosts,
> >>> host globs (*.example.com), IPs, or CIDR masks (192.168.1.0/24). It is
> >>> known to work with both bash and dash shells.
> >>>
> >>> V2: Implement recommendations by Enrico Scholz:
> >>>     o Use exec for the nc calls
> >>>     o Use "$@" instead of $* to avoid quoting issues inherent with $*
> >>>     o Use bash explicitly and simplify some of the string manipulations
> >>>     Also:
> >>>     o Drop the .sh in the name per Otavio Salvador
> >>>     o Remove a stray debug statement
> >>>
> >>> V3: Implement recommendations by Otavio Salvador
> >>>     o GPL license blurb
> >>>     o Fix minor typo in comment block
> >>>
> >>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> >>> Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> >>> Cc: Otavio Salvador <otavio@ossystems.com.br>
> >>>
> >>> git-proxy cleanup
> >>
> >> All those comments ought to be bellow --- or those will be included in
> >> commit log.
> >>
> >
> > Which is fine.
>
> Well, usually the log of the revisions are not included in the commit
> logs; any special reason for it to be done different?
>

Randomly jumping in,

It's not all that uncommon for kernel developers to keep the revision
history
in long logs. It's used as a way to track the intermediate history, give
review credit .. or just "because".

So while not always done, it isn't unheard of. I have no strong opinion one
way or the other, just thought I'd throw that out!

Cheers,

Bruce


>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--047d7b6226a494280c04d555d5bd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Sat, Feb 9, 2013 at 12:02 PM, Otavio Salvador <span dir=3D"ltr">=
&lt;<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@oss=
ystems.com.br</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On S=
at, Feb 9, 2013 at 2:59 PM, Darren Hart &lt;<a href=3D"mailto:dvhart@linux.=
intel.com">dvhart@linux.intel.com</a>&gt; wrote:<br>

&gt;<br>
&gt;<br>
&gt; On 02/08/2013 06:43 PM, Otavio Salvador wrote:<br>
&gt;&gt; On Fri, Feb 8, 2013 at 8:27 PM, Darren Hart &lt;<a href=3D"mailto:=
dvhart@linux.intel.com">dvhart@linux.intel.com</a>&gt; wrote:<br>
&gt;&gt;&gt; oe-git-proxy.sh is a simple tool to be used via GIT_PROXY_COMM=
AND. It<br>
&gt;&gt;&gt; uses BSD netcat to make SOCKS5 or HTTPS proxy connections. It =
uses<br>
&gt;&gt;&gt; ALL_PROXY to determine the proxy server, protocol, and port. I=
t uses<br>
&gt;&gt;&gt; NO_PROXY to skip using the proxy for a comma delimited list of=
 hosts,<br>
&gt;&gt;&gt; host globs (*.<a href=3D"http://example.com" target=3D"_blank"=
>example.com</a>), IPs, or CIDR masks (<a href=3D"http://192.168.1.0/24" ta=
rget=3D"_blank">192.168.1.0/24</a>). It is<br>
&gt;&gt;&gt; known to work with both bash and dash shells.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; V2: Implement recommendations by Enrico Scholz:<br>
&gt;&gt;&gt; =A0 =A0 o Use exec for the nc calls<br>
&gt;&gt;&gt; =A0 =A0 o Use &quot;$@&quot; instead of $* to avoid quoting is=
sues inherent with $*<br>
&gt;&gt;&gt; =A0 =A0 o Use bash explicitly and simplify some of the string =
manipulations<br>
&gt;&gt;&gt; =A0 =A0 Also:<br>
&gt;&gt;&gt; =A0 =A0 o Drop the .sh in the name per Otavio Salvador<br>
&gt;&gt;&gt; =A0 =A0 o Remove a stray debug statement<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; V3: Implement recommendations by Otavio Salvador<br>
&gt;&gt;&gt; =A0 =A0 o GPL license blurb<br>
&gt;&gt;&gt; =A0 =A0 o Fix minor typo in comment block<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Darren Hart &lt;<a href=3D"mailto:dvhart@linux.=
intel.com">dvhart@linux.intel.com</a>&gt;<br>
&gt;&gt;&gt; Cc: Enrico Scholz &lt;<a href=3D"mailto:enrico.scholz@sigma-ch=
emnitz.de">enrico.scholz@sigma-chemnitz.de</a>&gt;<br>
&gt;&gt;&gt; Cc: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com=
.br">otavio@ossystems.com.br</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; git-proxy cleanup<br>
&gt;&gt;<br>
&gt;&gt; All those comments ought to be bellow --- or those will be include=
d in<br>
&gt;&gt; commit log.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Which is fine.<br>
<br>
</div></div>Well, usually the log of the revisions are not included in the =
commit<br>
logs; any special reason for it to be done different?<br></blockquote><div>=
<br></div><div style>Randomly jumping in,</div><div><br></div><div style>It=
&#39;s not all that uncommon for kernel developers to keep the revision his=
tory</div>
<div style>in long logs. It&#39;s used as a way to track the intermediate h=
istory, give=A0</div><div style>review credit .. or just &quot;because&quot=
;.</div><div style><br></div><div style>So while not always done, it isn&#3=
9;t unheard of. I have no strong opinion one</div>
<div style>way or the other, just thought I&#39;d throw that out!</div><div=
 style><br></div><div style>Cheers,</div><div style><br></div><div style>Br=
uce</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S=
. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br<=
/a> =A0<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%2053%209981-7854" value=3D"+555399817854">+55 =
53 9981-7854</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossy=
stems.com.br" target=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
</div></div>

--047d7b6226a494280c04d555d5bd--
