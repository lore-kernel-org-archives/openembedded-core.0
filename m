Return-Path: <nathan@nathanrossi.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 56FEC601A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 09:54:56 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id k19so28199005iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 01:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iIhQPhnkfIcYhJGcp7kRtYMqxB+bTpRju6U/1jDEW1o=;
	b=BtVB9LB0cvITsz5rwZFPpuopnmGOoYdIkGdrqE/2REn4PC0Yr0NXxZzcG+hqcERem3
	YoRzEFkj5hJluc2HZR8796UDURRt3Cs78AYyRlNC1nuUY1WRK0KFaHpJety8GCJGPsXE
	UdCwNn3llY2QHn6AZJm0f4HY80SViDkcg3+f2XiMxrXNu9/aJKcUVWzBGfpEjvaIXp1C
	bwYVZWlrl+YtNTCogqx/lsTHgLYVhGsDDC3oE0s2DYX2Fsi/pBxgJ0xd6zOV3He68GtU
	2FjR3s0lum7eqVs4cRM0aRrAd7ONP8/BLSiO9uTCToBInFDV8iW0vU+nN7RJfPK39uwm
	kUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iIhQPhnkfIcYhJGcp7kRtYMqxB+bTpRju6U/1jDEW1o=;
	b=KZACt+udxBw+R2yIcvMkK/jFyXULOm57ulWW5vCaTbJSCEF69vbJCT3Oe3SMpbpGM0
	mmbOpV/UZ4paE0Hz+dQpmaGWrkbN7vF6cM8Q8TmV3X1fDijFTzRaUzQoLFeMklcIN3Nu
	CA+L72HX7IYeMtAHMuq+fNkZVXf2yRN+zYt7kYZvbRKXEPUZYW1IV/0Qk7J6PM9Cusjo
	KhMTDj+gvRLYtSMIecwYo58YOx8hDY2ptEkYitjCR1R56N6LGO28c9ocwUpyu3TY5h1k
	A4ikzVq4hWb5jDfWeNrwplmjJyhDeJMOtGtUaRIMUZ5GLfA93NrISrAAMN/G/oJZ+lrC
	iOWA==
X-Gm-Message-State: AKaTC02MYA+EqO9ydmcJ8NvbNz4tkKreaJDRbEpuwVBwNGV9Sn8y2JNAnQEW37SJSNp0moAfmxpq+cKQhCPQJQ==
X-Received: by 10.36.238.137 with SMTP id b131mr23113166iti.20.1480413298263; 
	Tue, 29 Nov 2016 01:54:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.48.194 with HTTP; Tue, 29 Nov 2016 01:54:57 -0800 (PST)
In-Reply-To: <CA+aJhH3hRSCU_=gKCKxJaqCPm_V2ZbOvCeSkS1MwAxj0o7Z2DA@mail.gmail.com>
References: <cover.1480404884.git.liezhi.yang@windriver.com>
	<bb8e7f0eeeecd6a1af5c28a716a5a0946b33e467.1480404884.git.liezhi.yang@windriver.com>
	<CA+aJhH3hRSCU_=gKCKxJaqCPm_V2ZbOvCeSkS1MwAxj0o7Z2DA@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 29 Nov 2016 19:54:57 +1000
Message-ID: <CA+aJhH02s7v86ax=SHX1w3xzwRt61tbzf7CLFtKjro=qacBJ0w@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] runqemu: set default device and hostfwd for slirp
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
X-List-Received-Date: Tue, 29 Nov 2016 09:54:59 -0000
Content-Type: text/plain; charset=UTF-8

