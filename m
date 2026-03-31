Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D0610F92FD
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 20:27:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.587.1774988835015191093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 13:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vasfVmOV;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C8FB04E42885;
	Tue, 31 Mar 2026 20:27:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9AE046029D;
	Tue, 31 Mar 2026 20:27:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C6F4104502A1;
	Tue, 31 Mar 2026 22:27:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774988831; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references:autocrypt;
	bh=kd/BHLmlgSB7wlYUUNXEY76cNRO0Lejc57vOzYpYXOg=;
	b=vasfVmOVcxs74WpngMVaKUWMbhQDLflqcxf/QobZ0PQh9ZdAF11Po0m5w32Ecr8heZ9DiB
	RS0Lz6+UZ0cpS2UfVCCQ8g8IrA6L/G01n0M0AFfYFA5aK/nRE1jCr0ej+jcGexbGbYICzj
	gKmqXw+kwPXTMWchxLz//7UuDjm6oKGThinYYYSRFpdQOTH/0/uDnYkO8n7/246IfFhsSf
	2+aCvjFWmG5ptaFcXDRkUso5kxsIi9ckMLdeRLAbFzDdn+ZbyPCYHj3SUEXt2/ZdyxyzS0
	eUDgUq3pZNX+5iYcWTZ4Me9DAxls4qfo+znVwoVQXg3WXvm/+zHLphPbj78fKw==
Message-ID: <9ea28268b4644e2c2db54a551c364298700ba619.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] lto: disable for expect and add
 DEBUG_PREFIX_MAP to ldflags
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: raj.khem@gmail.com, joerg.sommer@navimatix.de
Cc: thomas.perrot@bootlin.com, openembedded-core@lists.openembedded.org, 
	thomas.petazzoni@bootlin.com
Date: Tue, 31 Mar 2026 22:27:08 +0200
In-Reply-To: <CAMKF1so2416tJiJrPw8KQeJCXY-S=SQsGiJMjGE2d6T86NJznQ@mail.gmail.com>
References: <20260331081246.73406-1-thomas.perrot@bootlin.com>
	 <acvqE8lCFwxJesUk@navimatix.de>
	 <CAMKF1so2416tJiJrPw8KQeJCXY-S=SQsGiJMjGE2d6T86NJznQ@mail.gmail.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=mQGNBF+/ZOUBDAC2DghCjZvmgYcve02OG7dGZ7Iy58uEwne3LB7w7nRwdAxKw7ZaiVqwY
 O+yNGVi+GVx7oA6Wn4pv46z+QDRLQiq6OseuXhkSGCg7U/yBCUq12B/GRGO1Qt2Qi1mJJT1s+1qZ5
 Gxv6Nypz9qKVn94GM2bR1hXBga0t87vBpebThOHmX5d/0dqIcVxRCM7onNb0dDyRoVgLS5rBhQzrL
 CMrJaCy39xZUy0J1SOlH4Mgk6EhJIPYY4wlzikGX6urg+Tc9EjGd78ry0e0p5U5qgjFR5QGJDy1Gn
 U3CfwbT9sowdCASDbQDUoltlv2iWJCLa0xl97KVchCa0pr7HKbFA3J5SLKqFYUBCkFL+5WudYlz2n
 XxiUgyviMQxyK+ij66kEi6/2zFDAecd43pHV7790ptqZBC3Jc67Emj7Vo3ShX6RXPPxxbeCTOF2uk
 I45aJ9XcVFH/MFE96NjXj8uahnIsiTPyuCUoJu8tj7TSQyue874qJqVQvqlFyt2aZYJZ8ruq8AEQE
 AAbQpVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT6JAc4EEwEIADgCGwMF
 CwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCX79mdwAKCRCfw
 AsFcf4K7fhbC/wP0kSl6id2E/K3+UdXk6CLMVRbCFLCREzQs5WFpQ6l/I0WGOamhrOgegdszheiVF
 orlUP8d37XSpFAqydhKGaN78V5Dps0Wmwm4lIlS4MtQXJtSLUHXDJLIZLW0pw8tiPLKsd1o/yDkXE
 dnpsjJTRG6SdDSHnyOB2/gh4p+yTaLytFdARk/r4/P26+L+FiH0fFl+RnBt19LPklfKgeDc7GwIif
 ja+nIWpp3W23DAUuI6xduEut25Q89yu7Ci8CliLfAiLy9bIGjBQWU2Y+1/j/7KuPj6VbBsZWLTZY0
 hUmpJSTnWAqc9SMsNxo7NSQuddgviz5e2tqucaRqxP02FGzNa8U4NAKdWaXrlHG5Dglj9XH0DK+SH
 +c96qqFewYD8VPQ6XAGxQcXbrtJmiMor1R2DfziispLRvJcfYs8xqabbCtoS3ouXB9XRi8hn7A2kh
 ME1ryS+Oh63JshXHnw6bmjCpVd/p+fGLIGU6A47pJOpviKR4jEO84pl2ejtDZ3Tc=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-nmfEBCGQ0ZehydftkzsO"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 20:27:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234314


