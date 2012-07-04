Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1SmR68-0006Cj-76
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 17:02:32 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 04 Jul 2012 07:50:22 -0700
Received: by lbbgj3 with SMTP id gj3so9305870lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2012 07:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=zBdh8CkHxJCrX+jJPU5MQ9s+rICoSEPB+dyhjqHm1RA=;
	b=NFEV97BpXyTHT9mXx7LuwxuvOpPFoAMs6YE4/+p/QQemBOkp4DghZJMSsdi3YnogiQ
	1oCydYteiBwLly1REm0Hrh+WvcVTbsFvp+PLLS04qD8uDNYPxcXnLK6ezLdzyuIgVhUH
	JlXD4cWw79wmubdcu90CBouMeSwUAjFHGUNywEKSDC6k6mW5X1o9cMZMM9xpdWjF9pgb
	sWhY1GaUQ6xpqA6BeamlD5Skzq7tvEkbrbDtWejKs8VdGGhc5gQV8FmIkqbdRNdtwwwj
	cRzKRokiAGZdiDiLhdpqzuFmyDkglgUT6XwR5yRzmyw2pl+zFfa/B4ief35M68Oh4io8
	om7w==
MIME-Version: 1.0
Received: by 10.112.49.227 with SMTP id x3mr10256072lbn.73.1341413420774; Wed,
	04 Jul 2012 07:50:20 -0700 (PDT)
Received: by 10.112.38.132 with HTTP; Wed, 4 Jul 2012 07:50:20 -0700 (PDT)
In-Reply-To: <1341413143.3906.31.camel@ted>
References: <CAJ2CSBsPhAtmpoTpBRzfqghV6tnRQXmjpcY415h=XfXtHxQzHQ@mail.gmail.com>
	<4FF453EC.8030007@linux.intel.com> <1341413143.3906.31.camel@ted>
Date: Wed, 4 Jul 2012 17:50:20 +0300
Message-ID: <CAJ2CSBuRsmRDCaj5oY8xToURc3GkCJzRj8y6auzTUxA32AZBMQ@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmKFkKKNQJFN5lysEikOltbmAuAyFwXT3v5BxSj+Vo991p7t03dxD58avdbYWL7R0yO2SIN
Subject: Re: gcc errors while building core-image-sato-sdk
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
X-List-Received-Date: Wed, 04 Jul 2012 15:02:32 -0000
Content-Type: multipart/alternative; boundary=bcaec554dd3671361604c4022622

--bcaec554dd3671361604c4022622
Content-Type: text/plain; charset=ISO-8859-1

The question wasn't why it fails, but why sometimes it goes through, why
sometimes fail, and why is it retriggered
without any changes to the config or files (run 5 times the
core-image-sato-sdk build in a row, and at least once it will fail).

I don't trust systems that are not deterministic :).

This being said:

grep -C5 -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation'
/home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/build.i586-poky-linux.i586-poky-linux/gcc/config.log
| return ldopen ();
|   ;
|   return 0;
| }
configure:8836: i586-poky-linux-gcc  -m32   -march=i586
--sysroot=/home/ddalex/ssd/yocto/build/tmp/sysroots/qemux86 -o conftest
-pipe -g -feliminate-unused-debug-types   -Wl,-O1 -Wl,--hash-style=gnu
-Wl,--as-needed conftest.c -L/usr/lib/cmplrs/cc2.11 -lmld >&5
/home/ddalex/ssd/yocto/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.7.2/ld:
warning: library search path "/usr/lib/cmplrs/cc2.11" is unsafe for
cross-compilation
/home/ddalex/ssd/yocto/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.7.2/ld:
cannot find -lmld
collect2: error: ld returned 1 exit status
configure:8836: $? = 1
configure: failed program was:
| /* confdefs.h */
--
| return ldopen ();
|   ;
|   return 0;
| }
configure:8836: i586-poky-linux-gcc  -m32   -march=i586
--sysroot=/home/ddalex/ssd/yocto/build/tmp/sysroots/qemux86 -o conftest
-pipe -g -feliminate-unused-debug-types   -Wl,-O1 -Wl,--hash-style=gnu
-Wl,--as-needed conftest.c -L/usr/lib/cmplrs/cc3.11 -lmld >&5
/home/ddalex/ssd/yocto/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.7.2/ld:
warning: library search path "/usr/lib/cmplrs/cc3.11" is unsafe for
cross-compilation
/home/ddalex/ssd/yocto/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.7.2/ld:
cannot find -lmld
collect2: error: ld returned 1 exit status
configure:8836: $? = 1
configure: failed program was:
| /* confdefs.h */


On Wed, Jul 4, 2012 at 5:45 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2012-07-04 at 17:32 +0300, Mihai Lindner wrote:
> > On 7/4/2012 3:55 PM, Damian, Alexandru wrote:
> > > Hi guys,
> > >
> > > From time to time I get errors building gcc (although I didn't trigger
> a rebuild!) when runnign
> > > bitbake core-image-sato-sdk
> > >
> > > The error is attached:
> > >
> /home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/gcc-4.7.1+svnr188658-r2/temp/log.do_configure.20668
> > >
> > > What is causing this, is this a know bug ?
> > >
> > > Cheers,
> > > Alex
> > >
> > >
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> > >
> >
> > To get a hint on why it fails, check
> > in /home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/gcc-4.7.1
> >
> +svnr188658-r2/gcc-4_7-branch/build.i586-poky-linux.i586-poky-linux/gcc/config.log
> if there's "CROSS COMPILE Badness:" or "is unsafe for cross-compilation".
> >
> > #$ grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for
> > cross-compilation'
> /home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/build.i586-poky-linux.i586-poky-linux/gcc/config.log
> >
> > `bitbake` will fail if `grep` has results.
>
> It might be slightly more complex than this. gcc is ugly in that the
> compile task executes a ton of separate configure processes and it could
> be tripping up on the above expression on any one of those config.log
> files.
>
> Once you find the config.log, report back on which one it is and what
> the message says and then we can work through how to fix it.
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec554dd3671361604c4022622
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

