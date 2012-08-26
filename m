Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sriram.sundararajan@gmail.com>) id 1T5jJQ-0004Oo-5b
	for Openembedded-core@lists.openembedded.org;
	Sun, 26 Aug 2012 22:20:00 +0200
Received: by iaky10 with SMTP id y10so6937118iak.6
	for <Openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2012 13:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bjV9HKoksnqLHRB4JG5obke5QzZnxes/P636SZ1NPiU=;
	b=KztzUE7Jv+6Arf7nx90qSjcfOsXq8SHHF7O0+OCu8jEQ+kbPELHOsBbOoMJjkSPcSy
	XPoFyJM5EqjT0kgThth4LTXS12RZwVNIOGd1tqeCqMz0zwY26VkUyATdmMLhqjYEDvpw
	J5U2yiiIxCGd34JTm4JVlToelKI/AN/USedXdAjV0KyvLc3xJ12Meoha3fad54T0diqV
	Z4H4RMg2LvmSfsatSyyJk/rptU+rnXozw+NM1oMW26zKP2FYmnoAHhBaNusGNltp56JP
	JmtPFbrs5m//tA0rfh8AZeqsaBMvKmC4bIxaVlvKfqOS5DIFnVHAK7vil8gBS7WggbGE
	I2eQ==
MIME-Version: 1.0
Received: by 10.50.159.135 with SMTP id xc7mr8245472igb.9.1346011669084; Sun,
	26 Aug 2012 13:07:49 -0700 (PDT)
Received: by 10.64.49.138 with HTTP; Sun, 26 Aug 2012 13:07:48 -0700 (PDT)
In-Reply-To: <CAMKF1spv89aD9G4cZbtYTKhX-JX38g7cCRq-+wPVBg9rTA74Rw@mail.gmail.com>
References: <CAAeFaHY83=-vvqvrs8wNTkqAvoLVidp01ZHSzVXfAW=KX0n0iQ@mail.gmail.com>
	<CAMKF1spv89aD9G4cZbtYTKhX-JX38g7cCRq-+wPVBg9rTA74Rw@mail.gmail.com>
Date: Sun, 26 Aug 2012 14:07:48 -0600
Message-ID: <CAAeFaHZsfGHww_JcPjQvA6Wpy4tq6v1R5OQrmEODzoFAqW+QFw@mail.gmail.com>
From: Sriram Sundararajan <sriram.sundararajan@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: oe-core <Openembedded-core@lists.openembedded.org>
Subject: Re: tar: This does not look like a tar archive; bzip2-native folder has empty binaries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Aug 2012 20:20:00 -0000
Content-Type: multipart/alternative; boundary=14dae9399de16638b704c830c3bc

--14dae9399de16638b704c830c3bc
Content-Type: text/plain; charset=ISO-8859-1

I'm using Ubuntu-12.04 to build.


