Return-Path: <anibal.limon@linaro.org>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 215347D8DC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 14:20:20 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id j2so16476uaq.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 07:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KIQVHqbnMAePUvLtAwCNDqvN/tF4fw9bShSakloAme4=;
	b=NZLbfpGf6baZyVrhhSxukU6iL+S9hytfK4ST65Du1A+ttfwn7m8KVNX4tKDS1mJnbO
	PfZOXczec+lb4LhXV+QuLwawhDfhKrF1RPjYf+N70iQ6igENomqKALwjndSAYVZ7KRy4
	73BCpNZMA5odbXiImG+v0PhY/5rmBvWi68cFMIE3q/IfkK/x2Hc0s2nt4rIi6gcOxczU
	Q7WWvnoyyJpRlYJ35rTGn4mpYzUSBXH3EcEGRh01/pGgAv7ELfXmN08FxXtKKbFc8/sC
	lPr3Pn2WnxkiFYpScr6MxfXcKRcLKghwfYA4wTcTS8Tgd+VBgwRlf0ILxKWLLIRS7Dfe
	4jBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KIQVHqbnMAePUvLtAwCNDqvN/tF4fw9bShSakloAme4=;
	b=jNCBIwi+RKGv5i+mR1GJkK+C1nEPT8pMgv8DWrPmtj1C7eWBxKSNMSE309skB3dUfE
	hvFOl8FxPMlZIoCWGhSEokb08fzroO9XSyn2dffxPF+X9xsaE1FWvwTSW8P/iguFHNhI
	5sHK0+i2oC7aFOojGqtJoDNPFmyyrPlQ1mvl+zcDzbVPK5i221wNIurAUmTNpM9NW32T
	uBvAbdRiOU89J4lAhnkEfb4tj4qol0pm9jRNrFupJQDeJnk9U31NhNM7Bg04j0UCqTji
	0cdiqqKa/KmBta5tZW6RC9nLX4aL2rUoWLqrKwiAm1h+t8R6F5u6hT/hgGU+NTOkQgtP
	0+dg==
X-Gm-Message-State: APjAAAVjkh3DOQ2jqVzp1Qar6eV9HcuuAeExzwfrF+lITTGdDaj6wyzS
	Qn+ytEJP+dd5+PoUG/M53ftkJZJz/Bj9RPa5VqGiqw==
X-Google-Smtp-Source: APXvYqx8SayGqWxVaJwQnoGVDRVcaWGM8oXzRbdwzBO53IcK/eL6eAL63UlrO9Hu8M2ZWlSwhSpSZMXIIOWj/+oVAe4=
X-Received: by 2002:ab0:2556:: with SMTP id l22mr13083440uan.46.1562163621000; 
	Wed, 03 Jul 2019 07:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190701212350.32503-1-anibal.limon@linaro.org>
	<f6a6bb77-b965-803f-426a-1074cf7e605b@windriver.com>
In-Reply-To: <f6a6bb77-b965-803f-426a-1074cf7e605b@windriver.com>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Wed, 3 Jul 2019 09:21:00 -0500
Message-ID: <CA+_Aqita9GPSFCSe+1nrbABsjW72brxCNfoDdL=MYUmuoykwwA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 1/3] runqemu: Allow to store more than one lock for network interfaces
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
X-List-Received-Date: Wed, 03 Jul 2019 14:20:20 -0000
Content-Type: multipart/alternative; boundary="000000000000b60e12058cc78f8a"

--000000000000b60e12058cc78f8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen,

Thanks for report, may be related to the name of the NIC inside qemu. I
will investigate.

Regards!,
Anibal

On Tue, 2 Jul 2019 at 21:08, ChenQi <Qi.Chen@windriver.com> wrote:

