Return-Path: <jcady92@gmail.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4C1626E808
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 00:52:54 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id k4so20505906qaq.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 16:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5FVk0fBsVZCYUa/TSPYnq+fdTmlTAPt2FBFD0M/t5SE=;
	b=i87qFPSWriEuNmGW1sOgGFI5I5hxRq70REKpJ/UcxrXeA7iCFQAG9SEwaT+pLN/N0l
	9oeRohcmwO1byHIbac5SKKtNhXqGxzFzQzKO3fWpc9DbyKRS3fHG7Q3yvQydiJpYGUaL
	9TJAopr1WH396v78gVqtPUxT5FtTLxuJMDFWYYcRSuHGHHQ/2V2uAfa8zIiMMDLeeRN7
	xOCvc6cjusgsSK+KNQjtEYovn/lGJaxMjszI7XTJ5CX5NJ16f6GF7d1Jzn+fOxO6yldv
	aaEN+trfG4JGEfbpwl/bebtCkB58cdJHX9S0O+vtF2mouID76friWjcy6GdW1G8DNeDZ
	Y1Hw==
X-Received: by 10.140.23.52 with SMTP id 49mr23315643qgo.17.1392511974850;
	Sat, 15 Feb 2014 16:52:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.46.3 with HTTP; Sat, 15 Feb 2014 16:52:33 -0800 (PST)
In-Reply-To: <A0921DE9-1EB3-4D7D-9D96-9092A7579041@gmail.com>
References: <CANP1U1xG6AkomoUcvm=chpQ=G7HY7ruFQRgYA5We6UsoFxvBLQ@mail.gmail.com>
	<A0921DE9-1EB3-4D7D-9D96-9092A7579041@gmail.com>
From: Jay Cady <jcady92@gmail.com>
Date: Sat, 15 Feb 2014 19:52:33 -0500
Message-ID: <CANP1U1z1d5CDar_NLDmnVX+EZJYfMnxbATip1_ejfe4E18pFVQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problem with libicudata.so in OE master
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
X-List-Received-Date: Sun, 16 Feb 2014 00:52:55 -0000
Content-Type: multipart/alternative; boundary=001a11c148369b644304f27b7594

--001a11c148369b644304f27b7594
Content-Type: text/plain; charset=ISO-8859-1

Hey, thanks for the reply!

I tried it out and wasn't able to boot the image.  Here is the output of
the boot when it failed:

[    3.230529] Freeing init memory: 180K
INIT: version 2.88 booting
INIT: Entering runlevel: 5
INIT: cannot execute "/etc/init.d/rc"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT:
cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT:
cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: Id "mxc0" respawning too fast: disabled for 5 minutes
INIT: cannot execute "/sbin/getty"
INIT: cannot execute "/sbin/getty"
INIT: Id "1" respawning too fast: disabled for 5 minutes
INIT: no more processes left in this runlevel

Any ideas why this is happening?  Perhaps I installed the patch incorrectly?


On Sat, Feb 15, 2014 at 5:14 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Hi
>
> can you try this patch
>
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/icu&id=07ff1b539a62053c6d41cd2814e8d0bca1991a63
>
> and report back
>
> -Khem
>
>
>
> On Feb 15, 2014, at 9:57 AM, Jay Cady <jcady92@gmail.com> wrote:
>
> I'm having the exact same problem.
>
> Latest master branch of Yocto 1.5 2/13/14.  Built with the master branch
> of meta-qt5.  Wandboard-dual.
>
> When running the Qt5_CinematicExperience app, I'm getting this error:
>
> shared libraries: /usr/lib/libicudata.so.51: internal error
>
> Any ideas how to fix this?
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

--001a11c148369b644304f27b7594
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey, thanks for the reply!</div><div><br></div>I trie=
d it out and wasn&#39;t able to boot the image. =A0Here is the output of th=
e boot when it failed:<div><br></div><div><div>[ =A0 =A03.230529] Freeing i=
nit memory: 180K</div>


