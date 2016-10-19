Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1E97160191
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 18:52:15 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id x79so40532965lff.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 11:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pDPJioBoU2P6fTv3TBBsD1O67czehLkcdbfU3iQOwVA=;
	b=ICTzlsRxP2CPsytr99y+MG7uwV1LElDq4nZJJslYugSAj/Am7DQnoweSrxqJLK5MVz
	8xBwDsUTCuO3L5oLzZN1K+X66sz0QmoB9v2I3o3Tpv/0NlLNVqm318kiUiupXbk90npq
	u3uhtDsOdHz0uhiYz/DUJ40UPCKDCISAXo5AzDBaFg8RVvIwvnt0JwftXNj2z8TYIzJN
	eEJYFZ4545Y1P8S2TxGDZ9WAFcYH2pdWTVnJXHMIZVFd4b9GluztOLFLmmo0PSiNI+Zt
	AGfgRsbpv0GrdyyRbNIJpUGLMEmqW41KTwTQFWfliwZiybUOjoC0szb9FGltwtJnC66a
	cRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pDPJioBoU2P6fTv3TBBsD1O67czehLkcdbfU3iQOwVA=;
	b=ipa3QIqr2BZT3x7AArk2Htkeg0A7EliSqM/cp5X7o3qHwsPnVFWhpGNiLIcbUlVl+M
	ah8W7qnWNw3qdyrp2qcX7AN4pptkqhM8Hz2kiMUZGhFXsnSLJ2qG/4JPATXGow/FGJS6
	jMZfD9eRnLzoJLPiWawDa2OOPTowVFQ9fgMq/AhtlEvJtyc/YH4aZEE4JR6e1wb4Pk/p
	U1rEradYie+K0gzWVSXsc40qG3YG5sUIORXVqSkmRczuvyiTgdx2/CEBtEECZ+G15j5U
	TaNxulxeILKATfmUX5slULEtytTdKvxUAQ2XbAPxtrebPzrDgy5aQKoZfR5CHhrPqxBS
	UdPQ==
X-Gm-Message-State: AA6/9Rls/cFDX8li3OZZ2kAfBdRUaAv6lxNb+WCBQq6S2c/M12iRCKh3dExaXbm6xiLguA4UXP/zScGw2fuO7ZRQ
X-Received: by 10.25.87.135 with SMTP id l129mr6565829lfb.174.1476903136373;
	Wed, 19 Oct 2016 11:52:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.122.1 with HTTP; Wed, 19 Oct 2016 11:52:15 -0700 (PDT)
In-Reply-To: <CAD3vsf6pyv2=9khhMgvfzzw45KEZD+Ha2MUaA5c3Mw2eF5ApHw@mail.gmail.com>
References: <1476120925-26574-1-git-send-email-jkrishnanjanappa@mvista.com>
	<defce586-6033-baed-bf70-bdbe1659922c@opendreambox.org>
	<CAD3vsf5zv87RLAN70WF06Jxr1qq2=5-ctDekdA_0o1Cr1nmBhQ@mail.gmail.com>
	<7e33af3a-b88b-fc8f-32d1-3f743fea2ac3@opendreambox.org>
	<CAD3vsf6pyv2=9khhMgvfzzw45KEZD+Ha2MUaA5c3Mw2eF5ApHw@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Date: Thu, 20 Oct 2016 00:22:15 +0530
Message-ID: <CAD3vsf6qgb0_ef1CbvzXn8V0aXv+7jhHECM4JTmMD9npbVEC-g@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>,
	Christopher Larson <clarson@kergoth.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 18:52:17 -0000
Content-Type: multipart/alternative; boundary=001a11418c6acffcf8053f3c4eb5

--001a11418c6acffcf8053f3c4eb5
Content-Type: text/plain; charset=UTF-8

Hi Christopher,

Thanks for applying the required changes under below commit,

https://github.com/openembedded/openembedded-core/compare/master...kergoth:connman-systemd-nfs

Are there any plans to submit it to OE-core?

