Return-Path: <rewitt@declaratino.com>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Aug 2015 02:40:49 UTC
Received: from p3plsmtpa06-10.prod.phx3.secureserver.net
	(p3plsmtpa06-10.prod.phx3.secureserver.net [173.201.192.111])
	by mail.openembedded.org (Postfix) with ESMTP id B78F171633;
	Wed, 26 Aug 2015 02:40:49 +0000 (UTC)
Received: from mail-lb0-f181.google.com ([209.85.217.181])
	by p3plsmtpa06-10.prod.phx3.secureserver.net with 
	id 9EZe1r0013vQdcH01EZeY1; Tue, 25 Aug 2015 19:33:39 -0700
Received: by lbbtg9 with SMTP id tg9so112008529lbb.1;
	Tue, 25 Aug 2015 19:33:37 -0700 (PDT)
X-Received: by 10.152.21.231 with SMTP id y7mr25542729lae.63.1440556417768;
	Tue, 25 Aug 2015 19:33:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.206.197 with HTTP; Tue, 25 Aug 2015 19:33:08 -0700 (PDT)
In-Reply-To: <CAFeBWL4as4_aeTWOZox+V=NB_s7LriLof-sYNc04PB6vjDRBnw@mail.gmail.com>
References: <CAFeBWL6xGuzEcOR5B1sfEgZR=i-T=EZ-b-TKPT9DGZpCmDPy4g@mail.gmail.com>
	<5607133.YNgYITpZsc@peggleto-mobl.ger.corp.intel.com>
	<CAFeBWL4as4_aeTWOZox+V=NB_s7LriLof-sYNc04PB6vjDRBnw@mail.gmail.com>
From: Randy Witt <rewitt@declaratino.com>
Date: Tue, 25 Aug 2015 19:33:08 -0700
Message-ID: <CAP5N7XGHHKD7A+cWZaFyxiZR+NMrzPF0_1wW2pT-ion=T6PoXw@mail.gmail.com>
To: Adam Lee <adam.yh.lee@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Extensible SDK install errors
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
X-List-Received-Date: Wed, 26 Aug 2015 02:40:52 -0000
Content-Type: multipart/alternative; boundary=089e0158aea08f6526051e2dad7b

--089e0158aea08f6526051e2dad7b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2015 at 6:11 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:

> Thanks for your comments. I was not running the installer as root.
> I tried again and specified the install path in my home directory.
> This time it seems to have gone further, but still failed with this:
>
> "error: Can't install packagegroup-core-boot-1.0-r17.0@qemuarm: no
> package provides systemd"
>
> Perhaps I need to disable systemd from distro features?
>
>
You could do that, however there is a patch on the list to fix this kind of
problem.

http://patchwork.openembedded.org/patch/101213/

It may fix your problem until the next release comes out. I'm sorry you've
had this trouble. It was just something that was missed in the first
version of the extensible sdk.


> I will also check my user's permission to solve the permission error.
>
> On Mon, Aug 24, 2015 at 4:11 AM Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
>
>> Hi Adam,
>>
>> On Friday 21 August 2015 15:06:25 Adam Lee wrote:
>> > Hello, I built the Extensible SDK on Fido (bitbake core-image-minimal =
-c
>> > populate_sdk_ext).
>> >
>> > During the installation I get this permission error:
>> >
>> > $ ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh
>> >
>> > > Enter target directory for SDK (default: /opt/poky/1.8):
>> > > You are about to install the SDK to "/opt/poky/1.8". Proceed[Y/n]?
>> > > Extracting SDK...done
>> > > Setting it up...
>> > > Extracting buildtools...
>> > > ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh:
>> line
>> > > 148: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi:
>> Permission
>> > > denied
>> > > ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh:
>> line
>> > > 151: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi:
>> Permission
>> > > denied
>> > > ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh:
>> line
>> > > 155: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi:
>> Permission
>> > > denied
>> > > mv: cannot move =E2=80=98x86_64-nativesdk-libc.tar.bz2=E2=80=99 to
>> > > =E2=80=98/opt/poky/1.8/layers/poky/x86_64-nativesdk-libc.tar.bz2=E2=
=80=99: Permission
>> > > denied Preparing build system...
>> > > sh: 1: cannot create preparing_build_system.log: Permission denied
>> > > SDK preparation failed: see /opt/poky/1.8/preparing_build_system.log
>> >
>> >  It looks like `/opt/poky/1.8/layers/poky` directory belongs to the ro=
ot
>> > user:
>> >
>> > $ ls -l /opt/poky/1.8/layers/
>> >
>> > > total 36
>> > > drwxrwxr-x 9 root root 4096 Jun 16 10:25 meta-gnome
>> > > drwxrwxr-x 9 root root 4096 Jun 15 10:44 meta-multimedia
>> > > drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-networking
>> > > drwxrwxr-x 20 root root 4096 Jun 15 10:44 meta-oe
>> > > drwxrwxr-x 7 root root 4096 Jun 15 10:44 meta-python
>> > > drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-ruby
>> > > drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-systemd
>> > > drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-xfce
>> > > drwxrwxr-x 13 root root 4096 Aug 21 14:46 poky
>> >
>> >  I may have missed something obvious. Has anyone seen this?
>>
>> Basically you shouldn't be installing the extensible SDK as root. We
>> ought to
>> be telling you about this up front and we should have a more reasonable
>> default path - these are open bugs and patches are in review on the list
>> to fix
>> them.
>>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--089e0158aea08f6526051e2dad7b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Aug 25, 2015 at 6:11 PM, Adam Lee <span dir=3D"ltr">&lt;<a href=3D"mail=
to:adam.yh.lee@gmail.com" target=3D"_blank">adam.yh.lee@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex"><div dir=3D"ltr">Thanks for your comments.=
 I was not running the installer as root.<div>I tried again and specified t=
