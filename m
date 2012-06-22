Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1ShsjJ-0003lf-Dk
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 03:32:09 +0200
Received: by dalh21 with SMTP id h21so1571222dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 18:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type;
	bh=M7shNaCklvokqRjvoG8NW7Cbo7/lGxA748MF+DT8QNQ=;
	b=ZsIgTBnIpYZ/1CmJ9wyyqsIZqhGJH9EewORTMbPJ3CDGfIHCMFxQG7rocOMf7Y9oWb
	GGWmnAwVZHIoQl8gL+gxwC1OWeqhhypzZt2Nntuv12fq74/c2o8wrYEY7gQaiXYvuohj
	p9Wu28+/ufsSdComZw92PElsYmpzSqhGlNS82fL8p1ME/CE5vqighI66R0qUj9W46fC+
	J44d2T7bHzWKT0SZzhTMhqfI5vNAkYflOEyh2N6HOEBfF0AJi2PN08SSUSWXHnWZpCB2
	ZyG2PBvq00GLH/Qb3wyENxlDEGLNxWr9GK4w9/X3lgS3ycc+JGyZpw7w9JlqvCymr0HB
	KQMw==
Received: by 10.68.132.166 with SMTP id ov6mr4747615pbb.24.1340328081788;
	Thu, 21 Jun 2012 18:21:21 -0700 (PDT)
Received: from [192.168.1.132] (ip68-109-186-98.ph.ph.cox.net. [68.109.186.98])
	by mx.google.com with ESMTPS id jz4sm37284688pbc.17.2012.06.21.18.21.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 18:21:18 -0700 (PDT)
Date: Thu, 21 Jun 2012 18:21:17 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <482060616F6643A2B9718B9504DB510B@gmail.com>
In-Reply-To: <alpine.DEB.2.02.1206191647570.3325@oneiric>
References: <alpine.DEB.2.02.1206191218210.929@oneiric>
	<2651001.mzcHSCxQpi@helios>
	<alpine.DEB.2.02.1206191647570.3325@oneiric>
X-Mailer: sparrow 1.6 (build 1081.27)
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: some simple questions about assignment and appending
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
X-List-Received-Date: Fri, 22 Jun 2012 01:32:09 -0000
Content-Type: multipart/alternative; boundary="4fe3c88d_74b0dc51_7c58"

--4fe3c88d_74b0dc51_7c58
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The only assignment operator that forces immediate expansion is :=. Otherwise expansion always occurs when the value is used. This is inspired by the behavior of GNU Make. See http://www.gnu.org/software/make/manual/html_node/Flavors.html#Flavors for details of how it works there.

-- 
Christopher Larson


On Tuesday, June 19, 2012 at 1:49 PM, Robert P. J. Day wrote:

> On Tue, 19 Jun 2012, Paul Eggleton wrote:
> 
> > On Tuesday 19 June 2012 12:28:22 Robert P. J. Day wrote:
> > 
> > > finally, what are the evaluation mechanics of the "?=" operator?
> > 
> > ?= is the same as = except that it only sets the value if it is not
> > already set at the time the line is parsed.
> > 
> 
> 
> just so i don't come across as a total idiot, i did understand that
> "?=" is a conditional assignment -- my question was whether it had
> immediate evaluation semantics like ":=" or delayed evaluation
> semantics like "=", and you appear to have answered that. thanks.
> 
> rday
> 
> -- 
> 
> ========================================================================
> Robert P. J. Day Ottawa, Ontario, CANADA
> http://crashcourse.ca
> 
> Twitter: http://twitter.com/rpjday
> LinkedIn: http://ca.linkedin.com/in/rpjday
> ========================================================================
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org (mailto:Openembedded-core@lists.openembedded.org)
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 



--4fe3c88d_74b0dc51_7c58
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


                <div style=3D=22font-family: Helvetica; font-size: 13px; =
=22>The only assignment operator that forces immediate expansion is :=3D.=
 Otherwise expansion always occurs when the value is used. This is inspir=
ed by the behavior of GNU Make. See&nbsp;http://www.gnu.org/software/make=
/manual/html=5Fnode/=46lavors.html=23=46lavors for details of how it work=
s there.<br></div>
                <div><div><br></div><div>--&nbsp;</div><div>Christopher L=
arson</div><div><br></div></div>
                =20
                <p style=3D=22color: =23A0A0A8;=22>On Tuesday, June 19, 2=
012 at 1:49 PM, Robert P. J. Day wrote:</p>
                <blockquote type=3D=22cite=22 style=3D=22border-left-styl=
e:solid;border-width:1px;margin-left:0px;padding-left:10px;=22>
                    <span><div><div><div>On Tue, 19 Jun 2012, Paul Egglet=
on wrote:</div><div><br></div><blockquote type=3D=22cite=22><div><div>On =
Tuesday 19 June 2012 12:28:22 Robert P. J. Day wrote:</div><div><br></div=
><blockquote type=3D=22cite=22><div>  finally, what are the evaluation me=
chanics of the =22=3F=3D=22 operator=3F</div></blockquote><div><br></div>=
<div>=3F=3D is the same as =3D except that it only sets the value if it i=
s not</div><div>already set at the time the line is parsed.</div></div></=
blockquote><div><br></div><div>  just so i don't come across as a total i=
diot, i did understand that</div><div>=22=3F=3D=22 is a conditional assig=
nment -- my question was whether it had</div><div>immediate evaluation se=
mantics like =22:=3D=22 or delayed evaluation</div><div>semantics like =22=
=3D=22, and you appear to have answered that.  thanks.</div><div><br></di=
v><div>rday</div><div><br></div><div>-- </div><div><br></div><div>=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div>Rober=
t P. J. Day                                 Ottawa, Ontario, CANADA</div>=
<div>                        <a href=3D=22http://crashcourse.ca=22>http:/=
/crashcourse.ca</a></div><div><br></div><div>Twitter:                    =
                   <a href=3D=22http://twitter.com/rpjday=22>http://twitt=
er.com/rpjday</a></div><div>LinkedIn:                               <a hr=
ef=3D=22http://ca.linkedin.com/in/rpjday=22>http://ca.linkedin.com/in/rpj=
day</a></div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D</div><div><br></div><div>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F</div><div>Openembedded-core mailing list</div=
><div><a href=3D=22mailto:Openembedded-core=40lists.openembedded.org=22>O=
penembedded-core=40lists.openembedded.org</a></div><div><a href=3D=22http=
://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=22>http=
://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a></di=
v></div></div></span>
                =20
                =20
                =20
                =20
                </blockquote>
                =20
                <div>
                    <br>
                </div>
            

--4fe3c88d_74b0dc51_7c58--
