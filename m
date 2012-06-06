Received: from smtplq-out14.aruba.it ([62.149.158.34] helo=smtplq02.aruba.it)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <stefano@supergenesis.it>) id 1ScHv5-0002z1-BG
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 17:13:11 +0200
Received: (qmail 29840 invoked by uid 89); 6 Jun 2012 15:02:43 -0000
Received: from unknown (HELO smtp6.aruba.it) (62.149.158.226)
	by smtplq02.aruba.it with SMTP; 6 Jun 2012 15:02:43 -0000
Received: (qmail 20849 invoked by uid 89); 6 Jun 2012 14:56:00 -0000
Received: from unknown (HELO ?192.168.0.20?)
	(stefano@supergenesis.it@151.65.12.244)
	by smtp6.ad.aruba.it with SMTP; 6 Jun 2012 14:56:00 -0000
Message-ID: <4FCF6F75.6020508@supergenesis.it>
Date: Wed, 06 Jun 2012 16:55:49 +0200
From: Stefano <stefano@supergenesis.it>
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:13.0) Gecko/20120604 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Spam-Rating: smtp6.ad.aruba.it 1.6.2 0/1000/N
X-Spam-Rating: smtplq02.aruba.it 1.6.2 0/1000/N
Subject: kernel 3.2.18 hid-multitouch
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
X-List-Received-Date: Wed, 06 Jun 2012 15:13:11 -0000
Content-Type: multipart/alternative;
	boundary="------------030406020809030805080106"

--------------030406020809030805080106
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi, i'm using Angstrom with kernel 3.2.18 i want add hid-multitouch so i =

use this step:

opkg install kernel-module-hid-multitouch
modprobe hid-multitouch
[  655.797180] hid_multitouch: Unknown symbol usbhid_submit_report (err 0=
)
FATAL: Error inserting hid_multitouch=20
(/lib/modules/3.2.18/kernel/drivers/hid/hid-multitouch.ko): Unknown=20
symbol in module, or unknown parameter (see dmesg)

How to solve?
--=20
/Cordiali Saluti/
*Stefano Stucchi
*
*Genesis srl*
Via L. Manara 3/A
25126 Brescia

Tel: (+39) 030 5030499
www.supergenesis.it

Il contenuto di questo messaggio =E8 confidenziale e riservato.
Pu=F2 contenere informazioni la cui riservatezza =E8 tutelata legalmente.=

Ne sono vietati la riproduzione, la diffusione e l'uso.

This message is for the addressee only. It may contain informations=20
protected by law. Reproduction, transmission, or use of this message is=20
prohibited.


--------------030406020809030805080106
Content-Type: text/html; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DISO=
-8859-15">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hi, i'm using Angstrom with kernel 3.2.18 i want add hid-multitouch
    so i use this step:<br>
    <br>
    opkg install kernel-module-hid-multitouch <br>
    modprobe hid-multitouch<br>
    [=A0 655.797180] hid_multitouch: Unknown symbol usbhid_submit_report
    (err 0)<br>
    FATAL: Error inserting hid_multitouch
    (/lib/modules/3.2.18/kernel/drivers/hid/hid-multitouch.ko): Unknown
    symbol in module, or unknown parameter (see dmesg)<br>
    <br>
    How to solve?<br>
    <div class=3D"moz-signature">-- <br>
      <font face=3D"Helvetica, Arial, sans-serif"><small><i>Cordiali
            Saluti</i></small></font><br>
      <font face=3D"Arial"><b><small>Stefano Stucchi<br>
          </small></b><br>
      </font><b><font face=3D"Windsor"><big><big>Genesis <small><small>sr=
l</small></small></big></big></font></b><br>
      <font face=3D"Arial">Via L. Manara 3/A<br>
        25126 Brescia<br>
        <br>
        Tel: (+39) 030 5030499<br>
        <a class=3D"moz-txt-link-abbreviated"
          href=3D"http://www.supergenesis.it">www.supergenesis.it</a></fo=
nt><br>
      <br>
      <small><font face=3D"Arial">Il contenuto di questo messaggio =E8
          confidenziale e riservato.<br>
          Pu=F2 contenere informazioni la cui riservatezza =E8 tutelata
          legalmente.<br>
          Ne sono vietati la riproduzione, la diffusione e l'uso.<br>
          <br>
        </font></small><small><font face=3D"Arial">This message is for th=
e
          addressee only. It may contain informations protected by law.
          Reproduction, transmission, or use of this message is
          prohibited.<br>
        </font></small><br>
    </div>
  </body>
</html>

--------------030406020809030805080106--
