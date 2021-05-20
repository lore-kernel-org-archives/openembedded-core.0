Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web10.253.1621542599577020493
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fwB3VdGa;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id f1so5929451uaj.10
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OBRCftINKcQH07xuvoNM6sbKeheUHd7kKHZ42hA/3SU=;
        b=fwB3VdGaWQJobeDpANpoiPZ3eSh7JX+JMtc5HPCAI40jhR+iuoWI6EkbdsmKQjylvo
         Q4neOffvgPkFuADXtTBCuNGWwXRpLBmx0P/rzR4GgMrtyVrOvvUOVVA2xKiMlLZSqVqx
         DRitI+AS3KaO/f0kn6VdVdEO8oMK98fpOhe7Plf74z/LhS1QX85Ikbpb6Qu7lUNNMHXn
         cs3OIc+zmwWnIIVWYzXh4vUceHLEfqnaZ6ToywGo2iNkR0Ayd/n9plWAOD0NnMgvyl7t
         jOxsD/9SNIHTItSJ5f6gbAIl9SJSJ0zdyd5UtLMJBMRYuFrdki7YY33iWKdO8Fw2PTF0
         8cLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OBRCftINKcQH07xuvoNM6sbKeheUHd7kKHZ42hA/3SU=;
        b=Soh2oLydwxQ+DL0sSPdzVWdEkF5gQIyJdgHiKJNeTV+cI0GKh6zU3Mp8c7tyAFGt0L
         tDGc4ybYvpGK7kIqjQ7Pc9YsLfPRj+HdjkbdGejbrG2ryKiSxOBd3i+WGO6VaAS4MIDS
         8CzRPZHDIQWsXa9gVoHj3/HD6WKWJfZNboDMTz1SifYIFGX71GwrCtD+Ub/43HpSCLc9
         r6BiHBK/yJhxK09IdBz8sZmbcTWwPeyp0vQZ6+D67kS37z/sHb6coZiWVhmULjG5g9s5
         j3Xh7SWqI9dpXGyglck0BxrxKUrjwsDWzTD6Ye0iXninTMlN3Obhmtpc+xyf5Z1nFFy4
         PMOg==
X-Gm-Message-State: AOAM5300e90eSeeSYolwBp8RSCJsw7jsy0tZw0JcOUEl2QdgKntDQvC3
	140mts4EQJiVjh9z29KOFI09a00cwBw9NotcjDo=
X-Google-Smtp-Source: ABdhPJzfbjh7AITTp8BoGr6ptNefStpvSSrIXY7zpbeVclT05xOgGPEsQVNUBvWOUAiYZ5TUMJqI+Vfi93/Zk/H8JnU=
X-Received: by 2002:ab0:742:: with SMTP id h60mr6268810uah.89.1621542598717;
 Thu, 20 May 2021 13:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com> <20210517103528.24434-6-vinay.m.engg@gmail.com>
 <CANNYZj8jNE92Ct9541GmLzmmNwgrJ2UOEC4=jQstwyi12PBMpw@mail.gmail.com>
 <CANUMPcWJiKAKbw=UHkPd=T3TzTt4fmNwTya6hMZRbewUXdL2wQ@mail.gmail.com>
 <CANNYZj9C0DRCtsMjfr7DDTBqzSJpHSY+FGYx7-Sn2i5kdqNCUw@mail.gmail.com>
 <CANUMPcVaW7vKKwW5cfvu2ETgcrWb70qdAFpCuiD8J8KNoAjjNQ@mail.gmail.com>
 <CANNYZj9OeUc73=xf+F5qub-T4Fr6msvWTpshN=XubL-mL2j5UQ@mail.gmail.com>
 <CANUMPcUs_sUnzH_9XPU_mKsUJrbx5cA2PXUug0Yusf+ze6cpAw@mail.gmail.com>
 <167FE427910432AF.29970@lists.openembedded.org> <CANUMPcWrQtocibdLawMmt30eQkYiC5NLAj+MhnfUs8ozgoHOMA@mail.gmail.com>
