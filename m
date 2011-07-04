Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>)
	id 1Qdkh8-0007eY-Cl; Mon, 04 Jul 2011 17:04:18 +0200
Received: from server ([unknown] [173.74.34.213]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0LNT00BJJAW3BS80@vms173011.mailsrvcs.net>; Mon,
	04 Jul 2011 09:00:03 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 36659B; Mon, 04 Jul 2011 08:59:56 -0500
Received: from [192.168.1.2] by rkmorris.us with HTTP; Mon,
	04 Jul 2011 08:59:55 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Mon, 04 Jul 2011 08:59:55 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-id: <1309787995311998500@rkmorris.us>
In-reply-to: <1309729276205539500@rkmorris.us>
References: <1307481663432021500@rkmorris.us> <4DEFBF58.1010903@mentor.com>
	<1308007647883960500@rkmorris.us> <4DF8119C.2000106@mentor.com>
	<1308515164700783500@rkmorris.us> <1309729276205539500@rkmorris.us>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 2
X-Mailman-Approved-At: Sat, 09 Jul 2011 10:36:34 +0200
Subject: Re: [oe] Builds Failing
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
X-List-Received-Date: Mon, 04 Jul 2011 15:04:18 -0000
Content-type: multipart/alternative;
	boundary="===axigen=7742681010269666934134179507013809033441=axigen==="

--===axigen=7742681010269666934134179507013809033441=axigen===
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

FYI - I (locally) deleted the bash 3.2 recipe ...and the build works fine n=
ow! It seems that bash 3.0 is fine, but 3.2 has issues for some reason.

=20

Hopefully this saves someone else the same grief.

=20

... Russell

=20



On Sun, 07/03/2011 04:41 PM, Russell Morris <openembedded@rkmorris.us> wrot=
e:


>=20
Has anyone had any luck with bash lately? I can't get it to build - so even=
 console-image fails.
>=20
>=20
>=20
> Thanks!
>=20
>=20
>=20
> ... Russell
>=20
>=20
>=20
>=20
>=20
> On Sun, 06/19/2011 03:26 PM, Russell Morris <openembedded@rkmorris.us> wr=
ote:
>=20
>=20
> >=20
>=20
>=20
> Hi,
>=20
> >=20
> Sorry for the delay - out of town for a few days, just got back to this.
>=20
> >=20
> I did what you mentioned below, modified the recipe for bash_3.2 ... but =
now a new error ... :-). Here is what I get,
>=20
> >=20
>=20
> NOTE: Running task 3201 of 6177 (ID: 3047, /mnt/OpenEmbedded/openembedded=
/recipes/bash/bash_3.2.bb, do_setscene)
> NOTE: package bash-3.2-r13: task do_setscene: Started
> NOTE: package bash-3.2-r13: task do_setscene: Succeeded
> NOTE: Running task 3202 of 6177 (ID: 3046, /mnt/OpenEmbedded/openembedded=
/recipes/bash/bash_3.2.bb, do_fetch)
> NOTE: package bash-3.2-r13: task do_fetch: Started
> NOTE: package bash-3.2-r13: task do_fetch: Succeeded
> NOTE: Running task 3203 of 6177 (ID: 3039, /mnt/OpenEmbedded/openembedded=
/recipes/bash/bash_3.2.bb, do_unpack)
> NOTE: package bash-3.2-r13: task do_unpack: Started
> NOTE: package bash-3.2-r13: task do_unpack: Succeeded
> NOTE: Running task 3637 of 6177 (ID: 3040, /mnt/OpenEmbedded/openembedded=
/recipes/bash/bash_3.2.bb, do_patch)
> NOTE: package bash-3.2-r13: task do_patch: Started
> ERROR: Execution of 'git --git-dir=3D. apply -p0 /mnt/OpenEmbedded/source=
s/bash32-001' failed with exit code 1:
> error: No changes
>=20
> >=20
> NOTE: package bash-3.2-r13: task patch_do_patch: Failed
> ERROR: Function 'patch_do_patch' failed
> ERROR: Task 3040 (/mnt/OpenEmbedded/openembedded/recipes/bash/bash_3.2.bb=
, do_patch) failed with exit code '1'
> ERROR: '/mnt/OpenEmbedded/openembedded/recipes/bash/bash_3.2.bb' failed
>=20
> >=20
> Thoughts?
>=20
> >=20
> Thanks,
> ... Russell
>=20
> >=20
> > On Tue, 06/14/2011 08:57 PM, Tom Rini <tom_rini@mentor.com> wrote:
> >=20
> >=20
> On 06/13/2011 04:27 PM, Russell Morris wrote:
> > > Hi,
> > > Perhaps a dumb question, but ... do I need to do this? I can give it =
a try (though I'm not quite sure I understand what needs to be changed). Ju=
st trying to figure out how to get this working again.
> > > Thanks!
> >=20
> > Since you have a failing setup, yes, please :)
> >=20
> > To make git be used as the patch tool, add
> > PATCHTOOL =3D "git" to the recipe, increase the PR and add a comment ab=
out
> > why we do this.
> >=20
> > --
> > Tom Rini
> > Mentor Graphics Corporation
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

