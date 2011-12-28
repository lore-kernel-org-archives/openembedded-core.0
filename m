Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Rfk91-0006Ek-Mo
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 04:25:35 +0100
Received: by iakh37 with SMTP id h37so17754920iak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2011 19:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type;
	bh=jc69/lFLcA0cXiUXX+JmxaTt0OVqmAc+wA/HKwuEGA8=;
	b=wQQ8GhQ8QxKhRAcDyjQOPHsMU/KYlLSAaeH4b+ubR2A7+sAxSzCaOGdjTzetnPAyBL
	+Gi5znYoLZ4nteizCVyTuDdoD2HaJq+ry/zypug+Ue2/wSbznZ6u0n+q60hDrm8NYKik
	5skJKe287okbTb9i8DyH8XMtFmXrdxKSHQNN8=
Received: by 10.50.161.135 with SMTP id xs7mr28828713igb.15.1325042292170;
	Tue, 27 Dec 2011 19:18:12 -0800 (PST)
Received: from frey.local (ip24-251-167-38.ph.ph.cox.net. [24.251.167.38])
	by mx.google.com with ESMTPS id xu6sm4079764igb.7.2011.12.27.19.18.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Dec 2011 19:18:10 -0800 (PST)
Date: Tue, 27 Dec 2011 20:18:07 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <C912F71A353F438184732085CC1952DC@gmail.com>
In-Reply-To: <CABcZAN=kQT-imznF0wRWW_Nazs+YefcC2YY-yk+ckp6gjV757w@mail.gmail.com>
References: <4EF0C808.8060609@gmail.com> <4EFA2B81.4090405@linux.intel.com>
	<CABcZAN=kQT-imznF0wRWW_Nazs+YefcC2YY-yk+ckp6gjV757w@mail.gmail.com>
X-Mailer: sparrow 1.5 (build 1043.1)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] patch.bbclass: abstract out logic that determines patches to apply
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
X-List-Received-Date: Wed, 28 Dec 2011 03:25:35 -0000
Content-Type: multipart/alternative; boundary="4efa8a6f_721da317_14e4d"

--4efa8a6f_721da317_14e4d
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Pushed an updated version of the patch-refactor commit that should fix this.
-- 
Christopher Larson


On Tuesday, December 27, 2011 at 1:38 PM, Chris Larson wrote:

> On Tue, Dec 27, 2011 at 1:33 PM, Saul Wold <sgw@linux.intel.com (mailto:sgw@linux.intel.com)> wrote:
> > Do you need to pass d here?
> > 
> > I am seeing errors (see
> > http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/295/steps/shell_14/logs/stdio)
> > 
> 
> 
> Bah, indeed, apparently my testing didn't hit any recipes using
> minrev/maxrev/notrev. Will rework the patch. Grr.
> 
> 


--4efa8a6f_721da317_14e4d
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


                <div>
                    Pushed an updated version of the patch-refactor commi=
t that should fix this.</div><div><div>--&nbsp;</div><div>Christopher Lar=
son</div><div><br></div></div>
                =20
                <p style=3D=22color: =23A0A0A8;=22>On Tuesday, December 2=
7, 2011 at 1:38 PM, Chris Larson wrote:</p>
                <blockquote type=3D=22cite=22 style=3D=22border-left-styl=
e:solid;border-width:1px;margin-left:0px;padding-left:10px;=22>
                    <span><div><div><div>On Tue, Dec 27, 2011 at 1:33 PM,=
 Saul Wold &lt;<a href=3D=22mailto:sgw=40linux.intel.com=22>sgw=40linux.i=
ntel.com</a>&gt; wrote:</div><blockquote type=3D=22cite=22><div><div>Do y=
ou need to pass d here=3F</div><div><br></div><div>I am seeing errors (se=
e</div><div><a href=3D=22http://autobuilder.yoctoproject.org:8010/builder=
s/nightly-x86/builds/295/steps/shell=5F14/logs/stdio=22>http://autobuilde=
r.yoctoproject.org:8010/builders/nightly-x86/builds/295/steps/shell=5F14/=
logs/stdio</a>)</div></div></blockquote><div><br></div><div>Bah, indeed, =
apparently my testing didn't hit any recipes using</div><div>minrev/maxre=
v/notrev. Will rework the patch. Grr.</div></div></div></span></blockquot=
e>
            

--4efa8a6f_721da317_14e4d--
