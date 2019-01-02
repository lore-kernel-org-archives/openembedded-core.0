Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id A21D26BF3D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 21:13:22 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id x10so31767023wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 13:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=VXeowQ1FZ8u/EdxiHSKJ5TcKmuJMt33aSOoJLQMSwfA=;
	b=V6Lna2/EUgYevNO6j0EcfEO9zkkCSkMgz6mutFajTKccF4v+ByYI37n2DlK2ZAuzOr
	D75REUHC3OhhirqSo+tYDj6EMYwUG69PvLPLmJJkD2VeUnMxEvOynWEHRQia8u+f2TQh
	eMAzL8BIBclliglONprM9lOKKkqYpDlpzO0/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=VXeowQ1FZ8u/EdxiHSKJ5TcKmuJMt33aSOoJLQMSwfA=;
	b=r3g/wV6PP+38jyUT4VaVF5j/vQKWr7D+VkVXhpZepS7z+fPS7pi10tUWZ2mjwNiLze
	qb7ae4M81B76P6h61lnI5wp7YGRvrGeF/I4oc5D5YkvaacUgL616Ya0SMIxpiVUgzzUf
	FvaVnCul784WMB36AywUkArDSqHPb73+mGVGBr0//xL00vcMfQlSFgG3CYfQMRMLc7a0
	5soK3xWPlKZHsS+vRJR7kaatv0jBXZf1/Yk12y69AsamqlTcMFfdc6tc5uP3zSyhkpJ+
	7oIBeRBUcublUckkll8npFx9vt83oH4aFT4GU3H+Ov8Gc2jWzrSjpzn+IXt7965+v/7o
	tThg==
X-Gm-Message-State: AJcUukf+cqB4fOxCf+sW/CjBoM9oV9rVNHS3WURUoqKy+IrwD4Ie1BLT
	H8/9Dcx0gKYCfNxdGNgl9+0jHHti/QSmNw==
X-Google-Smtp-Source: ALg8bN422MXpUdyG+gc+e4uhScVVZWgHiS9QMEtWIKwNC/el3wnNZ3hbUlid64FyM+5LqyKfFzVxlg==
X-Received: by 2002:adf:9521:: with SMTP id 30mr37186788wrs.192.1546463603235; 
	Wed, 02 Jan 2019 13:13:23 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	202sm50196320wmt.8.2019.01.02.13.13.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 Jan 2019 13:13:22 -0800 (PST)
Message-ID: <87b2f230208d75707eb2effd514a16dc3d936254.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Wed, 02 Jan 2019 21:13:20 +0000
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: oe-selftest serial timeout
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
X-List-Received-Date: Wed, 02 Jan 2019 21:13:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Robert,

The test we added debug to failed, logs/links below. Looks like the 5s
timeout for non-kvm is too short as was commented elsewhere. Not sure
why the kvm setting isn't being passed in here but it should be set for
these builds, we may need to make sure its inherited as well?

Cheers,

Richard



https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/83

2019-01-02 17:48:44,799 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
2019-01-02 17:48:44,800 - oe-selftest - INFO - FAIL: runqemu.RunqemuTests.t=
est_boot_rootfs (subunit.RemotedTestCase)
2019-01-02 17:48:44,800 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2019-01-02 17:48:44,800 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/core/d=
ecorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/selfte=
st/cases/runqemu.py", line 144, in test_boot_rootfs
    self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
  File "/usr/lib/python3.6/unittest/case.py", line 682, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : Failed: runqemu nographic /home/pokybui=
ld/yocto-worker/oe-selftest/build/build-st-8591/tmp/deploy/images/qemux86-6=
4/core-image-minimal-qemux86-64.ext4, INFO: rootfs file:=20
INFO: Qemu log file: /home/pokybuild/yocto-worker/oe-selftest/build/build-s=
t-8591/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/q=
emu_boot_log.20190102164633
INFO: SSH log file: /home/pokybuild/yocto-worker/oe-selftest/build/build-st=
-8591/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/ss=
h_target_log.20190102164633
DEBUG: Created listening socket for qemu serial console on: 127.0.0.1:40679
DEBUG: Created listening socket for qemu serial console on: 127.0.0.1:50773
DEBUG: launchcmd=3Drunqemu nographic /home/pokybuild/yocto-worker/oe-selfte=
st/build/build-st-8591/tmp/deploy/images/qemux86-64/core-image-minimal-qemu=
x86-64.ext4 tcpserial=3D50773 bootparams=3D"console=3Dtty1 console=3DttyS0,=
115200n8 printk.time=3D1" qemuparams=3D"-serial tcp:127.0.0.1:40679 -pidfil=
e pidfile_8591"
DEBUG: runqemu started, pid is 29140
DEBUG: waiting at most 120 seconds for qemu pid (01/02/19 16:46:39)
DEBUG: qemu started in 0.5013589859008789 seconds - qemu procces pid is 295=
81 (01/02/19 16:46:40)
DEBUG: Target IP: None
DEBUG: Server IP: None
DEBUG: Starting logging thread
DEBUG: Starting thread event loop
DEBUG: Connection request received
DEBUG: Setting connection established event
DEBUG: Output from runqemu:
runqemu - INFO - Continuing with the following parameters:

runqemu - INFO - Using preconfigured tap device tap0
runqemu - INFO - If this is not intended, touch /tmp/qemu-tap-locks/tap0.sk=
ip to make runqemu skip tap0.
runqemu - INFO - Network configuration: 192.168.7.2::192.168.7.1:255.255.25=
5.0
runqemu - INFO - Running /home/pokybuild/yocto-worker/oe-selftest/build/bui=
ld-st-8591/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-n=
ative/usr/bin/qemu-system-x86_64 -device virtio-net-pci,netdev=3Dnet0,mac=
=3D52:54:00:12:34:02 -netdev tap,id=3Dnet0,ifname=3Dtap0,script=3Dno,downsc=
ript=3Dno -drive file=3D/home/pokybuild/yocto-worker/oe-selftest/build/buil=
d-st-8591/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.ext4,i=
f=3Dvirtio,format=3Draw -vga vmware -show-cursor -usb -device usb-tablet -o=
bject rng-random,filename=3D/dev/urandom,id=3Drng0 -device virtio-rng-pci,r=
ng=3Drng0  -nographic -serial tcp:127.0.0.1:40679 -pidfile pidfile_8591  -c=
pu core2duo -m 256 -serial tcp:127.0.0.1:50773 -kernel /home/pokybuild/yoct=
o-worker/oe-selftest/build/build-st-8591/tmp/deploy/images/qemux86-64/bzIma=
ge--4.18.21+git0+8f4a98c938_9eddc793f9-r0.2-qemux86-64-20190102130920.bin -=
append 'root=3D/dev/vda rw highres=3Doff  console=3DttyS0 mem=3D256M ip=3D1=
92.168.7.2::192.168.7.1:255.255.255.0 vga=3D0 uvesafb.mode_option=3D640x480=
-32 oprofile.timer=3D1 uvesafb.task_timeout=3D-1 console=3Dtty1 console=3Dt=
tyS0,115200n8 printk.time=3D1'

QEMU 3.1.0 monitor - type 'help' for more information
(qemu)=20
DEBUG: Waiting at most 1000 seconds for login banner (01/02/19 16:46:40)
DEBUG: Connection from 127.0.0.1:53454
DEBUG: Reached login banner in 83.91195774078369 seconds (01/02/19 16:48:04=
)
DEBUG: Couldn't login into serial console as root using blank password
DEBUG: The output:
 root
=1B7=1B[r
=1B[6n<<< run_serial(): command timed out after 5 seconds without output >>=
>



