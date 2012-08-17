Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T2PUD-0001xc-BH
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 18:33:25 +0200
Received: by ghbz2 with SMTP id z2so4538767ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 09:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type;
	bh=h6/ZiXvsRFO0mmLuCbf3kpk6/6OoZRYPU2z+NtIgsbQ=;
	b=dwwpQrXOA4+j3w33HWylF2xoXtqIAH8Hg9wo6NwVc9G1IFkW0hkVe7UNMbqQ5ighWx
	xNpWD2RsUjhIZMO97Jxa227MslR/m0LKb3c7nQBqpKGjmGXENgzK245DZQxVWTX4uUTm
	H+RNeB9IDrpqJAhKr0a9851w6MI8kg10LmUeacJgtBKGp4WoMifKjXr50TAE1CP/gpG6
	954M8x+ZGyXg4LbOxE7gQJBdpIdO6JrVz4XkFsxsF5LdJbwcKhGZrY4dydxceyhurR5X
	bRGBbTIJqTRCa4GshsAjulTdnYderOq88q5rhqtSZjt9LsPB0r3YEa3ZoV8K+QZ10b1o
	Ydjg==
Received: by 10.66.88.1 with SMTP id bc1mr10683324pab.18.1345220485852;
	Fri, 17 Aug 2012 09:21:25 -0700 (PDT)
Received: from [192.168.1.132] (ip68-109-186-98.ph.ph.cox.net. [68.109.186.98])
	by mx.google.com with ESMTPS id pn5sm949028pbb.25.2012.08.17.09.21.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 09:21:24 -0700 (PDT)
Date: Fri, 17 Aug 2012 09:21:21 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <25305C5D6E5A4932BA15741803712080@gmail.com>
In-Reply-To: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
References: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
X-Mailer: sparrow 1.6.3 (build 1172)
MIME-Version: 1.0
Subject: Re: Toolchain rework, call for testing
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
X-List-Received-Date: Fri, 17 Aug 2012 16:33:25 -0000
Content-Type: multipart/alternative; boundary="502e6f81_2d1d5ae9_11db5"

--502e6f81_2d1d5ae9_11db5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday, August 16, 2012 at 9:47 PM, Khem Raj wrote:
> Recently glibc build has been simplified upstream. It has dropped the
> dependency on libgcc_s and libgcc_eh for building glibc itself.
> This means that we can simplify our toolchain bootstrap a bit by
> dropping 1 of the 3 cross gcc build stages. We do not need
> gcc-cross-intermediate
> anymore. This should bring some build time reduction and simplify the
> bootstrap. I have a series of patches which I have tested
> by building core-image-minimal and meta-toolchain for all supported
> qemu architectures and also uclibc/eglibc both
> but it needs a lot more testing therefore I am calling out wider
> audience for help in testing it out.
> 
> The branch is
> 
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/toolchain-rework 

Successfully built core-image-base for p2020rdb with meta-fsl-ppc, so far.
-- 
Christopher Larson


--502e6f81_2d1d5ae9_11db5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


                <div><span style=3D=22color: rgb(160, 160, 168); =22>On T=
hursday, August 16, 2012 at 9:47 PM, Khem Raj wrote:</span></div>
                <blockquote type=3D=22cite=22 style=3D=22border-left-styl=
e:solid;border-width:1px;margin-left:0px;padding-left:10px;=22>
                    <span><div style=3D=22color: rgb(0, 0, 0); font-famil=
y: Helvetica; font-size: 13px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; orphans=
: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; wh=
ite-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust=
: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 2=
55); =22>Recently glibc build has been simplified upstream. It has droppe=
d the</div><div style=3D=22color: rgb(0, 0, 0); font-family: Helvetica; f=
ont-size: 13px; font-style: normal; font-variant: normal; font-weight: no=
rmal; letter-spacing: normal; line-height: normal; orphans: 2; text-align=
: -webkit-auto; text-indent: 0px; text-transform: none; white-space: norm=
al; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit=
-text-stroke-width: 0px; background-color: rgb(255, 255, 255); =22>depend=
ency on libgcc=5Fs and libgcc=5Feh for building glibc itself.</div><div s=
tyle=3D=22color: rgb(0, 0, 0); font-family: Helvetica; font-size: 13px; f=
ont-style: normal; font-variant: normal; font-weight: normal; letter-spac=
ing: normal; line-height: normal; orphans: 2; text-align: -webkit-auto; t=
ext-indent: 0px; text-transform: none; white-space: normal; widows: 2; wo=
rd-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-widt=
h: 0px; background-color: rgb(255, 255, 255); =22>This means that we can =
simplify our toolchain bootstrap a bit by</div><div style=3D=22color: rgb=
(0, 0, 0); font-family: Helvetica; font-size: 13px; font-style: normal; f=
ont-variant: normal; font-weight: normal; letter-spacing: normal; line-he=
ight: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; tex=
t-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -we=
bkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-c=
olor: rgb(255, 255, 255); =22>dropping 1 of the 3 cross gcc build stages.=
 We do not need</div><div style=3D=22color: rgb(0, 0, 0); font-family: He=