> Could you please help check if the following failures are related to
> this patch series?
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/785/ste=
ps/7/logs/step1c
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/766/ste=
ps/7/logs/step1c
>
> Regards,
> Chen Qi
>
> On 07/02/2019 05:23 AM, An=C3=ADbal Lim=C3=B3n wrote:
> > In order to support multiple tap devices in the same qemu virtual
> > machine.
> >
> > Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> > ---
> >   scripts/runqemu | 50 +++++++++++++++++++++++++-----------------------=
-
> >   1 file changed, 26 insertions(+), 24 deletions(-)
> >
> > diff --git a/scripts/runqemu b/scripts/runqemu
> > index 4079f2b17d..38dd1c30d9 100755
> > --- a/scripts/runqemu
> > +++ b/scripts/runqemu
> > @@ -181,8 +181,7 @@ class BaseConfig(object):
> >           self.audio_enabled =3D False
> >           self.tcpserial_portnum =3D ''
> >           self.custombiosdir =3D ''
> > -        self.lock =3D ''
> > -        self.lock_descriptor =3D None
> > +        self.lock_descriptors =3D {}
> >           self.bitbake_e =3D ''
> >           self.snapshot =3D False
> >           self.wictypes =3D ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi')
> > @@ -204,30 +203,32 @@ class BaseConfig(object):
> >           # avoid cleanup twice
> >           self.cleaned =3D False
> >
> > -    def acquire_lock(self, error=3DTrue):
> > -        logger.debug("Acquiring lockfile %s..." % self.lock)
> > +    def acquire_lock(self, lock, error=3DTrue):
> > +        logger.debug("Acquiring lockfile %s..." % lock)
> > +        descriptor =3D None
> >           try:
> > -            self.lock_descriptor =3D open(self.lock, 'w')
> > -            fcntl.flock(self.lock_descriptor,
> fcntl.LOCK_EX|fcntl.LOCK_NB)
> > +            descriptor =3D open(lock, 'w')
> > +            fcntl.flock(descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
> >           except Exception as e:
> > -            msg =3D "Acquiring lockfile %s failed: %s" % (self.lock, e=
)
> > +            msg =3D "Acquiring lockfile %s failed: %s" % (lock, e)
> >               if error:
> >                   logger.error(msg)
> >               else:
> >                   logger.info(msg)
> > -            if self.lock_descriptor:
> > -                self.lock_descriptor.close()
> > -                self.lock_descriptor =3D None
> > +            if descriptor:
> > +                descriptor.close()
> > +                descriptor =3D None
> >               return False
> > +        self.lock_descriptors[lock] =3D descriptor
> >           return True
> >
> > -    def release_lock(self):
> > -        if self.lock_descriptor:
> > -            logger.debug("Releasing lockfile for tap device '%s'" %
> self.tap)
> > -            fcntl.flock(self.lock_descriptor, fcntl.LOCK_UN)
> > -            self.lock_descriptor.close()
> > -            os.remove(self.lock)
> > -            self.lock_descriptor =3D None
> > +    def release_lock(self, lock):
> > +        if self.lock_descriptors[lock]:
> > +            logger.debug("Releasing lockfile for tap device '%s'" %
> lock)
> > +            fcntl.flock(self.lock_descriptors[lock], fcntl.LOCK_UN)
> > +            self.lock_descriptors[lock].close()
> > +            os.remove(lock)
> > +            self.lock_descriptors[lock] =3D None
> >
> >       def get(self, key):
> >           if key in self.d:
> > @@ -1016,8 +1017,8 @@ class BaseConfig(object):
> >               if os.path.exists('%s.skip' % lockfile):
> >                   logger.info('Found %s.skip, skipping %s' % (lockfile,
> p))
> >                   continue
> > -            self.lock =3D lockfile + '.lock'
> > -            if self.acquire_lock(error=3DFalse):
> > +            lock =3D lockfile + '.lock'
> > +            if self.acquire_lock(lock, error=3DFalse):
> >                   tap =3D p
> >                   logger.info("Using preconfigured tap device %s" % tap=
)
> >                   logger.info("If this is not intended, touch %s.skip
> to make runqemu skip %s." %(lockfile, tap))
> > @@ -1035,8 +1036,8 @@ class BaseConfig(object):
> >               cmd =3D ('sudo', self.qemuifup, str(uid), str(gid),
> self.bindir_native)
> >               tap =3D subprocess.check_output(cmd).decode('utf-8').stri=
p()
> >               lockfile =3D os.path.join(lockdir, tap)
> > -            self.lock =3D lockfile + '.lock'
> > -            self.acquire_lock()
> > +            lock =3D lockfile + '.lock'
> > +            self.acquire_lock(lock)
> >               self.cleantap =3D True
> >               logger.debug('Created tap: %s' % tap)
> >
> > @@ -1268,8 +1269,8 @@ class BaseConfig(object):
> >           cmds =3D shlex.split(cmd)
> >           logger.info('Running %s\n' % cmd)
> >           pass_fds =3D []
> > -        if self.lock_descriptor:
> > -            pass_fds =3D [self.lock_descriptor.fileno()]
> > +        if self.lock_descriptors.keys():
> > +            pass_fds =3D [self.lock_descriptors[lock].fileno() for loc=
k
> in self.lock_descriptors.keys()]
> >           process =3D subprocess.Popen(cmds, stderr=3Dsubprocess.PIPE,
> pass_fds=3Dpass_fds)
> >           self.qemupid =3D process.pid
> >           retcode =3D process.wait()
> > @@ -1291,7 +1292,8 @@ class BaseConfig(object):
> >               cmd =3D ('sudo', self.qemuifdown, self.tap,
> self.bindir_native)
> >               logger.debug('Running %s' % str(cmd))
> >               subprocess.check_call(cmd)
> > -        self.release_lock()
> > +        for lock in self.lock_descriptors.keys():
> > +            self.release_lock(lock)
> >
> >           if self.nfs_running:
> >               logger.info("Shutting down the userspace NFS server...")
>
>
>

--000000000000b60e12058cc78f8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Chen,<div><br></div><div>Thanks for report, may be rela=
ted to the name of the NIC inside qemu. I will investigate.</div><div><br><=
/div><div>Regards!,</div><div>Anibal</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 2 Jul 2019 at 21:08, Chen=
Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Could =
you please help check if the following failures are related to <br>
this patch series?<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/47/build=
s/785/steps/7/logs/step1c" rel=3D"noreferrer" target=3D"_blank">https://aut=
obuilder.yoctoproject.org/typhoon/#/builders/47/builds/785/steps/7/logs/ste=
p1c</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/63/build=
s/766/steps/7/logs/step1c" rel=3D"noreferrer" target=3D"_blank">https://aut=
obuilder.yoctoproject.org/typhoon/#/builders/63/builds/766/steps/7/logs/ste=
p1c</a><br>
<br>
Regards,<br>
Chen Qi<br>
<br>
On 07/02/2019 05:23 AM, An=C3=ADbal Lim=C3=B3n wrote:<br>
&gt; In order to support multiple tap devices in the same qemu virtual<br>
&gt; machine.<br>
&gt;<br>
&gt; Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.lim=
on@linaro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0scripts/runqemu | 50 +++++++++++++++++++++++++------------=
------------<br>
&gt;=C2=A0 =C2=A01 file changed, 26 insertions(+), 24 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/runqemu b/scripts/runqemu<br>
&gt; index 4079f2b17d..38dd1c30d9 100755<br>
&gt; --- a/scripts/runqemu<br>
&gt; +++ b/scripts/runqemu<br>
&gt; @@ -181,8 +181,7 @@ class BaseConfig(object):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.audio_enabled =3D False<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.tcpserial_portnum =3D &#3=
9;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.custombiosdir =3D &#39;&#=
39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock =3D &#39;&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descriptor =3D None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descriptors =3D {}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.bitbake_e =3D &#39;&#39;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.snapshot =3D False<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.wictypes =3D (&#39;wic&#3=
9;, &#39;wic.vmdk&#39;, &#39;wic.qcow2&#39;, &#39;wic.vdi&#39;)<br>
&gt; @@ -204,30 +203,32 @@ class BaseConfig(object):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# avoid cleanup twice<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.cleaned =3D False<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 def acquire_lock(self, error=3DTrue):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;Acquiring lockfile %s.=
..&quot; % self.lock)<br>
&gt; +=C2=A0 =C2=A0 def acquire_lock(self, lock, error=3DTrue):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;Acquiring lockfile %s.=
..&quot; % lock)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 descriptor =3D None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descriptor =3D op=
en(self.lock, &#39;w&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl.flock(self.lock_descr=
iptor, fcntl.LOCK_EX|fcntl.LOCK_NB)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 descriptor =3D open(lock, &=
#39;w&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl.flock(descriptor, fcn=
tl.LOCK_EX|fcntl.LOCK_NB)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Exception as e:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &quot;Acquiring loc=
kfile %s failed: %s&quot; % (self.lock, e)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &quot;Acquiring loc=
kfile %s failed: %s&quot; % (lock, e)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if error:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lo=
gger.error(msg)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.in=
fo</a>(msg)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.lock_descriptor:<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_des=
criptor.close()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_des=
criptor =3D None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if descriptor:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 descriptor.cl=
ose()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 descriptor =
=3D None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descriptors[lock] =3D descripto=
r<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return True<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 def release_lock(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.lock_descriptor:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;Releasin=
g lockfile for tap device &#39;%s&#39;&quot; % self.tap)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl.flock(self.lock_descr=
iptor, fcntl.LOCK_UN)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descriptor.close(=
)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(self.lock)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descriptor =3D No=
ne<br>
&gt; +=C2=A0 =C2=A0 def release_lock(self, lock):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.lock_descriptors[lock]:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;Releasin=
g lockfile for tap device &#39;%s&#39;&quot; % lock)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl.flock(self.lock_descr=
iptors[lock], fcntl.LOCK_UN)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descriptors[lock]=
.close()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(lock)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descriptors[lock]=
 =3D None<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def get(self, key):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if key in self.d:<br>
