Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1SCW5e-0006T7-09
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 15:05:34 +0200
Received: by vcbfl13 with SMTP id fl13so5908732vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=3rebE157e/rwGLSNmIuohgt3feWYY+qgC+t5a0cU7As=;
	b=a8UJPmehPN4JUn2GxovpYagF0Cnuni5ChL9on9Sutsri0FgurDdVkGs9jBwiLYT2lp
	58xq0grnDNT1mea2rBLDUNjVtwucUhKkVmqMtDuNJidSQLxrTZpcO02s+dEP4wYnSP9h
	l9YkXSOZMeAETeSkg0h/eKYyOE7ARKywT0u4Kh8RcEAIog8+bSrc/4/jhzNQPeBaCxKT
	BUQufhh6x3gD4BIBXBFYGZeMpOooclIDhl+jYXHw8mwgM8TUy17R5QtXSuxdsNMBRceZ
	EDVRiWVwG8cUU2ZlJJD0WS6Bki/KS5+kMYsIdTjtosCv7gjfLd9LI40jygg2LlRdjXhu
	yzkQ==
MIME-Version: 1.0
Received: by 10.52.68.228 with SMTP id z4mr2048938vdt.1.1332852992635; Tue, 27
	Mar 2012 05:56:32 -0700 (PDT)
Received: by 10.52.19.193 with HTTP; Tue, 27 Mar 2012 05:56:32 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1203270815010.3125@oneiric>
References: <alpine.DEB.2.02.1203270815010.3125@oneiric>
Date: Tue, 27 Mar 2012 14:56:32 +0200
Message-ID: <CAHod+GcSKcRd_4abi1qrDS71==1c8cQ2og4bR_nfVaa+k1frvQ@mail.gmail.com>
From: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: adding a single package to an image -- what's the proper way?
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
X-List-Received-Date: Tue, 27 Mar 2012 13:05:34 -0000
Content-Type: multipart/alternative; boundary=20cf3079bbc029f43a04bc3905b8

--20cf3079bbc029f43a04bc3905b8
Content-Type: text/plain; charset=ISO-8859-1

I haven't tried this myself on images, but you can probably use .bbappend
for this. I think bbappend files provide a proper way for extending
recipes. So for instance,
if you want to add a package to the core-image-minimal image you would
place the following in your core-image-minimal.bbappend file:

IMAGE_INSTALL += "your_package"

Of course, this solution assumes you have a local overlay.

Or maybe you could try placing the above IMAGE_INSTALL append to your
local.conf. But that's probably messy and not advised.


On Tue, Mar 27, 2012 at 2:20 PM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>
>  i'm currently poring over the OE docs (including the ones at the
> yocto site), and i'm trying to figure out how to simply add a package
> to an image through one's local.conf file.
>
>  the current yocto ref manual has an entire section about customizing
> images:
>
>
> http://www.yoctoproject.org/docs/current/poky-ref-manual/poky-ref-manual.html#usingpoky-extend-customimage
>
> but it discusses creating custom recipe files and custom tasks, and
> using IMAGE_INSTALL and IMAGE_FEATURES and EXTRA_IMAGE_FEATURES, and
> finally gets into using local.conf, suggesting:
>
>  DISTRO_EXTRA_RDEPENDS += "strace"
>
> is that, in fact, the accepted way if one simply wants to add a
> package to an existing image build?  because as soon as the manual
> mentions it, in the very next paragraph, it discourages its use.
>
>  so what's the story?  it seems it should be a lot easier to figure
> out how to do something that straightforward.
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                        http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--20cf3079bbc029f43a04bc3905b8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I haven&#39;t tried this myself on images, but you can probably use .bbappe=
nd for this. I think bbappend files provide a proper way for extending reci=
pes. So for instance,<div>if you want to add a package to the core-image-mi=
nimal image you would place the following in your core-image-minimal.bbappe=
nd file:</div>
<div><br></div><div>IMAGE_INSTALL +=3D &quot;your_package&quot;</div><div><=
br></div><div>Of course, this solution assumes you have a local overlay.</d=
iv><div><br></div><div>Or maybe you could try placing the above IMAGE_INSTA=
LL append to your local.conf. But that&#39;s probably messy and not advised=
.<br>
<div><br></div><div><br></div><div><div class=3D"gmail_quote">On Tue, Mar 2=
7, 2012 at 2:20 PM, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
<br>
 =A0i&#39;m currently poring over the OE docs (including the ones at the<br=
>
yocto site), and i&#39;m trying to figure out how to simply add a package<b=
r>
to an image through one&#39;s local.conf file.<br>
<br>
 =A0the current yocto ref manual has an entire section about customizing<br=
>
images:<br>
<br>
<a href=3D"http://www.yoctoproject.org/docs/current/poky-ref-manual/poky-re=
f-manual.html#usingpoky-extend-customimage" target=3D"_blank">http://www.yo=
ctoproject.org/docs/current/poky-ref-manual/poky-ref-manual.html#usingpoky-=
extend-customimage</a><br>

<br>
but it discusses creating custom recipe files and custom tasks, and<br>
using IMAGE_INSTALL and IMAGE_FEATURES and EXTRA_IMAGE_FEATURES, and<br>
finally gets into using local.conf, suggesting:<br>
<br>
 =A0DISTRO_EXTRA_RDEPENDS +=3D &quot;strace&quot;<br>
<br>
is that, in fact, the accepted way if one simply wants to add a<br>
package to an existing image build? =A0because as soon as the manual<br>
mentions it, in the very next paragraph, it discourages its use.<br>
<br>
 =A0so what&#39;s the story? =A0it seems it should be a lot easier to figur=
e<br>
out how to do something that straightforward.<br>
<br>
rday<br>
<br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Robert P. J. Day =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 Ottawa, Ontario, CANADA<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<a href=3D"http://crashcour=
se.ca" target=3D"_blank">http://crashcourse.ca</a><br>
<br>
Twitter: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 <a href=3D"http://twitter.com/rpjday" target=3D"_blank">http://=
twitter.com/rpjday</a><br>
LinkedIn: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <a hr=
ef=3D"http://ca.linkedin.com/in/rpjday" target=3D"_blank">http://ca.linkedi=
n.com/in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br></div></div>

--20cf3079bbc029f43a04bc3905b8--
