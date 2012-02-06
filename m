Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RuMlD-0006Zs-3h
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 12:29:27 +0100
Received: by eekd41 with SMTP id d41so1808667eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 03:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=ZgtOkCz5Spa7vhjBUA9eU2gCl/SaOQgWqQIrX5c6560=;
	b=d9upog6miNw/x1h52DMZxSPiRr2P3UyNke2e1ecWmx1kKwg8NKT8f0qhXpb1dCg01I
	woEs0Twm6vWftqS3xMNCq2Z6+tqTs2YvdTjDZAkHTFQ3xlzy8JBSG7ZIhyL4+bN8DBHj
	TzObhNFEXdUlE+Q9q/rRYQ3D9hOkRXRiP450g=
MIME-Version: 1.0
Received: by 10.14.95.129 with SMTP id p1mr3145373eef.10.1328527286330; Mon,
	06 Feb 2012 03:21:26 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.47.10 with HTTP; Mon, 6 Feb 2012 03:21:26 -0800 (PST)
In-Reply-To: <1328526818.14363.2.camel@phil-desktop>
References: <cover.1328526202.git.otavio@ossystems.com.br>
	<5ffae3864d6ec5dafadff13381d3177c44392b7e.1328526202.git.otavio@ossystems.com.br>
	<1328526818.14363.2.camel@phil-desktop>
Date: Mon, 6 Feb 2012 09:21:26 -0200
X-Google-Sender-Auth: hWC2tqmEIAQC_wGv-BpPdAEDXlQ
Message-ID: <CAP9ODKrFuJ85mcXS6DAJxagFrgonWv+jTCUUQibx3Ug85BOCVw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] dhcp: move dhcp leases files handling to postinst/postrm
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
X-List-Received-Date: Mon, 06 Feb 2012 11:29:27 -0000
Content-Type: multipart/alternative; boundary=bcaec52be805f9e5d204b849dc89

--bcaec52be805f9e5d204b849dc89
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 6, 2012 at 09:13, Phil Blundell <philb@gnu.org> wrote:

> On Mon, 2012-02-06 at 11:03 +0000, Otavio Salvador wrote:
> > +pkg_postrm_dhcp-server() {
> > +    rm -f $D/${localstatedir}/lib/dhcp/dhcpd.leases
> > +    rm -f $D/${localstatedir}/lib/dhcp/dhcpd6.leases
> > +    rmdir $D/${localstatedir}/lib/dhcp
> > +}
> > +
> > +pkg_postrm_dhcp-client() {
> > +    rm -f $D/${localstatedir}/lib/dhcp/dhclient.leases
> > +    rm -f $D/${localstatedir}/lib/dhcp/dhclient6.leases
> > +    rmdir $D/${localstatedir}/lib/dhcp
>
> Are those rmdirs not going to fail if you try to remove one package with
> the other one still installed?
>

I think they will. I'll add an || true on it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--bcaec52be805f9e5d204b849dc89
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Feb 6, 2012 at 09:13, Phil Blundell <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org">philb@gnu.org</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Mon, 2012-02-06 at 11:03 +0000, Otavio Salvador wrote:=
<br>
&gt; +pkg_postrm_dhcp-server() {<br>
&gt; + =A0 =A0rm -f $D/${localstatedir}/lib/dhcp/dhcpd.leases<br>
&gt; + =A0 =A0rm -f $D/${localstatedir}/lib/dhcp/dhcpd6.leases<br>
&gt; + =A0 =A0rmdir $D/${localstatedir}/lib/dhcp<br>
&gt; +}<br>
&gt; +<br>
&gt; +pkg_postrm_dhcp-client() {<br>
&gt; + =A0 =A0rm -f $D/${localstatedir}/lib/dhcp/dhclient.leases<br>
&gt; + =A0 =A0rm -f $D/${localstatedir}/lib/dhcp/dhclient6.leases<br>
&gt; + =A0 =A0rmdir $D/${localstatedir}/lib/dhcp<br>
<br>
</div>Are those rmdirs not going to fail if you try to remove one package w=
ith<br>
the other one still installed?<br></blockquote><div><br></div><div>I think =
they will. I&#39;ll add an || true on it.</div><div>=A0</div></div>-- <br>O=
tavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.=
S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"=
_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.=
br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--bcaec52be805f9e5d204b849dc89--
