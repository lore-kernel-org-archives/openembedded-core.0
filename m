Return-Path: <avery.brian@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 69B1B731D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 16:29:55 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id 16so123174345vko.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1naKPvi38s4DvgTQWw5flTje8iV6gTfnBZu8fjMViDc=;
	b=XuT627KNeyEGJhSq5hSYKICqtYDquoumzevLxanQJxk0N5tjyqsCCoBNW8ezr/U89C
	5gxCCUGLBXqPv5L4rcL/jrmwoEN75uADHR+j6kldHeNpBp1eaqSCAk2nUA/14xhIiWNA
	64vrIme0/F3pz2VdygF0Od9M98tsQr57kQCjbTNfkwxy5vrlWieImLsvcxkSzpLzhbLA
	ueQEah3RiB8OQUUM7USPck5diqQaTqgNZqPvBHS3cQJGCmfjvdEhelR4vxFskzMK0NQU
	A1QDUxePQHi2AMgGu1z8iYPclk/k4vdBYCTAU1DU5AL/hMU+2N7O06mUUbO3rgyQne0M
	l7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1naKPvi38s4DvgTQWw5flTje8iV6gTfnBZu8fjMViDc=;
	b=cdwWjLNHhjF+QP81oQo7rwVcAbyKvgl4GgAbzYxWdUKEEY2Kxb9FLEnNjE/5AByc78
	Hd3tYq2XIpRavRw07dOcdOKu2YXrXvQa2O3VU7vUDZK3/Mq7FBNHVY4+4Z+ALR2AfwOS
	2EJItVlxLDdoiHZF8guWDtMbAo4d1Pl8VydSS/yKKDAZmqQolvhMnoJ3d9OTeN45ULij
	vyCZyazkkoEKPgla7a3OeiHVPgkAPC8/lXh55TzaqnIlSvVU8JdkwJODWggMwT0QjY8x
	IMVwx8Ro94m+Cn+Kmzh6xkVFGCtO4cumR1u1TRY1eZ2OaWiCbhTPw6/X0EyOsBdGNIgT
	u+Ow==
X-Gm-Message-State: AE9vXwPvylmHsU9hWr/nhDz1ujVNzWeLIflVcMwVLOKR/dHoIvHAeurNtJ9V+o8ASFSdZJqKSyHLXCPxpmSssg==
X-Received: by 10.31.174.131 with SMTP id x125mr12962336vke.11.1473697795519; 
	Mon, 12 Sep 2016 09:29:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.108.18 with HTTP; Mon, 12 Sep 2016 09:29:54 -0700 (PDT)
In-Reply-To: <1473668344.4627.1.camel@linux.intel.com>
References: <cover.1473438968.git.brian.avery@intel.com>
	<aa9e2ec2a13162874be2386318dc7883676655c3.1473438968.git.brian.avery@intel.com>
	<1473668344.4627.1.camel@linux.intel.com>
From: Brian Avery <avery.brian@gmail.com>
Date: Mon, 12 Sep 2016 09:29:54 -0700
Message-ID: <CAKV_0ejK5sbRHVpA5OKg4vBw0eO3tzf4N9Jhy8KXGoyQK9iVRw@mail.gmail.com>
To: Joshua Lock <joshua.g.lock@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] qemurunner: print out the runqemu command
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
X-List-Received-Date: Mon, 12 Sep 2016 16:29:57 -0000
Content-Type: multipart/alternative; boundary=001a11467c7a9bb8f9053c520130

--001a11467c7a9bb8f9053c520130
Content-Type: text/plain; charset=UTF-8

true, you do, kind of.

This commit explicitly prints out what the runqemu cmd is (for instance
"runqemu snapshot -m 1024"), which is a lot easier to enter if you want to
rerun qemu the way the test did.

It's not a big deal, I just ended up adding it while i was trying to figure
out how the tests were getting started and where my params were ending up.
Your's prints out the long complete cmd line, mine prints out the shortcut
:).  The long one is definitely necessary. Mine is a convenience.

