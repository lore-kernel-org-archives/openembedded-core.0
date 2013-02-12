Received: from mail-ie0-f169.google.com ([209.85.223.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mhalstead@linuxfoundation.org>) id 1U5DDp-0006bX-RO
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 11:36:59 +0100
Received: by mail-ie0-f169.google.com with SMTP id 13so8993362iea.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 02:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:x-enigmail-version:content-type;
	bh=uU0xSXLq09Sq8UtFK+LuwxE7BgcS3b6RjSsn9UWzlto=;
	b=UGOY5SSSU+KfKtfqXXhAJ/XxmXglaOUqxhNKYoobwHNfiPA4dC1GA4Y52bi3MAJlod
	NTESmH9OcnBfFZN2Dl2a5O/S2VBG0np9rgfdIEkVFp3K/6ZH/kYMR+fR/WHLpkIzMJRJ
	YOWve+9FpjxNIhqDBPhLwDECDNQcUshIXfv7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:x-enigmail-version:content-type
	:x-gm-message-state;
	bh=uU0xSXLq09Sq8UtFK+LuwxE7BgcS3b6RjSsn9UWzlto=;
	b=cBD98Ch7oj1Lpb9x1zNvYiccUDWDLZZTkmTTCGQ81w+IRpjxR6BYB47gbl2RPlpjpk
	f1h3ueQ+gVlpbEDwJSUSmpoiYoVkI8JCs9eTMozOPEygpSwDwXQYmSP/mdUmDIHlLUoN
	IUQC9XbAVYw3S528A6bm0Q9pmbyL+PDJAoAb60XkwBszD8g1EinuHJKRthpss5b/h538
	wUVhGE5x8xFtMaBzz4EZ0kD6xBwahnoTUfanbrMKXc9ecXz2Ic08ZKaf2QPBx09q+9w5
	IsOzAT4fJ7UcxyYtCLgRlJt7C6We/5zY68PkP/p1ay6cDWQweZBTkHaRbUD5TFGdvkiK
	+PIA==
X-Received: by 10.50.88.199 with SMTP id bi7mr1817578igb.70.1360664421983;
	Tue, 12 Feb 2013 02:20:21 -0800 (PST)
Received: from [192.168.1.66] (static-50-43-37-91.bvtn.or.frontiernet.net.
	[50.43.37.91])
	by mx.google.com with ESMTPS id px5sm31307207igc.0.2013.02.12.02.20.19
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Feb 2013 02:20:20 -0800 (PST)
Sender: Michael Halstead <mhalstead@linuxfoundation.org>
Message-ID: <511A176D.2020207@yoctoproject.org>
Date: Tue, 12 Feb 2013 02:20:29 -0800
From: Michael Halstead <michael@yoctoproject.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Andrei Gherzan <andrei@gherzan.ro>
References: <50D17BD22A23EE4A887974F6B5882038855FB4BE@ALA-MBB.corp.ad.wrs.com>
	<CAK18fxFaVeETyzWOCK0j3q3iVZUZxygbwoiREPcK-jfbsWNAjg@mail.gmail.com>
	<3827804.EL3IkEV3FJ@helios>
	<CAK18fxFJBGM5=bqy=LJuYff0XbSdpTR5poyHLpCs4ySNFcGBTQ@mail.gmail.com>
In-Reply-To: <CAK18fxFJBGM5=bqy=LJuYff0XbSdpTR5poyHLpCs4ySNFcGBTQ@mail.gmail.com>
X-Enigmail-Version: 1.4.6
X-Gm-Message-State: ALoCoQlQFUxqKfjKNO3bxadDe2FdTLw7I5aDW3trjMkWkME2bW4idjQEjxhdqLxAS1+Tg390zCNu
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [denzil] qt 4.8.0 is not available from source anymore
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 10:37:00 -0000
X-Groupsio-MsgNum: 35337
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha1; boundary="------------ms050505090809030501070505"

--------------ms050505090809030501070505
Content-Type: multipart/alternative;
 boundary="------------020602010401010206090300"

--------------020602010401010206090300
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable


On 02/11/2013 06:57 AM, Andrei Gherzan wrote:
>
>
>
> On Mon, Feb 11, 2013 at 4:43 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com <mailto:paul.eggleton@linux.intel.com>>
> wrote:
>
>     On Monday 11 February 2013 16:01:10 Andrei Gherzan wrote:
>     > On Mon, Feb 11, 2013 at 3:10 PM, Sarbu, Florin-Ionut (Florin) <
>     > Florin.Sarbu@windriver.com <mailto:Florin.Sarbu@windriver.com>>
>     wrote:
>     > > On Monday, February 11, 2013 02:51 AM Andrei Gherzan wrote:
>     > > >
>     > > > In denzil SRC_URI for qt4.8.0 uses:
>     > > >
>     http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV=
}.tar.g
>     <http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-$%7=
BPV%7D.tar.g>
>     > > > z
>     > > >
>     > > >  This source seems to be outdated and replaced by:
>     > > > http://releases.qt-project.org/qt4/source/
>     > > >
>     > > >  The problem is that the new location doesn't include the
>     4.8.0 release.
>     > > >  qt-everywhere-opensource-src-4.6.4.tar.gz
>     > > >  qt-everywhere-opensource-src-4.8.1.tar.gz
>     > > >  qt-everywhere-opensource-src-4.8.2.tar.gz
>     > > >  qt-everywhere-opensource-src-4.8.3.tar.gz
>     > > >  qt-everywhere-opensource-src-4.8.4.tar.gz
>     > > >
>     > > >  So right now qt4 in denzil is not fetch-able anymore.
>     > >
>     > >  Use git
>     >
>     > We are not talking about switching of sources. I want to know
>     why 4.8.0 is
>     > not on yocto mirror.
>
>     It should be there, not sure why it isn't.
>
>     Michael, could you please upload qt 4.8.0 and anything else
>     downloaded by
>     "bitbake -c fetchall world" for the denzil-7.0.2 release into the
>     mirror?
>
I ran fetchall world and poky 7.0.2 uses
qt-everywhere-opensource-src-4.7.4.tar.gz which was already present at
http://downloads.yoctoproject.org/mirror/sources/. Every file downloaded
was already present on the mirror.

