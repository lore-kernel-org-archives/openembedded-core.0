Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1S9kkf-0004xE-0U
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 23:08:29 +0100
Received: by dado14 with SMTP id o14so10809564dad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 14:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type;
	bh=66CEla0vu3DyjCEbAowURJQrqWg14EzQwDrlfk/nLbc=;
	b=G1OBL5PM+0UmCfeUgctBjFeT1rLIDiAitpR7jAoFfnzX3FlQqL0c73n94zi4P5lCjr
	722Gn+i3WV5XxYxYAPJF0abuXSyObG3dJfgeT8cRVAH+d/xzxKLkKnfBelrO0TWwgLIv
	PSVxrCmrG9xIDL8OcpxaVuHjN30nIzNfcWS/GDJ8Y/1jtxOl4jmvTQxKWytGdnmUwyYZ
	In6rCFgn4yJ9L997YEqQta1LFJWnK6Nb5+dsIMpQ2YsRXnQ/kJVET46fu2gr07GHRd2r
	bbfMuazeOaYyHAUr8Los6+spoQKbZjUI8PxFFkq+qjwxPHFhoZxtHcbJXdwigauO9opl
	8b+Q==
Received: by 10.68.228.69 with SMTP id sg5mr44084084pbc.91.1332194376234;
	Mon, 19 Mar 2012 14:59:36 -0700 (PDT)
Received: from frey.local (ip68-110-79-242.ph.ph.cox.net. [68.110.79.242])
	by mx.google.com with ESMTPS id 3sm9235866pbf.47.2012.03.19.14.59.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 14:59:35 -0700 (PDT)
Date: Mon, 19 Mar 2012 14:59:33 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <B0098CE307294E64ABD9A4F359B2382D@gmail.com>
In-Reply-To: <COL120-W6346678F9768AEFEA35D5EDD420@phx.gbl>
References: <COL120-W391CDA1CEF0C6CE16540C8DD420@phx.gbl> <,> <,>
	<1332192150.9740.72.camel@ted> <,>
	<COL120-W278115027639B2C6CC9F7BDD420@phx.gbl> <,>
	<EBB81F82C91641E49DD69302B85DB8BF@gmail.com>
	<COL120-W6346678F9768AEFEA35D5EDD420@phx.gbl>
X-Mailer: sparrow 1.5 (build 1043.1)
MIME-Version: 1.0
Subject: Re: Linking two recipes
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
X-List-Received-Date: Mon, 19 Mar 2012 22:08:29 -0000
Content-Type: multipart/alternative; boundary="4f67ac45_1190cde7_aa0"

--4f67ac45_1190cde7_aa0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

All installs should be placed relative to ${D}. See one of the many other recipes that define do_install for examples :)

-- 
Christopher Larson


On Monday, March 19, 2012 at 2:57 PM, simran singh wrote:

> So install something along the lines:
> 
> do_install(){
>        python configure.py --prefix=${libdir}/botan
> }
> 
> When I do that, I get a permission denied error:
> mkdir: cannot create directory /usr/lib/botan
> 
> Sorry I am still significantly new to open embedded and bitbake.
> 
> Thanks,
> Simran
> 
> Date: Mon, 19 Mar 2012 14:39:13 -0700
> From: kergoth@gmail.com (mailto:kergoth@gmail.com)
> To: openembedded-core@lists.openembedded.org (mailto:openembedded-core@lists.openembedded.org)
> Subject: Re: [OE-core] Linking two recipes
> 
> /usr/botan isn't a path that'll be placed into the sysroot, which is the standard mechanism by which files from dependencies are accessed (e.g. headers, shared libraries, native scripts). You should install to more standard system locations.
> 
> -- 
> Christopher Larson
> 
> 
> On Monday, March 19, 2012 at 2:33 PM, simran singh wrote:
> 
> > Hello Richard,
> > 
> > I did try the DEPENDS variable before but still doesnt solve the problem.
> > A configure script in recipe B has to run a program that is built under ${D}/usr/botan by recipe A. 
> > Even if i pass the path to the configure script, it is unable to find the script. ./configure --with-botan=............./usr/botan
> > Thanks.
> > 
> > Simran
> > 
> > 
> > > From: richard.purdie@linuxfoundation.org (mailto:richard.purdie@linuxfoundation.org)
> > > To: openembedded-core@lists.openembedded.org (mailto:openembedded-core@lists.openembedded.org)
> > > Date: Mon, 19 Mar 2012 21:22:30 +0000
> > > Subject: Re: [OE-core] Linking two recipes
> > > 
> > > On Mon, 2012-03-19 at 13:59 -0700, simran singh wrote:
> > > > Hello,
> > > > I have recipes for two applications Recipe A and Recipe B. Recipe B
> > > > requires a lib.so file and init.h file which are installed by Recipe
> > > > A.
> > > > How do I acknowledge this dependency in Recipe B. I tried doing
> > > > do_stage() function in recipe A with no success. Please advice.
> > > > I am attaching the two recipes.
> > > > Thank you for any help.
> > > 
> > > recipe B needs to do:
> > > 
> > > DEPENDS += "recipeA"
> > > 
> > > Cheers,
> > > 
> > > Richard
> > > 
> > > 
> > > 
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org (mailto:Openembedded-core@lists.openembedded.org)
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org (mailto:Openembedded-core@lists.openembedded.org)
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> > 
> > 
> > 
> 
> 
> 
> _______________________________________________ Openembedded-core mailing list Openembedded-core@lists.openembedded.org http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org (mailto:Openembedded-core@lists.openembedded.org)
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 



--4f67ac45_1190cde7_aa0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


                <div style=3D=22font-family: Helvetica; font-size: 13px; =
=22>All installs should be placed relative to =24=7BD=7D. See one of the =
many other recipes that define do=5Finstall for examples :)<br></div>
                <div><div><br></div><div>--&nbsp;</div><div>Christopher L=
arson</div><div><br></div></div>
                =20
                <p style=3D=22color: =23A0A0A8;=22>On Monday, March 19, 2=
012 at 2:57 PM, simran singh wrote:</p>
                <blockquote type=3D=22cite=22 style=3D=22border-left-styl=
e:solid;border-width:1px;margin-left:0px;padding-left:10px;=22>
                    <span><div><div>


<div dir=3D=22ltr=22>
So install something along the lines:<div><br></div><div>do=5Finstall()=7B=
</div><div>&nbsp; &nbsp; &nbsp; &nbsp;python configure.py --prefix=3D=24=7B=
libdir=7D/botan</div><div>=7D<br><br>When I do that, I get a permission d=
enied error:</div><div>mkdir: cannot create directory /usr/lib/botan</div=
><div><br></div><div>Sorry I am still significantly new to open embedded =
and bitbake.</div><div><br></div><div>Thanks,</div><div>Simran<br><br><di=
v><hr>Date: Mon, 19 Mar 2012 14:39:13 -0700<br>=46rom: <a href=3D=22mailt=
o:kergoth=40gmail.com=22>kergoth=40gmail.com</a><br>To: <a href=3D=22mail=
to:openembedded-core=40lists.openembedded.org=22>openembedded-core=40list=
s.openembedded.org</a><br>Subject: Re: =5BOE-core=5D Linking two recipes<=
br><br>
                <div style=3D=22font-family:Helvetica;font-size:13px=22>/=
usr/botan isn't a path that'll be placed into the sysroot, which is the s=
tandard mechanism by which files from dependencies are accessed (e.g. hea=
ders, shared libraries, native scripts). You should install to more stand=
ard system locations.<br></div>
                <div><div><br></div><div>--&nbsp;</div><div>Christopher L=
arson</div><div><br></div></div>
                 =20
                <p style=3D=22color:=23A0A0A8=22>On Monday, March 19, 201=
