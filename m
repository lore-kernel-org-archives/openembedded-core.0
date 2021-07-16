Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.6369.1626442734847601274
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 06:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a7+8oiFM;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id l26so12987811eda.10
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 06:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=woJ+HskCwi3fw+B+VnpD0d9GS1/tNQqNEraijju6tH0=;
        b=a7+8oiFMHI4RHwyCyBD9pewAnZf/6TBJTOJp34Xoh/WXcUSHVnpmWaEpo86jIOhpRj
         jIpKU/kN6hLZ5YTmZLCLZjt/Py4RtwYisovlt7HhBPv+EcCdaxKCp7mpouA+Ft7xGsx1
         YfWMB9FsOHnMgYrHOd48gZsqQKJQPJKGguVdTeJwUm2pnkIUaGYdnY1MgedeNFiU4kK8
         Xnxlt+JSTRXjj+4qvnB28oWPzlhBHmzDD1swBo/u667VyGCZWFawbtEBJdNS3C/QercI
         +hE8I590gB0jcKIy9+kerUudaFlTXBfAFd5/52la6nd2AyIbczZBMqmR0MvVG7KP+mxP
         Q5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=woJ+HskCwi3fw+B+VnpD0d9GS1/tNQqNEraijju6tH0=;
        b=mw3Z3+ptPfcuX3fl9MbDUoeptRQpShr3myZ50FgDKWj4O7NlkkFZ0+/BovdzZT66HL
         p4gKE8+11R4Bg3TlgE/BHtZobAmtFwWy2AnmA2gw71unFXmppkQv+Ch6H/Tp0NR+FtXE
         QdiD2D14LqomPuzzylhowmEn5nhIJRHKEowHwGchVBPRbHf2drBfS7a/ojO6P2Bi5Cyw
         PSq+WloTQkct5jLiVxlKqP5pQ9sTn/gEXFpgOrOZ1JmstYcWdcTHERTtCeS9mNBGxMjG
         Qt1uUHOJLcuYTzjaRbfmG0pm45cuTPcpxcDqjwrQXcOclNeu51AAmle0yBSaranLpUu/
         +dVA==
X-Gm-Message-State: AOAM531GFpalg+62nn5BOTgcjFSMsmT8do/B35R69eeNumy/t0Q7klGb
	e7kFK/gPQQqnfK0/pwBkJrmlNhel6j57AMn1w+Q=
X-Google-Smtp-Source: ABdhPJw3iVGUMJ9GiAmPQIredvIGoe+F5zlL2OTtL8bnf87+yDYRC1ltKqAtelw4vABOj1VslT+ryytFnQzUA4iLm/k=
X-Received: by 2002:a05:6402:19a:: with SMTP id r26mr14570091edv.230.1626442733288;
 Fri, 16 Jul 2021 06:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <1626076608-17034-1-git-send-email-wangmy@fujitsu.com>
 <CA+chaQfWtGf7gsUCLXcTuB985YYHM=FQszdX1d2y4fcjjEepOg@mail.gmail.com>
 <17064fad-db99-80e0-f9b7-ab8c4685ec7d@gmail.com> <AM9PR09MB46422B3F8BEFD4663D00D74DA8129@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAMKF1sqeWORxEneNHxn7YiRAFkC=eUnb7p2U=tfeGRFDpsLeqw@mail.gmail.com> <6a1b0c81-338e-2c4c-2880-06a11eec052e@windriver.com>
In-Reply-To: <6a1b0c81-338e-2c4c-2880-06a11eec052e@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 16 Jul 2021 15:38:41 +0200
Message-ID: <CA+chaQeCTBrRGSOg9GuJe-AuAmiG22tEYbTwLarn0owbn=e9gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] python3-setuptools: upgrade 57.0.0 -> 57.1.0
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, Konrad Weihmann <kweihmann@outlook.com>, 
	wangmy <wangmy@fujitsu.com>, Leon Anavi <leon.anavi@konsulko.com>, 
	Derek Straka <derek@asterius.io>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005d80aa05c73db5d3"

--0000000000005d80aa05c73db5d3
Content-Type: text/plain; charset="UTF-8"

Thanks Trevor! my next world build will be green again (maybe) :).

On Fri, Jul 16, 2021 at 3:32 PM Trevor Gamblin <trevor.gamblin@windriver.com>
wrote:

>
> On 2021-07-15 2:55 p.m., Khem Raj wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On Thu, Jul 15, 2021 at 10:57 AM Konrad Weihmann <kweihmann@outlook.com>
> wrote:
> >> On 15.07.21 19:22, Khem Raj wrote:
> >>>
> >>> On 7/15/21 7:43 AM, Martin Jansa wrote:
> >>>> On Mon, Jul 12, 2021 at 9:57 AM wangmy <wangmy@fujitsu.com
> >>>> <mailto:wangmy@fujitsu.com>> wrote:
> >>>>
> >>>>      reproducibility.patch
> >>>>      deleted since it's been merged upstream.
> >>>>
> >>>>      v57.1.0
> >>>>      -------
> >>>>
> >>>>      Changes
> >>>>      ^^^^^^^
> >>>>      * #2692: Globs are now sorted in 'license_files' restoring
> >>>>      reproducibility by eliminating variance from disk order.
> >>>>      * #2714: Update to distutils at pypa/distutils@e2627b7.
> >>>>      * #2715: Removed reliance on deprecated ssl.match_hostname by
> >>>>      removing the ssl support. Now any index operations rely on the
> >>>>      native SSL implementation.
> >>>>
> >>>>
> >>>> FWIW: this change
> >>>> breaks
> meta-openembedded/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb:
> do_install:
> >>>>
> >>>>
> >>>> + people who might be interested in python3-cassandra-driver.
> >>>>
> >>>> | Installed
> >>>>
> /jenkins/mjansa/build/ros/ros2-rolling-honister/tmp-glibc/work/core2-64-oe-linux/python3-cassandra-driver/3.25.0-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/cassandra_driver-3.25.0-py3.9-linux-x86_64.egg
> >>>>
> >>>> | Processing dependencies for cassandra-driver==3.25.0
> >>>> | Searching for geomet<0.3,>=0.1
> >>>> | Reading https://pypi.org/simple/geomet/
> >>>> <https://pypi.org/simple/geomet/>
> >>>> | Download error on https://pypi.org/simple/geomet/
> >>>> <https://pypi.org/simple/geomet/>: [SSL: CERTIFICATE_VERIFY_FAILED]
> >>>> certificate verify failed: unable to get local issuer certificate
> >>>> (_ssl.c:1129) -- Some packages may not be found!
> >>>> | Couldn't find index page for 'geomet' (maybe misspelled?)
> >>>> | Scanning index of all packages (this may take a while)
> >>>> | Reading https://pypi.org/simple/ <https://pypi.org/simple/>
> >>>> | Download error on https://pypi.org/simple/
> >>>> <https://pypi.org/simple/>: [SSL: CERTIFICATE_VERIFY_FAILED]
> >>>> certificate verify failed: unable to get local issuer certificate
> >>>> (_ssl.c:1129) -- Some packages may not be found!
> >>>> | No local packages or working download links found for
> geomet<0.3,>=0.1
> >> But that not directly an issue of the setuptools upgrade, but a not well
> >> written recipe here.
> >> I'm more than lucky that this update revealed the issue, because
> >> otherwise no one would have really noticed that the original recipe of
> >> cassandra-driver is pulling sources while installing.
> >> So just in case I would rather pull in this upgrade than to mind the
> >> broken recipe from meta-python here (just my 2c)
> >>
> > i am fine with whatever the right fix is. Its normal that some base
> > infra component dependency
> > drives a change in another recipe if thats inline with expected design
> > then change the component
> > to work with new update.
>
> I've sent a patch to the openembedded-devel mailing list that removes
> the --no-libev flags and adds python3-geomet (which I also sent a patch
> to add to the layer) to the RDEPENDS, allowing python3-cassandra-driver
> to build/import OK in an image without trying to pull stuff during
> do_install.
>
> - Trevor
>
> >
> >>>> | error: Could not find suitable distribution for
> >>>> Requirement.parse('geomet<0.3,>=0.1')
> >>>>
> >>>>
> >>> yes its reproduced on AB as well.
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1397
> >>>
> >>>>
> >>>>
> >>>>
> >>>
> >>>
> >>>
>
> 
>
>