In-Reply-To: <CANUMPcWrQtocibdLawMmt30eQkYiC5NLAj+MhnfUs8ozgoHOMA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 20 May 2021 22:29:47 +0200
Message-ID: <CANNYZj88moczJGrTH_s3DAvR5P21aGui-yPfPst3mgySEcDj3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 6/7] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="00000000000095b94305c2c8cedf"

--00000000000095b94305c2c8cedf
Content-Type: text/plain; charset="UTF-8"

You cannot hardcode the ip address like that; it's set dynamically when
qemu starts, and you can only access it from selftest or runtime test.

Alex

On Thu, 20 May 2021 at 12:06, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> Hi Alex,
>
> Tried your suggestions to copy and run in rust.py without any issue as
> below.
> ===============================
> builddir = get_bb_var("B", "rust-testsuite")
> ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user="root", timeout=600)
> ssh.copy_to(builddir + "/" +
> "build/x86_64-unknown-linux-gnu/stage2-tools-bin/remote-test-server","~/")
> t_thread = threading.Thread(target=ssh.run,
> args=("~/remote-test-server -v remote",))
> t_thread.start()
> ===============================
>
> If we set "TEST_DEVICE_ADDR" in rust.py through "runCmd" as shown
> below,  the remote-test-client does not connect  to the image.
> So a lot of tests fail.
> ===============================
> "cmd  = "export TEST_DEVICE_ADDR=%s:12345;" % qemu.ip"
> runCmd(cmd)
> bitbake("{} -c check".format(recipe))
> ===============================
>
> Also, I tried to move do_check content to rust.py without any success.
> ===============================
> cmd = "export PATH=%s/../recipe-sysroot-native/usr/lib/rustlib/:" %
> builddir
> cmd= cmd + "%s/../recipe-sysroot-native/usr/bin:$PATH;" % builddir
> cmd = cmd + "export
> RUST_TARGET_PATH=%s/../recipe-sysroot-native/usr/lib/rustlib/;" %
> builddir
> cmd = cmd + "cd " + builddir + ";"
> cmd  = "export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
> cmd = cmd + "python3 src/bootstrap/bootstrap.py -j 40 --verbose test
> --no-fail-fast --bless --target aarch64-poky-linux > summary.txt 2>&1"
>
> Error:
> File
> "/ala-lpggp31/vinay/review-2/poky-contrib/meta/lib/oeqa/utils/commands.py",
> line 210, in runCmd
> raise AssertionError("Command '%s' returned non-zero exit status
> %d:\n%s" % (command, result.status, exc_output))
> AssertionError: Command 'export
> TEST_DEVICE_ADDR="192.168.7.2:12345";python3
> src/bootstrap/bootstrap.py -j 40 --verbose test --no-fail-fast --bless
> --target aarch64-poky-linux > summary.txt 2>&1' returned non-zero exit
> status 2:
> ===============================
>
> So in rust.py only copy and execution of "remote-test-server" is taken
> care of.
> And the test execution is by  do_check of rust-testsuite.inc as below,
> ===============================
> do_check () {
>     export TEST_DEVICE_ADDR="192.168.7.2:12345"
>     rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" >
> summary.txt 2> /dev/null
> }
>
> Let me know if this ok. will send patches with changes for review.
>
> Regards,
> Vinay
>
> On Mon, May 17, 2021 at 8:57 PM Vinay Kumar via lists.openembedded.org
> <vinay.m.engg=gmail.com@lists.openembedded.org> wrote:
> >
> > Hi Alex,
> >
> > Tried testing outside oe-selftest framework, it works fine without any
> errors,
> >
> > export TEST_DEVICE_ADDR="192.168.7.4:12345"
> > rust_runx test --no-fail-fast --bless --target "aarch64-poky-linux" >
> > summary.txt 2> /dev/null
> >
> > Also, log (summary.txt) shows "remote-test-client" is connecting to
> > the image without any issue.
> > =======================================
> > running:
> "/ala-lpggp31/vinay/review-2/b1/tmp/work/cortexa57-poky-linux/rust-testsuite/1.46.0-r0/rustc-1.46.0-src/build/x86_64-unknown-linux-gnu/stage0-tools-bin/remote-test-client"
> > "spawn-emulator" "aarch64-poky-linux"
> >
> "/ala-lpggp31/vinay/review-2/b1/tmp/work/cortexa57-poky-linux/rust-testsuite/1.46.0-r0/rustc-1.46.0-src/build/x86_64-unknown-linux-gnu/stage0-tools-bin/remote-test-server"
> >
> "/ala-lpggp31/vinay/review-2/b1/tmp/work/cortexa57-poky-linux/rust-testsuite/1.46.0-r0/rustc-1.46.0-src/build/tmp"
> > Connecting to remote device 192.168.7.4:12345 ...
> >
> > Will integrate these changes in oe-selftest and let you know.
> >
> > Regards,
> > Vinay
> >
> > On Mon, May 17, 2021 at 8:11 PM Vinay Kumar <vinay.m.engg@gmail.com>
> wrote:
> > >
> > > Checking suggestions, the booted image with tap seems to be working by
> > > passing "-monitor  telnet:127.0.0.1:1234,server,nowait"
> > > so I will execute testing and update you.
> > > ==========================
> > > root@qemuarm64:~# ifconfig
> > > eth0      Link encap:Ethernet  HWaddr 52:54:00:12:34:02
> > >           inet addr:192.168.7.4  Bcast:192.168.7.255
> Mask:255.255.255.0
> > >           inet6 addr: fe80::5054:ff:fe12:3402/64 Scope:Link
> > >           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
> > >           RX packets:116 errors:0 dropped:0 overruns:0 frame:0
> > >           TX packets:98 errors:0 dropped:0 overruns:0 carrier:0
> > >           collisions:0 txqueuelen:1000
> > >           RX bytes:945121 (922.9 KiB)  TX bytes:9529 (9.3 KiB)
> > >
> > > root@qemuarm64:~# ./remote-test-server -v remote
> > > starting test server
> > > listening on 0.0.0.0:12345!
> > > ==========================
> > >
> > > Regards,
> > > Vinay
> > >
> > > On Mon, May 17, 2021 at 8:02 PM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > > >
> > > > Thanks, can you please look into the error? The line where it
> happens and the way to get a backtrace is right there :)
> > > > There's no reason it shouldn't work.
> > > >
> > > > Alex
> > > >
> > > > On Mon, 17 May 2021 at 15:21, Vinay Kumar <vinay.m.engg@gmail.com>
> wrote:
> > > >>
> > > >> Hi Alex,
> > > >>
> > > >> Error on qemu  image (ex. Aarch64) booted with tap interface.
> > > >> ===========================
> > > >> root@qemuarm64:~# ./remote-test-server
> > > >> starting test server
> > > >> thread 'main' panicked at 'TcpListener::bind(bind_addr) failed with
> > > >> Cannot assign requested address (os error 99)',
> > > >> src/tools/remote-test-server/src/main.rs:90:20
> > > >> note: run with `RUST_BACKTRACE=1` environment variable to display a
> backtrace
> > > >> ===========================
> > > >>
> > > >> On Mon, May 17, 2021 at 5:16 PM Alexander Kanavin
> > > >> <alex.kanavin@gmail.com> wrote:
> > > >> >
> > > >> > On Mon, 17 May 2021 at 13:34, Vinay Kumar <vinay.m.engg@gmail.com>
> wrote:
> > > >> >>
> > > >> >> "remote-test-server" on qemu-image with a tap interface throws
> an error.
> > > >> >> The emulators for rust testing are with tcp port forwarding so
> used
> > > >> >> slirp method with added rust port.
> > > >> >
> > > >> >
> > > >> > I'm not sure I understand - what kind of error? In both cases the
> server starts listening on a port, so in slirp scenario the address is
> 127.0.0.1:12345 (prone to breakage if something else on the build host
> took that port btw, including another instance of the same test), in tap it
> would be 192.168.7.2:12345. For the client you simply supply that via
> TEST_DEVICE_ADDR. No?
> > > >> >
> > > >> > Alex
> >
> > 
> >
>

