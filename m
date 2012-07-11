Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sp1KZ-0004BK-V2
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 20:08:08 +0200
Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 11 Jul 2012 10:56:53 -0700
Received: by eeke53 with SMTP id e53so425429eek.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 10:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:cc:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type:x-gm-message-state;
	bh=AQTaBRza2kakwHan3l1TsYkN6wgQBTgYSTxCm35bEAc=;
	b=nHfRfRv2sB3pmjCWkEkf6HBKkNZRaGaLZtP53VFQFVxW66oPgzTQxl3YZzmQvTWSt+
	u4jGFs4MHDfzcfpM1Lf4xuaMuW9V++PA5Mb/0CicaaDuzKD+lZXylnpivyND6ZI7gbPh
	6sZBIUXoUW7cv0+OkG4dMXsPuKkGGxibEPPXnAj84N1t71r9AlAwjVKgQ1TgSDU62azZ
	9WgiCQS4RocMgEkFL2drA+sm+hHhJISUf6X3jr4Eio6ximCX5tEeOZR9xa0lNjcxEFLs
	jnhvBajGQaWpV7sn9FNKN8SdhfAS7FyOy1X0KyOn9y4XsGky15MFEiQWuB6Yv604Y3Oy
	ujjQ==
Received: by 10.14.98.204 with SMTP id v52mr11658413eef.198.1342029411846;
	Wed, 11 Jul 2012 10:56:51 -0700 (PDT)
Received: from [192.168.1.5] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id m46sm7970704eeh.9.2012.07.11.10.56.50
	(version=SSLv3 cipher=OTHER); Wed, 11 Jul 2012 10:56:50 -0700 (PDT)
Date: Wed, 11 Jul 2012 18:56:46 +0100
From: Ross Burton <ross.burton@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <C669838FFB3A4B7C9310AEE85DDAED1C@intel.com>
In-Reply-To: <1342028210.11939.35.camel@ted>
References: <cover.1342022120.git.peter.seebach@windriver.com>
	<22e5e5adc39fb855badc6d1260fbd4b30d966530.1342022120.git.peter.seebach@windriver.com>
	<1342023149.11939.22.camel@ted> <20120711113333.76632780@wrlaptop>
	<1342028210.11939.35.camel@ted>
X-Mailer: sparrow 1.3 (build 495)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmRYR5S1C8PEJIE3ed3SFSJRRi10PU0ku/cpCbm7Yvq83QxCkbfCGkqFZER7CksANBGx4BN
Subject: Re: [PATCH 1/1] package.bbclass: Allow overriding of debugedit starting path
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
X-List-Received-Date: Wed, 11 Jul 2012 18:08:08 -0000
Content-Type: multipart/alternative; boundary="4ffdbe5e_507ed7ab_1484"

--4ffdbe5e_507ed7ab_1484
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Incredibly sorry for top-posting, but a build history diff should show any delta and assuming none will give a lot more confidence in the changes being complete. In theory a simple change of indentation shouldn't result in any changes to the image, right?

