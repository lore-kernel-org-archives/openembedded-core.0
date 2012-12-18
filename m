Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1TktAs-0006kr-Or
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 10:09:23 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 18 Dec 2012 00:53:30 -0800
Received: by mail-ie0-f197.google.com with SMTP id 16so1732012iea.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 00:53:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:x-gm-message-state;
	bh=I+az7uDANeSX1nD6ee2/dQA6b2g5mk/dAbftYTPAm4o=;
	b=CZIZxojueomNMcomM4yXCmwf24c1AqMR5DiuGOZ6CgCLd+ICM/88O1ocxeMddiLmZN
	Ek7zK7WgaCSYAqYe0ZCzCHj6jvAw3bHQPe4eNJxwWUf4fRG2hV2zrFlqo+CLRzboKHa7
	xunEwUThDFiI9P3EV3Uvu56/xtUjYp1Oeqq+SGLZEJcgYK7r1f1GIrPBw1xiZKIHElC5
	o/icsr33nwA6KUzce6w8EMnbJ/KC7/qOnp9lEByWjdUnZi8zsdthk8ptpsPHx2NDwByg
	oGz2npJHp5DCfOinHtHWuW4UOK46cIXakCN5HFow2357nkpLaVoXELlhjLMjPEZ9jMp4
	99iQ==
X-Received: by 10.42.139.74 with SMTP id f10mr1246570icu.4.1355820809510;
	Tue, 18 Dec 2012 00:53:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.139.74 with SMTP id f10mr1246564icu.4.1355820809381; Tue,
	18 Dec 2012 00:53:29 -0800 (PST)
Received: by 10.64.49.164 with HTTP; Tue, 18 Dec 2012 00:53:29 -0800 (PST)
In-Reply-To: <50CF777C.8030705@linux.intel.com>
References: <1355743753-12947-1-git-send-email-alexandru.damian@intel.com>
	<1355748923-24459-1-git-send-email-alexandru.damian@intel.com>
	<50CF510B.7040705@linux.intel.com>
	<CAJ2CSBt1amQV=Mvkmp=vXaxQbYOFewMiYw-pnm31xv28aqWN=g@mail.gmail.com>
	<50CF777C.8030705@linux.intel.com>
Date: Tue, 18 Dec 2012 10:53:29 +0200
Message-ID: <CAJ2CSBu62jciHkw=Yc-b0H90Ug6jHXweX-MdKqBRrONr9A6cwQ@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQm4hgwhQAkWPUcZCuIYPRgKfSGH9F4G/WC1MtNmQcAt8+YTrugBEqD4Cb0GEUhDZrAALAmwo4UG3LLNBPEJHcjpx86xvv22hwN/L1QGFLOQOSTcSZ3HAKw4JNSTNGYJtKTIeivNUcOT7izpB4rGRApxFbNGIhyeVlNt06tnSPqxJK/0ZEmaq8T0AVdJwc/KTNRloWdK
Cc: Damien Lespiau <damien.lespiau@intel.com>, otavio@ossystems.com.br,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] init-live: default to initrd shell if image isn't found
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
X-List-Received-Date: Tue, 18 Dec 2012 09:09:28 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e8db4b8e80e04d11ca175

--90e6ba6e8db4b8e80e04d11ca175
Content-Type: text/plain; charset=ISO-8859-1

Ok, I'll add the print. And re-submit.

Alex


On Mon, Dec 17, 2012 at 9:50 PM, Darren Hart <dvhart@linux.intel.com> wrote:

>
>
> On 12/17/2012 11:21 AM, Damian, Alexandru wrote:
> > IMHO, if the system has to fatal() here, something VERY wrong is going
> on.
> >
> > This isn't your general debug option, this is a last-resort emergency
> > rescue. I suppose that if you need to debug this, the system is so
> > problematic you need to deep-dive into it anyway.
> >
> > I suggest taking it as it is now, and fill in a bugzilla entry about
> > handling it better in initramfs-framework as it should be.
> >
>
> I mentioned the below because it is something I've had to verify on
> several occasions. It is a fairly simple add, and you have the print
> statement there anyway. If you choose to skip the extra output, I
> suppose I can send a patch to add it next time I run into it.
>
> --
> Darren
>
> > Alex
> >
> >
> > On Mon, Dec 17, 2012 at 7:06 PM, Darren Hart <dvhart@linux.intel.com
> > <mailto:dvhart@linux.intel.com>> wrote:
> >
> >
> >
> >     On 12/17/2012 04:55 AM, Alex DAMIAN wrote:
> >     > From: Alexandru DAMIAN <alexandru.damian@intel.com <mailto:
> alexandru.damian@intel.com>>
> >     >
> >     > Adds "debugshell" command line parameter for live/install images.
> >     >
> >     > If the init live fails to find and mount a root-fs image,
> >     > dumps to a shell after timeout so that the developer can figure
> >     > what's wrong.
> >     >
> >     > Timeout defaults to 30 seconds, but it can be changed as param
> >     > argument.
> >     >
> >     > Prior art in Ubuntu. Also, leaving a system stale isn't good form.
> >     >
> >     > Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com<mailto:
> alexandru.damian@intel.com>>
> >     > ---
> >     >  meta/recipes-core/initrdscripts/files/init-live.sh |   18
> +++++++++++++++++-
> >     >  1 file changed, 17 insertions(+), 1 deletion(-)
> >     >
> >     > diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh
> b/meta/recipes-core/initrdscripts/files/init-live.sh
> >     > index c591f0d..d99a8ea 100644
> >     > --- a/meta/recipes-core/initrdscripts/files/init-live.sh
> >     > +++ b/meta/recipes-core/initrdscripts/files/init-live.sh
> >     > @@ -45,7 +45,13 @@ read_args() {
> >     >                      console_params=$arg
> >     >                  else
> >     >                      console_params="$console_params $arg"
> >     > -                fi
> >     > +                fi ;;
> >     > +            debugshell*)
> >     > +                if [ -z "$optarg" ]; then
> >     > +                        shelltimeout=30
> >     > +                else
> >     > +                        shelltimeout=$optarg
> >     > +                fi
> >     >          esac
> >     >      done
> >     >  }
> >     > @@ -75,6 +81,7 @@ early_setup
> >     >  read_args
> >     >
> >     >  echo "Waiting for removable media..."
> >     > +C=0
> >     >  while true
> >     >  do
> >     >    for i in `ls /media 2>/dev/null`; do
> >     > @@ -90,6 +97,15 @@ do
> >     >    if [ "$found" = "yes" ]; then
> >     >        break;
> >     >    fi
> >     > +  # don't wait for more than $shelltimeout seconds, if it's set
> >     > +  if [ -n "$shelltimeout" ]; then
> >     > +      echo -n " " $(( $shelltimeout - $C ))
> >     > +      if [ $C -ge $shelltimeout ]; then
> >     > +           echo "..."
> >     > +           fatal "Cannot find root image on media, dropping to
> shell "
> >
> >     I'd recommend being explicity about what it is looking for when
> >     debugshell is used. Which devices where probed, what was the file it
> >     looked for. Save the developer from having to find this script in the
> >     repository and look it up.
> >
> >     --
> >     Darren
> >
> >     > +      fi
> >     > +      C=$(( C + 1 ))
> >     > +  fi
> >     >    sleep 1
> >     >  done
> >     >
> >     >
> >
> >     --
> >     Darren Hart
> >     Intel Open Source Technology Center
> >     Yocto Project - Technical Lead - Linux Kernel
> >
> >
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Technical Lead - Linux Kernel
>

--90e6ba6e8db4b8e80e04d11ca175
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ok, I&#39;ll add the print. And re-submit.<div><br></div><div>Alex</div><di=
v class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon, Dec 17, =
2012 at 9:50 PM, Darren Hart <span dir=3D"ltr">&lt;<a href=3D"mailto:dvhart=
@linux.intel.com" target=3D"_blank">dvhart@linux.intel.com</a>&gt;</span> w=
rote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im"><br>
<br>
On 12/17/2012 11:21 AM, Damian, Alexandru wrote:<br>
&gt; IMHO, if the system has to fatal() here, something VERY wrong is going=
 on.<br>