he install path in my home directory.</div><div>This time it seems to have =
gone further, but still failed with this:</div><div><br></div><div>&quot;er=
ror: Can&#39;t install packagegroup-core-boot-1.0-r17.0@qemuarm: no package=
 provides systemd&quot;</div><div><br></div><div>Perhaps I need to disable =
systemd from distro features?</div><div><br></div></div></blockquote><div>=
=C2=A0</div><div><div>You could do that, however there is a patch on the li=
st to fix this kind of problem.</div><div><br></div><div><a href=3D"http://=
patchwork.openembedded.org/patch/101213/">http://patchwork.openembedded.org=
/patch/101213/</a><br></div><div><br></div><div>It may fix your problem unt=
il the next release comes out. I&#39;m sorry you&#39;ve had this trouble. I=
t was just something that was missed in the first version of the extensible=
 sdk.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div dir=3D"ltr"><div>=
</div><div>I will also check my user&#39;s permission to solve the permissi=
on error.</div></div><div class=3D""><div class=3D"h5"><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr">On Mon, Aug 24, 2015 at 4:11 AM Paul Eggleton &=
lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.=
eggleton@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">Hi Adam,<=
br>
<br>
On Friday 21 August 2015 15:06:25 Adam Lee wrote:<br>
&gt; Hello, I built the Extensible SDK on Fido (bitbake core-image-minimal =
-c<br>
&gt; populate_sdk_ext).<br>
&gt;<br>
&gt; During the installation I get this permission error:<br>
&gt;<br>
&gt; $ ./<a href=3D"http://poky-glibc-x86_64-core-image-minimal-armv5e-tool=
chain-ext-1.8.sh" rel=3D"noreferrer" target=3D"_blank">poky-glibc-x86_64-co=
re-image-minimal-armv5e-toolchain-ext-1.8.sh</a><br>
&gt;<br>
&gt; &gt; Enter target directory for SDK (default: /opt/poky/1.8):<br>
&gt; &gt; You are about to install the SDK to &quot;/opt/poky/1.8&quot;. Pr=
oceed[Y/n]?<br>
&gt; &gt; Extracting SDK...done<br>
&gt; &gt; Setting it up...<br>
&gt; &gt; Extracting buildtools...<br>
&gt; &gt; ./<a href=3D"http://poky-glibc-x86_64-core-image-minimal-armv5e-t=
oolchain-ext-1.8.sh" rel=3D"noreferrer" target=3D"_blank">poky-glibc-x86_64=
-core-image-minimal-armv5e-toolchain-ext-1.8.sh</a>: line<br>
&gt; &gt; 148: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi: P=
ermission<br>
&gt; &gt; denied<br>
&gt; &gt; ./<a href=3D"http://poky-glibc-x86_64-core-image-minimal-armv5e-t=
oolchain-ext-1.8.sh" rel=3D"noreferrer" target=3D"_blank">poky-glibc-x86_64=
-core-image-minimal-armv5e-toolchain-ext-1.8.sh</a>: line<br>
&gt; &gt; 151: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi: P=
ermission<br>
&gt; &gt; denied<br>
&gt; &gt; ./<a href=3D"http://poky-glibc-x86_64-core-image-minimal-armv5e-t=
oolchain-ext-1.8.sh" rel=3D"noreferrer" target=3D"_blank">poky-glibc-x86_64=
-core-image-minimal-armv5e-toolchain-ext-1.8.sh</a>: line<br>
&gt; &gt; 155: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi: P=
ermission<br>
&gt; &gt; denied<br>
&gt; &gt; mv: cannot move =E2=80=98x86_64-nativesdk-libc.tar.bz2=E2=80=99 t=
o<br>
&gt; &gt; =E2=80=98/opt/poky/1.8/layers/poky/x86_64-nativesdk-libc.tar.bz2=
=E2=80=99: Permission<br>
&gt; &gt; denied Preparing build system...<br>
&gt; &gt; sh: 1: cannot create preparing_build_system.log: Permission denie=
d<br>
&gt; &gt; SDK preparation failed: see /opt/poky/1.8/preparing_build_system.=
log<br>
&gt;<br>
&gt;=C2=A0 It looks like `/opt/poky/1.8/layers/poky` directory belongs to t=
he root<br>
&gt; user:<br>
&gt;<br>
&gt; $ ls -l /opt/poky/1.8/layers/<br>
&gt;<br>
&gt; &gt; total 36<br>
&gt; &gt; drwxrwxr-x 9 root root 4096 Jun 16 10:25 meta-gnome<br>
&gt; &gt; drwxrwxr-x 9 root root 4096 Jun 15 10:44 meta-multimedia<br>
&gt; &gt; drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-networking<br>
&gt; &gt; drwxrwxr-x 20 root root 4096 Jun 15 10:44 meta-oe<br>
&gt; &gt; drwxrwxr-x 7 root root 4096 Jun 15 10:44 meta-python<br>
&gt; &gt; drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-ruby<br>
&gt; &gt; drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-systemd<br>
&gt; &gt; drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-xfce<br>
&gt; &gt; drwxrwxr-x 13 root root 4096 Aug 21 14:46 poky<br>
&gt;<br>
&gt;=C2=A0 I may have missed something obvious. Has anyone seen this?<br>
<br>
Basically you shouldn&#39;t be installing the extensible SDK as root. We ou=
ght to<br>
be telling you about this up front and we should have a more reasonable<br>
default path - these are open bugs and patches are in review on the list to=
 fix<br>
them.<br>
<br>
Cheers,<br>
Paul<br>
<br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</blockquote></div>
</div></div><br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div><br></div></div>

--089e0158aea08f6526051e2dad7b--
