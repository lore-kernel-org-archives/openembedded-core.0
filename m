Received: from mail-yw0-f51.google.com ([209.85.213.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SoitY-0001I0-CW
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 00:27:00 +0200
Received: by yhnn12 with SMTP id n12so514896yhn.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 15:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=LvvMI9nnOMBVLMwOSCDwB+cuhx2dIxUSl06L/friF/8=;
	b=La9PgFG0uyE3oIFY3FpRGFP9LUssN87rQp1cNkVLi/ifL4DhGCKzVW+r3OM2uPD2NL
	uggWEwmJ7nXa4YWHtH6C9/KXxvAtdsk1FWdtMXbwyTWUzNrtKyBdaM/9dbwtX/coWU1Z
	AzXDKytTk11cSmDRpW/0qi20ELqG4jkngMA+Zsg1PV/xvdjuyKCLHMNoYA7Fe0uxiIDQ
	siilQumG93WU4hydutswqJT91SLO0+nrNx+agF2NWMaWrzzg2wbHF4Ex0QA+nUO5NUJC
	STeFldy80R30lfSP4BJFhS8maMzR0znSW6GSbffH8/Fopso7ZjO1UnNM/mhTUcSsXUmI
	qKLg==
Received: by 10.50.195.234 with SMTP id ih10mr12930216igc.0.1341958548524;
	Tue, 10 Jul 2012 15:15:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Tue, 10 Jul 2012 15:15:28 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
In-Reply-To: <CAK18fxFDoHEpzDnVwJLdPHKL48Qo7ZuwnJsQDE78U6fbcULjKw@mail.gmail.com>
References: <9403579097d0430a5ce2cd3bb23925fe25917a0b.1341932186.git.andrei@gherzan.ro>
	<d7e0c2813e4002b9dfd8e2d681b93da9ddc5870f.1341932186.git.andrei@gherzan.ro>
	<1341936154.1294.3.camel@ted>
	<CAK18fxFDoHEpzDnVwJLdPHKL48Qo7ZuwnJsQDE78U6fbcULjKw@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 11 Jul 2012 01:15:28 +0300
Message-ID: <CAK18fxH2w_0hSQscbm6sad-a+=kk2eyQkOtJLMnsZRe8jaf8KA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmIZmUnzWwpheReXjNH7oJ9AGh91Hmymhh1Pgc4hfOL/ZKwiWVfHMgTLYQFRiZ0G1Sx9Bu3
Subject: Re: [PATCH 5/5] busybox.inc: Install hwclock init script only if rtc is present in MACHINE_FEATURES
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
X-List-Received-Date: Tue, 10 Jul 2012 22:27:00 -0000
Content-Type: multipart/alternative; boundary=14dae934125b968cd804c481128c

--14dae934125b968cd804c481128c
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 10, 2012 at 11:53 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:

> On Tue, Jul 10, 2012 at 7:02 PM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Tue, 2012-07-10 at 17:59 +0300, Andrei Gherzan wrote:
>> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>> > ---
>> >  meta/recipes-core/busybox/busybox.inc |   10 +++++++---
>> >  1 file changed, 7 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/meta/recipes-core/busybox/busybox.inc
>> b/meta/recipes-core/busybox/busybox.inc
>> > index 82137a3..17ff442 100644
>> > --- a/meta/recipes-core/busybox/busybox.inc
>> > +++ b/meta/recipes-core/busybox/busybox.inc
>> > @@ -180,9 +180,13 @@ do_install () {
>> >       if grep "CONFIG_UDHCPD=y" ${WORKDIR}/defconfig; then
>> >               install -m 0755 ${WORKDIR}/busybox-udhcpd
>> ${D}${sysconfdir}/init.d/
>> >       fi
>> > -     if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
>> > -             install -m 0755 ${WORKDIR}/hwclock.sh
>> ${D}${sysconfdir}/init.d/
>> > -     fi
>> > +     case "${MACHINE_FEATURES}" in
>> > +     *rtc*)
>> > +             if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
>> > +                     install -m 0755 ${WORKDIR}/hwclock.sh
>> ${D}${sysconfdir}/init.d/
>> > +             fi
>> > +             ;;
>> > +     esac
>> >       if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
>> >               install -d ${D}${sysconfdir}/udhcpc.d
>> >               install -d ${D}${datadir}/udhcpc
>>
>> This makes busybox machine specific? Is that really what you want to do?
>>
>> I want to have hwclock init script only on machines with RTC.
>
>
And to move a little further, busybox should be configured
with CONFIG_HWCLOCK=y only if it makes sense for that MACHINE. In my
opinion this is machine specific. So avoiding an init script but still
having useless utils doesn't sound good for me.

@g

--14dae934125b968cd804c481128c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Jul 10, 2012 at 11:53 PM, Andrei Gherzan=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:andrei@gherzan.ro" target=3D"_blan=
k">andrei@gherzan.ro</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">

<div class=3D"gmail_quote"><div><div class=3D"h5">On Tue, Jul 10, 2012 at 7=
:02 PM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.or=
g</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<div><div>On Tue, 2012-07-10 at 17:59 +0300, Andrei Gherzan wrote:<br>
&gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro"=
 target=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/recipes-core/busybox/busybox.inc | =A0 10 +++++++---<br>
&gt; =A01 file changed, 7 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core=
/busybox/busybox.inc<br>
&gt; index 82137a3..17ff442 100644<br>
&gt; --- a/meta/recipes-core/busybox/busybox.inc<br>
&gt; +++ b/meta/recipes-core/busybox/busybox.inc<br>
&gt; @@ -180,9 +180,13 @@ do_install () {<br>
&gt; =A0 =A0 =A0 if grep &quot;CONFIG_UDHCPD=3Dy&quot; ${WORKDIR}/defconfig=
; then<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0755 ${WORKDIR}/busybox-udhcpd =
${D}${sysconfdir}/init.d/<br>
&gt; =A0 =A0 =A0 fi<br>
&gt; - =A0 =A0 if grep &quot;CONFIG_HWCLOCK=3Dy&quot; ${WORKDIR}/defconfig;=
 then<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 install -m 0755 ${WORKDIR}/hwclock.sh ${D}${=
sysconfdir}/init.d/<br>
&gt; - =A0 =A0 fi<br>
&gt; + =A0 =A0 case &quot;${MACHINE_FEATURES}&quot; in<br>
&gt; + =A0 =A0 *rtc*)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 if grep &quot;CONFIG_HWCLOCK=3Dy&quot; ${WOR=
KDIR}/defconfig; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0755 ${WORKDIR}/h=
wclock.sh ${D}${sysconfdir}/init.d/<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 fi<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 ;;<br>
&gt; + =A0 =A0 esac<br>
&gt; =A0 =A0 =A0 if grep &quot;CONFIG_UDHCPC=3Dy&quot; ${WORKDIR}/defconfig=
; then<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}${sysconfdir}/udhcpc.d<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}${datadir}/udhcpc<br>
<br>
</div></div>This makes busybox machine specific? Is that really what you wa=
nt to do?<br><br></blockquote></div></div><div>I want to have hwclock init =
script only on machines with RTC.</div><span class=3D"HOEnZb"><font color=
=3D"#888888"><div>

<br></div></font></span></div></blockquote><div></div></div><div><br></div>=
<div>And to move a little further, busybox should be configured with=A0CONF=
IG_HWCLOCK=3Dy only if it makes sense for that MACHINE. In my opinion this =
is machine specific. So avoiding an init script but still having useless ut=
ils doesn&#39;t sound good for me.</div>

<div><br></div><div>@g</div>

--14dae934125b968cd804c481128c--
