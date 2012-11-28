Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Tdlbp-0007Ya-Li
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 18:39:41 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so10108599lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 09:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0ENjviBprhOWbTUfKzfESPI54BijVeCSfSa97s+NmxA=;
	b=qf9014K0j9Zy8WRq+Iyzfu1DHCwnwsjCSZatBVrkZYNIuGVuuMBP9+ebf8DLc7iKti
	yqVlVEmNLJwN3Ip++3A4INA5j+Qo96M4lESy/PIwCLhzT/RTbk+OFEtx4/EO75EbIxoD
	o9fr30/sh3vJ2XTvQ8IAXK5P9M7D4AdB405HqYfXzWTQo5tdSWN9gFlRaFbyO4A2dYhD
	yCvqzJRs9ZiBGcbnbJ9dDkBmQc203PuGnuR1/dTq4OIJ1XLeQtJnDj1jZ1Gz0XQ2YtYU
	zNgV45qMLMLvi26uY737//8b4vYGNc1zPR6o1giWLe8zAjAvRwJs9yTKLg2NkYCWbHli
	hQuQ==
MIME-Version: 1.0
Received: by 10.112.40.129 with SMTP id x1mr4105807lbk.95.1354123527029; Wed,
	28 Nov 2012 09:25:27 -0800 (PST)
Received: by 10.114.17.8 with HTTP; Wed, 28 Nov 2012 09:25:26 -0800 (PST)
In-Reply-To: <1354119751.15992.2.camel@ted>
References: <50B63784.5050502@enea.com>
	<1354119751.15992.2.camel@ted>
Date: Wed, 28 Nov 2012 12:25:26 -0500
Message-ID: <CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-cloud layer
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
X-List-Received-Date: Wed, 28 Nov 2012 17:39:41 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe323ecf849804cf9173d0

--e0cb4efe323ecf849804cf9173d0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 28, 2012 at 11:22 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2012-11-28 at 17:10 +0100, David Nystr=F6m wrote:
> > Hello everyone,
> >
> > I'm working on getting a minimal Yocto/oe-core based OpenStack setup
> > running with the meta-cloud layer, with bits and pieces "borrowed" from
> > the meta-xen layer.
>
> Great news!
>
> It might be worth growing meta-xen into a meta-virtualisation layer
> since kvm, openstack and xen all seem to be sharing a lot of pieces.
> This depends on the maintainers but it would seem to be logical rather
> than many small interdependent layers.
>

FWIW. I'd like to see this as well, and can contribute/help where possible.
I
was considering a meta-ovs (Open Virtualization Solutions), but if there ar=
e
already plans afoot for a meta-virtualization, then anything I did could be
pushed down keeping any other layers small.

In particular I'm keen to drive some common kernel configuration, and work
on consolidating kernel features in trees versus having a whole set of out
of
tree modules with better tie in's to userspace enabling features
dynamically.

So I'll keep an eye out for things as well and help where possible.

Cheers,

Bruce


>
> > Still in its infancy, and lots of stuff is still missing and/or not
> > working properly.
> >
> > Have a look if your interested, not much to see yet though.
> >
> > https://github.com/nysan/meta-cloud.git
> >
> > Any thoughts on floating layer ML:s, i.e. an ML for so called
> > "out-of-tree" layers ?  Or is the common thought that all new recipes
> > should eventually go into oe-core ?
>
> The Yocto Project has been using the Yocto list for that and
> OpenEmbedded has openembedded-devel. Its not expected for everything to
> end up in OE-Core, quite the opposite.
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e0cb4efe323ecf849804cf9173d0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, N=
ov 28, 2012 at 11:22 AM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@l=
inuxfoundation.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, 2012-11-28 at 17:1=
0 +0100, David Nystr=F6m wrote:<br>
&gt; Hello everyone,<br>
&gt;<br>
&gt; I&#39;m working on getting a minimal Yocto/oe-core based OpenStack set=
up<br>
&gt; running with the meta-cloud layer, with bits and pieces &quot;borrowed=
&quot; from<br>
&gt; the meta-xen layer.<br>
<br>
</div>Great news!<br>
<br>
It might be worth growing meta-xen into a meta-virtualisation layer<br>
since kvm, openstack and xen all seem to be sharing a lot of pieces.<br>
This depends on the maintainers but it would seem to be logical rather<br>
than many small interdependent layers.<br></blockquote><div><br></div><div>=
FWIW. I&#39;d like to see this as well, and can contribute/help where possi=
ble. I</div><div>was considering a meta-ovs (Open Virtualization Solutions)=
, but if there are</div>
<div>already plans afoot for a meta-virtualization, then anything I did cou=
ld be</div><div>pushed down keeping any other layers small.</div><div><br><=
/div><div>In particular I&#39;m keen to drive=A0some common kernel configur=
ation, and work</div>
<div>on consolidating kernel features in trees versus having a whole set of=
 out of</div><div>tree modules with better tie in&#39;s to userspace enabli=
ng features dynamically.</div><div><br></div><div>So I&#39;ll keep an eye o=
ut for things as well and help where possible.</div>
<div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
&gt; Still in its infancy, and lots of stuff is still missing and/or not<br=
>
&gt; working properly.<br>
&gt;<br>
&gt; Have a look if your interested, not much to see yet though.<br>
&gt;<br>
&gt; <a href=3D"https://github.com/nysan/meta-cloud.git" target=3D"_blank">=
https://github.com/nysan/meta-cloud.git</a><br>
&gt;<br>
&gt; Any thoughts on floating layer ML:s, i.e. an ML for so called<br>
&gt; &quot;out-of-tree&quot; layers ? =A0Or is the common thought that all =
new recipes<br>
&gt; should eventually go into oe-core ?<br>
<br>
</div>The Yocto Project has been using the Yocto list for that and<br>
OpenEmbedded has openembedded-devel. Its not expected for everything to<br>
end up in OE-Core, quite the opposite.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
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
hee at its end&quot;<br>
</div>

--e0cb4efe323ecf849804cf9173d0--
