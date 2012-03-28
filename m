Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SCxLX-0007va-14
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 20:11:47 +0200
Received: by wibhm17 with SMTP id hm17so5720355wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 11:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=vIAkX+R6J9CnrGGssvvmoDejyL/tVIHOB1z/MLCc6Eg=;
	b=ezKzf2Pq28P7mRTOdo55j0rp7eKk40B5VBnTZs1EIZShybA1Mvq245O6VevgGufw2P
	3qAr6RNEppbhd3XS1QEWceS1iDKDY2KhnmSX1ieKpk7wLlAfuwJDau1JKWKyi7zTLj2s
	DaDoAyCo/1oj9yK2KJVdwr0UsvAFXL+5O5zx2Bq8vWtOP5bM401dHTcZrxiSL179KvKX
	BhXt3BDNRWcCZbmHD2MgKm9mfxymDMCTuQ7+qE2wjMxplKBmSG+WOHcDiS8iixot2KTa
	/3r9UcsxAro82IR+8dve5Cl5k04cqAteOx7IXDq67uAQGGI4qUgokwUIKued20iykxdh
	vBdQ==
Received: by 10.180.107.101 with SMTP id hb5mr319079wib.7.1332957764615; Wed,
	28 Mar 2012 11:02:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.227.38.164 with HTTP; Wed, 28 Mar 2012 11:02:24 -0700 (PDT)
X-Originating-IP: [79.117.121.2]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 28 Mar 2012 21:02:24 +0300
Message-ID: <CAK18fxGcvp9gYr7efBPxnaH27zOgzy8VS=KWcHwo4UttP55Ghw@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlYa1ee8m5fUViVeM8iblF0sUVXFcE40GsHX9pTtqX5SqrVVEQBoi6ala+U1y1y9VDdJKec
Subject: Problem with perl upstream link
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
X-List-Received-Date: Wed, 28 Mar 2012 18:11:47 -0000
Content-Type: multipart/alternative; boundary=e89a8f3bb0cf0f7d1704bc516ab4

--e89a8f3bb0cf0f7d1704bc516ab4
Content-Type: text/plain; charset=ISO-8859-1

From time to time my build crashes after trying to unpack the downloaded
perl package:
Check the log here:

ERROR: Logfile of failure stored in:
BUILD/tmp-eglibc-eglibc/work/i686-linux/perl-native-5.14.2-r0/temp/log.do_unpack.14775
Log data follows:
| NOTE: Unpacking
BUILD/tmp-eglibc-eglibc/work/i686-linux/perl-native-5.14.2-r0/
|
| gzip: stdin: invalid compressed data--crc error
| tar: Child returned status 1
| tar: Error is not recoverable: exiting now
| ERROR: Function failed: Unpack failure for URL: '
http://www.cpan.org/src/5.0/perl-5.14.2.tar.gz'. Unpack command PATH="..."
tar xz --no-same-owner -f DOWNLOADS/perl-5.14.2.tar.gz failed with return
value 2
NOTE: package perl-native-5.14.2-r0: task do_unpack: Failed

To check the remote i did a simple test:

wget http://www.cpan.org/src/5.0/perl-5.14.2.tar.gz
--2012-03-28 21:09:11--  http://www.cpan.org/src/5.0/perl-5.14.2.tar.gz
Resolving www.cpan.org... 207.171.7.177, 199.15.176.140,
2620:101:d000:8::140:1, ...
Connecting to www.cpan.org|207.171.7.177|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 15223598 (15M) [application/octet-stream]
Saving to: `perl-5.14.2.tar.gz'

100%[=======================================================================================================================================>]
15,223,598  1.07M/s   in 99s

2012-03-28 21:10:52 (151 KB/s) - `perl-5.14.2.tar.gz' saved
[15223598/15223598]

tar xz --no-same-owner -f
/media/HDD-WRS/yocto/2012-03-28-18-49-yocto-ve/../downloads/perl-5.14.2.tar.gz

gzip: stdin: invalid compressed data--crc error
tar: Child returned status 1
tar: Exiting with failure status due to previous errors

Anybody knows about this issue?
@g

--e89a8f3bb0cf0f7d1704bc516ab4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>From time to time my build crashes after trying to unpack the download=
ed perl package:</div><div>Check the log here:</div><div><br></div><div><di=
v>ERROR: Logfile of failure stored in: BUILD/tmp-eglibc-eglibc/work/i686-li=
nux/perl-native-5.14.2-r0/temp/log.do_unpack.14775</div>

<div>Log data follows:</div><div>| NOTE: Unpacking BUILD/tmp-eglibc-eglibc/=
work/i686-linux/perl-native-5.14.2-r0/</div><div>|</div><div>| gzip: stdin:=
 invalid compressed data--crc error</div><div>| tar: Child returned status =
1</div>

<div>| tar: Error is not recoverable: exiting now</div><div>| ERROR: Functi=
on failed: Unpack failure for URL: &#39;<a href=3D"http://www.cpan.org/src/=
5.0/perl-5.14.2.tar.gz">http://www.cpan.org/src/5.0/perl-5.14.2.tar.gz</a>&=
#39;. Unpack command PATH=3D&quot;...&quot; tar xz --no-same-owner -f DOWNL=
OADS/perl-5.14.2.tar.gz failed with return value 2</div>

<div>NOTE: package perl-native-5.14.2-r0: task do_unpack: Failed</div></div=
><div><br></div><div>To check the remote i did a simple test:</div><div><br=
></div><div><div>wget <a href=3D"http://www.cpan.org/src/5.0/perl-5.14.2.ta=
r.gz">http://www.cpan.org/src/5.0/perl-5.14.2.tar.gz</a></div>

<div>--2012-03-28 21:09:11-- =A0<a href=3D"http://www.cpan.org/src/5.0/perl=
-5.14.2.tar.gz">http://www.cpan.org/src/5.0/perl-5.14.2.tar.gz</a></div><di=
v>Resolving www.cpan.org... 207.171.7.177, 199.15.176.140, 2620:101:d000:8:=
:140:1, ...</div>

<div>Connecting to <a href=3D"http://www.cpan.org">www.cpan.org</a>|207.171=
.7.177|:80... connected.</div><div>HTTP request sent, awaiting response... =
200 OK</div><div>Length: 15223598 (15M) [application/octet-stream]</div>
<div>
Saving to: `perl-5.14.2.tar.gz&#39;</div><div><br></div><div>100%[=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D&gt;] 15,223,598 =A01.07M/s =A0 in 99s</div>

<div><br></div><div>2012-03-28 21:10:52 (151 KB/s) - `perl-5.14.2.tar.gz&#3=
9; saved [15223598/15223598]</div></div><div><br></div><div><div>tar xz --n=
o-same-owner -f /media/HDD-WRS/yocto/2012-03-28-18-49-yocto-ve/../downloads=
/perl-5.14.2.tar.gz</div>

<div><br></div><div>gzip: stdin: invalid compressed data--crc error</div><d=
iv>tar: Child returned status 1</div><div>tar: Exiting with failure status =
due to previous errors</div></div><div><br></div><div>Anybody knows about t=
his issue?</div>

@g

--e89a8f3bb0cf0f7d1704bc516ab4--
