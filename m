Return-Path: <anibal.limon@linaro.org>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 808DF6C149
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 21:26:14 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id a97so5656336uaa.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 14:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KNq283ZDi6kqaD43qnv4Agv2rBfc+ROn3e5wtNlcGjs=;
	b=Mf0WHyUKFL9mqf/9WatwOHVEHvSMKv4AkSaVWjpovkeI8dF+4+YY20m+jKdpHMxPTU
	f5lhXEpOsQDfaXJzrY+qxVp1UGplWqxyxzHwVKU5o6tBMuDLKx2Y9/lSgD257ZGjODaD
	Ya0UY24Dv2QR/NCgLKZSPsTnvokAClgfAg6xA02EMpEZEnDdypRjPvKQ3atRDy/m4seW
	7Iq32JnhR7WX/Mh6kcZoshqBtMiQlMDPMWy7Kr4wzK9XU0op1b0b+cHFiZrvZwTzr5Xt
	jiaqIzbRPJ4dmXyWyCFaygC3XKuMP4zFRBc/Ah0D4NjTw0Idc/YX20OZF3aZ/9EW5caK
	D+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KNq283ZDi6kqaD43qnv4Agv2rBfc+ROn3e5wtNlcGjs=;
	b=HXV9VZEX04fZiOuNgpQq+GTwh6NHkdAXCUDO9iSrBOQmpdnsjKe/K1POd1gM8nMr8U
	F2TfDu97yuhcm4r6FJT0vcqCW/nfMSyYMBJX4rFbaj09xRfrcnLgWKZQMiICHSxPJXbI
	/PzJYZCfCW63NTOLNLZGB+gXi7hR3aSPFVK1LlzzwYxZgO83ANV33LJyiDBAgIPcV7Pu
	owVT7Cuns8/2miLSKiZDIeMpvtGwYi0z7nKjSuIxqo5DxvpS/dPhf6EVj/BiPBRflmyd
	BIK0On2vF/m3niWCwjM97vvyRaA2rOOW0KI6fp/7m9frWRt47c79BjB3s5vp2T8v9qP7
	zvXQ==
X-Gm-Message-State: APjAAAW6rzFY52WwHGU2hxROWSQzR3Rgs+Y57Lo9vhY3BhsAoe8gnfS6
	TVIpQolIUcOTIt9Mihk0O08CjqvppR1o+dRhjGTYB15t
X-Google-Smtp-Source: APXvYqxevaoyTz8j+EL5uuiifRn9XMeZaxfOEOSw8Wgy4P5vbx6R5Tfb/TKr1v9yLHYMNlTR4x5ITCzTIO26O9FceMw=
X-Received: by 2002:ab0:2556:: with SMTP id l22mr10558274uan.46.1562016375257; 
	Mon, 01 Jul 2019 14:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190701212350.32503-1-anibal.limon@linaro.org>
In-Reply-To: <20190701212350.32503-1-anibal.limon@linaro.org>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Mon, 1 Jul 2019 16:26:53 -0500
Message-ID: <CA+_AqiviHKSt9rdEBt-yEt4f9QEnqWCgCVQ4stmBztASUGHYCQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 01 Jul 2019 21:26:14 -0000
Content-Type: multipart/alternative; boundary="0000000000002e549c058ca547cb"

--0000000000002e549c058ca547cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I squashed the fix in the wrong patch that's because the v3 that are no
functional changes between v2 and v3.

Fixed acquired_lock method to only add the lock when acquire succeed.

Regards,
Anibal

On Mon, 1 Jul 2019 at 16:23, An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.or=
g> wrote:

> In order to support multiple tap devices in the same qemu virtual
> machine.
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  scripts/runqemu | 50 +++++++++++++++++++++++++------------------------
>  1 file changed, 26 insertions(+), 24 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 4079f2b17d..38dd1c30d9 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -181,8 +181,7 @@ class BaseConfig(object):
>          self.audio_enabled =3D False
>          self.tcpserial_portnum =3D ''
>          self.custombiosdir =3D ''
> -        self.lock =3D ''
> -        self.lock_descriptor =3D None
> +        self.lock_descriptors =3D {}
>          self.bitbake_e =3D ''
>          self.snapshot =3D False
>          self.wictypes =3D ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi')
> @@ -204,30 +203,32 @@ class BaseConfig(object):
>          # avoid cleanup twice
>          self.cleaned =3D False
>
> -    def acquire_lock(self, error=3DTrue):
> -        logger.debug("Acquiring lockfile %s..." % self.lock)
> +    def acquire_lock(self, lock, error=3DTrue):
> +        logger.debug("Acquiring lockfile %s..." % lock)
> +        descriptor =3D None
>          try:
> -            self.lock_descriptor =3D open(self.lock, 'w')
> -            fcntl.flock(self.lock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_N=
B)
> +            descriptor =3D open(lock, 'w')
> +            fcntl.flock(descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
>          except Exception as e:
> -            msg =3D "Acquiring lockfile %s failed: %s" % (self.lock, e)
> +            msg =3D "Acquiring lockfile %s failed: %s" % (lock, e)
>              if error:
>                  logger.error(msg)
>              else:
>                  logger.info(msg)
> -            if self.lock_descriptor:
> -                self.lock_descriptor.close()
> -                self.lock_descriptor =3D None
> +            if descriptor:
> +                descriptor.close()
> +                descriptor =3D None
>              return False
> +        self.lock_descriptors[lock] =3D descriptor
>          return True
>
> -    def release_lock(self):
> -        if self.lock_descriptor:
> -            logger.debug("Releasing lockfile for tap device '%s'" %
> self.tap)
> -            fcntl.flock(self.lock_descriptor, fcntl.LOCK_UN)
> -            self.lock_descriptor.close()
> -            os.remove(self.lock)
> -            self.lock_descriptor =3D None
> +    def release_lock(self, lock):
> +        if self.lock_descriptors[lock]:
> +            logger.debug("Releasing lockfile for tap device '%s'" % lock=
)
> +            fcntl.flock(self.lock_descriptors[lock], fcntl.LOCK_UN)
> +            self.lock_descriptors[lock].close()
> +            os.remove(lock)
> +            self.lock_descriptors[lock] =3D None
>
>      def get(self, key):
>          if key in self.d:
> @@ -1016,8 +1017,8 @@ class BaseConfig(object):
>              if os.path.exists('%s.skip' % lockfile):
>                  logger.info('Found %s.skip, skipping %s' % (lockfile, p)=
)
>                  continue
> -            self.lock =3D lockfile + '.lock'
> -            if self.acquire_lock(error=3DFalse):
> +            lock =3D lockfile + '.lock'
> +            if self.acquire_lock(lock, error=3DFalse):
>                  tap =3D p
>                  logger.info("Using preconfigured tap device %s" % tap)
>                  logger.info("If this is not intended, touch %s.skip to
> make runqemu skip %s." %(lockfile, tap))
> @@ -1035,8 +1036,8 @@ class BaseConfig(object):
>              cmd =3D ('sudo', self.qemuifup, str(uid), str(gid),
> self.bindir_native)
>              tap =3D subprocess.check_output(cmd).decode('utf-8').strip()
>              lockfile =3D os.path.join(lockdir, tap)
> -            self.lock =3D lockfile + '.lock'
> -            self.acquire_lock()
> +            lock =3D lockfile + '.lock'
> +            self.acquire_lock(lock)
>              self.cleantap =3D True
>              logger.debug('Created tap: %s' % tap)
>
> @@ -1268,8 +1269,8 @@ class BaseConfig(object):
>          cmds =3D shlex.split(cmd)
>          logger.info('Running %s\n' % cmd)
>          pass_fds =3D []
> -        if self.lock_descriptor:
> -            pass_fds =3D [self.lock_descriptor.fileno()]
> +        if self.lock_descriptors.keys():
> +            pass_fds =3D [self.lock_descriptors[lock].fileno() for lock =
in
> self.lock_descriptors.keys()]
>          process =3D subprocess.Popen(cmds, stderr=3Dsubprocess.PIPE,
> pass_fds=3Dpass_fds)
>          self.qemupid =3D process.pid
>          retcode =3D process.wait()
> @@ -1291,7 +1292,8 @@ class BaseConfig(object):
>              cmd =3D ('sudo', self.qemuifdown, self.tap, self.bindir_nati=
ve)
>              logger.debug('Running %s' % str(cmd))
>              subprocess.check_call(cmd)
> -        self.release_lock()
> +        for lock in self.lock_descriptors.keys():
> +            self.release_lock(lock)
>
>          if self.nfs_running:
>              logger.info("Shutting down the userspace NFS server...")
> --
> 2.20.1
>
>

--0000000000002e549c058ca547cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I squashed the fix in the wrong patch that&#39;s because t=
he v3 that are no functional changes between v2 and v3.<div><br></div><div>=
Fixed acquired_lock method to only add the lock when acquire succeed.</div>=
<div><br></div><div>Regards,</div><div>Anibal</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 1 Jul 2019 at 16=
:23, An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org">=
anibal.limon@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">In order to support multiple tap devices in the same=
 qemu virtual<br>
machine.<br>
<br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu | 50 +++++++++++++++++++++++++-----------------------=
-<br>
=C2=A01 file changed, 26 insertions(+), 24 deletions(-)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index 4079f2b17d..38dd1c30d9 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -181,8 +181,7 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.audio_enabled =3D False<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.tcpserial_portnum =3D &#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.custombiosdir =3D &#39;&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock =3D &#39;&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descriptor =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descriptors =3D {}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.bitbake_e =3D &#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.snapshot =3D False<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.wictypes =3D (&#39;wic&#39;, &#39;wi=
c.vmdk&#39;, &#39;wic.qcow2&#39;, &#39;wic.vdi&#39;)<br>
@@ -204,30 +203,32 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# avoid cleanup twice<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.cleaned =3D False<br>
<br>
-=C2=A0 =C2=A0 def acquire_lock(self, error=3DTrue):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;Acquiring lockfile %s...&qu=
ot; % self.lock)<br>
+=C2=A0 =C2=A0 def acquire_lock(self, lock, error=3DTrue):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;Acquiring lockfile %s...&qu=
ot; % lock)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 descriptor =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descriptor =3D open(se=
lf.lock, &#39;w&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl.flock(self.lock_descriptor=
, fcntl.LOCK_EX|fcntl.LOCK_NB)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 descriptor =3D open(lock, &#39;w=
&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl.flock(descriptor, fcntl.LO=
CK_EX|fcntl.LOCK_NB)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Exception as e:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &quot;Acquiring lockfile=
 %s failed: %s&quot; % (self.lock, e)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &quot;Acquiring lockfile=
 %s failed: %s&quot; % (lock, e)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if error:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.error(=
msg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tp://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(msg)=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.lock_descriptor:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descript=
or.close()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descript=
or =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if descriptor:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 descriptor.close()=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 descriptor =3D Non=
e<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descriptors[lock] =3D descriptor<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return True<br>
<br>
-=C2=A0 =C2=A0 def release_lock(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.lock_descriptor:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;Releasing loc=
kfile for tap device &#39;%s&#39;&quot; % self.tap)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl.flock(self.lock_descriptor=
, fcntl.LOCK_UN)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descriptor.close()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(self.lock)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descriptor =3D None<br=
>
+=C2=A0 =C2=A0 def release_lock(self, lock):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.lock_descriptors[lock]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;Releasing loc=
kfile for tap device &#39;%s&#39;&quot; % lock)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl.flock(self.lock_descriptor=
s[lock], fcntl.LOCK_UN)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descriptors[lock].clos=
e()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(lock)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock_descriptors[lock] =3D =
None<br>
<br>
=C2=A0 =C2=A0 =C2=A0def get(self, key):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if key in self.d:<br>
@@ -1016,8 +1017,8 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(&#39;%s.s=
kip&#39; % lockfile):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tp://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39=
;Found %s.skip, skipping %s&#39; % (lockfile, p))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock =3D lockfile + &#39;.l=
ock&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.acquire_lock(error=3DFal=
se):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock =3D lockfile + &#39;.lock&#=
39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.acquire_lock(lock, error=
=3DFalse):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tap =3D p<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tp://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quo=
t;Using preconfigured tap device %s&quot; % tap)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tp://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quo=
t;If this is not intended, touch %s.skip to make runqemu skip %s.&quot; %(l=
ockfile, tap))<br>
@@ -1035,8 +1036,8 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D (&#39;sudo&#39;, se=
lf.qemuifup, str(uid), str(gid), self.bindir_native)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tap =3D subprocess.check_ou=
tput(cmd).decode(&#39;utf-8&#39;).strip()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lockfile =3D os.path.join(l=
ockdir, tap)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock =3D lockfile + &#39;.l=
ock&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.acquire_lock()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock =3D lockfile + &#39;.lock&#=
39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.acquire_lock(lock)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.cleantap =3D True<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.debug(&#39;Created t=
ap: %s&#39; % tap)<br>
<br>
@@ -1268,8 +1269,8 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmds =3D shlex.split(cmd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://logger.info" rel=3D"nor=
eferrer" target=3D"_blank">logger.info</a>(&#39;Running %s\n&#39; % cmd)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass_fds =3D []<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.lock_descriptor:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass_fds =3D [self.lock_descript=
or.fileno()]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.lock_descriptors.keys():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass_fds =3D [self.lock_descript=
ors[lock].fileno() for lock in self.lock_descriptors.keys()]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0process =3D subprocess.Popen(cmds, stderr=
=3Dsubprocess.PIPE, pass_fds=3Dpass_fds)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.qemupid =3D process.pid<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retcode =3D process.wait()<br>
@@ -1291,7 +1292,8 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D (&#39;sudo&#39;, se=
lf.qemuifdown, self.tap, self.bindir_native)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.debug(&#39;Running %=
s&#39; % str(cmd))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_call(cmd)<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.release_lock()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for lock in self.lock_descriptors.keys():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.release_lock(lock)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.nfs_running:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://logger.in=
fo" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;Shutting dow=
n the userspace NFS server...&quot;)<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div>

--0000000000002e549c058ca547cb--
