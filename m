Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=VA3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RMS5u-0000cV-He
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 23:18:38 +0100
Received: from mail103-va3-R.bigfish.com (10.7.14.248) by
	VA3EHSOBE003.bigfish.com (10.7.40.23) with Microsoft SMTP Server id
	14.1.225.22; Fri, 4 Nov 2011 22:12:10 +0000
Received: from mail103-va3 (localhost [127.0.0.1])	by
	mail103-va3-R.bigfish.com (Postfix) with ESMTP id C044B1C03BD	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2011 22:12:25 +0000 (UTC)
X-SpamScore: -20
X-BigFish: VS-20(zz9371K936eK1447Mc85dh1432N98dKzz1202hzz8275ch8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail103-va3 (localhost.localdomain [127.0.0.1]) by mail103-va3
	(MessageSwitch) id 1320444745444831_22700;
	Fri,  4 Nov 2011 22:12:25 +0000 (UTC)
Received: from VA3EHSMHS024.bigfish.com (unknown [10.7.14.250])	by
	mail103-va3.bigfish.com (Postfix) with ESMTP id 5CE3060045	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2011 22:12:25 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS024.bigfish.com
	(10.7.99.34) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 4 Nov 2011 22:12:06 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Fri, 4 Nov 2011 17:12:23 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] Introduce new SERIAL_CONSOLES to add
	multiple consoles for your MACHINE
Thread-Index: AQHMmz7TPJBRAfc7u0CKvdayD74mnA==
Date: Fri, 4 Nov 2011 22:12:23 +0000
Message-ID: <CAEsOVNc=qmagmW0gQbxa0Jo-XTt7wXihX9jeG9LBaTTLLGEjXQ@mail.gmail.com>
References: <1320441301.3137.1.camel@lenovo.internal.reciva.com>
	<1320441941-30850-1-git-send-email-msm@freescale.com>
	<1320442499.3296.4.camel@lenovo.internal.reciva.com>
In-Reply-To: <1320442499.3296.4.camel@lenovo.internal.reciva.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2] Introduce new SERIAL_CONSOLES to add multiple consoles for your MACHINE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 04 Nov 2011 22:18:38 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CAEsOVNcqmagmW0gQbxa0JoXTt7wXihX9jeG9LBaTTLLGEjXQmailgm_"

