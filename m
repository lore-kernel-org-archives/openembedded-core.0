Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 71CCF6E5FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 18:02:12 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c4so4704290pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 10:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=KMDtsGnL97GFtU60soLxMr+seCle/y4eqKuL8jCtdOk=;
	b=uDp6iGy2l2TcS2v7Vnf0AacwTxihzobA2vAxeR7FnLlSyQSQUzUzQkyN1HVOo/BaN8
	9FoYgXuU5XUGwjLPgaZFdkT5bD+f/9+hBHRsbLH/wx9nRTk0kuKEWVh9cjgDGsylr8A1
	yYfPyqJRsYr6Vj+ClHI5QRX3/Hj9sQz8N+BJO2/PdEuRGdRFI0AGR9zdqmDEImeMhtl8
	0S7pE8vdLrsCCRDWY4879XGazFiWtPefgj10ayB+1kmzVq2RiljpROSpZsUfknRD6N9e
	PrjcnZgoEkkisoZD1D80SQU/JpnCnxk34dqdo6ds4xlKMt9nwsWi4vot98T/+7/+frWL
	gxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=KMDtsGnL97GFtU60soLxMr+seCle/y4eqKuL8jCtdOk=;
	b=dEi3+Mab5UUVSlo6fz4ogIS+7PwTyJq2KPYwXKToC1fX/bzd+a0wN2Or19X8pOKFls
	dwASNeYi62wzbLpGW/GNtgThdk/v2aKoGpmAjkhX2epqVmxRpfcYpHm9r72o6FiRLe7B
	JDm/+kHepr9fcvCxpl1K94nv4bB90I9K08c8RPjHKdEx1FDY/217ubnqM4LCYDYAmL+a
	Bq9dJxH6jrHdwD/yf0Lcab1DO5gJXA8oDiiZJw6YR6CwrwzUfpAlVrgkg0ayVqN+V8D0
	M5JIWUQLhMgJe1y1TZ2W7c2+QUBJTP5MHtMmPfkqZyZzTivxO9iPnzioLYSEa/E15cIB
	O0IA==
X-Gm-Message-State: AKaTC019XADFkaWz5J3pyn0oqJOzngYE423waCX+IeGQ0eN9fAexYwFLlp+S+I9CF/phgw==
X-Received: by 10.98.33.133 with SMTP id o5mr96654525pfj.32.1481565733510;
	Mon, 12 Dec 2016 10:02:13 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:c5da:5e91:a866:bc94?
	([2601:646:8882:b8c:c5da:5e91:a866:bc94])
	by smtp.gmail.com with ESMTPSA id
	t21sm77226855pfa.1.2016.12.12.10.02.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Dec 2016 10:02:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <F7334516-0C0C-4709-88ED-8FAB7FFA5548@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Mon, 12 Dec 2016 10:02:36 -0800
In-Reply-To: <a186e3be-242a-5ba1-36fe-f5f3d561552c@mlbassoc.com>
To: Gary Thomas <gary@mlbassoc.com>
References: <20161110003935.1858-1-raj.khem@gmail.com>
	<a186e3be-242a-5ba1-36fe-f5f3d561552c@mlbassoc.com>
X-Mailer: Apple Mail (2.3251)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Mon, 12 Dec 2016 18:02:12 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_75808F7D-60B8-4147-978F-F12BE5DBBB69"

--Apple-Mail=_75808F7D-60B8-4147-978F-F12BE5DBBB69
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Dec 12, 2016, at 4:36 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>=20
> Looking at these recipes and they seem like a good starting point.
> I did have some issues though:
>=20
> * bitbake go - didn't create any target installable packages, although =
the
>  .../image directory seemed to be well populated.

Yeah mostly, I was concentrating on cross builds but this is something =
to look at.

> * bitbake go-helloworld - had these errors:
> ERROR: go-helloworld-0.1-r0 do_populate_lic: QA Issue: go-helloworld: =
LIC_FILES_CHKSUM points to an invalid file: /MIT [license-checksum]

Thats new, somehow it did not happen for me. I will check again.

> ERROR: go-helloworld-0.1-r0 do_compile: Function failed: do_compile =
(log file is located at =
/build/p0382_2016-01-13/tmp/work/cortexa9hf-neon-amltd-linux-gnueabi/go-he=
lloworld/0.1-r0/temp/log.do_compile.31170)
> ERROR: Logfile of failure stored in: =
/build/p0382_2016-01-13/tmp/work/cortexa9hf-neon-amltd-linux-gnueabi/go-he=
lloworld/0.1-r0/temp/log.do_compile.31170
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | stat helloworld.go: no such file or directory
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at =
/build/p0382_2016-01-13/tmp/work/cortexa9hf-neon-amltd-linux-gnueabi/go-he=
lloworld/0.1-r0/temp/log.do_compile.31170)
> ERROR: Task =
(/local/poky-cutting-edge/meta/recipes-extended/go-examples/go-helloworld_=
0.1.bb:do_compile) failed with exit code '1'
>=20
> I forced the compiler to my target (rsync is _my_ friend) and was
> able to run 'helloword.go'.  I've not tested much past this point,
> but I am enthusiastic about getting 'go' into OE-core


