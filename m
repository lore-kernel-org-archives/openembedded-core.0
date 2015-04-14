Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3782A73501
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 16:13:54 +0000 (UTC)
Received: by qkx62 with SMTP id 62so26105972qkx.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ZwMALjvLjCncPokIZWwG0oh6/OT8lUcxefuse6oC4UU=;
	b=Oml/ioWydyiQ+MriRz4EQ20pqVNdTrwgbCF/FkOsMipKUjS3fEwe3eTGr+nTQTzAuu
	Kz+2G8nrRFiaK+v7bEX/f5nPVQZoOoQ4UURRQNE61OUgogr2vuhB4OJp+7EYV4RP4sia
	Ri5HRJsgk5Y4PiiZVVq8zevoUqKm1czrh4nbLI8wcPzrZUyRxTryLciOlNcnQmeCfnHb
	Xs5Irk29kjv4N9m16cVvCJyNoDU9KCWGlaNVdCD6Dms/p3ftzLG9/UWp0RhyqyJ6Vuu6
	ZFYYFE0veZvdD0g1SKjcYgtQ7zZs7Ow123VywQoDnHXv3X4ni8SzN8RYZ2RJQiGIAdBd
	PKHA==
X-Received: by 10.229.8.8 with SMTP id f8mr26665663qcf.4.1429028007635;
	Tue, 14 Apr 2015 09:13:27 -0700 (PDT)
Received: from [10.101.1.4] ([38.122.23.194])
	by mx.google.com with ESMTPSA id f8sm1020043qka.9.2015.04.14.09.13.26
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 14 Apr 2015 09:13:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <365E1805BC95084CBE82381A0B869994E7F50379@EU-MBX-01.mgc.mentorg.com>
Date: Tue, 14 Apr 2015 12:13:24 -0400
Message-Id: <BEA2FCAB-E8F6-4172-9622-16BB339AEC91@gmail.com>
References: <365E1805BC95084CBE82381A0B869994E7F50379@EU-MBX-01.mgc.mentorg.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
X-Mailer: Apple Mail (2.2098)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: psplash and systemd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Apr 2015 16:13:55 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_A7679BDA-6B8A-4285-B070-89A3ED6C8918"

--Apple-Mail=_A7679BDA-6B8A-4285-B070-89A3ED6C8918
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Apr 14, 2015, at 12:04 PM, Ahsan, Noor <Noor_Ahsan@mentor.com> =
wrote:
>=20
> Hello,
> =20
> I noticed that splash does not have system support and it is still =
being used in our image class. I wanna ask any plan to add system =
support or move to other splash screen package?
> =20

Locally, I have patches for plymouth, which works well integrated with =
systemd. I plan to post them this 1.9 cycle.

> Noor
> =20
> Noor Ahsan | Engineering Manager Mentor Embedded Linux
> Mentor Embedded <http://www.mentor.com/embedded>=E2=84=A2 |5-6-7-8th =
floors 105  B2 Gulberg III, Ali Tower
> MM Alam Road, Lahore
> P +92 42 36099196 | M +92 307 4448444
> Nucleus <http://www.mentor.com/embedded-software/nucleus/>=C2=AE | =
Linux <http://www.mentor.com/embedded-software/linux/>=C2=AE | Android =
<http://www.mentor.com/embedded-software/android/>=E2=84=A2 | Services =
<http://www.mentor.com/embedded-software/services/> | UI =
<http://www.mentor.com/embedded-software/inflexion/> | Multi-OS =
<http://www.mentor.com/embedded-software/multicore-multi-os>
> =20
> Android is a trademark of Google Inc. Use of this trademark is subject =
to Google Permissions.
> Linux is the registered trademark of Linus Torvalds in the U.S. and =
other countries.
> =20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>