Regards,
Jagadeesh


On Thu, Oct 13, 2016 at 7:31 AM, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

>
>
> On Wed, Oct 12, 2016 at 12:30 PM, Andreas Oberritter <obi@opendreambox.org
> > wrote:
>
>> Hi Jagadeesh,
>>
>> On 11.10.2016 14:11, Jagadeesh Krishnanjanappa wrote:
>> > Hi Andreas,
>> >
>> > Thanks for reviewing the patch.
>> >
>> >
>> >     I think this is too fragile to land in OE-Core. What happens if a
>> >     network driver prints "device=eth0"? Or if other kernel messages
>> make
>> >     the string disappear from dmesg and connman gets restarted later?
>> >
>> >
>> > True. If device=eth0 gets disappeared/corrupted, then we may have
>> problem.
>> >
>> >
>> >     FWIW, I'm attaching my current wrapper script for connmand. I don't
>> >     think it's perfect, but at least it doesn't depend on any init
>> manager
>> >     and works across restarts.
>> >
>> > The wrapper script attached by you, takes care of the missing scenarios.
>> > Seems to be more complete.
>> >
>> >
>> >
>> >     Add these lines to connman's do_install, in case you'd like to test
>> >     and/or submit it:
>> >
>> >     mv ${D}${sbindir}/connmand ${D}${sbindir}/connmand.real
>> >     install -m 755 ${WORKDIR}/connmand-nfsroot.in
>> >     <http://connmand-nfsroot.in> ${D}${sbindir}/connmand
>> >     sed -e 's,@sbindir@,${sbindir},g' -i ${D}${sbindir}/connmand
>> >
>> > I think it would be good idea to integrate your changes into the already
>> > existing OE-core's connman script, instead of a calling original connman
>> > script from the wrapper script.
>>
>> please keep in mind that you'd need to implement the same logic for
>> systemd.
>>
>> Considering that the execution of connman on nfsroots without
>> appropriate parameters immediately hangs the system, a wrapper script
>> offers an additional level of protection compared to an init script or
>> systemd unit, especially for people debugging connman.
>>
>> The intention of integrating your changes into init script was to avoid
> an extra file being added to the layer. But yes, to help debugging and to
> support systemd; wrapper script can be helpful.
>
> Thanks,
> Jagadeesh
>
> Regards,
>> Andreas
>>
>> >
>> > Regards,
>> > Jagadeesh
>> >
>> >     >
>> >     > Signed-off-by: Jagadeesh Krishnanjanappa
>> >     <jkrishnanjanappa@mvista.com <mailto:jkrishnanjanappa@mvista.com>>
>> >     > ---
>> >     >  meta/recipes-connectivity/connman/connman/connman | 35
>> >     +++++++++++++----------
>> >     >  1 file changed, 20 insertions(+), 15 deletions(-)
>> >     >
>> >     > diff --git a/meta/recipes-connectivity/connman/connman/connman
>> >     b/meta/recipes-connectivity/connman/connman/connman
>> >     > index c64fa0d..aae2ca6 100644
>> >     > --- a/meta/recipes-connectivity/connman/connman/connman
>> >     > +++ b/meta/recipes-connectivity/connman/connman/connman
>> >     > @@ -29,23 +29,28 @@ done
>> >     >  do_start() {
>> >     >       EXTRA_PARAM=""
>> >     >       if test $nfsroot -eq 1 ; then
>> >     > -         NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9
>> >     ]*\):.*$/\1/p'`
>> >     > -         NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^
>> >     :]*\).*$/\1/p'`
>> >     > +         ethn_from_dmesg=`dmesg | grep "device="| sed
>> >     "s|\(.*\)device=\(.*\), hwaddr=\(.*\)|\2|g"`
>> >     > +         if [ ! -z "$ethn_from_dmesg" ]; then
>> >     > +             EXTRA_PARAM="-I $ethn_from_dmesg"
>> >     > +         else
>> >     > +             NET_DEVS=`cat /proc/net/dev | sed -ne
>> >     's/^\([a-zA-Z0-9 ]*\):.*$/\1/p'`
>> >     > +             NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^
>> >     :]*\).*$/\1/p'`
>> >     >
>> >     > -         if [ ! -z "$NET_ADDR" ]; then
>> >     > -             if [ "$NET_ADDR" = dhcp ]; then
>> >     > -                 ethn=`ifconfig | grep "^eth" | sed -e
>> >     "s/\(eth[0-9]\)\(.*\)/\1/"`
>> >     > -                 if [ ! -z "$ethn" ]; then
>> >     > -                     EXTRA_PARAM="-I $ethn"
>> >     > -                 fi
>> >     > -             else
>> >     > -                 for i in $NET_DEVS; do
>> >     > -                     ADDR=`ifconfig $i | sed 's/addr://g' | sed
>> >     -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
>> >     > -                     if [ "$NET_ADDR" = "$ADDR" ]; then
>> >     > -                         EXTRA_PARAM="-I $i"
>> >     > -                         break
>> >     > +             if [ ! -z "$NET_ADDR" ]; then
>> >     > +                 if [ "$NET_ADDR" = dhcp ]; then
>> >     > +                     ethn=`ifconfig | grep "^eth" | sed -e
>> >     "s/\(eth[0-9]\)\(.*\)/\1/"`
>> >     > +                     if [ ! -z "$ethn" ]; then
>> >     > +                         EXTRA_PARAM="-I $ethn"
>> >     >                       fi
>> >     > -                 done
>> >     > +                 else
>> >     > +                     for i in $NET_DEVS; do
>> >     > +                         ADDR=`ifconfig $i | sed 's/addr://g' |
>> >     sed -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
>> >     > +                         if [ "$NET_ADDR" = "$ADDR" ]; then
>> >     > +                             EXTRA_PARAM="-I $i"
>> >     > +                             break
>> >     > +                         fi
>> >     > +                     done
>> >     > +                 fi
>> >     >               fi
>> >     >           fi
>> >     >       fi
>> >     >
>> >
>> >
>> >     --
>> >     _______________________________________________
>> >     Openembedded-core mailing list
>> >     Openembedded-core@lists.openembedded.org
>> >     <mailto:Openembedded-core@lists.openembedded.org>
>> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>> >
>> >
>>
>>
>

