Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2418A78876
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 14:30:21 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id c16so812256itc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 06:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version; bh=DE6kXqcLidbHBqShVHlnPlxIlQVt4UK7XeAQHIo071E=;
	b=JihbC/YC0aV9SBl3zW22A1i1OLuY9h1Uie8OTgxjSV/rcoQ7qyEWyKLrQytEPjTpL2
	BvXr1mAfIT1MKyrhZW3m9yGxScImSyomxoFaeZYg63T0P5QVin0bP3OgpXiFRKsx3RCX
	YWWUjWaGsSKV/BCMj8WsdltvkkwkB8UQ8Uric/UHFP4/23+Zz7+nKfd5SfCF87OncAet
	T7IH9Yu6mVsK2bLndbQmJrD140fSmM4yAMBg6p8DAwMtOuyoHdVf3Ht/dVhtIY41LDQE
	Ni4VFT7WqXIiyQaMWr2ZBuho8soiKNFGfPjdaoJJgHeAYAI+rnZq+bJAwT5pH0sbnln8
	lb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version;
	bh=DE6kXqcLidbHBqShVHlnPlxIlQVt4UK7XeAQHIo071E=;
	b=t0v3VBIo0ek5O2k+2og+06TB86EEGSKu3rOo7hOixti/AM5K+23ajBOb107s71MLho
	FBUnhMjRFlDkI2ZUX1abQOjovKADXTrQajnCkze9r63mjpRp0+Yv+ejOS0V7HILDV+6w
	jPHBIXbho6+SIemr1NZCi+W2mSf6FVsffwhy0gVUF7SZ/kdfBsrf37kNQ0lJVXyyI2FH
	7HnmuEtoVEVLzyFhxUVKIUWPP0h6SNhlQgjVNU6/0s8oulaHIvQG3xJTIq6wLRvqCqtI
	Bf5pVBw14aHrKyZP6g7IwbAu/aAxo72ldUlpPSe7Z05JvjsUjONZrQA7XZvJIvCdrvNS
	fSiQ==
X-Gm-Message-State: AKwxytefyNs/rKXiJKwDifMc5pQ70ucIKxwoaaS/5D3s5XWgiK1GrJML
	zKWrg2+3oqBw8ivCsteQvDY=
X-Google-Smtp-Source: AH8x227bfT1aMU266y+FwXKeDxs8ZxW0KMBY4toq2m60fMAQHJyGRBmddcfkQ5kWKy57ZRTiBSy2hw==
X-Received: by 10.36.125.205 with SMTP id b196mr31894305itc.128.1517322623271; 
	Tue, 30 Jan 2018 06:30:23 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w142sm6158730ita.25.2018.01.30.06.30.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Jan 2018 06:30:22 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1517322622.31752.63.camel@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Tue, 30 Jan 2018 08:30:22 -0600
In-Reply-To: <CA+chaQc57j=7JQx3iNHfomkjVXmZX7Lm+yLED+xzMg7uhrVa8w@mail.gmail.com>
References: <20180130083003.39-1-Martin.Jansa@gmail.com>
	<CAJTo0LYmP0iqbm5X50FPi80=LB+tUD90JVzYPf8uah=c0ysiew@mail.gmail.com>
	<CA+chaQc57j=7JQx3iNHfomkjVXmZX7Lm+yLED+xzMg7uhrVa8w@mail.gmail.com>
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Mime-Version: 1.0
Cc: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>,
	Joe Slater <jslater@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] waf.bbclass: check that waf exists before trying to execute it
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
X-List-Received-Date: Tue, 30 Jan 2018 14:30:22 -0000
Content-Type: multipart/alternative; boundary="=-sAvC8S6rCfvhWGvOKdf7"

