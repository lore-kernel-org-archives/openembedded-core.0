Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAW0h-0006qY-DO
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 01:36:11 +0100
Received: by lagw12 with SMTP id w12so1276032lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 17:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=arhLxEsEg3a56bw0Cwq5IDFXnx9EHWBPPo50++E8ZVM=;
	b=UgS7a/UnU83AkhPV3wm6/DDvlHyvOjVTF1sI4D6IqW1eTZoKvM0nOkz36conKVBzsy
	0QDn1YFS+xAXwrNsBKw424U6o23eabfOGww/Yx7UNGcWLOda9gwLf43QtbVaodC0vHAR
	1mDvtynAoXh2fXSQBIyL3HKhsmLbPafpxgp2gmXAwIrphUhzwtPj7ijQrCXaQYxi+tQj
	P9OtKojvpn6vM/UpFuWc8eB+lmezfJN7HVd7VPsqLjo4CtAf/ZM+TErMkzx1k3G0L6UU
	KYQR5qa5bqUJ8S2gZc/PErfdAJjHQDQcsmXq9hKof0eQaaEtN33V+Hq5OFvUxcXs5P66
	afrg==
MIME-Version: 1.0
Received: by 10.152.102.228 with SMTP id fr4mr4266293lab.23.1332376036748;
	Wed, 21 Mar 2012 17:27:16 -0700 (PDT)
Received: by 10.152.2.71 with HTTP; Wed, 21 Mar 2012 17:27:16 -0700 (PDT)
Received: by 10.152.2.71 with HTTP; Wed, 21 Mar 2012 17:27:16 -0700 (PDT)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0137B66D@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
	<20120321185216.440a6353@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
	<20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
	<20120321203249.54411613@eb-e6520>
	<20120321194906.GC3659@jama.jama.net>
	<ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
	<20120321220253.00c4f254@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B5A8@ORSMSX106.amr.corp.intel.com>
	<20120321223521.36e49bba@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B66D@ORSMSX106.amr.corp.intel.com>
Date: Wed, 21 Mar 2012 17:27:16 -0700
Message-ID: <CAMKF1sq7hcTKrzFBYgmUOTcdQw6sC1FG4jUhsfKauqeXLQMgsg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Thu, 22 Mar 2012 00:36:11 -0000
Content-Type: multipart/alternative; boundary=f46d040710ab60ade404bbc9f8bd

--f46d040710ab60ade404bbc9f8bd
Content-Type: text/plain; charset=UTF-8

On Mar 21, 2012 2:53 PM, "Kamble, Nitin A" <nitin.a.kamble@intel.com> wrote:
>
> > Hi Nitin,
> >
> > FWIW I took the i586 target sdk generated on the Fedora 16 and
> > put it on a VirtualBox VM running ubuntu 10.04.3 LTS x86_64 (2.6.32
> > kernel) and gdb still works fine.
> >
> > Eric
>
> Eric,
>  If it is working for you, I don't understand why is it not working here.
>
> [nitin@nbuild0 oecore-x86_64]$ cd /usr/local/oecore-x86_64/
> [nitin@nbuild0 oecore-x86_64]$ ls
> environment-setup-x86_64-oe-linux  site-config-x86_64-oe-linux  sysroots
 version-x86_64-oe-linux
> [nitin@nbuild0 oecore-x86_64]$ . environment-setup-x86_64-oe-linux
> [nitin@nbuild0 oecore-x86_64]$
./sysroots/x86_64-oesdk-linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-gdb
> *** glibc detected ***
./sysroots/x86_64-oesdk-linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-gdb:
double free or corruption (out): 0x00007f3226818030 ***
> Aborted (core dumped)
> [nitin@nbuild0 oecore-x86_64]$ ldd
./sysroots/x86_64-oesdk-linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-gdb
>        linux-vdso.so.1 =>  (0x00007fffd05d8000)
>        libreadline.so.6 => /lib64/libreadline.so.6 (0x0000003f07400000)
>        libdl.so.2 =>
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libdl.so.2
(0x00007fa207a72000)
>        libncurses.so.5 =>
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libncurses.so.5
(0x00007fa20784f000)
>        libtinfo.so.5 =>
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libtinfo.so.5
(0x00007fa207628000)
>        libz.so.1 => /lib64/libz.so.1 (0x0000003f06c00000)
>        libm.so.6 =>
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libm.so.6
(0x00007fa2073a5000)
>        libpthread.so.0 =>
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libpthread.so.0
(0x00007fa207188000)
>        libutil.so.1 =>
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libutil.so.1
(0x00007fa206f84000)
>        libexpat.so.1 => /lib64/libexpat.so.1 (0x0000003f09800000)
>        libc.so.6 =>
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libc.so.6
(0x00007fa206bfd000)
>
 /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/ld-linux-x86-64.so.2