--001a11418c6acffcf8053f3c4eb5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0<span style=3D"color:rgb(80,0,80);font-size:12.800=
0001907349px">Christopher,</span><div><span style=3D"color:rgb(80,0,80);fon=
t-size:12.8000001907349px"><br></span></div><div><span style=3D"color:rgb(8=
0,0,80);font-size:12.8000001907349px">Thanks for applying the required chan=
ges under below commit,</span></div><div><span style=3D"color:rgb(80,0,80);=
font-size:12.8000001907349px"><br></span></div><div><font color=3D"#500050"=
><span style=3D"font-size:12.8000001907349px"><a href=3D"https://github.com=
/openembedded/openembedded-core/compare/master...kergoth:connman-systemd-nf=
s">https://github.com/openembedded/openembedded-core/compare/master...kergo=
th:connman-systemd-nfs</a></span></font><br></div><div><font color=3D"#5000=
50"><span style=3D"font-size:12.8000001907349px"><br></span></font></div><d=
iv><span style=3D"color:rgb(80,0,80);font-size:12.8000001907349px">Are ther=
e any plans to submit it to OE-core?</span></div><div><span style=3D"color:=
rgb(80,0,80);font-size:12.8000001907349px"><br></span></div><div><span styl=
e=3D"color:rgb(80,0,80);font-size:12.8000001907349px">Regards,</span></div>=
<div><span style=3D"color:rgb(80,0,80);font-size:12.8000001907349px">Jagade=
esh</span></div><div><span style=3D"color:rgb(80,0,80);font-size:12.8000001=
907349px"><br></span></div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Thu, Oct 13, 2016 at 7:31 AM, Jagadeesh Krishnanjanappa=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" targe=
t=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote"><div><div class=3D"h5">On Wed, Oct 12, 2016 at 12=
:30 PM, Andreas Oberritter <span dir=3D"ltr">&lt;<a href=3D"mailto:obi@open=
dreambox.org" target=3D"_blank">obi@opendreambox.org</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Hi Jagadeesh,<br>
<span><br>
On 11.10.2016 14:11, Jagadeesh Krishnanjanappa wrote:<br>
&gt; Hi Andreas,<br>
&gt;<br>
&gt; Thanks for reviewing the patch.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I think this is too fragile to land in OE-Core. Wha=
t happens if a<br>
&gt;=C2=A0 =C2=A0 =C2=A0network driver prints &quot;device=3Deth0&quot;? Or=
 if other kernel messages make<br>