--0000000000005d80aa05c73db5d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Trevor! my next world build will be green again (ma=
ybe) :).</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Fri, Jul 16, 2021 at 3:32 PM Trevor Gamblin &lt;<a href=3D"mailt=
o:trevor.gamblin@windriver.com">trevor.gamblin@windriver.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 2021-07-15 2:55 p.m., Khem Raj wrote:<br>
&gt; [Please note: This e-mail is from an EXTERNAL e-mail address]<br>
&gt;<br>
&gt; On Thu, Jul 15, 2021 at 10:57 AM Konrad Weihmann &lt;<a href=3D"mailt=
o:kweihmann@outlook.com" target=3D"_blank">kweihmann@outlook.com</a>&gt; wr=
ote:<br>
&gt;&gt; On 15.07.21 19:22, Khem Raj wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 7/15/21 7:43 AM, Martin Jansa wrote:<br>
&gt;&gt;&gt;&gt; On Mon, Jul 12, 2021 at 9:57 AM wangmy &lt;<a href=3D"mai=
lto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a><br>
&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 reproducibility.patch<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 deleted since it&#39;s been merged up=
stream.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 v57.1.0<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -------<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Changes<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ^^^^^^^<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 * #2692: Globs are now sorted in &#39=
;license_files&#39; restoring<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 reproducibility by eliminating varian=
ce from disk order.<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 * #2714: Update to distutils at pypa/=
distutils@e2627b7.<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 * #2715: Removed reliance on deprecat=
ed ssl.match_hostname by<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 removing the ssl support. Now any ind=
ex operations rely on the<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 native SSL implementation.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; FWIW: this change<br>
&gt;&gt;&gt;&gt; breaks=C2=A0 meta-openembedded/meta-python/recipes-devtoo=
ls/python/python3-cassandra-driver_3.25.0.bb:do_install:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; + people who might be interested in python3-cassandra-dri=
ver.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; | Installed<br>
&gt;&gt;&gt;&gt; /jenkins/mjansa/build/ros/ros2-rolling-honister/tmp-glibc=
/work/core2-64-oe-linux/python3-cassandra-driver/3.25.0-r0/recipe-sysroot-n=
ative/usr/lib/python3.9/site-packages/cassandra_driver-3.25.0-py3.9-linux-x=
86_64.egg<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; | Processing dependencies for cassandra-driver=3D=3D3.25.=
0<br>
&gt;&gt;&gt;&gt; | Searching for geomet&lt;0.3,&gt;=3D0.1<br>
&gt;&gt;&gt;&gt; | Reading <a href=3D"https://pypi.org/simple/geomet/" rel=
=
=3D"noreferrer" target=3D"_blank">https://pypi.org/simple/geomet/</a><br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"https://pypi.org/simple/geomet/" rel=3D"no=
referrer" target=3D"_blank">https://pypi.org/simple/geomet/</a>&gt;<br>
&gt;&gt;&gt;&gt; | Download error on <a href=3D"https://pypi.org/simple/ge=
omet/" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/simple/geomet/=
</a><br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"https://pypi.org/simple/geomet/" rel=3D"no=
referrer" target=3D"_blank">https://pypi.org/simple/geomet/</a>&gt;: [SSL: =
CERTIFICATE_VERIFY_FAILED]<br>
&gt;&gt;&gt;&gt; certificate verify failed: unable to get local issuer cer=
tificate<br>
&gt;&gt;&gt;&gt; (_ssl.c:1129) -- Some packages may not be found!<br>
&gt;&gt;&gt;&gt; | Couldn&#39;t find index page for &#39;geomet&#39; (mayb=
e misspelled?)<br>
&gt;&gt;&gt;&gt; | Scanning index of all packages (this may take a while)<=
br>
&gt;&gt;&gt;&gt; | Reading <a href=3D"https://pypi.org/simple/" rel=3D"nor=
eferrer" target=3D"_blank">https://pypi.org/simple/</a> &lt;<a href=3D"http=
s://pypi.org/simple/" rel=3D"noreferrer" target=3D"_blank">https://pypi.org=
/simple/</a>&gt;<br>
&gt;&gt;&gt;&gt; | Download error on <a href=3D"https://pypi.org/simple/" =
rel=3D"noreferrer" target=3D"_blank">https://pypi.org/simple/</a><br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"https://pypi.org/simple/" rel=3D"noreferre=
r" target=3D"_blank">https://pypi.org/simple/</a>&gt;: [SSL: CERTIFICATE_VE=
RIFY_FAILED]<br>
&gt;&gt;&gt;&gt; certificate verify failed: unable to get local issuer cer=
tificate<br>
&gt;&gt;&gt;&gt; (_ssl.c:1129) -- Some packages may not be found!<br>
&gt;&gt;&gt;&gt; | No local packages or working download links found for g=
eomet&lt;0.3,&gt;=3D0.1<br>
&gt;&gt; But that not directly an issue of the setuptools upgrade, but a n=
ot well<br>
&gt;&gt; written recipe here.<br>
&gt;&gt; I&#39;m more than lucky that this update revealed the issue, beca=
use<br>
&gt;&gt; otherwise no one would have really noticed that the original reci=
pe of<br>
&gt;&gt; cassandra-driver is pulling sources while installing.<br>
&gt;&gt; So just in case I would rather pull in this upgrade than to mind =
the<br>
&gt;&gt; broken recipe from meta-python here (just my 2c)<br>
&gt;&gt;<br>
&gt; i am fine with whatever the right fix is. Its normal that some base<b=
r>
&gt; infra component dependency<br>
&gt; drives a change in another recipe if thats inline with expected desig=
n<br>
&gt; then change the component<br>
&gt; to work with new update.<br>
<br>
I&#39;ve sent a patch to the openembedded-devel mailing list that removes =
<br>
the --no-libev flags and adds python3-geomet (which I also sent a patch <b=
r>
to add to the layer) to the RDEPENDS, allowing python3-cassandra-driver <b=
r>
to build/import OK in an image without trying to pull stuff during <br>
do_install.<br>
<br>
- Trevor<br>
<br>
&gt;<br>
&gt;&gt;&gt;&gt; | error: Could not find suitable distribution for<br>
&gt;&gt;&gt;&gt; Requirement.parse(&#39;geomet&lt;0.3,&gt;=3D0.1&#39;)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; yes its reproduced on AB as well.<br>
&gt;&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/bui=
lders/88/builds/1397" rel=3D"noreferrer" target=3D"_blank">https://autobuil=
der.yoctoproject.org/typhoon/#/builders/88/builds/1397</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt;<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000005d80aa05c73db5d3--