--=-nmfEBCGQ0ZehydftkzsO
Content-Type: multipart/alternative; boundary="=-Z6txMMEAWyLUZydpP4B0"

--=-Z6txMMEAWyLUZydpP4B0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, 2026-03-31 at 12:45 -0700, Khem Raj via lists.openembedded.org
wrote:
>=20
>=20
> On Tue, Mar 31, 2026 at 8:40=E2=80=AFAM J=C3=B6rg Sommer via
> lists.openembedded.org
> <joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
> > Thomas Perrot via lists.openembedded.org schrieb am Di 31. M=C3=A4r,
> > 10:12 (+0200):
> > > From: Thomas Perrot <thomas.perrot@bootlin.com>
> > >=20
> > > Disable LTO for the expect package and append DEBUG_PREFIX_MAP to
> > > TARGET_LDFLAGS when LTO is enabled, ensuring debug info remapping
> > > is applied consistently alongside LTO flags.
> > >=20
> > > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > ---
> > >=C2=A0 meta/conf/distro/include/lto.inc | 1 +
> > >=C2=A0 1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/meta/conf/distro/include/lto.inc
> > b/meta/conf/distro/include/lto.inc
> > > index 8752249685a4..c66dfc5a8074 100644
> > > --- a/meta/conf/distro/include/lto.inc
> > > +++ b/meta/conf/distro/include/lto.inc
> > > @@ -4,6 +4,7 @@
> > >=C2=A0 #
> > >=C2=A0=20
> > >=C2=A0 # Disable LTO for following packages
> > > +LTO:pn-expect =3D ""
> >=20
> > I suspect this is due to the gcc bug not because LTO is unsuitable
> > for
> > expect. Might it be a good idea to move all excludes due to the gcc
> > bug in
> > its own block? This would make it easier to revert them when the
> > bug gets
> > resolved.
> >=20
> >=20
>=20
>=20
> I also wonder if the issue is gcc specific and works with TOOLCHAIN =3D
> "clang"

I investigated further and can confirm your suspicion, this is indeed a
GCC bug,
not an incompatibility between LTO and expect.

                                                                           =
                                                                           =
                                                                           =
                                                                           =
                 =20
With -v added to LDFLAGS, I verified that -ffile-prefix-map flags=20
are correctly passed to lto1. However, the raw TMPDIR path does not
come from expect's own compilation, it leaks from tcl8 via the=20
.debug_line_str section:

$ readelf --debug-dump=3Dline libexpect5.45.4.so | grep '/src/build'=20
0 (indirect line string, offset: 0x7de):=20
/src/build/tmp/work/.../tcl8/8.6.17/build=20
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                 =20
During LTO, when GCC incorporates debug info from a linked dependency
(tcl8 here), the directory entries in .debug_line_str are not subject=20
to prefix remapping. DW_AT_comp_dir is correctly remapped, but=20
.debug_line_str is not.=20
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                 =20
This is not expect-specific, any package linking against tcl8 with LTO=20
could be affected.

                                                                           =
                                                                           =
                                                                           =
                                                                           =
                 =20
Your suggestion to group packages disabled due to this GCC bug=20
in a separate block, I think it's a good idea.

Kind regards,
Thomas

