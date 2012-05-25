Received: from smtplq-out14.aruba.it ([62.149.158.34] helo=smtplq04.aruba.it)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <stefano@supergenesis.it>) id 1SXwUk-00009R-KA
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 17:32:02 +0200
Received: (qmail 8845 invoked by uid 89); 25 May 2012 15:21:49 -0000
Received: from unknown (HELO smtp7.aruba.it) (62.149.158.227)
	by smtplq04.aruba.it with SMTP; 25 May 2012 15:21:49 -0000
Received: (qmail 10135 invoked by uid 89); 25 May 2012 15:21:49 -0000
Received: from unknown (HELO ?192.168.0.20?)
	(stefano@supergenesis.it@151.65.14.50)
	by smtp7.ad.aruba.it with SMTP; 25 May 2012 15:21:49 -0000
Message-ID: <4FBFA389.3040201@supergenesis.it>
Date: Fri, 25 May 2012 17:21:45 +0200
From: Stefano <stefano@supergenesis.it>
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4FBF9C60.5030000@supergenesis.it>
	<20120525151124.GA31846@mail.familie-heinold.de>
In-Reply-To: <20120525151124.GA31846@mail.familie-heinold.de>
X-Spam-Rating: smtp7.ad.aruba.it 1.6.2 0/1000/N
X-Spam-Rating: smtplq04.aruba.it 1.6.2 0/1000/N
Subject: Re: qt embedded enable plugin-gfx-powervr
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
X-List-Received-Date: Fri, 25 May 2012 15:32:02 -0000
Content-Type: multipart/alternative;
	boundary="------------040900040400060205010805"

--------------040900040400060205010805
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Il 25/05/2012 17.11, Henning Heinold ha scritto:
> On Fri, May 25, 2012 at 04:51:12PM +0200, Stefano wrote:
>> I see the latest version of qt embedded does not include the
>> plugin-gfx-powervr. The latest qt4-embedded.inc is configured:
>>
>> QT_CONFIG_FLAGS +=3D " \
>>    -embedded ${QT_ARCH} \
>>    -qtlibinfix ${QT_LIBINFIX} \
>>    -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc
>>    -plugin-gfx-directfb \
>>    -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinpu=
t \
>>    -qt-kbd-tty \
>>    -DQT_KEYPAD_NAVIGATION \
>>    "
>>
>> but without -plugin-gfx-powervr. This is because powervr need
>> -DQT_NO_QWS_CURSOR and  -DQT_WS_CLIENTBLIT?
>> I'm trying to modify the recipes to include powervr pluging, i have
>> add -plugin-gfx-powervr -DQT_NO_QWS_CURSOR -DQT_WS_CLIENTBLIT. But
>> this operation need two patches
>> https://github.com/prabindh/qt-configs/tree/master/qt4.8
>>
>> Somebody know a good solution to get the possibility to compile this
>> plugin?
>> Thank's for your time.
>>
>> --=20
>> /Cordiali Saluti/
>> *Stefano Stucchi
>> *
>> *Genesis srl*
>> Via L. Manara 3/A
>> 25126 Brescia
> Hi,
>
> are you sure you need the plugin? Koen mostly stated that the powervr p=
lugin doesnt give much improvement.
>
> Bye Henning
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
I'm using beagleboard... and i'm read i need powervr to improve=20
performance of opengl. But i can't test if is true or not because i=20
can't build the plugin :)

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


--------------040900040400060205010805
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Il 25/05/2012 17.11, Henning Heinold ha scritto:
    <blockquote
      cite="mid:20120525151124.GA31846@mail.familie-heinold.de"
      type="cite">
      <pre wrap="">On Fri, May 25, 2012 at 04:51:12PM +0200, Stefano wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">I see the latest version of qt embedded does not include the
plugin-gfx-powervr. The latest qt4-embedded.inc is configured:

QT_CONFIG_FLAGS += " \
  -embedded ${QT_ARCH} \
  -qtlibinfix ${QT_LIBINFIX} \
  -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc
  -plugin-gfx-directfb \
  -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinput \
  -qt-kbd-tty \
  -DQT_KEYPAD_NAVIGATION \
  "

but without -plugin-gfx-powervr. This is because powervr need
-DQT_NO_QWS_CURSOR and  -DQT_WS_CLIENTBLIT?
I'm trying to modify the recipes to include powervr pluging, i have
add -plugin-gfx-powervr -DQT_NO_QWS_CURSOR -DQT_WS_CLIENTBLIT. But
this operation need two patches
<a class="moz-txt-link-freetext" href="https://github.com/prabindh/qt-configs/tree/master/qt4.8">https://github.com/prabindh/qt-configs/tree/master/qt4.8</a>

Somebody know a good solution to get the possibility to compile this
plugin?
Thank's for your time.

-- 
/Cordiali Saluti/
*Stefano Stucchi
*
*Genesis srl*
Via L. Manara 3/A
25126 Brescia
</pre>
      </blockquote>
      <pre wrap="">
Hi,

are you sure you need the plugin? Koen mostly stated that the powervr plugin doesnt give much improvement.

Bye Henning

_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>


</pre>
    </blockquote>
    I'm using beagleboard... and i'm read i need powervr to improve
    performance of opengl. But i can't test if is true or not because i
    can't build the plugin :)<br>
    <br>
    <div class="moz-signature">-- <br>
      <font face="Helvetica, Arial, sans-serif"><small><i>Cordiali
            Saluti</i></small></font><br>
      <font face="Arial"><b><small>Stefano Stucchi<br>
          </small></b><br>
      </font><b><font face="Windsor"><big><big>Genesis <small><small>srl</small></small></big></big></font></b><br>
      <font face="Arial">Via L. Manara 3/A<br>
        25126 Brescia<br>
        <br>
        Tel: (+39) 030 5030499<br>
        <a class="moz-txt-link-abbreviated"
          href="http://www.supergenesis.it">www.supergenesis.it</a></font><br>
      <br>
      <small><font face="Arial">Il contenuto di questo messaggio &egrave;
          confidenziale e riservato.<br>
          Pu&ograve; contenere informazioni la cui riservatezza &egrave; tutelata
          legalmente.<br>
          Ne sono vietati la riproduzione, la diffusione e l'uso.<br>
          <br>
        </font></small><small><font face="Arial">This message is for the
          addressee only. It may contain informations protected by law.
          Reproduction, transmission, or use of this message is
          prohibited.<br>
        </font></small><br>
    </div>
  </body>
</html>

--------------040900040400060205010805--
