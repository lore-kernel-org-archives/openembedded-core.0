Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RoLIO-0001rp-Q5
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 21:42:48 +0100
Received: by ggnp4 with SMTP id p4so445816ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 12:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type;
	bh=sxclnHmE1QHitSFG0YlQO5heweAtpOv0AVfPwurxEdU=;
	b=pVVBbi2kBf/QGQWXhBlo80V6SeqHQi9yUaDvSB3jC/8lrYv77pOah8QtyeyfGV1i8s
	s3vr3QfN61nf7qeEvIBnN9G2yyFa8mMjirbNt8bSVMQPUJUNqWSILENuA7A9cHrh+RPt
	dnzRNYuWELpduJ3zQ2xzOh+h5+G7yhMYAO734=
Received: by 10.50.41.131 with SMTP id f3mr4040110igl.28.1327091707063;
	Fri, 20 Jan 2012 12:35:07 -0800 (PST)
Received: from frey.local (ip24-251-167-38.ph.ph.cox.net. [24.251.167.38])
	by mx.google.com with ESMTPS id r18sm13485728ibh.4.2012.01.20.12.35.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jan 2012 12:35:05 -0800 (PST)
Date: Fri, 20 Jan 2012 13:35:02 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <F707AE0BFC9B4879966C68C90082DDFA@gmail.com>
In-Reply-To: <CAMKF1soievYHSvbvqyvL0gROW+4v-5fU7FretdXyFfHWbOrJVA@mail.gmail.com>
References: <CAMKF1sqGt0FTbnhpuP9HCeJ6LpqJrRs8GVB6azdPGfcvYHSJSQ@mail.gmail.com>
	<CABcZANn5zbXFwTuXwL2GM1FknKrY1OjBfDv=TTyH1=NRrqqDKw@mail.gmail.com>
	<CAMKF1soievYHSvbvqyvL0gROW+4v-5fU7FretdXyFfHWbOrJVA@mail.gmail.com>
X-Mailer: sparrow 1.5 (build 1043.1)
MIME-Version: 1.0
Subject: Re: adding tools-debug to EXTRA_IMAGE_FEATURES pulls other tasks from same recipe
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
X-List-Received-Date: Fri, 20 Jan 2012 20:42:49 -0000
Content-Type: multipart/alternative; boundary="4f19cff6_46e87ccd_9c"

--4f19cff6_46e87ccd_9c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday, January 20, 2012 at 1:33 PM, Khem Raj wrote:
> On Fri, Jan 20, 2012 at 9:10 AM, Chris Larson <kergoth@gmail.com (mailto:kergoth@gmail.com)> wrote:
> > On Thu, Jan 19, 2012 at 11:28 PM, Khem Raj <raj.khem@gmail.com (mailto:raj.khem@gmail.com)> wrote:
> > > I added to local.conf
> > > EXTRA_IMAGE_FEATURES += "tools-debug"
> > > 
> > > and now when I do bitbake -g I see that its wanting to build
> > > "tools-testapp" and "tools-profile"
> > > even though I did not ask them to be added to my image. all these
> > > packages are coming from
> > > single recipe task-core-tools.bb. If I divide this recipe into 3
> > > different recipes where each provides
> > > just one task, it then leaves the others out.
> > > 
> > > Since these are meta packages they pull in a lot of stuff. Would it be
> > > ok to divide this recipe
> > > into 3 individual recipes ? Ideally I would expect that the other
> > > packages dont get build even
> > > though they are in same recipe but that is not the case at present
> > > 
> > 
> > 
> > 
> > One option would be to avoid the task indirection and simply set
> > PACKAGE_GROUP_tools-debug = "<list of debug tools>"
> > 
> 
> 
> we do lot of overriding in those tasks it would get
> a bit ugly I guess if we moved that info to image.bbclass
> 
> 


Possibly, but note that it doesn't need to live in a class, either. At mentor, our distro has a .inc that defines a variety of package groups for our images.

-Chris 

--4f19cff6_46e87ccd_9c
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


                <div><span style=3D=22color: rgb(160, 160, 168); =22>On =46=
riday, January 20, 2012 at 1:33 PM, Khem Raj wrote:</span></div>
                <blockquote type=3D=22cite=22 style=3D=22border-left-styl=
e:solid;border-width:1px;margin-left:0px;padding-left:10px;=22>
                    <span><div><div><div>On =46ri, Jan 20, 2012 at 9:10 A=
M, Chris Larson &lt;<a href=3D=22mailto:kergoth=40gmail.com=22>kergoth=40=
gmail.com</a>&gt; wrote:</div><blockquote type=3D=22cite=22><div><div>On =
Thu, Jan 19, 2012 at 11:28 PM, Khem Raj &lt;<a href=3D=22mailto:raj.khem=40=
gmail.com=22>raj.khem=40gmail.com</a>&gt; wrote:</div><blockquote type=3D=
=22cite=22><div><div>I added to local.conf</div><div>EXTRA=5FIMAGE=5F=46E=
ATURES +=3D =22tools-debug=22</div><div><br></div><div>and now when I do =
bitbake -g I see that its wanting to build</div><div>=22tools-testapp=22 =
and =22tools-profile=22</div><div>even though I did not ask them to be ad=
ded to my image. all these</div><div>packages are coming from</div><div>s=
ingle recipe task-core-tools.bb. If I divide this recipe into 3</div><div=
>different recipes where each provides</div><div>just one task, it then l=
eaves the others out.</div><div><br></div><div>Since these are meta packa=
ges they pull in a lot of stuff. Would it be</div><div>ok to divide this =
recipe</div><div>into 3 individual recipes =3F Ideally I would expect tha=
t the other</div><div>packages dont get build even</div><div>though they =
are in same recipe but that is not the case at present</div></div></block=
quote><div><br></div><div><br></div><div>One option would be to avoid the=
 task indirection and simply set</div><div>PACKAGE=5FGROUP=5Ftools-debug =
=3D =22&lt;list of debug tools&gt;=22</div></div></blockquote><div><br></=
div><div>we do lot of overriding in those tasks it would get</div><div>a =
bit ugly I guess if we moved that info to image.bbclass</div></div></div>=
</span></blockquote><div><br></div><div>Possibly, but note that it doesn'=
t need to live in a class, either. At mentor, our distro has a .inc that =
defines a variety of package groups for our images.</div><div><br></div><=
div>-Chris&nbsp;</div>
            

--4f19cff6_46e87ccd_9c--