--===axigen=7742681010269666934134179507013809033441=axigen===
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html><head><style id=3D"axi-htmleditor-style" type=3D"text/css">p { margin=
: 0px; }</style></head><body style=3D"font-size: 10pt; font-family: Arial; =
background-image: none; background-repeat: repeat; background-attachment: f=
ixed;"><P>FYI - I (locally) deleted the bash 3.2 recipe ...and the build wo=
rks fine now! It seems that bash 3.0 is fine, but 3.2 has issues for some r=
eason.</P>
<P>&nbsp;</P>
<P>Hopefully this saves someone else the same grief.</P>
<P>&nbsp;</P>
<P>... Russell</P>
<P>&nbsp;</P>
<P><BR><BR>On Sun, 07/03/2011 04:41 PM, Russell&nbsp;Morris&nbsp;&lt;openem=
bedded@rkmorris.us&gt; wrote:<BR></P>
<BLOCKQUOTE style=3D"BORDER-LEFT: rgb(0,0,204) 2px solid; PADDING-LEFT: 4px=
; MARGIN-LEFT: 16px">
<DIV style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">Has anyone had any luck =
with bash lately? I can't get it to build - so even console-image fails.<BR=
><BR><BR><BR>Thanks!<BR><BR><BR><BR>... Russell<BR><BR><BR><BR><BR><BR>On S=
un, 06/19/2011 03:26 PM, Russell Morris &lt;<A href=3D"mailto:openembedded@=
rkmorris.us" target=3D_blank>openembedded@rkmorris.us</A>&gt; wrote:<BR><BR=
><BR>&gt; <BR><BR><BR>Hi,<BR><BR>&gt; <BR>Sorry for the delay - out of town=
 for a few days, just got back to this.<BR><BR>&gt; <BR>I did what you ment=
ioned below, modified the recipe for bash_3.2 ... but now a new error ... :=
-). Here is what I get,<BR><BR>&gt; <BR><BR>NOTE: Running task 3201 of 6177=
 (ID: 3047, /mnt/OpenEmbedded/openembedded/recipes/bash/bash_3.2.bb, do_set=
scene)<BR>NOTE: package bash-3.2-r13: task do_setscene: Started<BR>NOTE: pa=
ckage bash-3.2-r13: task do_setscene: Succeeded<BR>NOTE: Running task 3202 =
of 6177 (ID: 3046, /mnt/OpenEmbedded/openembedded/recipes/bash/bash_3.2.bb,=
 do_fetch)<BR>NOTE: package bash-3.2-r13: task do_fetch: Started<BR>NOTE: p=
