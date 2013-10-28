Return-Path: <sebmennetrier@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9E9716CF0A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 13:44:56 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id u16so11038431iet.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 06:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=GzrhZmr5qRMkj7/GSKzxJhCOWIW1UOSqtDd4qwnGyEw=;
	b=jJeb/xQyMzFA4HTg0FanEE/bDnhYFE87V/ktbwVqhYfB2qhtvsSKSo83olcjvdxgpI
	5DoPFTT+hqSpvuBMKIAwKqXznh+yu2DFlcJWcCJYcal+cRg+7R907JkEdSEoF2x6iBFb
	0x6t6wOLfuKnXVwzCBcyLlJiZdCQvQIfNdDq4GQxY4traouhfoqe94TKiAXfgOJ4J5x8
	PFVsMWNwLq/rQlHspC2ROF7Zy6fJYiieqxE4sJX401F4JgZHifoZoGpDxX7ZMrWBiy7V
	iMYdE8X0QwguJq8oc4TMfdv3XkUAWE7QUlfsmK+HEhZ/0crO7if3nkIOaD8Nbz9xz9KM
	HQRw==
MIME-Version: 1.0
X-Received: by 10.43.138.8 with SMTP id iq8mr3881252icc.37.1382967897213; Mon,
	28 Oct 2013 06:44:57 -0700 (PDT)
Sender: sebmennetrier@gmail.com
Received: by 10.43.141.70 with HTTP; Mon, 28 Oct 2013 06:44:57 -0700 (PDT)
Date: Mon, 28 Oct 2013 14:44:57 +0100
X-Google-Sender-Auth: X0t5ernr3-thcZl7l2mwb4KDBoc
Message-ID: <CABgO3_ODLSb2ZWrkqN6jry7WNehq_rhRTBcorRQj+wuHTjfE7A@mail.gmail.com>
From: Sebastien MENNETRIER <s.mennetrier@innotis.org>
To: openembedded-core@lists.openembedded.org
Subject: Issue with package_rpm : can't install files named "%name..."
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
X-List-Received-Date: Mon, 28 Oct 2013 13:44:57 -0000
Content-Type: multipart/alternative; boundary=001a11c203643fd0ae04e9cd4ef3

--001a11c203643fd0ae04e9cd4ef3
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I try to cross-compile and install rubygems and the gems contain some
directories and files named "%name...".

To create the rpm package, a spec file that contains the list of all files
and directories that must be in the rpm package is generated in do_package.

The rpm process replace all the "%name" in the spec file by the name of the
package. So the package process try to include some file and directory that
doesn't exist.

How can I resolve this issue ? Is it a bug in package_rpm.bbclass ?

Best regards,

Seb

--001a11c203643fd0ae04e9cd4ef3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:13px;font-style:normal;font-variant:normal;font-weight:norm=
al;letter-spacing:normal;line-height:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);display:inline!important;float:none">Hi all,</span><div st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;font=
-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;=
line-height:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;font-style:normal;font-variant:normal;font-weight:normal;lette=
r-spacing:normal;line-height:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255)">
I try to cross-compile and install rubygems and the gems contain some direc=
tories and files named &quot;%name...&quot;.</div><div style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:13px;font-style:normal;font=
-variant:normal;font-weight:normal;letter-spacing:normal;line-height:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;font-style:normal;font-variant:normal;font-weight:normal;lette=
r-spacing:normal;line-height:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255)">
To create the rpm package, a spec file that contains the list of all files =
and directories that must be in the rpm package is generated in do_package.=
</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:13px;font-style:normal;font-variant:normal;font-weight:normal;letter-sp=
acing:normal;line-height:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;font-style:normal;font-variant:normal;font-weight:normal;lette=
r-spacing:normal;line-height:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255)">
The rpm process replace all the &quot;%name&quot; in the spec file by the n=
ame of the package. So the package process try to include some file and dir=
ectory that doesn&#39;t exist.</div><div style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:13px;font-style:normal;font-variant:norma=
l;font-weight:normal;letter-spacing:normal;line-height:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;font-style:normal;font-variant:normal;font-weight:normal;lette=
r-spacing:normal;line-height:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255)">
How can I resolve this issue ? Is it a bug in package_rpm.bbclass ?</div><d=
iv style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px=
;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:no=
rmal;line-height:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;font-style:normal;font-variant:normal;font-weight:normal;lette=
r-spacing:normal;line-height:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255)">
Best regards,</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:13px;font-style:normal;font-variant:normal;font-weight:nor=
mal;letter-spacing:normal;line-height:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;font-style:normal;font-variant:normal;font-weight:normal;lette=
r-spacing:normal;line-height:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255)">
Seb</div></div>

--001a11c203643fd0ae04e9cd4ef3--