--00000000000095b94305c2c8cedf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You cannot hardcode the ip address like that; it&#39;=
s set dynamically when qemu starts, and you can only access it from selftes=
t or runtime test.</div><div><br></div><div>Alex<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 20 May 20=
21 at 12:06, Vinay Kumar &lt;<a href=3D"mailto:vinay.m.engg@gmail.com">vina=
y.m.engg@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hi Alex,<br>
<br>
Tried your suggestions to copy and run in rust.py without any issue as bel=
ow.<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
builddir =3D get_bb_var(&quot;B&quot;, &quot;rust-testsuite&quot;)<br>
ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog, user=3D&quot;root&=
quot;, timeout=3D600)<br>
ssh.copy_to(builddir + &quot;/&quot; +<br>
&quot;build/x86_64-unknown-linux-gnu/stage2-tools-bin/remote-test-server&q=
uot;,&quot;~/&quot;)<br>
t_thread =3D threading.Thread(target=3Dssh.run,<br>
args=3D(&quot;~/remote-test-server -v remote&quot;,))<br>
t_thread.start()<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
<br>
If we set &quot;TEST_DEVICE_ADDR&quot; in rust.py through &quot;runCmd&quo=
t; as shown<br>
below,=C2=A0 the remote-test-client does not connect=C2=A0 to the image.<b=
r>
So a lot of tests fail.<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
&quot;cmd=C2=A0 =3D &quot;export TEST_DEVICE_ADDR=3D%s:12345;&quot; % qemu=
.ip&quot;<br>
runCmd(cmd)<br>
bitbake(&quot;{} -c check&quot;.format(recipe))<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Also, I tried to move do_check content to rust.py without any success.<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
cmd =3D &quot;export PATH=3D%s/../recipe-sysroot-native/usr/lib/rustlib/:&=
quot; % builddir<br>
cmd=3D cmd + &quot;%s/../recipe-sysroot-native/usr/bin:$PATH;&quot; % buil=
ddir<br>
cmd =3D cmd + &quot;export<br>
RUST_TARGET_PATH=3D%s/../recipe-sysroot-native/usr/lib/rustlib/;&quot; %<b=
r>
builddir<br>
cmd =3D cmd + &quot;cd &quot; + builddir + &quot;;&quot;<br>
cmd=C2=A0 =3D &quot;export TEST_DEVICE_ADDR=3D\&quot;%s:12345\&quot;;&quot=
; % qemu.ip<br>
cmd =3D cmd + &quot;python3 src/bootstrap/bootstrap.py -j 40 --verbose tes=
t<br>
--no-fail-fast --bless --target aarch64-poky-linux &gt; summary.txt 2&gt;&=
amp;1&quot;<br>
<br>
Error:<br>
File &quot;/ala-lpggp31/vinay/review-2/poky-contrib/meta/lib/oeqa/utils/co=
mmands.py&quot;,<br>
line 210, in runCmd<br>
raise AssertionError(&quot;Command &#39;%s&#39; returned non-zero exit sta=
tus<br>
%d:\n%s&quot; % (command, result.status, exc_output))<br>
AssertionError: Command &#39;export<br>
TEST_DEVICE_ADDR=3D&quot;<a href=3D"http://192.168.7.2:12345" rel=3D"noref=
errer" target=3D"_blank">192.168.7.2:12345</a>&quot;;python3<br>
src/bootstrap/bootstrap.py -j 40 --verbose test --no-fail-fast --bless<br>
--target aarch64-poky-linux &gt; summary.txt 2&gt;&amp;1&#39; returned non=
-zero exit<br>
status 2:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
<br>
So in rust.py only copy and execution of &quot;remote-test-server&quot; is=
 taken care of.<br>