On Sun, Aug 26, 2012 at 1:33 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Aug 26, 2012 at 11:33 AM, Sriram Sundararajan
> <sriram.sundararajan@gmail.com> wrote:
> > I was able to compile a 'core-image-minimal' on 08/23/12 without any
> issues.
> > On 08/25 however, I came across the following issue for the same (bitbake
> > core-image-minimal)
> >
> > ERROR: Function failed: Unpack failure for URL:
> > 'http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tar.bz2'. Unpack
> > command
> >
> PATH="/opt/oe/oe-core/scripts/native-intercept:/opt/oe/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/bzip2-native:blah:blah"
> > bzip2 -dc /opt/oe/oe-core/build/downloads/Python-2.7.3.tar.bz2 | tar x
> > --no-same-owner -f - failed with return value 2
> > ERROR: Logfile of failure stored in:
> >
> /opt/oe/oe-core/build/tmp-eglibc/work/x86_64-linux/python-native-2.7.3-r0.1/temp/log.do_unpack.3125
> > Log data follows:
> > | DEBUG: Executing python function do_unpack
> > | DEBUG: Executing python function base_do_unpack
> > | NOTE: Unpacking /opt/oe/oe-core/build/downloads/Python-2.7.3.tar.bz2 to
> >
> /opt/oe/oe-core/build/tmp-eglibc/work/x86_64-linux/python-native-2.7.3-r0.1/
> > | tar: This does not look like a tar archive
> > | tar: Exiting with failure status due to previous errors
> > | DEBUG: Python function base_do_unpack finished
> > | DEBUG: Python function do_unpack finished
> >
> > The bzip2-native binary files (including appropriate symlinks) were
> present
> > under tmp-eglibc/sysroots/x86_64-linux/usr/bin/bzip2-native, but were all
> > empty! I was able to copy my /bin/bz* to
> > /tmp-eglibc/sysroots/x86_64-linux/usr/bin/bzip2-native and move on.
>  Don't
> > know much about bzip2-native, but bitbake bzip2-native had no effect.
>  Both
> > my installs were performed from scratch on identical ubuntu 12.04
> installs.
> > The oe-core sources were cloned from gibhub. One on 08/23 and another on
> > 08/25. There was a checkin reference to bzip2-native for
> > python-native_2.7.3.bb about a month back according to github.
> >
> > Can anyone shed any light on why bzip tools were not compiled or
> installed
> > properly? What could've changed during these two days? I did a `find . |
> > grep bzip2-native` and saw some references to a folder
> > bzip2-native-1.0.6-r5. However, I could not find any references to
> > bzip2-full-native_1.0.6.bb or bzip2-native_1.0.6.bb. Now I'm scratching
> my
> > head and thinking where did this package come from in the first place?
> Any
> > help appreciated!
>
> what is your build host OS?
>
> >
> > Thanks
> > Sriram
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>

--14dae9399de16638b704c830c3bc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I&#39;m using Ubuntu-12.04 to build. <br><br><br><div class=3D"gmail_quote"=
>On Sun, Aug 26, 2012 at 1:33 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</s=
pan> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On S=
un, Aug 26, 2012 at 11:33 AM, Sriram Sundararajan<br>
&lt;<a href=3D"mailto:sriram.sundararajan@gmail.com">sriram.sundararajan@gm=
ail.com</a>&gt; wrote:<br>
&gt; I was able to compile a &#39;core-image-minimal&#39; on 08/23/12 witho=
ut any issues.<br>
&gt; On 08/25 however, I came across the following issue for the same (bitb=
ake<br>
&gt; core-image-minimal)<br>
&gt;<br>
&gt; ERROR: Function failed: Unpack failure for URL:<br>
&gt; &#39;<a href=3D"http://www.python.org/ftp/python/2.7.3/Python-2.7.3.ta=
r.bz2" target=3D"_blank">http://www.python.org/ftp/python/2.7.3/Python-2.7.=
3.tar.bz2</a>&#39;. Unpack<br>
&gt; command<br>
&gt; PATH=3D&quot;/opt/oe/oe-core/scripts/native-intercept:/opt/oe/oe-core/=
build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/bzip2-native:blah:blah&quot;=
<br>
&gt; bzip2 -dc /opt/oe/oe-core/build/downloads/Python-2.7.3.tar.bz2 | tar x=
<br>
&gt; --no-same-owner -f - failed with return value 2<br>
&gt; ERROR: Logfile of failure stored in:<br>
&gt; /opt/oe/oe-core/build/tmp-eglibc/work/x86_64-linux/python-native-2.7.3=
-r0.1/temp/log.do_unpack.3125<br>
&gt; Log data follows:<br>
&gt; | DEBUG: Executing python function do_unpack<br>
&gt; | DEBUG: Executing python function base_do_unpack<br>
&gt; | NOTE: Unpacking /opt/oe/oe-core/build/downloads/Python-2.7.3.tar.bz2=
 to<br>
&gt; /opt/oe/oe-core/build/tmp-eglibc/work/x86_64-linux/python-native-2.7.3=
-r0.1/<br>
&gt; | tar: This does not look like a tar archive<br>
&gt; | tar: Exiting with failure status due to previous errors<br>
&gt; | DEBUG: Python function base_do_unpack finished<br>
&gt; | DEBUG: Python function do_unpack finished<br>
&gt;<br>
&gt; The bzip2-native binary files (including appropriate symlinks) were pr=
esent<br>
&gt; under tmp-eglibc/sysroots/x86_64-linux/usr/bin/bzip2-native, but were =
all<br>
&gt; empty! I was able to copy my /bin/bz* to<br>
&gt; /tmp-eglibc/sysroots/x86_64-linux/usr/bin/bzip2-native and move on. =
=A0Don&#39;t<br>
&gt; know much about bzip2-native, but bitbake bzip2-native had no effect. =
=A0Both<br>
&gt; my installs were performed from scratch on identical ubuntu 12.04 inst=
alls.<br>
&gt; The oe-core sources were cloned from gibhub. One on 08/23 and another =
on<br>
&gt; 08/25. There was a checkin reference to bzip2-native for<br>
&gt; <a href=3D"http://python-native_2.7.3.bb" target=3D"_blank">python-nat=
ive_2.7.3.bb</a> about a month back according to github.<br>
&gt;<br>
&gt; Can anyone shed any light on why bzip tools were not compiled or insta=
lled<br>
&gt; properly? What could&#39;ve changed during these two days? I did a `fi=
nd . |<br>
&gt; grep bzip2-native` and saw some references to a folder<br>
&gt; bzip2-native-1.0.6-r5. However, I could not find any references to<br>
&gt; <a href=3D"http://bzip2-full-native_1.0.6.bb" target=3D"_blank">bzip2-=
full-native_1.0.6.bb</a> or <a href=3D"http://bzip2-native_1.0.6.bb" target=
=3D"_blank">bzip2-native_1.0.6.bb</a>. Now I&#39;m scratching my<br>
&gt; head and thinking where did this package come from in the first place?=
 Any<br>
&gt; help appreciated!<br>
<br>
</div></div>what is your build host OS?<br>
<br>
&gt;<br>
&gt; Thanks<br>
&gt; Sriram<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
&gt;<br>
</blockquote></div><br>

--14dae9399de16638b704c830c3bc--