ackage bash-3.2-r13: task do_fetch: Succeeded<BR>NOTE: Running task 3203 of=
 6177 (ID: 3039, /mnt/OpenEmbedded/openembedded/recipes/bash/bash_3.2.bb, d=
o_unpack)<BR>NOTE: package bash-3.2-r13: task do_unpack: Started<BR>NOTE: p=
ackage bash-3.2-r13: task do_unpack: Succeeded<BR>NOTE: Running task 3637 o=
f 6177 (ID: 3040, /mnt/OpenEmbedded/openembedded/recipes/bash/bash_3.2.bb, =
do_patch)<BR>NOTE: package bash-3.2-r13: task do_patch: Started<BR>ERROR: E=
xecution of 'git --git-dir=3D. apply -p0 /mnt/OpenEmbedded/sources/bash32-0=
01' failed with exit code 1:<BR>error: No changes<BR><BR>&gt; <BR>NOTE: pac=
kage bash-3.2-r13: task patch_do_patch: Failed<BR>ERROR: Function 'patch_do=
_patch' failed<BR>ERROR: Task 3040 (/mnt/OpenEmbedded/openembedded/recipes/=
bash/bash_3.2.bb, do_patch) failed with exit code '1'<BR>ERROR: '/mnt/OpenE=
mbedded/openembedded/recipes/bash/bash_3.2.bb' failed<BR><BR>&gt; <BR>Thoug=
hts?<BR><BR>&gt; <BR>Thanks,<BR>... Russell<BR><BR>&gt; <BR>&gt; On Tue, 06=
/14/2011 08:57 PM, Tom Rini &lt;<A href=3D"mailto:tom_rini@mentor.com" targ=
et=3D_blank>tom_rini@mentor.com</A>&gt; wrote:<BR>&gt; <BR>&gt; <BR>On 06/1=
3/2011 04:27 PM, Russell Morris wrote:<BR>&gt; &gt; Hi,<BR>&gt; &gt; Perhap=
s a dumb question, but ... do I need to do this? I can give it a try (thoug=
h I'm not quite sure I understand what needs to be changed). Just trying to=
 figure out how to get this working again.<BR>&gt; &gt; Thanks!<BR>&gt; <BR=
>&gt; Since you have a failing setup, yes, please :)<BR>&gt; <BR>&gt; To ma=
ke git be used as the patch tool, add<BR>&gt; PATCHTOOL =3D "git" to the re=
cipe, increase the PR and add a comment about<BR>&gt; why we do this.<BR>&g=
t; <BR>&gt; --<BR>&gt; Tom Rini<BR>&gt; Mentor Graphics Corporation<BR>&gt;=
 <BR>&gt; _______________________________________________<BR>&gt; Openembed=
ded-devel mailing list<BR>&gt;<A href=3D"mailto:%20Openembedded-devel@lists=
.openembedded.org" target=3D_blank> Openembedded-devel@lists.openembedded.o=
rg</A><BR>&gt; <A href=3D"http://server.home:8080/redir.hsp?url=3D%68%74%74=
%70%3A%2F%2F%6C%69%73%74%73%2E%6C%69%6E%75%78%74%6F%67%6F%2E%6F%72%67%2F%63=
%67%69%2D%62%69%6E%2F%6D%61%69%6C%6D%61%6E%2F%6C%69%73%74%69%6E%66%6F%2F%6F=
%70%65%6E%65%6D%62%65%64%64%65%64%2D%64%65%76%65%6C" target=3D_blank>http:/=
/lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel</A><BR>&gt=
; <BR>_______________________________________________<BR>Openembedded-devel mailing list<BR><A href=3D"mailto:Op=
enembedded-devel@lists.openembedded.org" target=3D_blank>Openembedded-devel=
@lists.openembedded.org</A><BR><A href=3D"http://server.home:8080/redir.hsp=
?url=3D%68%74%74%70%3A%2F%2F%6C%69%73%74%73%2E%6C%69%6E%75%78%74%6F%67%6F%2=
E%6F%72%67%2F%63%67%69%2D%62%69%6E%2F%6D%61%69%6C%6D%61%6E%2F%6C%69%73%74%6=
9%6E%66%6F%2F%6F%70%65%6E%65%6D%62%65%64%64%65%64%2D%64%65%76%65%6C" target=
=3D_blank>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
devel</A><BR></DIV></BLOCKQUOTE></body></html>

--===axigen=7742681010269666934134179507013809033441=axigen===--
