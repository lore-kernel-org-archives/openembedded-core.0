Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SMjdo-0006Qy-6V
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 19:35:04 +0200
Received: by yenm3 with SMTP id m3so582199yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 10:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=d/kkDGDZKH2+XXYiWMukFMc5C8SHfAP+nBP94f3rXWI=;
	b=OiWSebAWYYZcaillrqjF57xMkaHnFD9+ObaSCzWnUhRY73onVLz/ZZjQDLIj1vuwhN
	7P/bDazl5PX5glpTRMuu98aa730XimJwYMB21fFUMPS8jb1iatbPCf1OitWPfc2PormV
	euy2mK0eYIuWdMPS9TQOcIazicOJodXF6xkyQWMCLkdy26/jwOjgzOhieBDRmVNxjWIm
	kA7ZWe68NsH+DJlkoN7SlTINbg0LqGcLEUgKBLCIYB68oKJh1kfS36XxFD+mi+NpA4hn
	cjgnJ8n8zKhfpgikGGKtj/Dj3VKbgU6sP0GTN4kK6b1CZ9DRkdFENAORMRWGafW/Wcjo
	9/0A==
Received: by 10.50.88.225 with SMTP id bj1mr11278351igb.42.1335288328724; Tue,
	24 Apr 2012 10:25:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.25.18 with HTTP; Tue, 24 Apr 2012 10:25:08 -0700 (PDT)
X-Originating-IP: [79.115.103.32]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 24 Apr 2012 20:25:08 +0300
Message-ID: <CAK18fxFXyj7U1RgBSigrED+H6BjJjx3uCcWY2nVONCOULxL+iw@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnwmBpH+/fAOejo59aa1HBf9uC3AwO7x9oKUxPrxTbui/zNFYX31Y9af+s4IFqMaULWYJEH
Subject: LICENSE_{X}-xxx is parsed?
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
X-List-Received-Date: Tue, 24 Apr 2012 17:35:04 -0000
Content-Type: multipart/alternative; boundary=e89a8f23441781a02304be700a74

--e89a8f23441781a02304be700a74
Content-Type: text/plain; charset=ISO-8859-1

Hello everybody,

Is there any mechanism of parsing LICENSE variables for every provided
package in a bb file?

To be a little more clear about this.

If i have an app named myapp. Let's say the myapp_1.0.bb includes:
LICENSE = "GPLv3 & LGPLv2.1"
LICENSE_${PN} = LGPLv2.1
LICENSE_${PN} -tests = GPLv3

If this app is not whitelisted, this file will pe ignored (assuming
INCOMPATIBLE_LICENSE = GPLv3) even if the only needed package on the final
fs is the ${PN} package.

For files in these case (like gnults) we use right now WHITELIST. In this
way license checking on those packages is skipped.

If nobody works on this (or this is already done but i couldn't spot it in
the code) i can dig and propose a way to solve this issue.

@g

--e89a8f23441781a02304be700a74
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hello everybody,</div><div><br></div><div>Is there any=A0mechanism of =
parsing LICENSE variables for every provided package in a bb file?</div><di=
v><br></div><div>To be a little more clear about this.</div><div><br></div>

<div>If i have an app named myapp. Let&#39;s say the <a href=3D"http://myap=
p_1.0.bb">myapp_1.0.bb</a> includes:</div><div>LICENSE =3D &quot;GPLv3 &amp=
; LGPLv2.1&quot;</div><div>LICENSE_${PN} =3D LGPLv2.1</div><div>LICENSE_${P=
N} -tests =3D GPLv3</div>

<div><br></div><div>If this app is not whitelisted, this file will pe ignor=
ed (assuming INCOMPATIBLE_LICENSE =3D GPLv3) even if the only needed packag=
e on the final fs is the ${PN} package.</div><div><br></div><div>For files =
in these case (like gnults) we use right now WHITELIST. In this way license=
=A0checking=A0on those packages is skipped. =A0</div>

<div><br></div><div>If nobody works on this (or this is already done but i =
couldn&#39;t spot it in the code) i can dig and propose a way to solve this=
 issue.</div><div><br></div>@g

--e89a8f23441781a02304be700a74--