&gt;<br>
&gt; This isn&#39;t your general debug option, this is a last-resort emerge=
ncy<br>
&gt; rescue. I suppose that if you need to debug this, the system is so<br>
&gt; problematic you need to deep-dive into it anyway.<br>
&gt;<br>
&gt; I suggest taking it as it is now, and fill in a bugzilla entry about<b=
r>
&gt; handling it better in initramfs-framework as it should be.<br>
&gt;<br>
<br>
</div>I mentioned the below because it is something I&#39;ve had to verify =
on<br>
several occasions. It is a fairly simple add, and you have the print<br>
statement there anyway. If you choose to skip the extra output, I<br>
suppose I can send a patch to add it next time I run into it.<br>
<br>
--<br>
Darren<br>
<div class=3D"im"><br>
&gt; Alex<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Dec 17, 2012 at 7:06 PM, Darren Hart &lt;<a href=3D"mailto:dvh=
art@linux.intel.com">dvhart@linux.intel.com</a><br>
</div><div class=3D"im">&gt; &lt;mailto:<a href=3D"mailto:dvhart@linux.inte=
l.com">dvhart@linux.intel.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; =A0 =A0 On 12/17/2012 04:55 AM, Alex DAMIAN wrote:<br>
</div>&gt; =A0 =A0 &gt; From: Alexandru DAMIAN &lt;<a href=3D"mailto:alexan=
dru.damian@intel.com">alexandru.damian@intel.com</a> &lt;mailto:<a href=3D"=
mailto:alexandru.damian@intel.com">alexandru.damian@intel.com</a>&gt;&gt;<b=
r>
<div class=3D"im">&gt; =A0 =A0 &gt;<br>
&gt; =A0 =A0 &gt; Adds &quot;debugshell&quot; command line parameter for li=
ve/install images.<br>
&gt; =A0 =A0 &gt;<br>
&gt; =A0 =A0 &gt; If the init live fails to find and mount a root-fs image,=
<br>
&gt; =A0 =A0 &gt; dumps to a shell after timeout so that the developer can =
figure<br>
&gt; =A0 =A0 &gt; what&#39;s wrong.<br>
&gt; =A0 =A0 &gt;<br>
&gt; =A0 =A0 &gt; Timeout defaults to 30 seconds, but it can be changed as =
param<br>
&gt; =A0 =A0 &gt; argument.<br>
&gt; =A0 =A0 &gt;<br>
&gt; =A0 =A0 &gt; Prior art in Ubuntu. Also, leaving a system stale isn&#39=
;t good form.<br>
&gt; =A0 =A0 &gt;<br>
</div>&gt; =A0 =A0 &gt; Signed-off-by: Alexandru DAMIAN &lt;<a href=3D"mail=
to:alexandru.damian@intel.com">alexandru.damian@intel.com</a> &lt;mailto:<a=
 href=3D"mailto:alexandru.damian@intel.com">alexandru.damian@intel.com</a>&=
gt;&gt;<br>