I downloaded qt-everywhere-opensource-src-4.8.0.tar.gz from a Fedora
Project mirror and added it to
http://downloads.yoctoproject.org/mirror/sources/ so we'd have it.

Michael Halstead
Yocto Project / System Administrator


>
>
> Thank you.
>
> --=20
> *Andrei Gherzan*
> m: +40.744.478.414 |  f: +40.31.816.28.12


--------------020602010401010206090300
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3DISO-8859-1"
      http-equiv=3D"Content-Type">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <div class=3D"moz-cite-prefix"><br>
      <pre class=3D"moz-signature" cols=3D"72">
</pre>
      On 02/11/2013 06:57 AM, Andrei Gherzan wrote:<br>
    </div>
    <blockquote
cite=3D"mid:CAK18fxFJBGM5=3Dbqy=3DLJuYff0XbSdpTR5poyHLpCs4ySNFcGBTQ@mail.=
gmail.com"
      type=3D"cite">
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra"><br>
          <br>
          <div class=3D"gmail_quote">On Mon, Feb 11, 2013 at 4:43 PM, Pau=
l
            Eggleton <span dir=3D"ltr">&lt;<a moz-do-not-send=3D"true"
                href=3D"mailto:paul.eggleton@linux.intel.com"
                target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</=
span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div class=3D"im">On Monday 11 February 2013 16:01:10 Andre=
i
                Gherzan wrote:<br>
                &gt; On Mon, Feb 11, 2013 at 3:10 PM, Sarbu,
                Florin-Ionut (Florin) &lt;<br>
                &gt; <a moz-do-not-send=3D"true"
                  href=3D"mailto:Florin.Sarbu@windriver.com">Florin.Sarbu=