The question wasn&#39;t why it fails, but why sometimes it goes through, wh=
y sometimes fail, and why is it retriggered<br>without any changes to the c=
onfig or files (run 5 times the core-image-sato-sdk build in a row, and at =
least once it will fail).<br>
<br>I don&#39;t trust systems that are not deterministic :).<br><br>This be=
ing said:<br><br>grep -C5 -e &#39;CROSS COMPILE Badness:&#39; -e &#39;is un=
safe for cross-compilation&#39; /home/ddalex/ssd/yocto/build/tmp/work/i586-=
poky-linux/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/build.i586-poky-linux.i58=
6-poky-linux/gcc/config.log<br>
| return ldopen ();<br>|=A0=A0 ;<br>|=A0=A0 return 0;<br>| }<br>configure:8=
836: i586-poky-linux-gcc=A0 -m32=A0=A0 -march=3Di586 --sysroot=3D/home/ddal=
ex/ssd/yocto/build/tmp/sysroots/qemux86 -o conftest -pipe -g -feliminate-un=
used-debug-types=A0=A0 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed conft=
est.c -L/usr/lib/cmplrs/cc2.11 -lmld &gt;&amp;5<br>
/home/ddalex/ssd/yocto/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-pok=
y-linux/gcc/i586-poky-linux/4.7.2/ld: warning: library search path &quot;/u=
sr/lib/cmplrs/cc2.11&quot; is unsafe for cross-compilation<br>/home/ddalex/=
ssd/yocto/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i=
586-poky-linux/4.7.2/ld: cannot find -lmld<br>
collect2: error: ld returned 1 exit status<br>configure:8836: $? =3D 1<br>c=
onfigure: failed program was:<br>| /* confdefs.h */<br>--<br>| return ldope=
n ();<br>|=A0=A0 ;<br>|=A0=A0 return 0;<br>| }<br>configure:8836: i586-poky=
-linux-gcc=A0 -m32=A0=A0 -march=3Di586 --sysroot=3D/home/ddalex/ssd/yocto/b=
uild/tmp/sysroots/qemux86 -o conftest -pipe -g -feliminate-unused-debug-typ=
es=A0=A0 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed conftest.c -L/usr/l=
ib/cmplrs/cc3.11 -lmld &gt;&amp;5<br>
/home/ddalex/ssd/yocto/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-pok=
y-linux/gcc/i586-poky-linux/4.7.2/ld: warning: library search path &quot;/u=
sr/lib/cmplrs/cc3.11&quot; is unsafe for cross-compilation<br>/home/ddalex/=
ssd/yocto/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i=
586-poky-linux/4.7.2/ld: cannot find -lmld<br>
collect2: error: ld returned 1 exit status<br>configure:8836: $? =3D 1<br>c=
onfigure: failed program was:<br>| /* confdefs.h */<br><br><br><div class=
=3D"gmail_quote">On Wed, Jul 4, 2012 at 5:45 PM, Richard Purdie <span dir=
=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, 2012-07-04 at 17:3=
2 +0300, Mihai Lindner wrote:<br>
&gt; On 7/4/2012 3:55 PM, Damian, Alexandru wrote:<br>
&gt; &gt; Hi guys,<br>
&gt; &gt;<br>
&gt; &gt; From time to time I get errors building gcc (although I didn&#39;=
t trigger a rebuild!) when runnign<br>
&gt; &gt; bitbake core-image-sato-sdk<br>
&gt; &gt;<br>
&gt; &gt; The error is attached:<br>
&gt; &gt; /home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/gcc-4.7.1+s=
vnr188658-r2/temp/log.do_configure.20668<br>
&gt; &gt;<br>
&gt; &gt; What is causing this, is this a know bug ?<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt; Alex<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Opene=
mbedded-core@lists.openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/op=
enembedded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailm=
an/listinfo/openembedded-core</a><br>
&gt; &gt;<br>
&gt;<br>
&gt; To get a hint on why it fails, check<br>
&gt; in /home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/gcc-4.7.1<br>
&gt; +svnr188658-r2/gcc-4_7-branch/build.i586-poky-linux.i586-poky-linux/gc=
c/config.log if there&#39;s &quot;CROSS COMPILE Badness:&quot; or &quot;is =
unsafe for cross-compilation&quot;.<br>
&gt;<br>
&gt; #$ grep -e &#39;CROSS COMPILE Badness:&#39; -e &#39;is unsafe for<br>
&gt; cross-compilation&#39; /home/ddalex/ssd/yocto/build/tmp/work/i586-poky=
-linux/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/build.i586-poky-linux.i586-po=
ky-linux/gcc/config.log<br>
&gt;<br>
&gt; `bitbake` will fail if `grep` has results.<br>
<br>
</div>It might be slightly more complex than this. gcc is ugly in that the<=
br>
compile task executes a ton of separate configure processes and it could<br=
>
be tripping up on the above expression on any one of those config.log<br>
files.<br>
<br>
Once you find the config.log, report back on which one it is and what<br>
the message says and then we can work through how to fix it.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br>

--bcaec554dd3671361604c4022622--