On 29 November 2016 at 19:38, Nathan Rossi <nathan@nathanrossi.com> wrote:
> On 29 November 2016 at 17:35, Robert Yang <liezhi.yang@windriver.com> wrote:
>> There is no network rather than lo whitout set device, so set it by
>> default. And set hostfwd: 2222 -> 22, 2323 -> 23
>>
>> [YOCTO #7887]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta/conf/machine/include/qemuboot-x86.inc |  1 -
>>  meta/conf/machine/qemuarm64.conf           |  1 -
>>  scripts/runqemu                            | 34 ++++++++++++++++++++++++++++--
>>  3 files changed, 32 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
>> index 0870294..06ac983 100644
>> --- a/meta/conf/machine/include/qemuboot-x86.inc
>> +++ b/meta/conf/machine/include/qemuboot-x86.inc
>> @@ -13,4 +13,3 @@ QB_AUDIO_OPT = "-soundhw ac97,es1370"
>>  QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1"
>>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>>  QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
>> -QB_SLIRP_OPT = "-net nic,model=e1000 -net user,hostfwd=tcp::2222-:22"
>> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
>> index df2010c..7a5570c 100644
>> --- a/meta/conf/machine/qemuarm64.conf
>> +++ b/meta/conf/machine/qemuarm64.conf
>> @@ -18,7 +18,6 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,38400"
>>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>>  QB_OPT_APPEND = "-show-cursor -device virtio-rng-pci -monitor null"
>>  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-device,netdev=net0,mac=@MAC@"
>> -QB_SLIRP_OPT = "-netdev user,id=net0 -device virtio-net-device,netdev=net0"
>>  QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
>>  QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
>>  QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index a10270c..7123b8f 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -147,6 +147,19 @@ def get_first_file(cmds):
>>                      return f
>>      return ''
>>
>> +def check_free_port(host, port):
>> +    """ Check whether the port is free or not """
>> +    import socket
>> +    from contextlib import closing
>> +
>> +    with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as sock:
>> +        if sock.connect_ex((host, port)) == 0:
>> +            # Port is open, so not free
>> +            return False
>> +        else:
>> +            # Port is not open, so free
>> +            return True
>> +
>>  class BaseConfig(object):
>>      def __init__(self):
>>          # Vars can be merged with .qemuboot.conf, use a dict to manage them.
>> @@ -751,14 +764,31 @@ class BaseConfig(object):
>>
>>          self.nfs_running = True
>>
>> -
>>      def setup_slirp(self):
>>          """Setup user networking"""
>>
>>          if self.fstype == 'nfs':
>>              self.setup_nfs()
>>          self.kernel_cmdline_script += ' ip=dhcp'
>> -        self.set('NETWORK_CMD', self.get('QB_SLIRP_OPT'))
>> +        # Port mapping
>> +        hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
>> +        qb_slirp_opt_default = "-netdev user,id=net0%s -device virtio-net-pci,netdev=net0" % hostfwd
>> +        qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
>> +        # Figure out the port
>> +        ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
>> +        ports = [int(i) for i in ports]
>
> Should runqemu not just always supply "-netdev user,id=net0..." itself
> for slirp. And qemuboot should supply only the devices, e.g. the "-dev
> virtio-net-pci,netdev=net0" or "-net nic,netdev=net0". This could even
> allow for consolidation of the "QB_SLIRP_OPT" and "QB_TAP_OPT" into
> "QB_NETWORK".

Just saw this patch was an updated version of
https://patchwork.openembedded.org/patch/134399/ which was doing
similar to what I suggested above. (I read this patch before the other
one linked)

Maybe QB_SLIRP_OPT and QB_TAP_OPT should provide overrides for the
-netdev user/tap, and if a BSP/etc needs to overwrite them it can. But
the "-net"/"-device" is provided as a separate QB_NETWORK variable.
This would allow for BSPs to take advantage of the default netdev
user/tap args that runqemu provides without needing to specify any of
the forwards/etc. And would also allow for backwards compatibility
with current BSP QB_* setups.

Regards,
Nathan

>
> This way runqemu would not need to do any searching/substitution and
> could just build the user netdev arg itself. This would allow for easy
> extension of custom forwards (e.g gdbserver, etc), and also even
> setting up the in qemu user/slirp 'tftp=<dir>' server.
>
>> +        # Find a free port to avoid conflicts
>> +        for p in ports[:]:
>> +            p_new = p
>> +            while not check_free_port('127.0.0.1', p_new):
>
> Should this be 'localhost', since 127.0.0.1 will only check for ipv4 listeners.
>
> Regards,
> Nathan
>
>> +                p_new += 1
>> +                while p_new in ports:
>> +                        p_new += 1
>> +            if p != p_new:
>> +                ports.append(p_new)
>> +                qb_slirp_opt = re.sub(':%s-' % p, ':%s-' % p_new, qb_slirp_opt)
>> +                logger.info("Port forward changed: %s -> %s" % (p, p_new))
>> +        self.set('NETWORK_CMD', qb_slirp_opt)
>>
>>      def setup_tap(self):
>>          """Setup tap"""
>> --
>> 2.9.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