@windriver.com</a>&gt;
                wrote:<br>
              </div>
              <div class=3D"im">&gt; &gt; On Monday, February 11, 2013
                02:51 AM Andrei Gherzan wrote:<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; In denzil SRC_URI for qt4.8.0 uses:<br>
                &gt; &gt; &gt; <a moz-do-not-send=3D"true"
href=3D"http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-$%=
7BPV%7D.tar.g"
                  target=3D"_blank">http://get.qt.nokia.com/qt/source/qt-=
everywhere-opensource-src-${PV}.tar.g</a><br>
                &gt; &gt; &gt; z<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; &nbsp;This source seems to be outdated and=

                replaced by:<br>
                &gt; &gt; &gt; <a moz-do-not-send=3D"true"
                  href=3D"http://releases.qt-project.org/qt4/source/"
                  target=3D"_blank">http://releases.qt-project.org/qt4/so=
urce/</a><br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; &nbsp;The problem is that the new location=

                doesn't include the 4.8.0 release.<br>
                &gt; &gt; &gt;
                &nbsp;qt-everywhere-opensource-src-4.6.4.tar.gz<br>
                &gt; &gt; &gt;
                &nbsp;qt-everywhere-opensource-src-4.8.1.tar.gz<br>
                &gt; &gt; &gt;
                &nbsp;qt-everywhere-opensource-src-4.8.2.tar.gz<br>
                &gt; &gt; &gt;
                &nbsp;qt-everywhere-opensource-src-4.8.3.tar.gz<br>
                &gt; &gt; &gt;
                &nbsp;qt-everywhere-opensource-src-4.8.4.tar.gz<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; &nbsp;So right now qt4 in denzil is not
                fetch-able anymore.<br>
                &gt; &gt;<br>
              </div>
              <div class=3D"im">&gt; &gt; &nbsp;Use git<br>
                &gt;<br>
                &gt; We are not talking about switching of sources. I
                want to know why 4.8.0 is<br>
                &gt; not on yocto mirror.<br>
                <br>
              </div>
              It should be there, not sure why it isn't.<br>
              <br>
              Michael, could you please upload qt 4.8.0 and anything
              else downloaded by<br>
              "bitbake -c fetchall world" for the denzil-7.0.2 release
              into the mirror?<br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    I ran fetchall world and poky 7.0.2 uses
    qt-everywhere-opensource-src-4.7.4.tar.gz which was already present
    at <a class=3D"moz-txt-link-freetext" href=3D"http://downloads.yoctop=
roject.org/mirror/sources/">http://downloads.yoctoproject.org/mirror/sour=
ces/</a>. Every file
    downloaded was already present on the mirror.<br>
    <br>
    I downloaded qt-everywhere-opensource-src-4.8.0.tar.gz from a Fedora
    Project mirror and added it to
    <a class=3D"moz-txt-link-freetext" href=3D"http://downloads.yoctoproj=
ect.org/mirror/sources/">http://downloads.yoctoproject.org/mirror/sources=
/</a> so we'd have it.<br>
    <br>
    <pre class=3D"moz-signature" cols=3D"72">Michael Halstead
Yocto Project / System Administrator</pre>
    <br>
    <blockquote
cite=3D"mid:CAK18fxFJBGM5=3Dbqy=3DLJuYff0XbSdpTR5poyHLpCs4ySNFcGBTQ@mail.=
gmail.com"
      type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div class=3D"HOEnZb">
                <div class=3D"h5"><br>
                </div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div style=3D"">Thank you.</div>
            <div style=3D""><br>
            </div>
          </div>
          -- <br>
          <div dir=3D"ltr">
            <div style=3D"text-align:center">
              <div style=3D"font-family:'Times New
                Roman';font-size:medium" align=3D"left"><b