--_000_CAEsOVNcqmagmW0gQbxa0JoXTt7wXihX9jeG9LBaTTLLGEjXQmailgm_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Nov 4, 2011 4:35 PM, "Phil Blundell" <philb@gnu.org<mailto:philb@gnu.org=
>> wrote:
>
> On Fri, 2011-11-04 at 16:25 -0500, Matthew McClintock wrote:
> > v2: handle case where SERIAL_CONSOLES is not defined
> >
> >  .../sysvinit/sysvinit-inittab_2.88dsf.bb<http://sysvinit-inittab_2.88d=
sf.bb>           |   12 ++++++++++++
> >  1 files changed, 12 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb<htt=
p://sysvinit-inittab_2.88dsf.bb> b/meta/recipes-core/sysvinit/sysvinit-init=
tab_2.88dsf.bb<http://sysvinit-inittab_2.88dsf.bb>
> > index ba60c74..adab262 100644
> > --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb<http://sys=
vinit-inittab_2.88dsf.bb>
> > +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb<http://sys=
vinit-inittab_2.88dsf.bb>
> > @@ -25,6 +25,18 @@ do_install() {
> >      if [ ! -z "${SERIAL_CONSOLE}" ]; then
> >          echo "S:2345:respawn:${base_sbindir}/getty ${SERIAL_CONSOLE}" =
>> ${D}${sysconfdir}/inittab
> >      fi
> > +
> > +    idx=3D0
> > +    tmp=3D"${SERIAL_CONSOLES}"
> > +    if [ "x" !=3D "x$tmp" ]; then
> > +     for i in $tmp
> > +     do
> > +         j=3D`echo ${i} | sed s/\;/\ /g`
> > +         echo "${idx}:2345:respawn:${base_sbindir}/getty ${j}" >> ${D}=
${sysconfdir}/inittab
> > +         idx=3D`expr $idx + 1`
> > +     done
> > +    fi
> > +
>
> Did you test that this actually solves the problem?  It looks to me as
> though it will still do the wrong thing if the variable is not defined
> at all (as opposed to being defined to the empty string).  The added
> "if" statement doesn't actually achieve much since, if $tmp is the empty
> string, the for-loop wouldn't have executed anyway and there is no need
> for an extra guard.
>
> Also, for what it's worth, the "x$tmp" idiom is unnecessary if you're
> going to quote the strings.
>
> p.
>
>

Thanks for the feedback. Ill look at this again when I'm fresh.

-M

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.o=
penembedded.org>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--_000_CAEsOVNcqmagmW0gQbxa0JoXTt7wXihX9jeG9LBaTTLLGEjXQmailgm_
Content-Type: text/html; charset="iso-8859-1"
Content-ID: <C45DFA0E5045AD42B2B0018A7AF8DC7F@freescale.net>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<p>On Nov 4, 2011 4:35 PM, &quot;Phil Blundell&quot; &lt;<a href=3D"mailto:=
philb@gnu.org">philb@gnu.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, 2011-11-04 at 16:25 -0500, Matthew McClintock wrote:<br>
&gt; &gt; v2: handle case where SERIAL_CONSOLES is not defined<br>
&gt; &gt;<br>
&gt; &gt; &nbsp;.../sysvinit/<a href=3D"http://sysvinit-inittab_2.88dsf.bb"=
>sysvinit-inittab_2.88dsf.bb</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp=
; 12 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt; &gt; &nbsp;1 files changed, 12 insertions(&#43;), 0 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/sysvinit/<a href=3D"http://sysvini=
t-inittab_2.88dsf.bb">sysvinit-inittab_2.88dsf.bb</a> b/meta/recipes-core/s=
ysvinit/<a href=3D"http://sysvinit-inittab_2.88dsf.bb">sysvinit-inittab_2.8=
8dsf.bb</a><br>
&gt; &gt; index ba60c74..adab262 100644<br>
&gt; &gt; --- a/meta/recipes-core/sysvinit/<a href=3D"http://sysvinit-initt=
ab_2.88dsf.bb">sysvinit-inittab_2.88dsf.bb</a><br>
&gt; &gt; &#43;&#43;&#43; b/meta/recipes-core/sysvinit/<a href=3D"http://sy=
svinit-inittab_2.88dsf.bb">sysvinit-inittab_2.88dsf.bb</a><br>
&gt; &gt; @@ -25,6 &#43;25,18 @@ do_install() {<br>
&gt; &gt; &nbsp; &nbsp; &nbsp;if [ ! -z &quot;${SERIAL_CONSOLE}&quot; ]; th=
en<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;echo &quot;S:2345:respawn:${bas=
e_sbindir}/getty ${SERIAL_CONSOLE}&quot; &gt;&gt; ${D}${sysconfdir}/inittab=
<br>
&gt; &gt; &nbsp; &nbsp; &nbsp;fi<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43; &nbsp; &nbsp;idx=3D0<br>
&gt; &gt; &#43; &nbsp; &nbsp;tmp=3D&quot;${SERIAL_CONSOLES}&quot;<br>
&gt; &gt; &#43; &nbsp; &nbsp;if [ &quot;x&quot; !=3D &quot;x$tmp&quot; ]; t=
hen<br>
&gt; &gt; &#43; &nbsp; &nbsp; for i in $tmp<br>
&gt; &gt; &#43; &nbsp; &nbsp; do<br>
&gt; &gt; &#43; &nbsp; &nbsp; &nbsp; &nbsp; j=3D`echo ${i} | sed s/\;/\ /g`=
<br>
&gt; &gt; &#43; &nbsp; &nbsp; &nbsp; &nbsp; echo &quot;${idx}:2345:respawn:=
${base_sbindir}/getty ${j}&quot; &gt;&gt; ${D}${sysconfdir}/inittab<br>
&gt; &gt; &#43; &nbsp; &nbsp; &nbsp; &nbsp; idx=3D`expr $idx &#43; 1`<br>
&gt; &gt; &#43; &nbsp; &nbsp; done<br>
&gt; &gt; &#43; &nbsp; &nbsp;fi<br>
&gt; &gt; &#43;<br>
&gt;<br>
&gt; Did you test that this actually solves the problem? &nbsp;It looks to =
me as<br>
&gt; though it will still do the wrong thing if the variable is not defined=
<br>
&gt; at all (as opposed to being defined to the empty string). &nbsp;The ad=
ded<br>
&gt; &quot;if&quot; statement doesn't actually achieve much since, if $tmp =
is the empty<br>
&gt; string, the for-loop wouldn't have executed anyway and there is no nee=
d<br>
&gt; for an extra guard.<br>
&gt;<br>
&gt; Also, for what it's worth, the &quot;x$tmp&quot; idiom is unnecessary =
if you're<br>
&gt; going to quote the strings.<br>
&gt;<br>
&gt; p.<br>
&gt;<br>
&gt;</p>
<p>Thanks for the feedback. Ill look at this again when I'm fresh.</p>
<p>-M<br>
</p>
<p>&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><b=
r>
</p>
</body>
</html>

--_000_CAEsOVNcqmagmW0gQbxa0JoXTt7wXihX9jeG9LBaTTLLGEjXQmailgm_--
