Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rzyj8-0004ft-KJ
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 00:02:30 +0100
Received: by wibhq7 with SMTP id hq7so4030255wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 14:54:11 -0800 (PST)
Received-SPF: pass (google.com: domain of andrei@gherzan.ro designates
	10.180.92.71 as permitted sender) client-ip=10.180.92.71; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrei@gherzan.ro
	designates 10.180.92.71 as permitted sender)
	smtp.mail=andrei@gherzan.ro
Received: from mr.google.com ([10.180.92.71])
	by 10.180.92.71 with SMTP id ck7mr37109631wib.3.1329864851422 (num_hops
	= 1); Tue, 21 Feb 2012 14:54:11 -0800 (PST)
Received: by 10.180.92.71 with SMTP id ck7mr30885588wib.3.1329864851184; Tue,
	21 Feb 2012 14:54:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.227.113.67 with HTTP; Tue, 21 Feb 2012 14:53:51 -0800 (PST)
X-Originating-IP: [79.117.107.69]
In-Reply-To: <1329864016.2591.195.camel@x121e.pbcl.net>
References: <1328889675-9864-1-git-send-email-andrei@gherzan.ro>
	<4F441987.2010800@linux.intel.com>
	<1329864016.2591.195.camel@x121e.pbcl.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 22 Feb 2012 00:53:51 +0200
Message-ID: <CAK18fxG9DZ3UTbfVcCeTLJHobav90xMAs+1FsK8hUfNvwqBAyw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlOsnw5Td8+daARS3DibkwFa5ZS3+q63KuPq0mzvJR+HxstiBpK/jvsRiMeMXGy0O7IHAJq
Subject: Re: [PATCH] openssl: Move libcrypto to base_libdir
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
X-List-Received-Date: Tue, 21 Feb 2012 23:02:30 -0000
Content-Type: multipart/alternative; boundary=f46d043c80700dddd204b9814af0

--f46d043c80700dddd204b9814af0
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 22, 2012 at 00:40, Phil Blundell <philb@gnu.org> wrote:

> On Tue, 2012-02-21 at 14:24 -0800, Saul Wold wrote:
> > On 02/10/2012 08:01 AM, Andrei Gherzan wrote:
> > > This fix is for dhclient. It needs libcrypto at runtime and if
> > > libcrypto is in libdir, it's path can be inaccessible on systems
> > > where /usr is on nfs for example or dhclient is needed before
> > > /usr is mounted.
> > >
> > > Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> > > ---
> > >   ...001-openssl-Move-libcrypto-to-base_libdir.patch |   61
> ++++++++++++++++++++
> > >   meta/recipes-connectivity/openssl/openssl.inc      |   10 +++-
> > >   .../recipes-connectivity/openssl/openssl_1.0.0g.bb |    2 +-
> > >   3 files changed, 71 insertions(+), 2 deletions(-)
> > >   create mode 100644
> meta/recipes-connectivity/openssl/0001-openssl-Move-libcrypto-to-base_libdir.patch
> > >
> > > diff --git
> a/meta/recipes-connectivity/openssl/0001-openssl-Move-libcrypto-to-base_libdir.patch
> b/meta/recipes-connectivity/openssl/0001-openssl-Move-libcrypto-to-base_libdir.patch
> > > new file mode 100644
> > > index 0000000..b101d8c
> > > --- /dev/null
> > > +++
> b/meta/recipes-connectivity/openssl/0001-openssl-Move-libcrypto-to-base_libdir.patch
> > > @@ -0,0 +1,61 @@
> > > +From ac1fe1490e997fb8fd91ec13b675d38efcc65775 Mon Sep 17 00:00:00 2001
> > > +From: Andrei Gherzan<andrei@gherzan.ro>
> > > +Date: Thu, 9 Feb 2012 00:03:38 +0200
> > > +Subject: [PATCH] openssl: Move libcrypto to base_libdir
> > > +
> > > +This fix is for dhclient. It needs libcrypto at runtime and if
> > > +libcrypto is in libdir, it's path can be inaccessible on systems
> > > +where /usr is on nfs for example or dhclient is needed before
> > > +/usr is mounted.
> > > +
> > Seems to be missing Upstream-Status
>
> Really?  There doesn't seem to be any genuine patch here.  As far as I
> can tell, that 0001-openssl-Move-libcrypto-to-base_libdir.patch file is
> some old version of the changeset which has somehow gotten checked in as
> a git format-patch'd diff.  I think it should be deleted, not given an
> upstream-status.
>
> p.
>
>
It was my mistake. git -A did the wrong thing. I will re-upload .

