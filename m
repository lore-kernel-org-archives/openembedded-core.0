Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id D559660190
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 12:11:42 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id b81so37845953lfe.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 05:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9DAF3dQO/o8Rw33AaYGHTkAQ/ew7i3W6J0QgPrZR9zs=;
	b=iilNgLEWOIsEo2LDKUZE4JpHiE4zSZSmEn4q5h7++iXTxoKg6clcHOIUJpRZPs9bNG
	UMpMdwRiLS3lFkd5C6NWfi/6lVJeHdLRVO3Ev60fqspXR79YABMMpPjywn1MhY7y3aFD
	ZtJ9NnjXgnMDKeXUhIBjsllDx86xVmVZpQZFlCL9BPoF+CbeKr3KCXKia2CW6wHV3Wc1
	GphzTnGBCNs3lEVhaqiWR9lI8I+bXWoUNnDUVxcAubHUGTyBA6d8orXRII0FGIBQk0ja
	FJy2vBFOnmfzNCxLNe42kCgtprU4lNy1xFU9lu0acZXSyz1vTElretb9pbEn3DjO2scc
	gNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9DAF3dQO/o8Rw33AaYGHTkAQ/ew7i3W6J0QgPrZR9zs=;
	b=Bhxvfii1ZscDwtvwlyIxT6NhXXHhc+W7Eq6hrrTXXEpyWIIOZEoyF8/CmrCFkUvpdC
	a7IC/+HJNyke7vZkHMGMVI3RlMnWjGS3Pdroj3RDi+caKSwe30QkinLC5HVLOrOCmyQZ
	IcSb2ItVduS2EYR8/hAwz+/uS0vyzNqNJNwg7wnYSWvZseKjPhb0Y3eCXlh4J+koQrIc
	ahZSTVWkYQmIRnlbTcO1ePaQD7H5x3rCc833QHLopFr5mDjkAzl1bPHuIBANtMrpQQFZ
	FPfXQ0hlkED3HhTDGMbs3sIiU1EZ3Y8dVLlTBJdNLTaALn8zccetVR67TA11WWThMbV8
	ItTQ==
X-Gm-Message-State: AA6/9RnuHgispjEoNlLE4ngNljEJ3fIkQvF2j34rxZgFo1RJ/f8svDmX2y3/vELJBV5a03SrzTr94MIaunrJ79qO
X-Received: by 10.25.40.211 with SMTP id o202mr2294195lfo.174.1476187902575;
	Tue, 11 Oct 2016 05:11:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.77.42 with HTTP; Tue, 11 Oct 2016 05:11:41 -0700 (PDT)
In-Reply-To: <defce586-6033-baed-bf70-bdbe1659922c@opendreambox.org>
References: <1476120925-26574-1-git-send-email-jkrishnanjanappa@mvista.com>
	<defce586-6033-baed-bf70-bdbe1659922c@opendreambox.org>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Date: Tue, 11 Oct 2016 17:41:41 +0530
Message-ID: <CAD3vsf5zv87RLAN70WF06Jxr1qq2=5-ctDekdA_0o1Cr1nmBhQ@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: get the correct network interface name from dmesg during NFS booting
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
X-List-Received-Date: Tue, 11 Oct 2016 12:11:43 -0000
Content-Type: multipart/alternative; boundary=001a1146c3548e20a2053e95c7af

--001a1146c3548e20a2053e95c7af
Content-Type: text/plain; charset=UTF-8

Hi Andreas,

Thanks for reviewing the patch.


> I think this is too fragile to land in OE-Core. What happens if a
> network driver prints "device=eth0"? Or if other kernel messages make
> the string disappear from dmesg and connman gets restarted later?
>

True. If device=eth0 gets disappeared/corrupted, then we may have problem.

>
> FWIW, I'm attaching my current wrapper script for connmand. I don't
> think it's perfect, but at least it doesn't depend on any init manager
> and works across restarts.

The wrapper script attached by you, takes care of the missing scenarios.
Seems to be more complete.

>
>
Add these lines to connman's do_install, in case you'd like to test
> and/or submit it:
>
> mv ${D}${sbindir}/connmand ${D}${sbindir}/connmand.real
> install -m 755 ${WORKDIR}/connmand-nfsroot.in ${D}${sbindir}/connmand
> sed -e 's,@sbindir@,${sbindir},g' -i ${D}${sbindir}/connmand
>
I think it would be good idea to integrate your changes into the already
existing OE-core's connman script, instead of a calling original connman
script from the wrapper script.