> =C2=A0
> > >=C2=A0 LTO:pn-glibc =3D ""
> > >=C2=A0 LTO:pn-gcc-runtime =3D ""
> > >=C2=A0 LTO:pn-libgcc-initial =3D ""
> > > --=20
> > > 2.53.0
> > >=20
> >=20
> > >=20
> > >=20
> > >=20
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#234313):
> > https://lists.openembedded.org/g/openembedded-core/message/234313
> > Mute This Topic:
> > https://lists.openembedded.org/mt/118593189/5443093
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > thomas.perrot@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=-Z6txMMEAWyLUZydpP4B0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode:=
 space; line-break: after-white-space;"><div>Hello,<br><br></div><div>On Tu=
e, 2026-03-31 at 12:45 -0700, Khem Raj via lists.openembedded.org wrote:</d=
iv><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #7=
29fcf solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><=
br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Mar 31, 2026 at 8:40=E2=80=AFAM J=C3=B6rg Sommer vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
joerg.sommer=3D<a href=3D"mailto:navimatix.de@lists.openembedded.org">navim=
atix.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote type=3D"=
cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-lef=
t:1ex"><div>Thomas Perrot via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> schrieb am Di =
31. M=C3=A4r, 10:12 (+0200):<br>&gt; From: Thomas Perrot &lt;<a href=3D"mai=
lto:thomas.perrot@bootlin.com" target=3D"_blank">thomas.perrot@bootlin.com<=
/a>&gt;<br>&gt; <br>&gt; Disable LTO for the expect package and append DEBU=
G_PREFIX_MAP to<br>&gt; TARGET_LDFLAGS when LTO is enabled, ensuring debug =
info remapping<br>&gt; is applied consistently alongside LTO flags.<br>&gt;=
 <br>&gt; Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@=
bootlin.com" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>&gt; --=
-<br>&gt;&nbsp; meta/conf/distro/include/lto.inc | 1 +<br>&gt;&nbsp; 1 file=
 changed, 1 insertion(+)<br>&gt; <br>&gt; diff --git a/meta/conf/distro/inc=
lude/lto.inc b/meta/conf/distro/include/lto.inc<br>&gt; index 8752249685a4.=
.c66dfc5a8074 100644<br>&gt; --- a/meta/conf/distro/include/lto.inc<br>&gt;=
 +++ b/meta/conf/distro/include/lto.inc<br>&gt; @@ -4,6 +4,7 @@<br>&gt;&nbs=
p; #<br>&gt;&nbsp; <br>&gt;&nbsp; # Disable LTO for following packages<br>&=
gt; +LTO:pn-expect =3D ""<br></div><div><br>I suspect this is due to the gc=
c bug not because LTO is unsuitable for<br>expect. Might it be a good idea =
to move all excludes due to the gcc bug in<br>its own block? This would mak=
e it easier to revert them when the bug gets<br>resolved.<br></div><div><br=
></div><br></blockquote><div><br></div><div>I also wonder if the issue is g=
cc specific and works with TOOLCHAIN =3D "clang"</div></div></div></blockqu=
ote><div><br></div><div></div><div></div><div>I investigated further and ca=
n confirm your suspicion, this is indeed a GCC bug,</div><div>not an incomp=
atibility between LTO and expect.</div><div><br></div><div>                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
  </div><div>  With -v added to LDFLAGS, I verified that -ffile-prefix-map =
flags                                                                      =
                                                                           =
                                                                           =
                               </div><div>  are correctly passed to lto1. H=
owever, the raw TMPDIR path does not</div><div>  come from expect's own com=
pilation, it leaks from tcl8 via the                                       =
                                                                           =
                                                                           =
                                                                </div><div>=
  .debug_line_str section:</div><div><br></div><div>    $ readelf --debug-d=
ump=3Dline libexpect5.45.4.so | grep '/src/build'                          =
                                                                           =
                                                                           =
                                                                        </d=
iv><div>      0  (indirect line string, offset: 0x7de):  </div><div>       =
  /src/build/tmp/work/.../tcl8/8.6.17/build                                =
                                                                           =
                                                                           =
                                                                           =
           </div><div>                                                     =
                                                                           =
                                                                           =
                                                                           =
                                        </div><div>  During LTO, when GCC i=