--Apple-Mail=_A7679BDA-6B8A-4285-B070-89A3ED6C8918
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Apr 14, 2015, at 12:04 PM, Ahsan, Noor &lt;<a =
href=3D"mailto:Noor_Ahsan@mentor.com" =
class=3D"">Noor_Ahsan@mentor.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"WordSection1" style=3D"page: WordSection1; font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;"><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D"">Hello,<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><o:p =
class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D"">I noticed =
that splash does not have system support and it is still being used in =
our image class. I wanna ask any plan to add system support or move to =
other splash screen package?<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D""><o:p =
class=3D"">&nbsp;</o:p></div></div></div></blockquote><div><br =
class=3D""></div><div>Locally, I have patches for plymouth, which works =
well integrated with systemd. I plan to post them this 1.9 =
cycle.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div class=3D"WordSection1" style=3D"page: WordSection1; =
font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;"><div style=3D"margin: 0in 0in =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">Noor<o:p class=3D""></o:p></div><div style=3D"margin: 0in 0in =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><b class=3D""><span style=3D"font-size: 10pt;" class=3D"">Noor =
Ahsan</span></b><span style=3D"font-size: 10pt;" class=3D""><span =
class=3D"Apple-converted-space">&nbsp;</span><span style=3D"color: =
rgb(89, 89, 89);" class=3D"">| Engineering Manager Mentor Embedded =
Linux</span><span style=3D"color: rgb(127, 127, 127);" class=3D""><o:p =
class=3D""></o:p></span></span></div><div style=3D"margin: 0in 0in =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><span style=3D"font-size: 10pt;" class=3D""><a =
href=3D"http://www.mentor.com/embedded" style=3D"color: purple; =
text-decoration: underline;" class=3D""><span style=3D"color: blue;" =
class=3D"">Mentor Embedded</span></a>=E2=84=A2<span =
class=3D"Apple-converted-space">&nbsp;</span><span style=3D"color: =
rgb(89, 89, 89);" class=3D"">|5-6-7-8<sup class=3D"">th</sup><span =
class=3D"Apple-converted-space">&nbsp;</span>floors 105&nbsp; B2 Gulberg =
III, Ali Tower<o:p class=3D""></o:p></span></span></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D""><span style=3D"font-size: 10pt; color: =
rgb(89, 89, 89);" class=3D"">MM Alam Road, Lahore</span><span =
style=3D"font-size: 10pt; color: rgb(127, 127, 127);" class=3D""><o:p =
class=3D""></o:p></span></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><span =
style=3D"font-size: 10pt; color: rgb(89, 89, 89);" class=3D"">P +92 42 =
36099196 | M +92 307 4448444<o:p class=3D""></o:p></span></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D""><span style=3D"font-size: 10pt;" =
class=3D""><a href=3D"http://www.mentor.com/embedded-software/nucleus/" =
style=3D"color: purple; text-decoration: underline;" class=3D""><span =
style=3D"color: blue;" class=3D"">Nucleus</span></a>=C2=AE<span =
style=3D"color: rgb(118, 146, 60);" class=3D""><span =
class=3D"Apple-converted-space">&nbsp;</span>|<span =
class=3D"Apple-converted-space">&nbsp;</span></span><a =
href=3D"http://www.mentor.com/embedded-software/linux/" style=3D"color: =
purple; text-decoration: underline;" class=3D""><span style=3D"color: =
blue;" class=3D"">Linux</span></a>=C2=AE<span style=3D"color: rgb(118, =
146, 60);" class=3D""><span =
class=3D"Apple-converted-space">&nbsp;</span>|<span =
class=3D"Apple-converted-space">&nbsp;</span></span><a =
href=3D"http://www.mentor.com/embedded-software/android/" style=3D"color: =
purple; text-decoration: underline;" class=3D""><span style=3D"color: =
blue;" class=3D"">Android</span></a>=E2=84=A2<span style=3D"color: =
rgb(118, 146, 60);" class=3D""><span =
class=3D"Apple-converted-space">&nbsp;</span>|<span =
class=3D"Apple-converted-space">&nbsp;</span></span><a =
href=3D"http://www.mentor.com/embedded-software/services/" style=3D"color:=
 purple; text-decoration: underline;" class=3D""><span style=3D"color: =
blue;" class=3D"">Services</span></a><span =
class=3D"Apple-converted-space">&nbsp;</span><span style=3D"color: =
rgb(118, 146, 60);" class=3D"">|<span =
class=3D"Apple-converted-space">&nbsp;</span></span><a =
href=3D"http://www.mentor.com/embedded-software/inflexion/" =
style=3D"color: purple; text-decoration: underline;" class=3D""><span =
style=3D"color: blue;" class=3D"">UI</span></a><span =
class=3D"Apple-converted-space">&nbsp;</span><span style=3D"color: =
rgb(118, 146, 60);" class=3D"">|<span =
class=3D"Apple-converted-space">&nbsp;</span></span><a =
href=3D"http://www.mentor.com/embedded-software/multicore-multi-os" =
style=3D"color: purple; text-decoration: underline;" class=3D""><span =
style=3D"color: blue;" class=3D"">Multi-OS</span></a><span style=3D"color:=
 rgb(118, 146, 60);" class=3D""><o:p =
class=3D""></o:p></span></span></div><div style=3D"margin: 0in 0in =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><span style=3D"font-size: 7pt; color: rgb(31, 73, 125);" =
class=3D"">&nbsp;</span></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><span =
style=3D"font-size: 7pt; color: rgb(127, 127, 127);" class=3D"">Android =
is a trademark of Google Inc. Use of this trademark is subject to Google =
Permissions.<o:p class=3D""></o:p></span></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><span style=3D"font-size: 7pt; color: rgb(127, 127, 127);" =
class=3D"">Linux is the registered trademark of Linus Torvalds in the =
U.S. and other countries.</span><span style=3D"font-size: 7pt;" =
class=3D""><o:p class=3D""></o:p></span></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></div></div><span =
style=3D"font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" =
class=3D"">_______________________________________________</span><br =
style=3D"font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Openembedded-core mailing list</span><br =
style=3D"font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" style=3D"color: =
purple; text-decoration: underline; font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
style=3D"font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
style=3D"color: purple; text-decoration: underline; font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_A7679BDA-6B8A-4285-B070-89A3ED6C8918--
