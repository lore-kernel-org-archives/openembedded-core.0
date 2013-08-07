Return-Path: <mranostay@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 44B636007B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 15:53:40 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wd6so1512994obb.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2013 08:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=50pYT0ze4XjWpT66d1qI0BXKJ3EcBkgQAFBkhvrsa3c=;
	b=DWkGLA1yoeViwGWXAWJVfELhHnr0K2CJRFg9AZJlakkUxE82/goGwC52yBpSHM19z0
	qEGtu1AalgVg0HuvpWiZUbNzAdROiz0L8H1M5jsyAe0GFnJTEKhrA3fQ4H/kIkWJam7z
	gAJ90zHLisGIXt+Sv938Sbcf8xyQwZqNXFqfXGH4kJDholuUJUMvqAJvw03J3fLlcjm7
	sHcAc5RIsOrdIvS8OoQjmsK4vUgCv71DuAlYSpGHLVU8p5xRdYrVjvPzm05VZ+rXdfug
	0g9rrvf/welUCRXGiYa5P3eMFzr9zFd95i6zcmQ7OSHEFBxpKbAcXCQEAmiU6RK1pXmz
	NqAA==
MIME-Version: 1.0
X-Received: by 10.60.93.41 with SMTP id cr9mr1073024oeb.20.1375890820378; Wed,
	07 Aug 2013 08:53:40 -0700 (PDT)
Received: by 10.76.25.4 with HTTP; Wed, 7 Aug 2013 08:53:40 -0700 (PDT)
In-Reply-To: <CAJTo0LYAgx=FdSGNMDL3u+yjuPBjmcy1U2zd+Ew5GC7225SKeQ@mail.gmail.com>
References: <1375885075-13410-1-git-send-email-mranostay@gmail.com>
	<CAJTo0LYAgx=FdSGNMDL3u+yjuPBjmcy1U2zd+Ew5GC7225SKeQ@mail.gmail.com>
Date: Wed, 7 Aug 2013 08:53:40 -0700
Message-ID: <CAKzfze9g76FX6i5OYosKr6w+rLhwZc+JOEDYLzwWLL3HdfGSdw@mail.gmail.com>
From: Matt Ranostay <mranostay@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] acpica: Add ACPICA package
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
X-List-Received-Date: Wed, 07 Aug 2013 15:53:40 -0000
Content-Type: multipart/alternative; boundary=047d7b33d2fc99357604e35d8b1a

--047d7b33d2fc99357604e35d8b1a
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2013 at 7:34 AM, Burton, Ross <ross.burton@intel.com> wrote:

> Hi,
>
> On 7 August 2013 15:17, Matt Ranostay <mranostay@gmail.com> wrote:
> > Added ACPICA package which enables viewing/editing/compiling
> > of ACPI tables.
>
> Is this really general-purpose enough to be suitable for oe-core, or
> would it be more suited to meta-oe or some other layer?
>
> Probably correct to be in meta-oe or another layer since only x86 and som=
e
ARM platforms use ACPI as of now.


> > +PR =3D "r0"
>
> Remove this line, r0 is the default.
>
> +LIC_FILES_CHKSUM =3D
>
> "file://${S}/source/include/aclocal.h;endline=3D42;md5=3D07fbd4e514c75e14=
0a19e3ab508f763d"
>
> ${S} is default, so in general people do file://sources/...
>
> > +SRC_URI =3D "
> https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz"
>
> Fetching that here with wget produces:
>
> ERROR: The certificate of =91acpica.org=92 is not trusted.
>
>
Seems StartCom Ltd. isn't a trusted  CA or just not in the keystore by
default.


> Someone should tell them...
>
> > +inherit autotools
>
> The recipe doesn't use autotools, so you should drop this inherit.
>
> > +do_install() {
> > +    oe_runmake INSTALLFLAGS=3D"-m 555"
> > +}
>
> That's just running 'make INSTALLFLAGS=3D"-m 555"'.  You'll need to tell
> it to run the right target for install, and to pass ${D} somehow so
> the makefile doesn't try and write to /usr directly.
>
> Gah good catch. Will fix up and resubmit.


> Ross
>

--047d7b33d2fc99357604e35d8b1a
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Wed, Aug 7, 2013 at 7:34 AM, Burton, =
Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
Hi,<br>
<div class=3D"im"><br>
On 7 August 2013 15:17, Matt Ranostay &lt;<a href=3D"mailto:mranostay@gmail=
.com">mranostay@gmail.com</a>&gt; wrote:<br>
&gt; Added ACPICA package which enables viewing/editing/compiling<br>
&gt; of ACPI tables.<br>
<br>
</div>Is this really general-purpose enough to be suitable for oe-core, or<=
br>
would it be more suited to meta-oe or some other layer?<br>
<br></blockquote><div>Probably correct to be in meta-oe or another layer si=
nce only x86 and some ARM platforms use ACPI as of now.<br>=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">

&gt; +PR =3D &quot;r0&quot;<br>
<br>
Remove this line, r0 is the default.<br>
<div class=3D"im"><br>
+LIC_FILES_CHKSUM =3D<br>
&quot;file://${S}/source/include/aclocal.h;endline=3D42;md5=3D07fbd4e514c75=
e140a19e3ab508f763d&quot;<br>
<br>
</div>${S} is default, so in general people do file://sources/...<br>
<div class=3D"im"><br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://acpica.org/sites/acpica/files/ac=
pica-unix2-${PV}.tar.gz" target=3D"_blank">https://acpica.org/sites/acpica/=
files/acpica-unix2-${PV}.tar.gz</a>&quot;<br>
<br>
</div>Fetching that here with wget produces:<br>
<br>
ERROR: The certificate of =91<a href=3D"http://acpica.org" target=3D"_blank=
">acpica.org</a>=92 is not trusted.<br>
<br></blockquote><div><br>Seems StartCom Ltd. isn&#39;t a trusted=A0 CA or =
just not in the keystore by default.<br>=A0<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">

Someone should tell them...<br>
<br>
&gt; +inherit autotools<br>
<br>
The recipe doesn&#39;t use autotools, so you should drop this inherit.<br>
<div class=3D"im"><br>
&gt; +do_install() {<br>
&gt; + =A0 =A0oe_runmake INSTALLFLAGS=3D&quot;-m 555&quot;<br>
&gt; +}<br>
<br>
</div>That&#39;s just running &#39;make INSTALLFLAGS=3D&quot;-m 555&quot;&#=
39;. =A0You&#39;ll need to tell<br>
it to run the right target for install, and to pass ${D} somehow so<br>
the makefile doesn&#39;t try and write to /usr directly.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div>Gah good catch. Will fix up and resubmit.<br>=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888">
Ross<br>
</font></span></blockquote></div><br>

--047d7b33d2fc99357604e35d8b1a--