&gt;=C2=A0 =C2=A0 =C2=A0the string disappear from dmesg and connman gets re=
started later?<br>
&gt;<br>
&gt;<br>
&gt; True. If device=3Deth0 gets disappeared/corrupted, then we may have pr=
oblem.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0FWIW, I&#39;m attaching my current wrapper script f=
or connmand. I don&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0think it&#39;s perfect, but at least it doesn&#39;t=
 depend on any init manager<br>
&gt;=C2=A0 =C2=A0 =C2=A0and works across restarts.<br>
&gt;<br>
&gt; The wrapper script attached by you, takes care of the missing scenario=
s.<br>
&gt; Seems to be more complete.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Add these lines to connman&#39;s do_install, in cas=
e you&#39;d like to test<br>
&gt;=C2=A0 =C2=A0 =C2=A0and/or submit it:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0mv ${D}${sbindir}/connmand ${D}${sbindir}/connmand.=
real<br>
&gt;=C2=A0 =C2=A0 =C2=A0install -m 755 ${WORKDIR}/<a href=3D"http://connman=
d-nfsroot.in" rel=3D"noreferrer" target=3D"_blank">connmand-nfsroot.in</a><=
br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://connmand-nfsroot.in" r=
el=3D"noreferrer" target=3D"_blank">http://connmand-nfsroot.in</a>&gt; ${D}=
${sbindir}/connmand<br>
<span>&gt;=C2=A0 =C2=A0 =C2=A0sed -e &#39;s,@sbindir@,${sbindir},g&#39; -i =
${D}${sbindir}/connmand<br>
&gt;<br>
&gt; I think it would be good idea to integrate your changes into the alrea=
dy<br>
&gt; existing OE-core&#39;s connman script, instead of a calling original c=
onnman<br>
&gt; script from the wrapper script.<br>
<br>
</span>please keep in mind that you&#39;d need to implement the same logic =
for systemd.<br>
<br>
Considering that the execution of connman on nfsroots without<br>
appropriate parameters immediately hangs the system, a wrapper script<br>
offers an additional level of protection compared to an init script or<br>
systemd unit, especially for people debugging connman.<br>
<br></blockquote></div></div><div>The intention of integrating your changes=
 into init script was to avoid an extra file being added to the layer. But =
yes, to help debugging and to support systemd; wrapper script can be helpfu=
l.</div><div><br></div><div>Thanks,</div><div>Jagadeesh</div><div><div clas=
s=3D"h5"><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Regards,<br>
Andreas<br>
<span><br>
&gt;<br>
&gt; Regards,<br>
&gt; Jagadeesh<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Jagadeesh Krishnanjanappa<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:jkrishnanjanappa@mvist=
a.com" target=3D"_blank">jkrishnanjanappa@mvista.com</a> &lt;mailto:<a href=
=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrishnanjanappa@=
mvist<wbr>a.com</a>&gt;&gt;<br>
<div><div class=3D"m_-8541421065902995186h5">&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=
--<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 meta/recipes-connectivity/conn<wbr>man/c=
onnman/connman | 35<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++----------<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 1 file changed, 20 insertions(+), 15 del=
etions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/meta/recipes-connectivity/co<wbr>=
nnman/connman/connman<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-connectivity/c<wbr>onnman/connman/co=
nnman<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index c64fa0d..aae2ca6 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/meta/recipes-connectivity/co<wbr>nnman/c=
onnman/connman<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/meta/recipes-connectivity/co<wbr>nnman/c=
onnman/connman<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -29,23 +29,28 @@ done<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 do_start() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0EXTRA_PARAM=3D&quot;=
&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if test $nfsroot -eq=
 1 ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NET_DEVS=3D=
