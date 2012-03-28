Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SCjOL-0006V4-9F
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 05:17:45 +0200
Received: by obqv19 with SMTP id v19so792807obq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 20:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type;
	bh=jtJQS9UIKB0tGwzkzm+hrNi9msYR4Zvr+MFq9DgxHJ0=;
	b=jHfXKut5Sz+z07L0F1kkds+tO//wnS05WY/bJYgUCBk+W6tN0xPQBkM8wEVYyMwNki
	bl/uqO+GYE/GO/1DNtsltYHwhSYknbW1340RkzZA5gGpmwKzWwizH0NNkVU6wJV12GJA
	4NmdILDhfDvBtP1Cgrl7cXgWGalb1Dr/tGWS/xge/3u+ccv3Cg3hNZLTBJO9pUA/Zifi
	BwttfJSa7JxTdrrqoyoRXTLBoq+PA7bdG4mgEf1HLDWvTf/Ip0EUoKMOlWdKX85LskbG
	tHi5L44giW1W88qJ6UDEqArWfPpq5fFA8CMFh6i6bZHlqX87vKuCF9ss7oVdBfOMUnDF
	SC/g==
Received: by 10.182.155.68 with SMTP id vu4mr35156494obb.61.1332904122919;
	Tue, 27 Mar 2012 20:08:42 -0700 (PDT)
Received: from frey (ip68-110-79-242.ph.ph.cox.net. [68.110.79.242])
	by mx.google.com with ESMTPS id m3sm1517565oem.7.2012.03.27.20.08.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Mar 2012 20:08:41 -0700 (PDT)
Date: Tue, 27 Mar 2012 20:08:42 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <C26382903E56411CA8FD5CF05308DA30@gmail.com>
In-Reply-To: <20120328024204.GE17470@denix.org>
References: <alpine.DEB.2.02.1203270815010.3125@oneiric>
	<1704770.YM0OKmOcSp@helios> <20120328024204.GE17470@denix.org>
X-Mailer: sparrow 1.5 (build 1043.1)
MIME-Version: 1.0
Subject: Re: adding a single package to an image -- what's the proper way?
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
X-List-Received-Date: Wed, 28 Mar 2012 03:17:45 -0000
Content-Type: multipart/alternative; boundary="4f7280ba_5e884adc_13b26"

--4f7280ba_5e884adc_13b26
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I IMAGE_INSTALL_append or IMAGE_INSTALL_append_pn-core-image-minimal or whatever when I need to quickly add a package temporarily, myself.

-- 
Christopher Larson


On Tuesday, March 27, 2012 at 7:42 PM, Denys Dmytriyenko wrote:

> On Tue, Mar 27, 2012 at 08:27:02PM +0100, Paul Eggleton wrote:
> > On Tuesday 27 March 2012 08:20:11 Robert P. J. Day wrote:
> > > i'm currently poring over the OE docs (including the ones at the
> > > yocto site), and i'm trying to figure out how to simply add a package
> > > to an image through one's local.conf file.
> > > 
> > > the current yocto ref manual has an entire section about customizing
> > > images:
> > > 
> > > http://www.yoctoproject.org/docs/current/poky-ref-manual/poky-ref-manual.htm
> > > l#usingpoky-extend-customimage
> > > 
> > > but it discusses creating custom recipe files and custom tasks, and
> > > using IMAGE_INSTALL and IMAGE_FEATURES and EXTRA_IMAGE_FEATURES, and
> > > finally gets into using local.conf, suggesting:
> > > 
> > > DISTRO_EXTRA_RDEPENDS += "strace"
> > > 
> > > is that, in fact, the accepted way if one simply wants to add a
> > > package to an existing image build? because as soon as the manual
> > > mentions it, in the very next paragraph, it discourages its use.
> > > 
> > 
> > 
> > Well, this clearly does not make sense if that's the way it is presented. 
> > 
> > The real answer to this question is it depends on why you're adding the 
> > package.
> > 
> > 1) If you just want to add a single package temporarily for testing, use 
> > CORE_IMAGE_EXTRA_INSTALL += in local.conf (although I really wish we could 
> > make this mechanism more generic so that it applies to any image, not just the 
> > ones in OE-Core).
> > 
> > 2) If you want to add something permanently for every (non-minimal) image 
> > produced using your DISTRO, set DISTRO_EXTRA_RDEPENDS in your distro 
> > configuration. This will come into your image via task-distro-base which is 
> > pulled in by task-base. I don't think we should be advocating doing anything 
> > with DISTRO_EXTRA_RDEPENDS via local.conf.
> > 
> > 3) If you're adding it permanently for a single image, consider whether adding 
> > your own custom image recipe would be more appropriate. FWIW, I don't think 
> > bbappends for recipes are a good idea.
> > 
> 
> 
> All these options don't cover one more need - temporarily adding one or more 
> packages to a single specific image via local.conf. Both option 1) and 2) do 
> it too broadly to several/all images... And the only option is to go with more 
> permanent way in 3) by adding own image recipe.
> 
> -- 
> Denys
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org (mailto:Openembedded-core@lists.openembedded.org)
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 