-b
an intel employee.

On Mon, Sep 12, 2016 at 1:19 AM, Joshua Lock <joshua.g.lock@linux.intel.com>
wrote:

> On Fri, 2016-09-09 at 09:38 -0700, bavery wrote:
> > This logs the launch command that was used for runqemu while running
> > -c
> > testimage.  This way, if I'd like to easily launch qemu manually in
> > order to debug a failed test, I know what commmand was run to create
> > the qemu instance.
>
> I already have this in my runqemu output:
>
> runqemu - INFO - Running
> /home/joshuagl/Projects/poky/build/tmp/sysroots/x86_64-
> linux/usr/bin/qemu-system-ppc -net
> tap,vlan=0,ifname=tap0,script=no,downscript=no -net nic,model=pcnet  -
> machine mac99 -cpu G4 -m 256 -drive file=/home/joshuagl/mess/35/core-
> image-lsb-qemuppc-20160902090100.rootfs.ext4,if=virtio,format=raw  -
> show-cursor -usb -usbdevice tablet -device virtio-rng-pci -kernel
> /home/joshuagl/mess/35/vmlinux-qemuppc.bin -append 'root=/dev/vda rw
> highres=off  mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0
> console=ttyS0 console=tty'
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11467c7a9bb8f9053c520130
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">true, you do, kind of.<div><br><div>This commit explicitly=
 prints out what the runqemu cmd is (for instance &quot;runqemu snapshot -m=
 1024&quot;), which is a lot easier to enter if you want to rerun qemu the =
way the test did.</div><div><br></div><div>It&#39;s not a big deal, I just =
ended up adding it while i was trying to figure out how the tests were gett=
ing started and where my params were ending up.=C2=A0 Your&#39;s prints out=
 the long complete cmd line, mine prints out the shortcut :).=C2=A0 The lon=
g one is definitely necessary. Mine is a convenience.</div><div><br></div><=
div>-b</div><div>an intel employee.</div></div></div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Mon, Sep 12, 2016 at 1:19 AM, Joshua=
 Lock <span dir=3D"ltr">&lt;<a href=3D"mailto:joshua.g.lock@linux.intel.com=
" target=3D"_blank">joshua.g.lock@linux.intel.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">On Fri, 2016-09-09 at 09:38=
 -0700, bavery wrote:<br>
&gt; This logs the launch command that was used for runqemu while running<b=
r>
&gt; -c<br>
&gt; testimage.=C2=A0=C2=A0This way, if I&#39;d like to easily launch qemu =
manually in<br>
&gt; order to debug a failed test, I know what commmand was run to create<b=
r>
&gt; the qemu instance.<br>
<br>
</span>I already have this in my runqemu output:<br>
<br>
runqemu - INFO - Running<br>
/home/joshuagl/Projects/poky/<wbr>build/tmp/sysroots/x86_64-<br>
linux/usr/bin/qemu-system-ppc -net<br>
tap,vlan=3D0,ifname=3Dtap0,script=3D<wbr>no,downscript=3Dno -net nic,model=
=3Dpcnet=C2=A0=C2=A0-<br>
machine mac99 -cpu G4 -m 256 -drive file=3D/home/joshuagl/mess/35/<wbr>core=
-<br>
image-lsb-qemuppc-<wbr>20160902090100.rootfs.ext4,if=3D<wbr>virtio,format=
=3Draw=C2=A0=C2=A0-<br>
show-cursor -usb -usbdevice tablet -device virtio-rng-pci -kernel<br>
/home/joshuagl/mess/35/<wbr>vmlinux-qemuppc.bin -append &#39;root=3D/dev/vd=
a rw<br>
highres=3Doff=C2=A0=C2=A0mem=3D256M ip=3D<a href=3D"http://192.168.7.2">192=
.168.7.2</a>::<a href=3D"http://192.168.7.1">192.168.7.1</a>:<wbr>255.255.2=
55.0<br>
console=3DttyS0 console=3Dtty&#39;<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a11467c7a9bb8f9053c520130--