And the test execution is by=C2=A0 do_check of rust-testsuite.inc as below=
,<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
do_check () {<br>
=C2=A0 =C2=A0 export TEST_DEVICE_ADDR=3D&quot;<a href=3D"http://192.168.7.=
2:12345" rel=3D"noreferrer" target=3D"_blank">192.168.7.2:12345</a>&quot;<b=
r>
=C2=A0 =C2=A0 rust_runx test --no-fail-fast --bless --target &quot;${TARGE=
T_SYS}&quot; &gt;<br>
summary.txt 2&gt; /dev/null<br>
}<br>
<br>
Let me know if this ok. will send patches with changes for review.<br>
<br>
Regards,<br>
Vinay<br>
<br>
On Mon, May 17, 2021 at 8:57 PM Vinay Kumar via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org=
</a><br>
&lt;vinay.m.engg=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Alex,<br>
&gt;<br>
&gt; Tried testing outside oe-selftest framework, it works fine without an=
y errors,<br>
&gt;<br>
&gt; export TEST_DEVICE_ADDR=3D&quot;<a href=3D"http://192.168.7.4:12345" =
rel=3D"noreferrer" target=3D"_blank">192.168.7.4:12345</a>&quot;<br>
&gt; rust_runx test --no-fail-fast --bless --target &quot;aarch64-poky-lin=
ux&quot; &gt;<br>
&gt; summary.txt 2&gt; /dev/null<br>
&gt;<br>
&gt; Also, log (summary.txt) shows &quot;remote-test-client&quot; is conne=
cting to<br>
&gt; the image without any issue.<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; running: &quot;/ala-lpggp31/vinay/review-2/b1/tmp/work/cortexa57-poky=
-linux/rust-testsuite/1.46.0-r0/rustc-1.46.0-src/build/x86_64-unknown-linux=
-gnu/stage0-tools-bin/remote-test-client&quot;<br>
&gt; &quot;spawn-emulator&quot; &quot;aarch64-poky-linux&quot;<br>
&gt; &quot;/ala-lpggp31/vinay/review-2/b1/tmp/work/cortexa57-poky-linux/ru=
st-testsuite/1.46.0-r0/rustc-1.46.0-src/build/x86_64-unknown-linux-gnu/stag=
e0-tools-bin/remote-test-server&quot;<br>
&gt; &quot;/ala-lpggp31/vinay/review-2/b1/tmp/work/cortexa57-poky-linux/ru=
st-testsuite/1.46.0-r0/rustc-1.46.0-src/build/tmp&quot;<br>
&gt; Connecting to remote device <a href=3D"http://192.168.7.4:12345" rel=
=3D"noreferrer" target=3D"_blank">192.168.7.4:12345</a> ...<br>
&gt;<br>
&gt; Will integrate these changes in oe-selftest and let you know.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Vinay<br>
&gt;<br>
&gt; On Mon, May 17, 2021 at 8:11 PM Vinay Kumar &lt;<a href=3D"mailto:vin=
ay.m.engg@gmail.com" target=3D"_blank">vinay.m.engg@gmail.com</a>&gt; wrote=
:<br>
&gt; &gt;<br>
&gt; &gt; Checking suggestions, the booted image with tap seems to be work=
ing by<br>
&gt; &gt; passing &quot;-monitor=C2=A0 telnet:<a href=3D"http://127.0.0.1:=
1234" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:1234</a>,server,nowait=
&quot;<br>
&gt; &gt; so I will execute testing and update you.<br>
&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; &gt; root@qemuarm64:~# ifconfig<br>
&gt; &gt; eth0=C2=A0 =C2=A0 =C2=A0 Link encap:Ethernet=C2=A0 HWaddr 52:54:=
00:12:34:02<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inet addr:192.168.7.4=C2=
=
=A0 Bcast:192.168.7.255=C2=A0 Mask:255.255.255.0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inet6 addr: fe80::5054:f=
f:fe12:3402/64 Scope:Link<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UP BROADCAST RUNNING MUL=
TICAST=C2=A0 MTU:1500=C2=A0 Metric:1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RX packets:116 errors:0 =
dropped:0 overruns:0 frame:0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TX packets:98 errors:0 d=
ropped:0 overruns:0 carrier:0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0collisions:0 txqueuelen:=
1000<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RX bytes:945121 (922.9 K=
iB)=C2=A0 TX bytes:9529 (9.3 KiB)<br>
&gt; &gt;<br>
&gt; &gt; root@qemuarm64:~# ./remote-test-server -v remote<br>
&gt; &gt; starting test server<br>
&gt; &gt; listening on <a href=3D"http://0.0.0.0:12345" rel=3D"noreferrer"=
 target=3D"_blank">0.0.0.0:12345</a>!<br>