style=3D"color:rgb(51,51,51);font-family:Arial;font-size:small;text-align=
:center">Andrei
                  Gherzan</b><font size=3D"-1" color=3D"#333333"
                  face=3D"Arial"><br>
                </font><font size=3D"-1" color=3D"#333333" face=3D"Arial"=
>m:
                  +40.744.478.414 | &nbsp;f: +40.31.816.28.12</font><br>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------020602010401010206090300--

--------------ms050505090809030501070505
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIINjDCCBjQw
ggQcoAMCAQICASAwDQYJKoZIhvcNAQEFBQAwfTELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0
Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxKTAn
BgNVBAMTIFN0YXJ0Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTA3MTAyNDIxMDI1NVoX
DTE3MTAyNDIxMDI1NVowgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSsw
KQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFy
dENvbSBDbGFzcyAyIFByaW1hcnkgSW50ZXJtZWRpYXRlIENsaWVudCBDQTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAMsohUWcASz7GfKrpTOMKqANy9BV7V0igWdGxA8IU77L3aTxErQ+
fcxtDYZ36Z6GH0YFn7fq5RADteP0AYzrCA+EQTfi8q1+kA3m0nwtwXG94M5sIqsvs7lRP1aycBke
/s5g9hJHryZ2acScnzczjBCAo7X1v5G3yw8MDP2m2RCye0KfgZ4nODerZJVzhAlOD9YejvAXZqHk
sw56HzElVIoYSZ3q4+RJuPXXfIoyby+Y2m1E+YzX5iCZXBx05gk6MKAW1vaw4/v2OOLy6FZH3XHH
tOkzUreG//CsFnB9+uaYSlR65cdGzTsmoIK8WH1ygoXhRBm98SD7Hf/r3FELNvUCAwEAAaOCAa0w
ggGpMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBSuVYNv7DHKufcd
+q9rMfPIHeOsuzAfBgNVHSMEGDAWgBROC+8apEBbpRdphzDKNGhD0EGu8jBmBggrBgEFBQcBAQRa
MFgwJwYIKwYBBQUHMAGGG2h0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9jYTAtBggrBgEFBQcwAoYh
aHR0cDovL3d3dy5zdGFydHNzbC5jb20vc2ZzY2EuY3J0MFsGA1UdHwRUMFIwJ6AloCOGIWh0dHA6
Ly93d3cuc3RhcnRzc2wuY29tL3Nmc2NhLmNybDAnoCWgI4YhaHR0cDovL2NybC5zdGFydHNzbC5j
b20vc2ZzY2EuY3JsMIGABgNVHSAEeTB3MHUGCysGAQQBgbU3AQIBMGYwLgYIKwYBBQUHAgEWImh0
dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwNAYIKwYBBQUHAgEWKGh0dHA6Ly93d3cu
c3RhcnRzc2wuY29tL2ludGVybWVkaWF0ZS5wZGYwDQYJKoZIhvcNAQEFBQADggIBADqpJw3I07QW
ke9plNBpxUxcffc7nUrIQpJHDci91DFG7fVhHRkMZ1J+BKg5UNUxIFJ2Z9B90Micc/NXcs7kPBRd
n6XGO/vPc87Y6R+cWS9Nc9+fp3Enmsm94OxOwI9wn8qnr/6o3mD4noP9JphwUPTXwHovjavRnhUQ
HLfo/i2NG0XXgTHXS2Xm0kVUozXqpYpAdumMiB/vezj1QHQJDmUdPYMcp+reg9901zkyT3fDW/iv
JVv6pWtkh6Pw2ytZT7mvg7YhX3V50Nv860cV11mocUVcqBLv0gcT+HBDYtbuvexNftwNQKD5193A
7zN4vG7CTYkXxytSjKuXrpEatEiFPxWgb84nVj25SU5q/r1Xhwby6mLhkbaXslkVtwEWT3Van49r
KjlK4XrUKYYWtnfzq6aSak5u0Vpxd1rY79tWhD3EdCvOhNz/QplNa+VkIsrcp7+8ZhP1l1b2U6Ma
xIVteuVMD3X0vziIwr7jxYae9FZjbxlpUemqXjcC0QaFfN7qI0JsQMALL7iGRBg7K0CoOBzECdD3
fuZil5kU/LP9cr1BK31U0Uy651bFnAMMMkqhAChIbn0ei72VnbpSsrrSdF0BAGYQ8vyHae5aCg+H
75dVCV33K6FuxZrf09yTz+Vx/PkdRUYkXmZz/OTfyJXsUOUXrym6KvI2rYpccSk5MIIHUDCCBjig
AwIBAgICIgMwDQYJKoZIhvcNAQEFBQAwgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENv
bSBMdGQuMSswKQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMTgwNgYD
VQQDEy9TdGFydENvbSBDbGFzcyAyIFByaW1hcnkgSW50ZXJtZWRpYXRlIENsaWVudCBDQTAeFw0x
MjA2MTMwNDU5MjlaFw0xNDA2MTQxNjE4MzBaMIGRMRkwFwYDVQQNExBnMDFwWTYwMWJGM1BrRTY3
MQswCQYDVQQGEwJVUzEPMA0GA1UECBMGT3JlZ29uMRIwEAYDVQQHEwlIaWxsc2Jvcm8xGTAXBgNV
BAMTEE1pY2hhZWwgSGFsc3RlYWQxJzAlBgkqhkiG9w0BCQEWGG1pY2hhZWxAeW9jdG9wcm9qZWN0
Lm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMFZ+GW0VKdiyuQy3hlOvwcHxcm0
8ZwNGGah4zipYky5wVFZO7p9LjJfyF6rvd24xdkaTluxTMmd9pfq2cOVQ6c3RsPufv1yBUbytk6F
4Wk+qD0qEGjuHh5FfakcLIEsHiSn3nzaQZHaolS/yzx/A3coQS8pQrshZYqAF/ME5OxMyL8KDdtk
xatt1reDPqzvI5rKYdeEbmHsTYgd9WWHvs8MfZFHidZoAXMXU+PcsKCUxEYhgP/h9NKcTApu/Mhd
IPKn11pD+gfDM+ochGu1uxuW/t1tNJyRYDVQSDV+rpliQ7mrimSmyktIKkow02pUk4Xw3OqdYq7/
/HpVOUs5nk8CAwEAAaOCA7MwggOvMAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0GA1UdJQQWMBQG
CCsGAQUFBwMCBggrBgEFBQcDBDAdBgNVHQ4EFgQUcZFNotb1OfDmPE6GQ6MQIBh7meUwHwYDVR0j
BBgwFoAUrlWDb+wxyrn3HfqvazHzyB3jrLswIwYDVR0RBBwwGoEYbWljaGFlbEB5b2N0b3Byb2pl
Y3Qub3JnMIICIQYDVR0gBIICGDCCAhQwggIQBgsrBgEEAYG1NwECAjCCAf8wLgYIKwYBBQUHAgEW
Imh0dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwNAYIKwYBBQUHAgEWKGh0dHA6Ly93
d3cuc3RhcnRzc2wuY29tL2ludGVybWVkaWF0ZS5wZGYwgfcGCCsGAQUFBwICMIHqMCcWIFN0YXJ0
Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MAMCAQEagb5UaGlzIGNlcnRpZmljYXRlIHdhcyBp
c3N1ZWQgYWNjb3JkaW5nIHRvIHRoZSBDbGFzcyAyIFZhbGlkYXRpb24gcmVxdWlyZW1lbnRzIG9m
IHRoZSBTdGFydENvbSBDQSBwb2xpY3ksIHJlbGlhbmNlIG9ubHkgZm9yIHRoZSBpbnRlbmRlZCBw
dXJwb3NlIGluIGNvbXBsaWFuY2Ugb2YgdGhlIHJlbHlpbmcgcGFydHkgb2JsaWdhdGlvbnMuMIGc
BggrBgEFBQcCAjCBjzAnFiBTdGFydENvbSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTADAgECGmRM
aWFiaWxpdHkgYW5kIHdhcnJhbnRpZXMgYXJlIGxpbWl0ZWQhIFNlZSBzZWN0aW9uICJMZWdhbCBh
bmQgTGltaXRhdGlvbnMiIG9mIHRoZSBTdGFydENvbSBDQSBwb2xpY3kuMDYGA1UdHwQvMC0wK6Ap
oCeGJWh0dHA6Ly9jcmwuc3RhcnRzc2wuY29tL2NydHUyLWNybC5jcmwwgY4GCCsGAQUFBwEBBIGB
MH8wOQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9zdWIvY2xhc3MyL2NsaWVu
dC9jYTBCBggrBgEFBQcwAoY2aHR0cDovL2FpYS5zdGFydHNzbC5jb20vY2VydHMvc3ViLmNsYXNz
Mi5jbGllbnQuY2EuY3J0MCMGA1UdEgQcMBqGGGh0dHA6Ly93d3cuc3RhcnRzc2wuY29tLzANBgkq
hkiG9w0BAQUFAAOCAQEANR/d6M8GHL/rkx3Kz9ILDxYMcekmFgefaDXNQMicUHiUw5TsIl5af1pS
Y2AvbKlA2/FZnyG8w42FuK6ZQBZJxs4/N10NW8qDmuuFTi6TyJgurj73tx9RogW50miDHMZLoMRe
avB1h8zy99L2lRPZSebpSFkrQdYDHaGRVhYMjEcWNW9cLxhR8BaAEw/KlpERv3hUQpwGMppYOE66
M7KJ3HpeR7DXfa4njL9W2hukTQNsskdWtzejHp5iQ65+5Mv+NXLmYP4uLJcR9AbttgNhwStc0P1b
LxnQkElGeUzATOBq+QsVZ7Fo6sSS7kqrhpfaPibqpj83m/wSgpKVsbZJ3DGCA9owggPWAgEBMIGT
MIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjErMCkGA1UECxMiU2VjdXJl
IERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYGA1UEAxMvU3RhcnRDb20gQ2xhc3MgMiBQ
cmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0ECAiIDMAkGBSsOAwIaBQCgggIbMBgGCSqGSIb3
DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTEzMDIxMjEwMjAyOVowIwYJKoZIhvcN
AQkEMRYEFD3DFi9OaCjU01+17NnJqtPNlsyIMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAw
BwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgaQGCSsGAQQBgjcQBDGBljCBkzCBjDELMAkGA1UEBhMC
SUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRp
ZmljYXRlIFNpZ25pbmcxODA2BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDIgUHJpbWFyeSBJbnRlcm1l
ZGlhdGUgQ2xpZW50IENBAgIiAzCBpgYLKoZIhvcNAQkQAgsxgZaggZMwgYwxCzAJBgNVBAYTAklM
MRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSswKQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZp
Y2F0ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFydENvbSBDbGFzcyAyIFByaW1hcnkgSW50ZXJtZWRp
YXRlIENsaWVudCBDQQICIgMwDQYJKoZIhvcNAQEBBQAEggEAJ1g0giFL9cMRk795IISlrEyPZx5n
ractxB49pFCp76D3sXT2PxCR9HHOljvf4B7gliikl01a7jWfhmx2jjfFw+cySqviPBTGDE9OKRft
eOjyOXX1olAt9W6gWdEAaqCmMT4V/MQCa7H067c92mASkNF5CYXtIRCtQteEESAxlQecZ7Ju5w1b
YVvPOwDur3znp4mqFguUJQppCzaz5f3uzyW0Jl9oRIvhAbnOK1hn17oexMLOlEqOO3bii2ghouXG
ERH6HFHTe6kdVcWAfAAMkqAnQnhkGrL+ZB3dMScmA+Un9dDIF4zMo8pEBRUw65zHRTxorvfi+aXZ
KkRVX114iwAAAAAAAA==

--------------ms050505090809030501070505--