Regards,
Jagadeesh

>
> > Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > ---
> >  meta/recipes-connectivity/connman/connman/connman | 35
> +++++++++++++----------
> >  1 file changed, 20 insertions(+), 15 deletions(-)
> >
> > diff --git a/meta/recipes-connectivity/connman/connman/connman
> b/meta/recipes-connectivity/connman/connman/connman
> > index c64fa0d..aae2ca6 100644
> > --- a/meta/recipes-connectivity/connman/connman/connman
> > +++ b/meta/recipes-connectivity/connman/connman/connman
> > @@ -29,23 +29,28 @@ done
> >  do_start() {
> >       EXTRA_PARAM=""
> >       if test $nfsroot -eq 1 ; then
> > -         NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9
> ]*\):.*$/\1/p'`
> > -         NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^
> :]*\).*$/\1/p'`
> > +         ethn_from_dmesg=`dmesg | grep "device="| sed
> "s|\(.*\)device=\(.*\), hwaddr=\(.*\)|\2|g"`
> > +         if [ ! -z "$ethn_from_dmesg" ]; then
> > +             EXTRA_PARAM="-I $ethn_from_dmesg"
> > +         else
> > +             NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9
> ]*\):.*$/\1/p'`
> > +             NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^
> :]*\).*$/\1/p'`
> >
> > -         if [ ! -z "$NET_ADDR" ]; then
> > -             if [ "$NET_ADDR" = dhcp ]; then
> > -                 ethn=`ifconfig | grep "^eth" | sed -e
> "s/\(eth[0-9]\)\(.*\)/\1/"`
> > -                 if [ ! -z "$ethn" ]; then
> > -                     EXTRA_PARAM="-I $ethn"
> > -                 fi
> > -             else
> > -                 for i in $NET_DEVS; do
> > -                     ADDR=`ifconfig $i | sed 's/addr://g' | sed -ne
> 's/^.*inet \([0-9.]*\) .*$/\1/p'`
> > -                     if [ "$NET_ADDR" = "$ADDR" ]; then
> > -                         EXTRA_PARAM="-I $i"
> > -                         break
> > +             if [ ! -z "$NET_ADDR" ]; then
> > +                 if [ "$NET_ADDR" = dhcp ]; then
> > +                     ethn=`ifconfig | grep "^eth" | sed -e
> "s/\(eth[0-9]\)\(.*\)/\1/"`
> > +                     if [ ! -z "$ethn" ]; then
> > +                         EXTRA_PARAM="-I $ethn"
> >                       fi
> > -                 done
> > +                 else
> > +                     for i in $NET_DEVS; do
> > +                         ADDR=`ifconfig $i | sed 's/addr://g' | sed -ne
> 's/^.*inet \([0-9.]*\) .*$/\1/p'`
> > +                         if [ "$NET_ADDR" = "$ADDR" ]; then
> > +                             EXTRA_PARAM="-I $i"
> > +                             break
> > +                         fi
> > +                     done
> > +                 fi
> >               fi
> >           fi
> >       fi
> >
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a1146c3548e20a2053e95c7af
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Andreas,<div><br></div><div>Thanks for reviewing t=
he patch.<br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;paddi=
ng-left:1ex"><span class=3D"gmail-"><br>
</span>I think this is too fragile to land in OE-Core. What happens if a<br=
>
network driver prints &quot;device=3Deth0&quot;? Or if other kernel message=
s make<br>
the string disappear from dmesg and connman gets restarted later?<br></bloc=
kquote><div>=C2=A0</div><div>True. If device=3Deth0 gets disappeared/corrup=
ted, then we may have problem.</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex">
<br>
FWIW, I&#39;m attaching my current wrapper script for connmand. I don&#39;t=
<br>
think it&#39;s perfect, but at least it doesn&#39;t depend on any init mana=
ger<br>
and works across restarts.</blockquote><div>The wrapper script attached by =
you, takes care of the missing scenarios. Seems to be more complete.</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;pa=
dding-left:1ex">=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb=
(204,204,204);border-left-style:solid;padding-left:1ex">
Add these lines to connman&#39;s do_install, in case you&#39;d like to test=
<br>
and/or submit it:<br>
<br>
mv ${D}${sbindir}/connmand ${D}${sbindir}/connmand.real<br>
install -m 755 ${WORKDIR}/<a href=3D"http://connmand-nfsroot.in" rel=3D"nor=
eferrer" target=3D"_blank">connmand-nfsroot.in</a> ${D}${sbindir}/connmand<=
br>
sed -e &#39;s,@sbindir@,${sbindir},g&#39; -i ${D}${sbindir}/connmand<br></b=
lockquote><div>I think it would be good idea to integrate your changes into=
 the already existing OE-core&#39;s connman script, instead of a calling or=