ncorporates debug info from a linked dependency</div><div>  (tcl8 here), th=
e directory entries in .debug_line_str are not subject                     =
                                                                           =
                                                                           =
                                                                           =
 </div><div>  to prefix remapping. DW_AT_comp_dir is correctly remapped, bu=
t                                                                          =
                                                                           =
                                                                           =
                              </div><div>  .debug_line_str is not.         =
                                                                           =
                                                                           =
                                                                           =
                                                           </div><div>     =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
             </div><div>  This is not expect-specific, any package linking =
against tcl8 with LTO                                                      =
                                                                           =
                                                                           =
                                         </div><div>  could be affected.</d=
iv><div><br></div><div>                                                    =
                                                                           =
                                                                           =
                                                                           =
                                         </div><div>  Your suggestion to gr=
oup packages disabled due to this GCC bug                                  =
                                                                           =
                                                                           =
                                                            </div><div>  in=
 a separate block, I think it's a good idea.</div><div><br></div><div>  Kin=
d regards,</div><div>  Thomas</div><div></div><div><br></div><blockquote ty=
pe=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_contain=
er"><div>&nbsp;</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; =
border-left:2px #729fcf solid;padding-left:1ex"><div>&gt;&nbsp; LTO:pn-glib=
c =3D ""<br>&gt;&nbsp; LTO:pn-gcc-runtime =3D ""<br>&gt;&nbsp; LTO:pn-libgc=
c-initial =3D ""<br>&gt; -- <br>&gt; 2.53.0<br>&gt; <br></div><div><br>&gt;=
 <br>&gt; <br>&gt; <br></div><div><br></div><div><br></div><div>-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br></div><div>Links: You receive all m=
essages sent to this group.<br></div><div>View/Reply Online (#234313): <a h=
ref=3D"https://lists.openembedded.org/g/openembedded-core/message/234313">h=
ttps://lists.openembedded.org/g/openembedded-core/message/234313</a><br></d=
iv><div>Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11859=
3189/5443093">https://lists.openembedded.org/mt/118593189/5443093</a><br></=
div><div>Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.opene=
mbedded.org">openembedded-core+owner@lists.openembedded.org</a><br></div><d=
iv>Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-co=
re/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a>&nbsp=
;[<a href=3D"mailto:thomas.perrot@bootlin.com">thomas.perrot@bootlin.com</a=
>]<br></div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br></div><di=
v><br></div></blockquote></div></div></blockquote><div><br></div><div><span=
><pre>-- <br></pre><pre>Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

</pre></span></div></body></html>

--=-Z6txMMEAWyLUZydpP4B0--

--=-nmfEBCGQ0ZehydftkzsO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmnMLhwACgkQn8ALBXH+
Cu2EEAv+MKCNrZWsw0PSpYV4LnijNF43CBTD1hzBPGhhrEPUzJjneyiLQmWGFRJG
ZYTQkUjVIFkE9+NAIaRNDfyq41Qs69tvLYDcMHmV9lRts9kigsBMs9HYBB25UYXH
+8Rqd/0MhIALb6tSmwIpbfKfR8FeXVg1EPt50c/5X9/rupTeqt6aDTBfM6CvQ0e2
75DnQPU7iGFchniU1NELQxx9gb2eQrCjbTQgP8dNioZZysgngWWSPR1OMizoA70O
r4Ac2MPvXK8ULdPpuwpx4QLzLVDh3FeNbQon+3ciA9p3wcWfJjJzGJ3FEBajI4W6
kPVD0rJn9pRthMN+ztN4WnRIAJTSGMq0Nat8WJ2/iwGCMQACT1dPIPtL/dt1SAHj
vfwCo84kIjM0KO+lzJ6s2Jkh4TYxz+tZft3x8u7ABT1bkL6WHTvBDsChuXD/teua
gV7jn6hiAay2PAkYSnPeB+9sAVUg9Ek4ZolBaG4y90o9mhdMVUbmdsjACG2vObc7
lpWmO4N/
=EpwD
-----END PGP SIGNATURE-----

--=-nmfEBCGQ0ZehydftkzsO--