<div>INIT: version 2.88 booting</div><div>INIT: Entering runlevel: 5</div><=
div>INIT: cannot execute &quot;/etc/init.d/rc&quot;</div><div>INIT: cannot =
execute &quot;/sbin/getty&quot;</div><div>INIT: cannot execute &quot;/sbin/=
getty&quot;</div>


<div>INIT:</div><div>cannot execute &quot;/sbin/getty&quot;</div><div>INIT:=
 cannot execute &quot;/sbin/getty&quot;</div><div>INIT: cannot execute &quo=
t;/sbin/getty&quot;</div><div>INIT: cannot execute &quot;/sbin/getty&quot;<=
/div>


<div>INIT: cannot execute &quot;/sbin/getty&quot;</div><div>INIT:</div><div=
>cannot execute &quot;/sbin/getty&quot;</div><div>INIT: cannot execute &quo=
t;/sbin/getty&quot;</div><div>INIT: cannot execute &quot;/sbin/getty&quot;<=
/div>


<div>INIT: cannot execute &quot;/sbin/getty&quot;</div><div>INIT: cannot ex=
ecute &quot;/sbin/getty&quot;</div><div>INIT: cannot execute &quot;/sbin/ge=
tty&quot;</div><div>INIT: Id &quot;mxc0&quot; respawning too fast: disabled=
 for 5 minutes</div>


<div>INIT: cannot execute &quot;/sbin/getty&quot;</div><div>INIT: cannot ex=
ecute &quot;/sbin/getty&quot;</div><div>INIT: Id &quot;1&quot; respawning t=
oo fast: disabled for 5 minutes</div><div>INIT: no more processes left in t=
his runlevel</div>


</div><div><br></div><div>Any ideas why this is happening? =A0Perhaps I ins=
talled the patch incorrectly?</div><div class=3D"gmail_extra"><br><br><div =
class=3D"gmail_quote">On Sat, Feb 15, 2014 at 5:14 PM, Khem Raj <span dir=
=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div style=3D"word-wrap:break-word">Hi<div><=
br></div><div>can you try this patch</div><div><br></div><div><a href=3D"ht=
tp://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/icu&am=
p;id=3D07ff1b539a62053c6d41cd2814e8d0bca1991a63" target=3D"_blank">http://g=
it.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/icu&amp;id=
=3D07ff1b539a62053c6d41cd2814e8d0bca1991a63</a></div>


<div><br></div><div>and report back</div><div><br></div><div>-Khem</div><di=
v><br></div><div><br></div><div><br><div><div><div><div>On Feb 15, 2014, at=
 9:57 AM, Jay Cady &lt;<a href=3D"mailto:jcady92@gmail.com" target=3D"_blan=
k">jcady92@gmail.com</a>&gt; wrote:</div>


<br></div></div><blockquote type=3D"cite"><div><div><div dir=3D"ltr">I&#39;=
m having the exact same problem.<div><br></div><div>Latest master branch of=
 Yocto 1.5 2/13/14. =A0Built with the master branch of meta-qt5. =A0Wandboa=
rd-dual.</div>


<div><br></div><div>When running the Qt5_CinematicExperience app, I&#39;m g=
etting this error:</div>

<div><br></div><div>shared libraries: /usr/lib/libicudata.so.51: internal e=
rror</div><div><br></div><div>Any ideas how to fix this?</div></div></div><=
/div>
_______________________________________________<br>Openembedded-core mailin=
g list<br><a href=3D"mailto:Openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">Openembedded-core@lists.openembedded.org</a><br><a href=3D"htt=
p://lists.openembedded.org/mailman/listinfo/openembedded-core" target=3D"_b=
lank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><=
br>


</blockquote></div><br></div></div></blockquote></div><br></div></div>

--001a11c148369b644304f27b7594--