lvetica; font-size: 13px; font-style: normal; font-variant: normal; font-=
weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; =
text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: aut=
o; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); =
=22>gcc-cross-intermediate</div><div style=3D=22color: rgb(0, 0, 0); font=
-family: Helvetica; font-size: 13px; font-style: normal; font-variant: no=
rmal; font-weight: normal; letter-spacing: normal; line-height: normal; o=
rphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: no=
ne; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-=
adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, =
255, 255); =22>anymore. This should bring some build time reduction and s=
implify the</div><div style=3D=22color: rgb(0, 0, 0); font-family: Helvet=
ica; font-size: 13px; font-style: normal; font-variant: normal; font-weig=
ht: normal; letter-spacing: normal; line-height: normal; orphans: 2; text=
-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space=
: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -=
webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); =22>=
bootstrap. I have a series of patches which I have tested</div><div style=
=3D=22color: rgb(0, 0, 0); font-family: Helvetica; font-size: 13px; font-=
style: normal; font-variant: normal; font-weight: normal; letter-spacing:=
 normal; line-height: normal; orphans: 2; text-align: -webkit-auto; text-=
indent: 0px; text-transform: none; white-space: normal; widows: 2; word-s=
pacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0=
px; background-color: rgb(255, 255, 255); =22>by building core-image-mini=
mal and meta-toolchain for all supported</div><div style=3D=22color: rgb(=
0, 0, 0); font-family: Helvetica; font-size: 13px; font-style: normal; fo=
nt-variant: normal; font-weight: normal; letter-spacing: normal; line-hei=
ght: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text=
-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-co=
lor: rgb(255, 255, 255); =22>qemu architectures and also uclibc/eglibc bo=
th</div><div style=3D=22color: rgb(0, 0, 0); font-family: Helvetica; font=
-size: 13px; font-style: normal; font-variant: normal; font-weight: norma=
l; letter-spacing: normal; line-height: normal; orphans: 2; text-align: -=
webkit-auto; text-indent: 0px; text-transform: none; white-space: normal;=
 widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-te=
xt-stroke-width: 0px; background-color: rgb(255, 255, 255); =22>but it ne=
eds a lot more testing therefore I am calling out wider</div><div style=3D=
=22color: rgb(0, 0, 0); font-family: Helvetica; font-size: 13px; font-sty=
le: normal; font-variant: normal; font-weight: normal; letter-spacing: no=
rmal; line-height: normal; orphans: 2; text-align: -webkit-auto; text-ind=
ent: 0px; text-transform: none; white-space: normal; widows: 2; word-spac=
ing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;=
 background-color: rgb(255, 255, 255); =22>audience for help in testing i=
t out.</div><div style=3D=22color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 13px; font-style: normal; font-variant: normal; font-weight: n=
ormal; letter-spacing: normal; line-height: normal; orphans: 2; text-alig=
n: -webkit-auto; text-indent: 0px; text-transform: none; white-space: nor=
mal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webki=
t-text-stroke-width: 0px; background-color: rgb(255, 255, 255); =22><br><=
/div><div style=3D=22color: rgb(0, 0, 0); font-family: Helvetica; font-si=
ze: 13px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: -web=
kit-auto; text-indent: 0px; text-transform: none; white-space: normal; wi=
dows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-=
stroke-width: 0px; background-color: rgb(255, 255, 255); =22>The branch i=
s</div><div style=3D=22color: rgb(0, 0, 0); font-family: Helvetica; font-=
size: 13px; font-style: normal; font-variant: normal; font-weight: normal=
; letter-spacing: normal; line-height: normal; orphans: 2; text-align: -w=
ebkit-auto; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-tex=
t-stroke-width: 0px; background-color: rgb(255, 255, 255); =22><br></div>=
<div style=3D=22color: rgb(0, 0, 0); font-family: Helvetica; font-size: 1=
3px; font-style: normal; font-variant: normal; font-weight: normal; lette=
r-spacing: normal; line-height: normal; orphans: 2; text-align: -webkit-a=
uto; text-indent: 0px; text-transform: none; white-space: normal; widows:=
 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-strok=
e-width: 0px; background-color: rgb(255, 255, 255); =22><a href=3D=22http=
://git.openembedded.org/openembedded-core-contrib/log/=3Fh=3Dkraj/toolcha=
in-rework=22 style=3D=22color: rgb(0, 106, 227); =22>http://git.openembed=
ded.org/openembedded-core-contrib/log/=3Fh=3Dkraj/toolchain-rework</a></d=
iv></span>
                =20
                =20
                =20
                =20
                </blockquote>
                =20
                <div>
                    <br>
                </div><div>Successfully built core-image-base for p2020rd=
b with meta-fsl-ppc, so far.</div><div><div>--&nbsp;</div><div>Christophe=
r Larson</div></div>
            

--502e6f81_2d1d5ae9_11db5--