<div class=3D"HOEnZb"><div class=3D"h5">&gt; =A0 =A0 &gt; ---<br>
&gt; =A0 =A0 &gt; =A0meta/recipes-core/initrdscripts/files/init-live.sh | =
=A0 18 +++++++++++++++++-<br>
&gt; =A0 =A0 &gt; =A01 file changed, 17 insertions(+), 1 deletion(-)<br>
&gt; =A0 =A0 &gt;<br>
&gt; =A0 =A0 &gt; diff --git a/meta/recipes-core/initrdscripts/files/init-l=
ive.sh b/meta/recipes-core/initrdscripts/files/init-live.sh<br>
&gt; =A0 =A0 &gt; index c591f0d..d99a8ea 100644<br>
&gt; =A0 =A0 &gt; --- a/meta/recipes-core/initrdscripts/files/init-live.sh<=
br>
&gt; =A0 =A0 &gt; +++ b/meta/recipes-core/initrdscripts/files/init-live.sh<=
br>
&gt; =A0 =A0 &gt; @@ -45,7 +45,13 @@ read_args() {<br>
&gt; =A0 =A0 &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0console_params=
=3D$arg<br>
&gt; =A0 =A0 &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else<br>
&gt; =A0 =A0 &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0console_params=
=3D&quot;$console_params $arg&quot;<br>
&gt; =A0 =A0 &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi<br>
&gt; =A0 =A0 &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi ;;<br>
&gt; =A0 =A0 &gt; + =A0 =A0 =A0 =A0 =A0 =A0debugshell*)<br>
&gt; =A0 =A0 &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if [ -z &quot;$optarg&qu=
ot; ]; then<br>
&gt; =A0 =A0 &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0shelltim=
eout=3D30<br>
&gt; =A0 =A0 &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else<br>
&gt; =A0 =A0 &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0shelltim=
eout=3D$optarg<br>
&gt; =A0 =A0 &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi<br>
&gt; =A0 =A0 &gt; =A0 =A0 =A0 =A0 =A0esac<br>
&gt; =A0 =A0 &gt; =A0 =A0 =A0done<br>
&gt; =A0 =A0 &gt; =A0}<br>
&gt; =A0 =A0 &gt; @@ -75,6 +81,7 @@ early_setup<br>
&gt; =A0 =A0 &gt; =A0read_args<br>
&gt; =A0 =A0 &gt;<br>
&gt; =A0 =A0 &gt; =A0echo &quot;Waiting for removable media...&quot;<br>
&gt; =A0 =A0 &gt; +C=3D0<br>
&gt; =A0 =A0 &gt; =A0while true<br>
&gt; =A0 =A0 &gt; =A0do<br>
&gt; =A0 =A0 &gt; =A0 =A0for i in `ls /media 2&gt;/dev/null`; do<br>
&gt; =A0 =A0 &gt; @@ -90,6 +97,15 @@ do<br>
&gt; =A0 =A0 &gt; =A0 =A0if [ &quot;$found&quot; =3D &quot;yes&quot; ]; the=
n<br>
&gt; =A0 =A0 &gt; =A0 =A0 =A0 =A0break;<br>
&gt; =A0 =A0 &gt; =A0 =A0fi<br>
&gt; =A0 =A0 &gt; + =A0# don&#39;t wait for more than $shelltimeout seconds=
, if it&#39;s set<br>
&gt; =A0 =A0 &gt; + =A0if [ -n &quot;$shelltimeout&quot; ]; then<br>
&gt; =A0 =A0 &gt; + =A0 =A0 =A0echo -n &quot; &quot; $(( $shelltimeout - $C=
 ))<br>
&gt; =A0 =A0 &gt; + =A0 =A0 =A0if [ $C -ge $shelltimeout ]; then<br>
&gt; =A0 =A0 &gt; + =A0 =A0 =A0 =A0 =A0 echo &quot;...&quot;<br>
&gt; =A0 =A0 &gt; + =A0 =A0 =A0 =A0 =A0 fatal &quot;Cannot find root image =
on media, dropping to shell &quot;<br>
&gt;<br>
&gt; =A0 =A0 I&#39;d recommend being explicity about what it is looking for=
 when<br>
&gt; =A0 =A0 debugshell is used. Which devices where probed, what was the f=
ile it<br>
&gt; =A0 =A0 looked for. Save the developer from having to find this script=
 in the<br>
&gt; =A0 =A0 repository and look it up.<br>
&gt;<br>
&gt; =A0 =A0 --<br>
&gt; =A0 =A0 Darren<br>
&gt;<br>
&gt; =A0 =A0 &gt; + =A0 =A0 =A0fi<br>
&gt; =A0 =A0 &gt; + =A0 =A0 =A0C=3D$(( C + 1 ))<br>
&gt; =A0 =A0 &gt; + =A0fi<br>
&gt; =A0 =A0 &gt; =A0 =A0sleep 1<br>
&gt; =A0 =A0 &gt; =A0done<br>
&gt; =A0 =A0 &gt;<br>
&gt; =A0 =A0 &gt;<br>
&gt;<br>
&gt; =A0 =A0 --<br>
&gt; =A0 =A0 Darren Hart<br>
&gt; =A0 =A0 Intel Open Source Technology Center<br>
&gt; =A0 =A0 Yocto Project - Technical Lead - Linux Kernel<br>
&gt;<br>
&gt;<br>
<br>
--<br>
Darren Hart<br>
Intel Open Source Technology Center<br>
Yocto Project - Technical Lead - Linux Kernel<br>
</div></div></blockquote></div><br></div>

--90e6ba6e8db4b8e80e04d11ca175--