ag

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--f46d043c80700dddd204b9814af0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Feb 22, 2012 at 00:40, Phil Blundell <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org">philb@gnu.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">

On Tue, 2012-02-21 at 14:24 -0800, Saul Wold wrote:<br>
&gt; On 02/10/2012 08:01 AM, Andrei Gherzan wrote:<br>
&gt; &gt; This fix is for dhclient. It needs libcrypto at runtime and if<br=
>
&gt; &gt; libcrypto is in libdir, it&#39;s path can be inaccessible on syst=
ems<br>
&gt; &gt; where /usr is on nfs for example or dhclient is needed before<br>
&gt; &gt; /usr is mounted.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Andrei Gherzan&lt;<a href=3D"mailto:andrei@gherzan=
.ro">andrei@gherzan.ro</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =A0 ...001-openssl-Move-libcrypto-to-base_libdir.patch | =A0 61 +=
+++++++++++++++++++<br>
&gt; &gt; =A0 meta/recipes-connectivity/openssl/openssl.inc =A0 =A0 =A0| =
=A0 10 +++-<br>
&gt; &gt; =A0 .../recipes-connectivity/openssl/<a href=3D"http://openssl_1.=
0.0g.bb" target=3D"_blank">openssl_1.0.0g.bb</a> | =A0 =A02 +-<br>
&gt; &gt; =A0 3 files changed, 71 insertions(+), 2 deletions(-)<br>
&gt; &gt; =A0 create mode 100644 meta/recipes-connectivity/openssl/0001-ope=
nssl-Move-libcrypto-to-base_libdir.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-connectivity/openssl/0001-openssl-Move-=
libcrypto-to-base_libdir.patch b/meta/recipes-connectivity/openssl/0001-ope=
nssl-Move-libcrypto-to-base_libdir.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..b101d8c<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-connectivity/openssl/0001-openssl-Move-libcryp=
to-to-base_libdir.patch<br>
&gt; &gt; @@ -0,0 +1,61 @@<br>
&gt; &gt; +From ac1fe1490e997fb8fd91ec13b675d38efcc65775 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Andrei Gherzan&lt;<a href=3D"mailto:andrei@gherzan.ro">and=
rei@gherzan.ro</a>&gt;<br>
&gt; &gt; +Date: Thu, 9 Feb 2012 00:03:38 +0200<br>
&gt; &gt; +Subject: [PATCH] openssl: Move libcrypto to base_libdir<br>
&gt; &gt; +<br>
&gt; &gt; +This fix is for dhclient. It needs libcrypto at runtime and if<b=
r>
&gt; &gt; +libcrypto is in libdir, it&#39;s path can be inaccessible on sys=
tems<br>
&gt; &gt; +where /usr is on nfs for example or dhclient is needed before<br=
>
&gt; &gt; +/usr is mounted.<br>
&gt; &gt; +<br>
&gt; Seems to be missing Upstream-Status<br>
<br>
Really? =A0There doesn&#39;t seem to be any genuine patch here. =A0As far a=
s I<br>
can tell, that 0001-openssl-Move-libcrypto-to-base_libdir.patch file is<br>
some old version of the changeset which has somehow gotten checked in as<br=
>
a git format-patch&#39;d diff. =A0I think it should be deleted, not given a=
n<br>
upstream-status.<br>
<br>
p.<br>
<br></blockquote><div><br></div><div>It was my mistake. git -A did the wron=
g thing. I will re-upload .</div><div><br></div><div>ag</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">


<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br>

--f46d043c80700dddd204b9814af0--