Ross
-- 
Ross Burton
Sent with Sparrow (http://www.sparrowmailapp.com/?sig)


On Wednesday, 11 July 2012 at 18:36, Richard Purdie wrote:

> On Wed, 2012-07-11 at 11:33 -0500, Peter Seebach wrote:
> > On Wed, 11 Jul 2012 17:12:29 +0100
> > Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > 
> > > I think I at least would find this slightly less confusing as:
> > > 
> > > workparentdir = d.getVar("DEBUGSRC_OVERRIDE_PATH", True) or
> > > os.path.dirname(workdir)
> > > 
> > 
> > 
> > Wait, LESS confusing?
> > 
> > I appear to have tragically misunderstood the design goals of
> > package.bbclass. :P
> > 
> 
> 
> Well, we are trying over time... :)
> 
> > But yes, that's a good improvement. Applied locally.
> > 
> > Speaking of confusing: If purely hypothetically I wanted to
> > submit a patch which standardized the indentation in package.bbclass,
> > would anyone be interested in that? I ask only because while I can
> > accept either 8-space or 4-space indentation, I find it comforting when
> > any given file full of Python source uses one or the other.
> > 
> 
> 
> It should all use 4 space for python functions. There is however a twist
> which is due to the way we handle _prepend and _append. Those prepends
> and appends have whitespace too and I seem to remember issues with
> whitespace matching.
> 
> Yes, this is horrible. This is why that file hasn't been touched for
> whitespace though.
> 
> > And while there's currently only a couple of blocks of 4-space
> > indentation in the file, we *normally* use 4-space, that's the
> > quasi-official Python community norm, and a LOT of the "too long" lines
> > in that file would be much more readable at 4 spaces.
> > 
> > (This would be a totally separate patch, and I'm not super happy about
> > the idea of a patch which updates half or more of the lines in the
> > file, but it's not as though it'll be less painful to fix later.)
> > 
> 
> 
> I'd be interested to see how much breakage we get from changing it. In
> fact I just tried it, the result:
> 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t14&id=3db917bfb2455715a3a3a542ea831d05ca1cf9f7
> 
> the particularly nasty bit:
> 
> python populate_packages () {
> # Whitespace is deliberately a tab here due to the number of packages which
> # prepend this fuction :(
> populate_packages_core(d)
> }
> 
> other than that it does seem to be working as long as I tweaked the
> busybox recipe and update-alternatives too. We could go through and
> change all the populate_packages_prepend functions but its the ones
> outside OE-Core I worry about. I also worry there are some _append
> functions now silently failing though :(.
> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 



--4ffdbe5e_507ed7ab_1484
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


    <div id=3D=22reply-content=22>
        Incredibly sorry for top-posting, but a build history diff should=
 show any delta and assuming none will give a lot more confidence in the =
changes being complete<span class=3D=22Apple-style-span=22 style=3D=22-we=
bkit-composition-fill-color: rgba(175, 192, 227, 0.230469); -webkit-compo=
sition-frame-color: rgba(77, 128, 180, 0.230469); =22>. In theory a simpl=
e change of indentation shouldn't result in any changes to the image, rig=
ht=3F</span></div><div id=3D=22reply-content=22><br></div><div id=3D=22re=
ply-content=22>Ross</div><div id=3D=222E=463DB6532B14=46B2BE5=4653=4695=46=
763C24=22>--&nbsp;<br>Ross Burton<br><div>Sent with <a href=3D=22http://w=
ww.sparrowmailapp.com/=3Fsig=22>Sparrow</a></div><div><br></div></div>
    =20
    <p style=3D=22color: =23A0A0A8;=22>On Wednesday, 11 July 2012 at 18:3=
6, Richard Purdie wrote:</p>
    <blockquote type=3D=22cite=22 style=3D=22border-left-style:solid;bord=
er-width:1px;margin-left:0px;padding-left:10px;=22>
        <div id=3D=22quoted-message-content=22><div><div>On Wed, 2012-07-=
11 at 11:33 -0500, Peter Seebach wrote:</div><blockquote type=3D=22cite=22=
><div><div>On Wed, 11 Jul 2012 17:12:29 +0100</div><div>Richard Purdie &l=
t;richard.purdie=40linuxfoundation.org&gt; wrote:</div><div><br></div><bl=
ockquote type=3D=22cite=22><div><div>I think I at least would find this s=
lightly less confusing as:</div><div><br></div><div>workparentdir =3D d.g=
etVar(=22DEBUGSRC=5FOVERRIDE=5FPATH=22, True) or</div><div>os.path.dirnam=
e(workdir)</div></div></blockquote><div><br></div><div>Wait, LESS confusi=
ng=3F</div><div><br></div><div>I appear to have tragically misunderstood =
the design goals of</div><div>package.bbclass.  :P</div></div></blockquot=
e><div><br></div><div>Well, we are trying over time... :)</div><div><br><=
/div><blockquote type=3D=22cite=22><div><div>But yes, that's a good impro=
vement. Applied locally.</div><div><br></div><div>Speaking of confusing: =
If purely hypothetically I wanted to</div><div>submit a patch which stand=
ardized the indentation in package.bbclass,</div><div>would anyone be int=
erested in that=3F  I ask only because while I can</div><div>accept eithe=
r 8-space or 4-space indentation, I find it comforting when</div><div>any=
 given file full of Python source uses one or the other.</div></div></blo=
ckquote><div><br></div><div>It should all use 4 space for python function=
s. There is however a twist</div><div>which is due to the way we handle =5F=
prepend and =5Fappend. Those prepends</div><div>and appends have whitespa=
ce too and I seem to remember issues with</div><div>whitespace matching.<=
/div><div><br></div><div>Yes, this is horrible. This is why that file has=
n't been touched for</div><div>whitespace though.</div><div><br></div><bl=
ockquote type=3D=22cite=22><div><div>And while there's currently only a c=
ouple of blocks of 4-space</div><div>indentation in the file, we *normall=
y* use 4-space, that's the</div><div>quasi-official Python community norm=
, and a LOT of the =22too long=22 lines</div><div>in that file would be m=
uch more readable at 4 spaces.</div><div><br></div><div>(This would be a =
totally separate patch, and I'm not super happy about</div><div>the idea =
of a patch which updates half or more of the lines in the</div><div>file,=
 but it's not as though it'll be less painful to fix later.)</div></div><=
/blockquote><div><br></div><div>I'd be interested to see how much breakag=
e we get from changing it. In</div><div>fact I just tried it, the result:=
</div><div><br></div><div>http://git.yoctoproject.org/cgit.cgi/poky-contr=
ib/commit/=3Fh=3Drpurdie/t14&amp;id=3D3db917bfb2455715a3a3a542ea831d05ca1=
cf9f7</div><div><br></div><div>the particularly nasty bit:</div><div><br>=
</div><div>python populate=5Fpackages () =7B</div><div>	=23 Whitespace is=
 deliberately a tab here due to the number of packages which</div><div>	=23=
 prepend this fuction :(</div><div>	populate=5Fpackages=5Fcore(d)</div><d=
iv>=7D</div><div><br></div><div>other than that it does seem to be workin=
g as long as I tweaked the</div><div>busybox recipe and update-alternativ=
es too. We could go through and</div><div>change all the populate=5Fpacka=
ges=5Fprepend functions but its the ones</div><div>outside OE-Core I worr=
y about. I also worry there are some =5Fappend</div><div>functions now si=
lently failing though :(.</div><div><br></div><div>Cheers,</div><div><br>=
</div><div>Richard</div><div><br></div><div><br></div><div>=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F</div><div>Openembedde=
d-core mailing list</div><div>Openembedded-core=40lists.openembedded.org<=
/div><div>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</div></div></div>
        =20
        =20
        =20
        =20
    </blockquote>
    =20
    <div>
        <br>
    </div>

--4ffdbe5e_507ed7ab_1484--