Thanks Gary for your feedback it will help. I know I have a rev2 due for =
this patchset. Haven=E2=80=99t yet includes all needed changes for v2.=

--Apple-Mail=_75808F7D-60B8-4147-978F-F12BE5DBBB69
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Dec 12, 2016, at 4:36 AM, Gary Thomas &lt;<a =
href=3D"mailto:gary@mlbassoc.com" class=3D"">gary@mlbassoc.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: FiraMono-Regular; font-size: 13px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Looking at these recipes and they seem like a =
good starting point.</span><br style=3D"font-family: FiraMono-Regular; =
font-size: 13px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: FiraMono-Regular; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; =
display: inline !important;" class=3D"">I did have some issues =
though:</span><br style=3D"font-family: FiraMono-Regular; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br =
style=3D"font-family: FiraMono-Regular; font-size: 13px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: FiraMono-Regular; font-size: 13px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">* bitbake go - didn't create any target =
installable packages, although the</span><br style=3D"font-family: =
FiraMono-Regular; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
FiraMono-Regular; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">&nbsp;.../image directory seemed to be well =
populated.</span><br style=3D"font-family: FiraMono-Regular; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote><div><br class=3D""></div><div>Yeah =
mostly, I was concentrating on cross builds but this is something to =
look at.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><span style=3D"font-family: FiraMono-Regular; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; =
display: inline !important;" class=3D"">* bitbake go-helloworld - had =
these errors:</span><br style=3D"font-family: FiraMono-Regular; =
font-size: 13px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: FiraMono-Regular; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; =
display: inline !important;" class=3D"">ERROR: go-helloworld-0.1-r0 =
do_populate_lic: QA Issue: go-helloworld: LIC_FILES_CHKSUM points to an =
invalid file: /MIT [license-checksum]</span><br style=3D"font-family: =
FiraMono-Regular; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>Thats new, somehow it did not happen for me. I =
will check again.</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><span style=3D"font-family: FiraMono-Regular; =
font-size: 13px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">ERROR: =
go-helloworld-0.1-r0 do_compile: Function failed: do_compile (log file =
is located at =
/build/p0382_2016-01-13/tmp/work/cortexa9hf-neon-amltd-linux-gnueabi/go-he=
lloworld/0.1-r0/temp/log.do_compile.31170)</span><br style=3D"font-family:=
 FiraMono-Regular; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
FiraMono-Regular; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">ERROR: Logfile of failure stored in: =
/build/p0382_2016-01-13/tmp/work/cortexa9hf-neon-amltd-linux-gnueabi/go-he=
lloworld/0.1-r0/temp/log.do_compile.31170</span><br style=3D"font-family: =
FiraMono-Regular; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
FiraMono-Regular; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Log data follows:</span><br style=3D"font-family: =
FiraMono-Regular; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
FiraMono-Regular; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">| DEBUG: Executing shell function =
do_compile</span><br style=3D"font-family: FiraMono-Regular; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span=
 style=3D"font-family: FiraMono-Regular; font-size: 13px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">| stat helloworld.go: no such file or =
directory</span><br style=3D"font-family: FiraMono-Regular; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span=
 style=3D"font-family: FiraMono-Regular; font-size: 13px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">| WARNING: exit code 1 from a shell =
command.</span><br style=3D"font-family: FiraMono-Regular; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span=
 style=3D"font-family: FiraMono-Regular; font-size: 13px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">| ERROR: Function failed: do_compile (log file =
is located at =
/build/p0382_2016-01-13/tmp/work/cortexa9hf-neon-amltd-linux-gnueabi/go-he=
lloworld/0.1-r0/temp/log.do_compile.31170)</span><br style=3D"font-family:=
 FiraMono-Regular; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
FiraMono-Regular; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">ERROR: Task =
(/local/poky-cutting-edge/meta/recipes-extended/go-examples/go-helloworld_=
0.1.bb:do_compile) failed with exit code '1'</span><br =
style=3D"font-family: FiraMono-Regular; font-size: 13px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family:=
 FiraMono-Regular; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
FiraMono-Regular; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">I forced the compiler to my target (rsync is =
_my_ friend) and was</span><br style=3D"font-family: FiraMono-Regular; =
font-size: 13px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: FiraMono-Regular; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; =
display: inline !important;" class=3D"">able to run 'helloword.go'. =
&nbsp;I've not tested much past this point,</span><br =
style=3D"font-family: FiraMono-Regular; font-size: 13px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: FiraMono-Regular; font-size: 13px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">but I am enthusiastic about getting 'go' into =
OE-core</span><br style=3D"font-family: FiraMono-Regular; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote></div><br class=3D""><div class=3D""><br =
class=3D""></div><div class=3D"">Thanks Gary for your feedback it will =
help. I know I have a rev2 due for this patchset. Haven=E2=80=99t yet =
includes all needed changes for v2.</div></body></html>=

--Apple-Mail=_75808F7D-60B8-4147-978F-F12BE5DBBB69--
