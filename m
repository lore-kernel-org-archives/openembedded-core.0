Return-Path: <anibal.limon@linaro.org>
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
	[209.85.217.41])
	by mail.openembedded.org (Postfix) with ESMTP id 35FBF7E726
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 17:04:28 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id 2so253396vso.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 10:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zWKHOlcPjcdTTIhsJMIdIQZPP4NlVOK3Bqy1ZFVq3nc=;
	b=ProCE7n1UI4UJeLERqrDcnJAQh++8l3Lo4YdPC/g/rb4I+UuyrIuAfs0sbKQnjpNsU
	zMsTgkYMcB5Ni8N4bmbYIFwgpZpfyDrcUfFP3MA+rF2ineGx+Hg917X6VgjL5qgIGpOa
	gkJSog34ufIuxwseIVeCs7TP9N79weDlT0FiYirgSrDAUJhrz/0MJEFUW0Cqj4lD0PHu
	ffODWJ7w/8625GmsJ8x59H3vWW8G9p8+OZIKDX5uJxZa41eATTPyescB5bBgpItjIdbi
	asar9HNdYtvka10XWfOAFL0ziPuVN+Z7XooKyPshA0HMA4SkOmfWyirUxeIZFMXM4a38
	eeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zWKHOlcPjcdTTIhsJMIdIQZPP4NlVOK3Bqy1ZFVq3nc=;
	b=FSyeIsVsg2GMXKQsHWGxWbrCWR4C5/WNfwDO1YHPfm3QZPkeOZFXsAryzokQzZuf/R
	JDGuAl/CZ2P47Sm+XZVNBhn1F6o4q+wCk6OAC5RKeyJZbSP1bopDQ3WBjtk/bfStmfRq
	LvatbQ2WiS0r6upn3KoGDlz5G7RbUXsaNAKIPbRJ3xolaTSzdwfcjB5gjlLfJgeAdXnW
	zcY7284bSHDLYfNxdu1aAejk+t2Sxr0Cvl3YPTXgS9gMIFHvcGl9Qo0e+oGCdC5dsu7W
	Gjtdd73GruqQlCsi+ApHwqoqd2RFXetnDiW8fR4raPNfIuXlogLCM13Wos8YRC65i6bb
	b2AQ==
X-Gm-Message-State: APjAAAXiIMzGpBN1eEf9doB3t148oseA5h5hKguoJWEhXYKccOIYWStw
	LcTuWotZuCd/JZO/GkG63yk+u2htSspMgcJsrasBWFoO2lM=
X-Google-Smtp-Source: APXvYqyV95SymoI6K1sSy97foa5Y/7dbzNHb+FU9COD93pzanGPU6UAR8qwf576LthxYPtWP5WYpJLrq5Qd9hH1/H7c=
X-Received: by 2002:a05:6102:2008:: with SMTP id
	p8mr18995839vsr.188.1562173468858; 
	Wed, 03 Jul 2019 10:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190703170223.6228-1-anibal.limon@linaro.org>
	<20190703170223.6228-2-anibal.limon@linaro.org>
In-Reply-To: <20190703170223.6228-2-anibal.limon@linaro.org>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Wed, 3 Jul 2019 12:05:08 -0500
Message-ID: <CA+_AqisKWyf_xM12bbgWma6dEjEUXu7w=-k9SjpTVptNpkhx5w@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	ChenQi <Qi.Chen@windriver.com>
Subject: Re: [PATCHv4 2/3] runqemu: Add support for multiple tap devices
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
X-List-Received-Date: Wed, 03 Jul 2019 17:04:29 -0000
Content-Type: multipart/alternative; boundary="000000000000b06ec2058cc9dac3"

--000000000000b06ec2058cc9dac3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Jul 2019 at 12:01, An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.or=
g> wrote:

> Add the ability to set more than one tap devices into the
> same qemu instance,
>
> The code was modified to detect multiple @TAP@ and @MAC@ in the
> QA_TAP_OPT and QA_NETWORK_DEVICE respectively, it handles the
> attach/creation of multiple tap devices and stores into a list
> for lock/unlock.
>
> Configure the first interface because Kernel IP Configuration
> only takes care of the first device.
>
> This patch was tested using qemux86, kvm-vhost and NFS rootfs.
>
> Example of the configuration:
>
> QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downscri=
pt=3Dno \
>               -netdev tap,id=3Dnet1,ifname=3D@TAP@,script=3Dno,downscript=
=3Dno"
> QB_NETWORK_DEVICE =3D "-device virtio-net-pci,netdev=3Dnet0,mac=3D@MAC@ \
>                      -device virtio-net-pci,netdev=3Dnet1,mac=3D@MAC@"
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  scripts/runqemu | 141 ++++++++++++++++++++++++++++--------------------
>  1 file changed, 83 insertions(+), 58 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 38dd1c30d9..0134f86b4c 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1006,64 +1006,88 @@ class BaseConfig(object):
>              except FileExistsError:
>                  pass
>
> -        cmd =3D (ip, 'link')
> -        logger.debug('Running %s...' % str(cmd))
> -        ip_link =3D subprocess.check_output(cmd).decode('utf-8')
> -        # Matches line like: 6: tap0: <foo>
> -        possibles =3D re.findall('^[0-9]+: +(tap[0-9]+): <.*', ip_link,
> re.M)
> -        tap =3D ""
> -        for p in possibles:
> -            lockfile =3D os.path.join(lockdir, p)
> -            if os.path.exists('%s.skip' % lockfile):
> -                logger.info('Found %s.skip, skipping %s' % (lockfile, p)=
)
> -                continue
> -            lock =3D lockfile + '.lock'
> -            if self.acquire_lock(lock, error=3DFalse):
> -                tap =3D p
> -                logger.info("Using preconfigured tap device %s" % tap)
> -                logger.info("If this is not intended, touch %s.skip to
> make runqemu skip %s." %(lockfile, tap))
> -                break
> -
> -        if not tap:
> -            if os.path.exists(nosudo_flag):
> -                logger.error("Error: There are no available tap devices
> to use for networking,")
> -                logger.error("and I see %s exists, so I am not going to
> try creating" % nosudo_flag)
> -                raise RunQemuError("a new one with sudo.")
> -
> -            gid =3D os.getgid()
> -            uid =3D os.getuid()
> -            logger.info("Setting up tap interface under sudo")
> -            cmd =3D ('sudo', self.qemuifup, str(uid), str(gid),
> self.bindir_native)
> -            tap =3D subprocess.check_output(cmd).decode('utf-8').strip()
> -            lockfile =3D os.path.join(lockdir, tap)
> -            lock =3D lockfile + '.lock'
> -            self.acquire_lock(lock)
> -            self.cleantap =3D True
> -            logger.debug('Created tap: %s' % tap)
> -
> -        if not tap:
> -            logger.error("Failed to setup tap device. Run
> runqemu-gen-tapdevs to manually create.")
> -            return 1
> -        self.tap =3D tap
> -        tapnum =3D int(tap[3:])
> -        gateway =3D tapnum * 2 + 1
> -        client =3D gateway + 1
> -        if self.fstype =3D=3D 'nfs':
> -            self.setup_nfs()
> -        netconf =3D "192.168.7.%s::192.168.7.%s:255.255.255.0" % (client=
,
> gateway)
> -        logger.info("Network configuration: %s", netconf)
> -        self.kernel_cmdline_script +=3D " ip=3D%s" % netconf
> -        mac =3D "%s%02x" % (self.mac_tap, client)
> -        qb_tap_opt =3D self.get('QB_TAP_OPT')
> -        if qb_tap_opt:
> -            qemu_tap_opt =3D qb_tap_opt.replace('@TAP@', tap)
> -        else:
> -            qemu_tap_opt =3D "-netdev
> tap,id=3Dnet0,ifname=3D%s,script=3Dno,downscript=3Dno" % (self.tap)
> +        self.taps =3D []
> +        qemu_tap_opt =3D self.get('QB_TAP_OPT')
> +        if not qemu_tap_opt:
> +            qemu_tap_opt =3D '-netdev tap,id=3Dnet0,ifname=3D@TAP@
> ,script=3Dno,downscript=3Dno'
>
>          if self.vhost_enabled:
> -            qemu_tap_opt +=3D ',vhost=3Don'
> +            opts =3D []
> +            for tap_opt in qemu_tap_opt.split():
> +                if 'tap' in tap_opt:
> +                    tap_opt +=3D ',vhost=3Don'
> +                    opts.append(tap_opt)
> +                else:
> +                    opts.append(tap_opt)
> +            qemu_tap_opt =3D ' '.join(opts)
> +
> +        tap_no =3D qemu_tap_opt.count('@TAP@')
> +        for tap_idx in range(tap_no):
> +            cmd =3D (ip, 'link')
> +            logger.debug('Running %s...' % str(cmd))
> +            ip_link =3D subprocess.check_output(cmd).decode('utf-8')
> +            # Matches line like: 6: tap0: <foo>
> +            possibles =3D re.findall('^[0-9]+: +(tap[0-9]+): <.*', ip_li=
nk,
> re.M)
> +            tap =3D ""
> +            for p in possibles:
> +                if p in self.taps:
> +                    continue
> +
> +                lockfile =3D os.path.join(lockdir, p)
> +                if os.path.exists('%s.skip' % lockfile):
> +                    logger.info('Found %s.skip, skipping %s' %
> (lockfile, p))
> +                    continue
> +                lock =3D lockfile + '.lock'
> +                if self.acquire_lock(lock, error=3DFalse):
> +                    tap =3D p
> +                    logger.info("Using preconfigured tap device %s" %
> tap)
> +                    logger.info("If this is not intended, touch %s.skip
> to make runqemu skip %s." %(lockfile, tap))
> +                    break
>
> -        self.set('NETWORK_CMD', '%s %s' %
> (self.network_device.replace('@MAC@', mac), qemu_tap_opt))
> +            if not tap:
> +                if os.path.exists(nosudo_flag):
> +                    logger.error("Error: There are no available tap
> devices to use for networking,")
> +                    logger.error("and I see %s exists, so I am not going
> to try creating" % nosudo_flag)
> +                    raise RunQemuError("a new one with sudo.")
> +
> +                gid =3D os.getgid()
> +                uid =3D os.getuid()
> +                logger.info("Setting up tap interface under sudo")
> +                cmd =3D ('sudo', self.qemuifup, str(uid), str(gid),
> self.bindir_native)
> +                tap =3D subprocess.check_output(cmd).decode('utf-8').str=
ip()
> +                lockfile =3D os.path.join(lockdir, tap)
> +                lock =3D lockfile + '.lock'
> +                self.acquire_lock(lock)
> +                self.cleantap =3D True
> +                logger.info('Created tap: %s' % tap)
> +
> +            if not tap:
> +                logger.error("Failed to setup tap device. Run
> runqemu-gen-tapdevs to manually create.")
> +                return 1
> +            self.taps.append(tap)
> +            tapnum =3D int(tap[3:])
> +            gateway =3D tapnum * 2 + 1
> +            client =3D gateway + 1
> +
>

Hi Chen,

For some reason Linux isn't not configuring the NIC when eth0 is specified
in the cmdline for qemuppc and qemuarm, I added this workaround
that not pass ethN to ip=3D in kernel cmdline when only one tap device is
requested.

Regards,
Anibal


> +            # XXX: Linux qemuarm and qemuppc dosen't configure the
> interface
> +            # if device is specified in ip (ethN), so if only one tap
> device is
> +            # requested don't specify ethN.
> +            if tap_no =3D=3D 1:
> +                netconf =3D "192.168.7.%s::192.168.7.%s:255.255.255.0" %
> (client, gateway)
> +                logger.info("Network configuration: %s", netconf)
> +                self.kernel_cmdline_script +=3D " ip=3D%s" % netconf
> +            elif tap_idx =3D=3D 0:
> +                netconf =3D "192.168.7.%s::192.168.7.%s:255.255.255.0::e=
th%d"
> % (client, gateway, tap_idx)
> +                logger.info("Network configuration: %s", netconf)
> +                self.kernel_cmdline_script +=3D " ip=3D%s" % netconf
> +
> +            mac =3D "%s%02x" % (self.mac_tap, client)
> +            qemu_tap_opt =3D qemu_tap_opt.replace('@TAP@', tap, 1)
> +            self.network_device =3D self.network_device.replace('@MAC@',
> mac, 1)
> +
> +        self.set('NETWORK_CMD', '%s %s' % (self.network_device,
> qemu_tap_opt))
> +        if self.fstype =3D=3D 'nfs':
> +            self.setup_nfs()
>
>      def setup_network(self):
>          if self.get('QB_NET') =3D=3D 'none':
> @@ -1289,9 +1313,10 @@ class BaseConfig(object):
>
>          logger.info("Cleaning up")
>          if self.cleantap:
> -            cmd =3D ('sudo', self.qemuifdown, self.tap, self.bindir_nati=
ve)
> -            logger.debug('Running %s' % str(cmd))
> -            subprocess.check_call(cmd)
> +            for tap in self.taps:
> +                cmd =3D ('sudo', self.qemuifdown, tap, self.bindir_nativ=
e)
> +                logger.debug('Running %s' % str(cmd))
> +                subprocess.check_call(cmd)
>          for lock in self.lock_descriptors.keys():
>              self.release_lock(lock)
>
> --
> 2.20.1
>
>

--000000000000b06ec2058cc9dac3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 3 Jul 2019 at 12:01, An=C3=AD=
bal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org">anibal.limon@=
linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Add the ability to set more than one tap devices into the<br>
same qemu instance,<br>
<br>
The code was modified to detect multiple @TAP@ and @MAC@ in the<br>
QA_TAP_OPT and QA_NETWORK_DEVICE respectively, it handles the<br>
attach/creation of multiple tap devices and stores into a list<br>
for lock/unlock.<br>
<br>
Configure the first interface because Kernel IP Configuration<br>
only takes care of the first device.<br>
<br>
This patch was tested using qemux86, kvm-vhost and NFS rootfs.<br>
<br>
Example of the configuration:<br>
<br>
QB_TAP_OPT =3D &quot;-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downs=
cript=3Dno \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -netdev tap,id=3Dnet1,ifna=
me=3D@TAP@,script=3Dno,downscript=3Dno&quot;<br>
QB_NETWORK_DEVICE =3D &quot;-device virtio-net-pci,netdev=3Dnet0,mac=3D@MAC=
@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-device virtio-net-pci,netdev=3Dnet1,mac=3D@MAC@&quot;<br>
<br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu | 141 ++++++++++++++++++++++++++++-------------------=
-<br>
=C2=A01 file changed, 83 insertions(+), 58 deletions(-)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index 38dd1c30d9..0134f86b4c 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -1006,64 +1006,88 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except FileExistsError:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D (ip, &#39;link&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&#39;Running %s...&#39; % str(cmd=
))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ip_link =3D subprocess.check_output(cmd).decod=
e(&#39;utf-8&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Matches line like: 6: tap0: &lt;foo&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 possibles =3D re.findall(&#39;^[0-9]+: +(tap[0=
-9]+): &lt;.*&#39;, ip_link, re.M)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tap =3D &quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for p in possibles:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lockfile =3D os.path.join(lockdi=
r, p)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(&#39;%s.skip&#=
39; % lockfile):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://=
logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39;Foun=
d %s.skip, skipping %s&#39; % (lockfile, p))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock =3D lockfile + &#39;.lock&#=
39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.acquire_lock(lock, error=
=3DFalse):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tap =3D p<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://=
logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;Usi=
ng preconfigured tap device %s&quot; % tap)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://=
logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;If =
this is not intended, touch %s.skip to make runqemu skip %s.&quot; %(lockfi=
le, tap))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not tap:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(nosudo_flag):<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.error(&quot=
;Error: There are no available tap devices to use for networking,&quot;)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.error(&quot=
;and I see %s exists, so I am not going to try creating&quot; % nosudo_flag=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise RunQemuError=
(&quot;a new one with sudo.&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gid =3D os.getgid()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uid =3D os.getuid()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" r=
el=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;Setting up tap in=
terface under sudo&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D (&#39;sudo&#39;, self.qe=
muifup, str(uid), str(gid), self.bindir_native)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tap =3D subprocess.check_output(=
cmd).decode(&#39;utf-8&#39;).strip()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lockfile =3D os.path.join(lockdi=
r, tap)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock =3D lockfile + &#39;.lock&#=
39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.acquire_lock(lock)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.cleantap =3D True<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&#39;Created tap: %=
s&#39; % tap)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not tap:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.error(&quot;Failed to set=
up tap device. Run runqemu-gen-tapdevs to manually create.&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tap =3D tap<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tapnum =3D int(tap[3:])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gateway =3D tapnum * 2 + 1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 client =3D gateway + 1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.fstype =3D=3D &#39;nfs&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.setup_nfs()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 netconf =3D &quot;192.168.7.%s::192.168.7.%s:2=
55.255.255.0&quot; % (client, gateway)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferr=
er" target=3D"_blank">logger.info</a>(&quot;Network configuration: %s&quot;=
, netconf)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.kernel_cmdline_script +=3D &quot; ip=3D%s=
&quot; % netconf<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mac =3D &quot;%s%02x&quot; % (self.mac_tap, cl=
ient)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qb_tap_opt =3D self.get(&#39;QB_TAP_OPT&#39;)<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if qb_tap_opt:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_tap_opt =3D qb_tap_opt.repl=
ace(&#39;@TAP@&#39;, tap)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_tap_opt =3D &quot;-netdev t=
ap,id=3Dnet0,ifname=3D%s,script=3Dno,downscript=3Dno&quot; % (self.tap)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.taps =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_tap_opt =3D self.get(&#39;QB_TAP_OPT&#39;=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not qemu_tap_opt:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_tap_opt =3D &#39;-netdev ta=
p,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downscript=3Dno&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.vhost_enabled:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_tap_opt +=3D &#39;,vhost=3D=
on&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opts =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for tap_opt in qemu_tap_opt.spli=
t():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;tap&#39; i=
n tap_opt:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tap_=
opt +=3D &#39;,vhost=3Don&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opts=
.append(tap_opt)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opts=
.append(tap_opt)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_tap_opt =3D &#39; &#39;.joi=
n(opts)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tap_no =3D qemu_tap_opt.count(&#39;@TAP@&#39;)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for tap_idx in range(tap_no):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D (ip, &#39;link&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&#39;Running %s...&=
#39; % str(cmd))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ip_link =3D subprocess.check_out=
put(cmd).decode(&#39;utf-8&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Matches line like: 6: tap0: &l=
t;foo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 possibles =3D re.findall(&#39;^[=
0-9]+: +(tap[0-9]+): &lt;.*&#39;, ip_link, re.M)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tap =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for p in possibles:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p in self.taps:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lockfile =3D os.pa=
th.join(lockdir, p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(=
&#39;%s.skip&#39; % lockfile):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a h=
ref=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info=
</a>(&#39;Found %s.skip, skipping %s&#39; % (lockfile, p))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock =3D lockfile =
+ &#39;.lock&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.acquire_lo=
ck(lock, error=3DFalse):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tap =
=3D p<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a h=
ref=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info=
</a>(&quot;Using preconfigured tap device %s&quot; % tap)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a h=
ref=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info=
</a>(&quot;If this is not intended, touch %s.skip to make runqemu skip %s.&=
quot; %(lockfile, tap))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.set(&#39;NETWORK_CMD&#39;, &#39;%s %s&#39=
; % (self.network_device.replace(&#39;@MAC@&#39;, mac), qemu_tap_opt))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not tap:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(=
nosudo_flag):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logg=
er.error(&quot;Error: There are no available tap devices to use for network=
ing,&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logg=
er.error(&quot;and I see %s exists, so I am not going to try creating&quot;=
 % nosudo_flag)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rais=
e RunQemuError(&quot;a new one with sudo.&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gid =3D os.getgid(=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uid =3D os.getuid(=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://=
logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;Set=
ting up tap interface under sudo&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D (&#39;sudo=
&#39;, self.qemuifup, str(uid), str(gid), self.bindir_native)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tap =3D subprocess=
.check_output(cmd).decode(&#39;utf-8&#39;).strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lockfile =3D os.pa=
th.join(lockdir, tap)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock =3D lockfile =
+ &#39;.lock&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.acquire_lock(=
lock)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.cleantap =3D =
True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://=
logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39;Crea=
ted tap: %s&#39; % tap)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not tap:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.error(&quot=
;Failed to setup tap device. Run runqemu-gen-tapdevs to manually create.&qu=
ot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.taps.append(tap)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tapnum =3D int(tap[3:])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gateway =3D tapnum * 2 + 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client =3D gateway + 1<br>
+<br></blockquote><div><br></div><div>Hi Chen,</div><div><br></div><div>For=
 some reason Linux isn&#39;t not configuring the NIC when eth0 is specified=
 in the cmdline for qemuppc and qemuarm, I added this workaround</div><div>=
that not pass ethN to ip=3D in kernel cmdline when only one tap device is r=
equested.</div><div><br></div><div>Regards,</div><div>Anibal</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # XXX: Linux qemuarm and qemuppc=
 dosen&#39;t configure the interface <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # if device is specified in ip (=
ethN), so if only one tap device is<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # requested don&#39;t specify et=
hN.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tap_no =3D=3D 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 netconf =3D &quot;=
192.168.7.%s::192.168.7.%s:255.255.255.0&quot; % (client, gateway)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://=
logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;Net=
work configuration: %s&quot;, netconf)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.kernel_cmdlin=
e_script +=3D &quot; ip=3D%s&quot; % netconf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif tap_idx =3D=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 netconf =3D &quot;=
192.168.7.%s::192.168.7.%s:255.255.255.0::eth%d&quot; % (client, gateway, t=
ap_idx)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://=
logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;Net=
work configuration: %s&quot;, netconf)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.kernel_cmdlin=
e_script +=3D &quot; ip=3D%s&quot; % netconf<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mac =3D &quot;%s%02x&quot; % (se=
lf.mac_tap, client)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_tap_opt =3D qemu_tap_opt.re=
place(&#39;@TAP@&#39;, tap, 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.network_device =3D self.net=
work_device.replace(&#39;@MAC@&#39;, mac, 1)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.set(&#39;NETWORK_CMD&#39;, &#39;%s %s&#39=
; % (self.network_device, qemu_tap_opt))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.fstype =3D=3D &#39;nfs&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.setup_nfs()<br>
<br>
=C2=A0 =C2=A0 =C2=A0def setup_network(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.get(&#39;QB_NET&#39;) =3D=3D &#39=
;none&#39;:<br>
@@ -1289,9 +1313,10 @@ class BaseConfig(object):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://logger.info" rel=3D"nor=
eferrer" target=3D"_blank">logger.info</a>(&quot;Cleaning up&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.cleantap:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D (&#39;sudo&#39;, self.qe=
muifdown, self.tap, self.bindir_native)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&#39;Running %s&#39=
; % str(cmd))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call(cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for tap in self.taps:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D (&#39;sudo=
&#39;, self.qemuifdown, tap, self.bindir_native)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&#39;=
Running %s&#39; % str(cmd))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_c=
all(cmd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for lock in self.lock_descriptors.keys():=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.release_lock(lock)<br>
<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div></div>

--000000000000b06ec2058cc9dac3--