--=-sAvC8S6rCfvhWGvOKdf7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-01-30 at 13:26 +0100, Martin Jansa wrote:
> +Andreas who added waf inherit in jack in:commit
> 0f8f1973e229a0799098bc2334416fec8c608b50
> Author: Andreas Müller <schnitzeltony@googlemail.com>
> Date:   Sat Oct 8 12:03:32 2016 +0200
> 
>     jack: swap to jack2
> 
> +Bian who added waf samba in:
> commit 962e346df99696a10657a2ea7b2166dfaf290289
> Author: Bian Naimeng <biannm@cn.fujitsu.com>
> Date:   Tue Jun 16 14:18:25 2015 +0900
> 
>     waf-samba: add new class
>     
>     waf-samba is a build system used by samba related software
waf-samba looks very special purpose and not how I would expect a
normal waf workflow to work at all.... maybe it shouldn't inherit from
waf.bbclass, especially since all it is actually using is
get_waf_parallel_make() ?
> +Joe and Joe and who maintains samba and related recipes + meta-
> networking
> 
> 
> On Tue, Jan 30, 2018 at 1:03 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > Why would they do that?  Shouldn't it be a fatal bug if waf isn't
> > found?
> > On 30 January 2018 at 08:30, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> > > * there are some recipes like jack and other which inherit waf-
> > > samba
> > > 
> > > which inherits waf, but they don't use waf for configure, strange
> > > isn't
> > > 
> > > it?
> > > 
> > > 
> > > 
> > > * fixes:
> > > 
> > > WARNING: libldb-1.1.29-r0 do_configure: Unable to execute waf --
> > > version, exit code 127. Assuming waf version without
> > > bindir/libdir support.
> > > 
> > > WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf --
> > > version, exit code 127. Assuming waf version without
> > > bindir/libdir support.
> > > 
> > > WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execute waf
> > > --version, exit code 127. Assuming waf version without
> > > bindir/libdir
> > > 
> > > support.
> > > 
> > > WARNING: jack-1.9.10+gitAUTOINC+2d1d323505-r0 do_configure:
> > > Unable to execute waf --version, exit code 1. Assuming waf
> > > version without bindir/libdir support.
> > > 
> > > WARNING: libtevent-0.9.31-r0 do_configure: Unable to execute waf
> > > --version, exit code 127. Assuming waf version without
> > > bindir/libdir support.
> > > 
> > > WARNING: libtdb-1.3.14-r0 do_configure: Unable to execute waf --
> > > version, exit code 127. Assuming waf version without
> > > bindir/libdir support.
> > > 
> > > 
> > > 
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > 
> > > ---
> > > 
> > >  meta/classes/waf.bbclass | 3 +++
> > > 
> > >  1 file changed, 3 insertions(+)
> > > 
> > > 
> > > 
> > > diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> > > 
> > > index c3e744e5de..eec4d9496d 100644
> > > 
> > > --- a/meta/classes/waf.bbclass
> > > 
> > > +++ b/meta/classes/waf.bbclass
> > > 
> > > @@ -29,6 +29,9 @@ python waf_preconfigure() {
> > > 
> > >      from distutils.version import StrictVersion
> > > 
> > >      srcsubdir = d.getVar('S')
> > > 
> > >      wafbin = os.path.join(srcsubdir, 'waf')
> > > 
> > > +    if not os.path.isfile(wafbin):
> > > 
> > > +        bb.note("%s doesn't exist, cannot check whether it
> > > supports --bindir/--libdir" % wafbin)
> > > 
> > > +        return
> > > 
> > >      status, result = oe.utils.getstatusoutput(wafbin + " --
> > > version")
> > > 
> > >      if status != 0:
> > > 
> > >          bb.warn("Unable to execute waf --version, exit code %d.
> > > Assuming waf version without bindir/libdir support." % status)
> > > 
> > > 
> > > --
> > > 
> > > 2.15.1
> > > 
> > > 
> > > 
> > > --
> > > 
> > > _______________________________________________
> > > 
> > > Openembedded-core mailing list
> > > 
> > > Openembedded-core@lists.openembedded.org
> > > 
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > > 

--=-sAvC8S6rCfvhWGvOKdf7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Tue, 2018-01-30 at 13:26 +0100, Martin Jan=
sa wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border=
-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr">+Andreas who add=
ed waf inherit in jack in:<div><div>commit 0f8f1973e229a0799098bc2334416fec=
8c608b50</div><div>Author: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnit=
zeltony@googlemail.com">schnitzeltony@googlemail.com</a>&gt;</div><div>Date=
:&nbsp; &nbsp;Sat Oct 8 12:03:32 2016 +0200</div><div><br></div><div>&nbsp;=
 &nbsp; jack: swap to jack2</div></div><div><br></div><div>+Bian who added =
waf samba in:</div><div><div>commit 962e346df99696a10657a2ea7b2166dfaf29028=
9</div><div>Author: Bian Naimeng &lt;<a href=3D"mailto:biannm@cn.fujitsu.co=
m">biannm@cn.fujitsu.com</a>&gt;</div><div>Date:&nbsp; &nbsp;Tue Jun 16 14:=
18:25 2015 +0900</div><div><br></div><div>&nbsp; &nbsp; waf-samba: add new =
class</div><div>&nbsp; &nbsp;&nbsp;</div><div>&nbsp; &nbsp; waf-samba is a =
build system used by samba related software</div></div></div></blockquote><=
div><br></div><div>waf-samba looks very special purpose and not how I would=
 expect a normal waf workflow to work at all.... maybe it shouldn't inherit=
 from waf.bbclass, especially since all it is actually using is get_waf_par=
allel_make() ?</div><div><br></div><blockquote type=3D"cite" style=3D"margi=
n:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"l=
tr"><div><br></div><div>+Joe and Joe and who maintains samba and related re=
cipes + meta-networking</div><div><br></div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Tue, Jan 30, 2018 at 1:03 PM, Burton, R=
oss <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><div dir=3D"ltr">Why would they do that?&nbsp; Shouldn't it be a=
 fatal bug if waf isn't found?</div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote"><div><div class=3D"h5">On 30 January 2018 at 08:30, Mart=
in Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br></div></div=
><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729=
fcf solid;padding-left:1ex"><div><div class=3D"h5">* there are some recipes=
 like jack and other which inherit waf-samba<br>
which inherits waf, but they don't use waf for configure, strange isn't<br>
it?<br>
<br>
* fixes:<br>
WARNING: libldb-1.1.29-r0 do_configure: Unable to execute waf --version, ex=
it code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf --version, exit=
 code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execute waf --version, =
exit code 127. Assuming waf version without bindir/libdir<br>
support.<br>
WARNING: jack-1.9.10+gitAUTOINC+2d1d323<wbr>505-r0 do_configure: Unable to =
execute waf --version, exit code 1. Assuming waf version without bindir/lib=
dir support.<br>
WARNING: libtevent-0.9.31-r0 do_configure: Unable to execute waf --version,=
 exit code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: libtdb-1.3.14-r0 do_configure: Unable to execute waf --version, ex=
it code 127. Assuming waf version without bindir/libdir support.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
&nbsp;meta/classes/waf.bbclass | 3 +++<br>
&nbsp;1 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index c3e744e5de..eec4d9496d 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -29,6 +29,9 @@ python waf_preconfigure() {<br>
&nbsp; &nbsp; &nbsp;from distutils.version import StrictVersion<br>
&nbsp; &nbsp; &nbsp;srcsubdir =3D d.getVar('S')<br>
&nbsp; &nbsp; &nbsp;wafbin =3D os.path.join(srcsubdir, 'waf')<br>
+&nbsp; &nbsp; if not os.path.isfile(wafbin):<br>
+&nbsp; &nbsp; &nbsp; &nbsp; bb.note("%s doesn't exist, cannot check whethe=
r it supports --bindir/--libdir" % wafbin)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; return<br>
&nbsp; &nbsp; &nbsp;status, result =3D oe.utils.getstatusoutput(wafbi<wbr>n=
 + " --version")<br>
&nbsp; &nbsp; &nbsp;if status !=3D 0:<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bb.warn("Unable to execute waf --version,=
 exit code %d. Assuming waf version without bindir/libdir support." % statu=
s)<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888"><span class=3D"m=
_7061875709844897417HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></font></span></blockquote></div><br></div>
</blockquote></div><br></div>
</blockquote></body></html>

--=-sAvC8S6rCfvhWGvOKdf7--