2 at 2:33 PM, simran singh wrote:</p><blockquote type=3D=22cite=22><div>
                    <span><div><div>


<div dir=3D=22ltr=22>

Hello Richard,<div><br></div><div>I did try the DEPENDS variable before b=
ut still doesnt solve the problem.</div><div>A configure script in recipe=
 B has to run a program that is built under =24=7BD=7D/usr/botan by recip=
e A.&nbsp;</div><div>Even if i pass the path to the configure script, it =
is unable to find the script. ./configure --with-botan=3D............./us=
r/botan</div><div>Thanks.</div><div><br></div><div>Simran</div><div><br><=
br><div>&gt; =46rom: <a href=3D=22mailto:richard.purdie=40linuxfoundation=
.org=22>richard.purdie=40linuxfoundation.org</a><br>&gt; To: <a href=3D=22=
mailto:openembedded-core=40lists.openembedded.org=22>openembedded-core=40=
lists.openembedded.org</a><br>&gt; Date: Mon, 19 Mar 2012 21:22:30 +0000<=
br>&gt; Subject: Re: =5BOE-core=5D Linking two recipes<br>&gt; <br>&gt; O=
n Mon, 2012-03-19 at 13:59 -0700, simran singh wrote:<br>&gt; &gt; Hello,=
<br>&gt; &gt; I have recipes for two applications Recipe A and Recipe B. =
Recipe B<br>&gt; &gt; requires a lib.so file and init.h file which are in=
stalled by Recipe<br>&gt; &gt; A.<br>&gt; &gt; How do I acknowledge this =
dependency in Recipe B. I tried doing<br>&gt; &gt; do=5Fstage() function =
in recipe A with no success. Please advice.<br>&gt; &gt; I am attaching t=
he two recipes.<br>&gt; &gt; Thank you for any help.<br>&gt; <br>&gt; rec=
ipe B needs to do:<br>&gt; <br>&gt; DEPENDS +=3D =22recipeA=22<br>&gt; <b=
r>&gt; Cheers,<br>&gt; <br>&gt; Richard<br>&gt; <br>&gt; <br>&gt; <br>&gt=
; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>=
&gt; Openembedded-core mailing list<br>&gt; <a href=3D=22mailto:Openembed=
ded-core=40lists.openembedded.org=22>Openembedded-core=40lists.openembedd=
ed.org</a><br>&gt; <a href=3D=22http://lists.linuxtogo.org/cgi-bin/mailma=
n/listinfo/openembedded-core=22 target=3D=22=5Fblank=22>http://lists.linu=
xtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><br></div></div> =
		 	   		  </div>
</div><div><div>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F</div><div>Openembedded-core mailing list</div><div><a href=3D=22=
mailto:Openembedded-core=40lists.openembedded.org=22>Openembedded-core=40=
lists.openembedded.org</a></div><div><a href=3D=22http://lists.linuxtogo.=
org/cgi-bin/mailman/listinfo/openembedded-core=22 target=3D=22=5Fblank=22=
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a=
></div></div></div></span>
                 =20
                 =20
                 =20
                 =20
                </div></blockquote><div>
                    <br>
                </div>
            <br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F
Openembedded-core mailing list
Openembedded-core=40lists.openembedded.org
<a href=3D=22http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembe=
dded-core=22>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembe=
dded-core</a></div></div> 		 	   		  </div>
</div><div><div>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F</div><div>Openembedded-core mailing list</div><div><a href=3D=22=
mailto:Openembedded-core=40lists.openembedded.org=22>Openembedded-core=40=
lists.openembedded.org</a></div><div><a href=3D=22http://lists.linuxtogo.=
org/cgi-bin/mailman/listinfo/openembedded-core=22>http://lists.linuxtogo.=
org/cgi-bin/mailman/listinfo/openembedded-core</a></div></div></div></spa=
n>
                =20
                =20
                =20
                =20
                </blockquote>
                =20
                <div>
                    <br>
                </div>
            

--4f67ac45_1190cde7_aa0--