--4f7280ba_5e884adc_13b26
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


                <div style=3D=22font-family: Helvetica; font-size: 13px; =
=22>I IMAGE=5FINSTALL=5Fappend or IMAGE=5FINSTALL=5Fappend=5Fpn-core-imag=
e-minimal or whatever when I need to quickly add a package temporarily, m=
yself.<br></div>
                <div><div><br></div><div>--&nbsp;</div><div>Christopher L=
arson</div><div><br></div></div>
                =20
                <p style=3D=22color: =23A0A0A8;=22>On Tuesday, March 27, =
2012 at 7:42 PM, Denys Dmytriyenko wrote:</p>
                <blockquote type=3D=22cite=22 style=3D=22border-left-styl=
e:solid;border-width:1px;margin-left:0px;padding-left:10px;=22>
                    <span><div><div><div>On Tue, Mar 27, 2012 at 08:27:02=
PM +0100, Paul Eggleton wrote:</div><blockquote type=3D=22cite=22><div><d=
iv>On Tuesday 27 March 2012 08:20:11 Robert P. J. Day wrote:</div><blockq=
uote type=3D=22cite=22><div><div>  i'm currently poring over the OE docs =
(including the ones at the</div><div>yocto site), and i'm trying to figur=
e out how to simply add a package</div><div>to an image through one's loc=
al.conf file.</div><div><br></div><div>  the current yocto ref manual has=
 an entire section about customizing</div><div>images:</div><div><br></di=
v><div><a href=3D=22http://www.yoctoproject.org/docs/current/poky-ref-man=
ual/poky-ref-manual.htm=22>http://www.yoctoproject.org/docs/current/poky-=
ref-manual/poky-ref-manual.htm</a></div><div>l=23usingpoky-extend-customi=
mage</div><div><br></div><div>but it discusses creating custom recipe fil=
es and custom tasks, and</div><div>using IMAGE=5FINSTALL and IMAGE=5F=46E=
ATURES and EXTRA=5FIMAGE=5F=46EATURES, and</div><div>finally gets into us=
ing local.conf, suggesting:</div><div><br></div><div>  DISTRO=5FEXTRA=5FR=
DEPENDS +=3D =22strace=22</div><div><br></div><div>is that, in fact, the =
accepted way if one simply wants to add a</div><div>package to an existin=
g image build=3F  because as soon as the manual</div><div>mentions it, in=
 the very next paragraph, it discourages its use.</div></div></blockquote=
><div><br></div><div>Well, this clearly does not make sense if that's the=
 way it is presented. </div><div><br></div><div>The real answer to this q=
uestion is it depends on why you're adding the </div><div>package.</div><=
div><br></div><div>1) If you just want to add a single package temporaril=
y for testing, use </div><div>CORE=5FIMAGE=5FEXTRA=5FINSTALL +=3D in loca=
l.conf (although I really wish we could </div><div>make this mechanism mo=
re generic so that it applies to any image, not just the </div><div>ones =
in OE-Core).</div><div><br></div><div>2) If you want to add something per=
manently for every (non-minimal) image </div><div>produced using your DIS=
TRO, set DISTRO=5FEXTRA=5FRDEPENDS in your distro </div><div>configuratio=
n. This will come into your image via task-distro-base which is </div><di=
v>pulled in by task-base. I don't think we should be advocating doing any=
thing </div><div>with DISTRO=5FEXTRA=5FRDEPENDS via local.conf.</div><div=
><br></div><div>3) If you're adding it permanently for a single image, co=
nsider whether adding </div><div>your own custom image recipe would be mo=
re appropriate. =46WIW, I don't think </div><div>bbappends for recipes ar=
e a good idea.</div></div></blockquote><div><br></div><div>All these opti=
ons don't cover one more need - temporarily adding one or more </div><div=
>packages to a single specific image via local.conf. Both option 1) and 2=
) do </div><div>it too broadly to several/all images... And the only opti=
on is to go with more </div><div>permanent way in 3) by adding own image =
recipe.</div><div><br></div><div>-- </div><div>Denys</div><div><br></div>=
<div>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<=
/div><div>Openembedded-core mailing list</div><div><a href=3D=22mailto:Op=
enembedded-core=40lists.openembedded.org=22>Openembedded-core=40lists.ope=
nembedded.org</a></div><div><a href=3D=22http://lists.linuxtogo.org/cgi-b=
in/mailman/listinfo/openembedded-core=22>http://lists.linuxtogo.org/cgi-b=
in/mailman/listinfo/openembedded-core</a></div></div></div></span>
                =20
                =20
                =20
                =20
                </blockquote>
                =20
                <div>
                    <br>
                </div>
            

--4f7280ba_5e884adc_13b26--