&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Vinay<br>
&gt; &gt;<br>
&gt; &gt; On Mon, May 17, 2021 at 8:02 PM Alexander Kanavin<br>
&gt; &gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">=
alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks, can you please look into the error? The line where =
it happens and the way to get a backtrace is right there :)<br>
&gt; &gt; &gt; There&#39;s no reason it shouldn&#39;t work.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Alex<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, 17 May 2021 at 15:21, Vinay Kumar &lt;<a href=3D"ma=
ilto:vinay.m.engg@gmail.com" target=3D"_blank">vinay.m.engg@gmail.com</a>&g=
t; wrote:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Hi Alex,<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Error on qemu=C2=A0 image (ex. Aarch64) booted with tap=
 interface.<br>
&gt; &gt; &gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt;&gt; root@qemuarm64:~# ./remote-test-server<br>
&gt; &gt; &gt;&gt; starting test server<br>
&gt; &gt; &gt;&gt; thread &#39;main&#39; panicked at &#39;TcpListener::bin=
d(bind_addr) failed with<br>
&gt; &gt; &gt;&gt; Cannot assign requested address (os error 99)&#39;,<br>
&gt; &gt; &gt;&gt; src/tools/remote-test-server/src/main.rs:90:20<br>
&gt; &gt; &gt;&gt; note: run with `RUST_BACKTRACE=3D1` environment variabl=
e to display a backtrace<br>
&gt; &gt; &gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; On Mon, May 17, 2021 at 5:16 PM Alexander Kanavin<br>
&gt; &gt; &gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D=
"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; On Mon, 17 May 2021 at 13:34, Vinay Kumar &lt;<a h=
ref=3D"mailto:vinay.m.engg@gmail.com" target=3D"_blank">vinay.m.engg@gmail.=
com</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; &gt;&gt; &quot;remote-test-server&quot; on qemu-image w=
ith a tap interface throws an error.<br>
&gt; &gt; &gt;&gt; &gt;&gt; The emulators for rust testing are with tcp po=
rt forwarding so used<br>
&gt; &gt; &gt;&gt; &gt;&gt; slirp method with added rust port.<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; I&#39;m not sure I understand - what kind of error=
? In both cases the server starts listening on a port, so in slirp scenario=
 the address is <a href=3D"http://127.0.0.1:12345" rel=3D"noreferrer" targe=
t=3D"_blank">127.0.0.1:12345</a> (prone to breakage if something else on th=
e build host took that port btw, including another instance of the same tes=
t), in tap it would be <a href=3D"http://192.168.7.2:12345" rel=3D"noreferr=
er" target=3D"_blank">192.168.7.2:12345</a>. For the client you simply supp=
ly that via TEST_DEVICE_ADDR. No?<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; Alex<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--00000000000095b94305c2c8cedf--