&gt; @@ -1016,8 +1017,8 @@ class BaseConfig(object):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exist=
s(&#39;%s.skip&#39; % lockfile):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.in=
fo</a>(&#39;Found %s.skip, skipping %s&#39; % (lockfile, p))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
ntinue<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock =3D lockfile + &#=
39;.lock&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.acquire_lock(error=
=3DFalse):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock =3D lockfile + &#39;.l=
ock&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.acquire_lock(lock, =
error=3DFalse):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ta=
p =3D p<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.in=
fo</a>(&quot;Using preconfigured tap device %s&quot; % tap)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.in=
fo</a>(&quot;If this is not intended, touch %s.skip to make runqemu skip %s=
.&quot; %(lockfile, tap))<br>
&gt; @@ -1035,8 +1036,8 @@ class BaseConfig(object):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D (&#39;su=
do&#39;, self.qemuifup, str(uid), str(gid), self.bindir_native)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tap =3D subproce=
ss.check_output(cmd).decode(&#39;utf-8&#39;).strip()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lockfile =3D os.=
path.join(lockdir, tap)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock =3D lockfile + &#=
39;.lock&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.acquire_lock()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock =3D lockfile + &#39;.l=
ock&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.acquire_lock(lock)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.cleantap =
=3D True<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.debug(&#3=
9;Created tap: %s&#39; % tap)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -1268,8 +1269,8 @@ class BaseConfig(object):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmds =3D shlex.split(cmd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://logger.info"=
 rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39;Running %s\n&#39=
; % cmd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass_fds =3D []<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.lock_descriptor:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass_fds =3D [self.lock_des=
criptor.fileno()]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.lock_descriptors.keys():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass_fds =3D [self.lock_des=
criptors[lock].fileno() for lock in self.lock_descriptors.keys()]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0process =3D subprocess.Popen(c=
mds, stderr=3Dsubprocess.PIPE, pass_fds=3Dpass_fds)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.qemupid =3D process.pid<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retcode =3D process.wait()<br>
&gt; @@ -1291,7 +1292,8 @@ class BaseConfig(object):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D (&#39;su=
do&#39;, self.qemuifdown, self.tap, self.bindir_native)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.debug(&#3=
9;Running %s&#39; % str(cmd))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check=
_call(cmd)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.release_lock()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for lock in self.lock_descriptors.keys():=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.release_lock(lock)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.nfs_running:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http:=
//logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;S=
hutting down the userspace NFS server...&quot;)<br>
<br>
<br>
</blockquote></div>

--000000000000b60e12058cc78f8a--