=> /lib64/ld-linux-x86-64.so.2 (0x0000003f05000000)
>
>
> I am seeing that the sdk gdb is dynamically linking with some of the host
libraries as seen above.
>

I think host libs is issue here
Why is libexpat libreadline libz being used from build host

>
> Nitin
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--f46d040710ab60ade404bbc9f8bd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p><br>
On Mar 21, 2012 2:53 PM, &quot;Kamble, Nitin A&quot; &lt;<a href=3D"mailto:=
nitin.a.kamble@intel.com">nitin.a.kamble@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Hi Nitin,<br>
&gt; &gt;<br>
&gt; &gt; FWIW I took the i586 target sdk generated on the Fedora 16 and<br=
>
&gt; &gt; put it on a VirtualBox VM running ubuntu 10.04.3 LTS x86_64 (2.6.=
32<br>
&gt; &gt; kernel) and gdb still works fine.<br>
&gt; &gt;<br>
&gt; &gt; Eric<br>
&gt;<br>
&gt; Eric,<br>
&gt; =C2=A0If it is working for you, I don&#39;t understand why is it not w=
orking here.<br>
&gt;<br>
&gt; [nitin@nbuild0 oecore-x86_64]$ cd /usr/local/oecore-x86_64/<br>
&gt; [nitin@nbuild0 oecore-x86_64]$ ls<br>
&gt; environment-setup-x86_64-oe-linux =C2=A0site-config-x86_64-oe-linux =
=C2=A0sysroots =C2=A0version-x86_64-oe-linux<br>
&gt; [nitin@nbuild0 oecore-x86_64]$ . environment-setup-x86_64-oe-linux<br>
&gt; [nitin@nbuild0 oecore-x86_64]$ ./sysroots/x86_64-oesdk-linux/usr/bin/x=
86_64-oe-linux/x86_64-oe-linux-gdb<br>
&gt; *** glibc detected *** ./sysroots/x86_64-oesdk-linux/usr/bin/x86_64-oe=
-linux/x86_64-oe-linux-gdb: double free or corruption (out): 0x00007f322681=
8030 ***<br>
&gt; Aborted (core dumped)<br>
&gt; [nitin@nbuild0 oecore-x86_64]$ ldd ./sysroots/x86_64-oesdk-linux/usr/b=
in/x86_64-oe-linux/x86_64-oe-linux-gdb<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0linux-vdso.so.1 =3D&gt; =C2=A0(0x00007fffd0=
5d8000)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0libreadline.so.6 =3D&gt; /lib64/libreadline=
.so.6 (0x0000003f07400000)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0libdl.so.2 =3D&gt; /usr/local/oecore-x86_64=
/sysroots/x86_64-oesdk-linux/lib/libdl.so.2 (0x00007fa207a72000)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0libncurses.so.5 =3D&gt; /usr/local/oecore-x=
86_64/sysroots/x86_64-oesdk-linux/lib/libncurses.so.5 (0x00007fa20784f000)<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0libtinfo.so.5 =3D&gt; /usr/local/oecore-x86=
_64/sysroots/x86_64-oesdk-linux/lib/libtinfo.so.5 (0x00007fa207628000)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0libz.so.1 =3D&gt; /lib64/libz.so.1 (0x00000=
03f06c00000)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0libm.so.6 =3D&gt; /usr/local/oecore-x86_64/=
sysroots/x86_64-oesdk-linux/lib/libm.so.6 (0x00007fa2073a5000)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0libpthread.so.0 =3D&gt; /usr/local/oecore-x=
86_64/sysroots/x86_64-oesdk-linux/lib/libpthread.so.0 (0x00007fa207188000)<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0libutil.so.1 =3D&gt; /usr/local/oecore-x86_=
64/sysroots/x86_64-oesdk-linux/lib/libutil.so.1 (0x00007fa206f84000)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0libexpat.so.1 =3D&gt; /lib64/libexpat.so.1 =
(0x0000003f09800000)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0libc.so.6 =3D&gt; /usr/local/oecore-x86_64/=
sysroots/x86_64-oesdk-linux/lib/libc.so.6 (0x00007fa206bfd000)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/local/oecore-x86_64/sysroots/x86_64-oe=
sdk-linux/lib/ld-linux-x86-64.so.2 =3D&gt; /lib64/ld-linux-x86-64.so.2 (0x0=
000003f05000000)<br>
&gt;<br>
&gt;<br>
&gt; I am seeing that the sdk gdb is dynamically linking with some of the h=
ost libraries as seen above.<br>
&gt;</p>
<p>I think host libs is issue here<br>
Why is libexpat libreadline libz being used from build host</p>
<p>&gt;<br>
&gt; Nitin<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>
</p>

--f46d040710ab60ade404bbc9f8bd--