`cat /proc/net/dev | sed -ne &#39;s/^\([a-zA-Z0-9<br>
&gt;=C2=A0 =C2=A0 =C2=A0]*\):.*$/\1/p&#39;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NET_ADDR=3D=
`cat /proc/cmdline | sed -ne &#39;s/^.*ip=3D\([^<br>
&gt;=C2=A0 =C2=A0 =C2=A0:]*\).*$/\1/p&#39;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ethn_from_d=
mesg=3D`dmesg | grep &quot;device=3D&quot;| sed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;s|\(.*\)device=3D\(.*\), hwaddr=3D\(.*\)|\2|g=
&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -z &=
quot;$ethn_from_dmesg&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0EXTRA_PARAM=3D&quot;-I $ethn_from_dmesg&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0NET_DEVS=3D`cat /proc/net/dev | sed -ne<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;s/^\([a-zA-Z0-9 ]*\):.*$/\1/p&#39;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0NET_ADDR=3D`cat /proc/cmdline | sed -ne &#39;s/^.*ip=3D\([^<br>
&gt;=C2=A0 =C2=A0 =C2=A0:]*\).*$/\1/p&#39;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -z &=
quot;$NET_ADDR&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if [ &quot;$NET_ADDR&quot; =3D dhcp ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ethn=3D`ifconfig | grep &quot;^eth&quot; | sed -e<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;s/\(eth[0-9]\)\(.*\)/\1/&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if [ ! -z &quot;$ethn&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXTRA_PARAM=3D&quot;-I $ethn&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0for i in $NET_DEVS; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ADDR=3D`ifconfig $i | sed &#39;s/addr://g&#3=
9; | sed<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ne &#39;s/^.*inet \([0-9.]*\) .*$/\1/p&#39;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$NET_ADDR&quot; =3D &quot;$ADDR&q=
uot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXTRA_PARAM=3D&quot;-I $i&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if [ ! -z &quot;$NET_ADDR&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if [ &quot;$NET_ADDR&quot; =3D dhcp ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ethn=3D`ifconfig | grep &quot;^eth&quot; | s=
ed -e<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;s/\(eth[0-9]\)\(.*\)/\1/&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -z &quot;$ethn&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXTRA_PARAM=3D&quot;-I $ethn&q=
uot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in $NET_DEVS; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ADDR=3D`ifconfig $i | sed &#39=
;s/addr://g&#39; |<br>
&gt;=C2=A0 =C2=A0 =C2=A0sed -ne &#39;s/^.*inet \([0-9.]*\) .*$/\1/p&#39;`<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$NET_ADDR&quot; =3D=
 &quot;$ADDR&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXTRA_PARAM=3D&q=
uot;-I $i&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0_____________________________<wbr>_________________=
_<br>
&gt;=C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openembedded-core@lists.openembed=
ded.org" target=3D"_blank">Openembedded-core@lists.opene<wbr>mbedded.org</a=
><br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembedd=
ed-core@lists.openembedded.org" target=3D"_blank">Openembedded-core@lis<wbr=
>ts.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org/mailman/li=
stinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists=
.openembedded.<wbr>org/mailman/listinfo/<wbr>openembedded-core</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://l=
ists.openembedded.or<wbr>g/mailman/listinfo/openembedde<wbr>d-core</a>&gt;<=
br>
&gt;<br>
&gt;<br>
<br>
</blockquote></div></div></div><br></div></div>
</blockquote></div><br></div>

--001a11418c6acffcf8053f3c4eb5--
