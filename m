Received: from smtplq-out14.aruba.it ([62.149.158.34] helo=smtplq02.aruba.it)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <stefano@supergenesis.it>) id 1SXw7d-0004ec-Mu
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 17:08:09 +0200
Received: (qmail 9449 invoked by uid 89); 25 May 2012 14:51:17 -0000
Received: from unknown (HELO smtp1.aruba.it) (62.149.158.221)
	by smtplq02.aruba.it with SMTP; 25 May 2012 14:51:17 -0000
Received: (qmail 18486 invoked by uid 89); 25 May 2012 14:51:17 -0000
Received: from unknown (HELO ?192.168.0.20?)
	(stefano@supergenesis.it@151.65.14.50)
	by smtp1.ad.aruba.it with SMTP; 25 May 2012 14:51:17 -0000
Message-ID: <4FBF9C60.5030000@supergenesis.it>
Date: Fri, 25 May 2012 16:51:12 +0200
From: Stefano <stefano@supergenesis.it>
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Spam-Rating: smtp1.ad.aruba.it 1.6.2 0/1000/N
X-Spam-Rating: smtplq02.aruba.it 1.6.2 0/1000/N
Subject: qt embedded enable plugin-gfx-powervr
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
X-List-Received-Date: Fri, 25 May 2012 15:08:09 -0000
Content-Type: multipart/alternative;
	boundary="------------070301050906070507080808"

--------------070301050906070507080808
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable

I see the latest version of qt embedded does not include the=20
plugin-gfx-powervr. The latest qt4-embedded.inc is configured:

QT_CONFIG_FLAGS +=3D " \
   -embedded ${QT_ARCH} \
   -qtlibinfix ${QT_LIBINFIX} \
   -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc
   -plugin-gfx-directfb \
   -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinput \=

   -qt-kbd-tty \
   -DQT_KEYPAD_NAVIGATION \
   "

but without -plugin-gfx-powervr. This is because powervr need =20
-DQT_NO_QWS_CURSOR and  -DQT_WS_CLIENTBLIT?
I'm trying to modify the recipes to include powervr pluging, i have add=20
-plugin-gfx-powervr -DQT_NO_QWS_CURSOR -DQT_WS_CLIENTBLIT. But this=20
operation need two patches=20
https://github.com/prabindh/qt-configs/tree/master/qt4.8

Somebody know a good solution to get the possibility to compile this=20
plugin?
Thank's for your time.

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


--------------070301050906070507080808
Content-Type: text/html; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DISO=
-8859-15">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    I see the latest version of qt <span id=3D"result_box"
      class=3D"short_text" lang=3D"en"><span class=3D"hps">embedded does =
not</span>
      <span class=3D"hps">include </span></span><span id=3D"result_box"
      class=3D"short_text" lang=3D"en"><span class=3D"hps">the </span></s=
pan>plugin-gfx-powervr.
    The latest qt4-embedded.inc is configured:<br>
    <br>
    QT_CONFIG_FLAGS +=3D " \<br>
    =A0
    -embedded ${QT_ARCH} \<br>
    =A0 -qtlibinfix ${QT_LIBINFIX} \<br>
    =A0 -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc<br>
    =A0 -plugin-gfx-directfb \<br>
    =A0 -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb
    -qt-mouse-linuxinput \<br>
    =A0 -qt-kbd-tty \<br>
    =A0 -DQT_KEYPAD_NAVIGATION \<br>
    =A0 "<br>
    <br>
    but without -plugin-gfx-powervr. This is because powervr need=A0
    -DQT_NO_QWS_CURSOR and =A0-DQT_WS_CLIENTBLIT?<br>
    I'm trying to modify the recipes to include powervr pluging, i have
    add -plugin-gfx-powervr -DQT_NO_QWS_CURSOR -DQT_WS_CLIENTBLIT. But
    this operation need two patches
    <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/prabind=
h/qt-configs/tree/master/qt4.8">https://github.com/prabindh/qt-configs/tr=
ee/master/qt4.8</a><br>
    <br>
    Somebody know a good solution to get the <span id=3D"result_box"
      class=3D"short_text" lang=3D"en"><span class=3D"hps">possibility to=

        compile this plugin? <br>
        Thank's for your time.<br>
      </span></span><br>
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

--------------070301050906070507080808--
