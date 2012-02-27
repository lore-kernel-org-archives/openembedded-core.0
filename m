Received: from col0-omc3-s16.col0.hotmail.com ([65.55.34.154])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyoonn@hotmail.com>)
	id 1S29Ni-00073f-Fz; Mon, 27 Feb 2012 23:49:23 +0100
Received: from COL120-W36 ([65.55.34.135]) by col0-omc3-s16.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 27 Feb 2012 14:39:51 -0800
Message-ID: <COL120-W36A0C340F8E742B6764468DD690@phx.gbl>
X-Originating-IP: [70.137.142.215]
From: simran singh <kyoonn@hotmail.com>
To: <openembedded-core@lists.openembedded.org>,
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Feb 2012 14:39:49 -0800
Importance: Normal
In-Reply-To: <COL120-W40B503FFC0574E4957B971DD6B0@phx.gbl>
References: <COL120-W40B503FFC0574E4957B971DD6B0@phx.gbl>
MIME-Version: 1.0
X-OriginalArrivalTime: 27 Feb 2012 22:39:51.0238 (UTC)
	FILETIME=[B7B22660:01CCF5A0]
Subject: Re: [oe] BOTAN crypto library
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
X-List-Received-Date: Mon, 27 Feb 2012 22:49:23 -0000
Content-Type: multipart/alternative;
	boundary="_b5ac102b-4580-45ea-8930-771cec077aca_"

--_b5ac102b-4580-45ea-8930-771cec077aca_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello=2C



I figured out the solution. Posting here for someone else lost like me.



Had to add this line:



export LDFLAGS =3D "-L${STAGING_LIBDIR}"





From: kyoonn@hotmail.com
To: openembedded-core@lists.openembedded.org=3B openembedded-devel@lists.op=
enembedded.org
Date: Fri=2C 24 Feb 2012 16:15:19 -0800
Subject: [oe] BOTAN crypto library

=20
Hello=2C
=20
I hope this is right place to ask for help regarding this. I am trying to b=
uild the Botan crytpo library using
system builder. I created a recipe for this and I am getting an error when =
I try to $make the library.
This is the error I am getting:
=20
| /usr/bin/ld: /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder=
/build_p4080ds_release/sysroots/
ppce500mc-linux/usr/lib/crti.o: Relocations in generic ELF (EM: 20)
| /usr/bin/ld: /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder=
/build_p4080ds_release/sysroots/
ppce500mc-linux/usr/lib/crti.o: Relocations in generic ELF (EM: 20)
| /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080d=
s_release/sysroots/
ppce500mc-linux/usr/lib/crti.o: could not read symbols: File in wrong forma=
t
| collect2: ld returned 1 exit status
| make: *** [libbotan-1.10.so.0.1] Error 1
| ERROR: Function do_install failed
=20
I am guessing this has to do something with the linking of the libbotan-1.1=
0.so.0.1 file. Please advice. I have attached
the recipe that I created
Thank you for any help.
=20
Simran
 		 	   		 =20

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel 		 	=
   		  =

--_b5ac102b-4580-45ea-8930-771cec077aca_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 10pt=3B
font-family:Tahoma
}
--></style></head>
<body class=3D'hmmessage'><div dir=3D'ltr'>
Hello=2C<br>
<br>
I figured out the solution. Posting here for someone else lost like me.<br>
<br>
Had to add this line:<br>
<br>
export LDFLAGS =3D "-L${STAGING_LIBDIR}"<br><br><br><br><br><br><div><div i=
d=3D"SkyDrivePlaceholder"></div>From: kyoonn@hotmail.com<br>To: openembedde=
d-core@lists.openembedded.org=3B openembedded-devel@lists.openembedded.org<=
br>Date: Fri=2C 24 Feb 2012 16:15:19 -0800<br>Subject: [oe] BOTAN crypto li=
brary<br><br><pre> <br>Hello=2C<br> <br>I hope this is right place to ask f=
or help regarding this. I am trying to build the Botan crytpo library using=
<br>system builder. I created a recipe for this and I am getting an error w=
hen I try to $make the library.<br>This is the error I am getting:<br> <br>=
| /usr/bin/ld: /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder=
/build_p4080ds_release/sysroots/<br>ppce500mc-linux/usr/lib/crti.o: Relocat=
ions in generic ELF (EM: 20)<br>| /usr/bin/ld: /home/Simran/Freescale/QorIQ=
-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/sysroots/<br>ppce500=
mc-linux/usr/lib/crti.o: Relocations in generic ELF (EM: 20)<br>| /home/Sim=
ran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/s=
ysroots/<br>ppce500mc-linux/usr/lib/crti.o: could not read symbols: File in=
 wrong format<br>| collect2: ld returned 1 exit status<br>| make: *** [libb=
otan-1.10.so.0.1] Error 1<br>| ERROR: Function do_install failed<br> <br>I =
am guessing this has to do something with the linking of the libbotan-1.10.=
so.0.1 file. Please advice. I have attached<br>the recipe that I created<br=
>Thank you for any help.<br> <br>Simran<br> 		 	   		  <br></pre><br>______=
_________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel</div=
> 		 	   		  </div></body>
</html>=

--_b5ac102b-4580-45ea-8930-771cec077aca_--