iginal connman script from the wrapper script.</div><div><br></div><div>Reg=
ards,</div><div>Jagadeesh</div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-co=
lor:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div class=
=3D"gmail-HOEnZb"><div class=3D"gmail-h5">&gt;<br>
&gt; Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishn=
anjanappa@mvista.com">jkrishnanjanappa@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-connectivity/<wbr>connman/connman/connman | 35 ++++=
+++++++++----------<br>
&gt;=C2=A0 1 file changed, 20 insertions(+), 15 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/<wbr>connman/connman/connman b/=
meta/recipes-connectivity/<wbr>connman/connman/connman<br>
&gt; index c64fa0d..aae2ca6 100644<br>
&gt; --- a/meta/recipes-connectivity/<wbr>connman/connman/connman<br>
&gt; +++ b/meta/recipes-connectivity/<wbr>connman/connman/connman<br>
&gt; @@ -29,23 +29,28 @@ done<br>
&gt;=C2=A0 do_start() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0EXTRA_PARAM=3D&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if test $nfsroot -eq 1 ; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NET_DEVS=3D`cat /proc/net/dev | sed=
 -ne &#39;s/^\([a-zA-Z0-9 ]*\):.*$/\1/p&#39;`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NET_ADDR=3D`cat /proc/cmdline | sed=
 -ne &#39;s/^.*ip=3D\([^ :]*\).*$/\1/p&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ethn_from_dmesg=3D`dmesg | grep &qu=
ot;device=3D&quot;| sed &quot;s|\(.*\)device=3D\(.*\), hwaddr=3D\(.*\)|\2|g=
&quot;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -z &quot;$ethn_from_dmesg&qu=
ot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXTRA_PARAM=3D&quot;-=
I $ethn_from_dmesg&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NET_DEVS=3D`cat /proc=
/net/dev | sed -ne &#39;s/^\([a-zA-Z0-9 ]*\):.*$/\1/p&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NET_ADDR=3D`cat /proc=
/cmdline | sed -ne &#39;s/^.*ip=3D\([^ :]*\).*$/\1/p&#39;`<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -z &quot;$NET_ADDR&quot; ]; =
then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$NET_ADDR&=
quot; =3D dhcp ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ethn=3D=
`ifconfig | grep &quot;^eth&quot; | sed -e &quot;s/\(eth[0-9]\)\(.*\)/\1/&q=
uot;`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! =
-z &quot;$ethn&quot; ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0EXTRA_PARAM=3D&quot;-I $ethn&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i i=
n $NET_DEVS; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ADDR=3D`ifconfig $i | sed &#39;s/addr://g&#39; | sed -ne &#39;s/^.*i=
net \([0-9.]*\) .*$/\1/p&#39;`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if [ &quot;$NET_ADDR&quot; =3D &quot;$ADDR&quot; ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0EXTRA_PARAM=3D&quot;-I $i&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -z &quot;$NET_=
ADDR&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &q=
uot;$NET_ADDR&quot; =3D dhcp ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ethn=3D`ifconfig | grep &quot;^eth&quot; | sed -e &quot;s/\(eth[0-9]=
\)\(.*\)/\1/&quot;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if [ ! -z &quot;$ethn&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0EXTRA_PARAM=3D&quot;-I $ethn&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0for i in $NET_DEVS; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ADDR=3D`ifconfig $i | sed &#39;s/addr://g&#39; | sed -=
ne &#39;s/^.*inet \([0-9.]*\) .*$/\1/p&#39;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0if [ &quot;$NET_ADDR&quot; =3D &quot;$ADDR&quot; ]; th=
en<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXTRA_PARAM=3D&quot;-I $i&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;<br>
<br>
</div></div><br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div></div></div>

--001a1146c3548e20a2053e95c7af--
