Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1866473189
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 21:02:17 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id y134so30983861pfg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 14:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=Ln9ysvLWp9K5cMFlyr1vrqkC5ojAM5QtOarommo84nk=;
	b=buJWkduT6Ttyg/u5xflnyQYCjqMsvzc77m4eb66SwUWFoVwoUp/vXYMe8U/eBY0mqm
	3KMYaW3uXyzzIsbPvKl+HHbOINyyfsmwS3X6CO0brOrHrl1wCTHqlxeBDD60gIturxi8
	wNedc/+p5+wPk81xb+tpVArIxC9jqznH+qHJa3lEAVf907u2PXvZfVH4JIVw/ddlnM9R
	UM9djyfVtEMha0Ylj5Rq+hKQqq6XXFcAA641QANU+bd00zGmVQv3cpqRE7z6rRJBCvV2
	660htfyH1TkEZH+YzgrCQhxEaNki9ZvQhxAbGcQWgY9nJE7iBAUPWvLrLqYPcIaWhn/7
	Hx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Ln9ysvLWp9K5cMFlyr1vrqkC5ojAM5QtOarommo84nk=;
	b=AWMwxp66u/3KkyAerdV2e0K/kHATaBcpqHOnlYB5wBe3hA6HbhYu3R0Mp2NEOXcPY0
	mW06ImHKWisi/7Od+JOL2WzdnKkLTldIQvYbj7D+DHH0pwDZJZd9x6c4gp6JYAFzCxJc
	/SDnbT443k3f59mBWWdbeOYSKW05e7rqt+SfRpxvDWOE80wC4YcaM3GUeISb/Uhl+JoV
	KsePXwvSWnzz4EY7GIyGJAuP7lv1j4Qhgnv4vRxZlfX9UdYCmg1CYYRfiY42Z+Usleqq
	/qVUKcB6WTBE0SAGZ+xiC0yvhbLmg5yWpogcw+6jb3eNaetsELMVb39g0lWg9zlo83jM
	8JMg==
X-Gm-Message-State: AEkooutpzDFm7ngd65BmkYHeJx9vMPkMi5xmHgYRuLSJjBOEOQrAf6h8jp0w9WvM7j6F0A==
X-Received: by 10.98.196.77 with SMTP id y74mr67596784pff.97.1471381338422;
	Tue, 16 Aug 2016 14:02:18 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:7934:66f:2860:bf87?
	([2601:646:8882:b8c:7934:66f:2860:bf87])
	by smtp.gmail.com with ESMTPSA id
	84sm41461694pfp.59.2016.08.16.14.02.17
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Aug 2016 14:02:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <25D6125FB568F54699E315276ED4D36C614E157B@SLXMBX01.csw.l-3com.com>
Date: Tue, 16 Aug 2016 14:02:12 -0700
Message-Id: <237DA9E1-C8D9-44E8-A6D6-F0242F950179@gmail.com>
References: <25D6125FB568F54699E315276ED4D36C614E157B@SLXMBX01.csw.l-3com.com>
To: kyle.unice@L-3com.com
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: 'Daisy' problem bitbake -c do_populate_sdk fsl-image-full
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
X-List-Received-Date: Tue, 16 Aug 2016 21:02:20 -0000
X-Groupsio-MsgNum: 85804
Content-Type: multipart/signed;
	boundary="Apple-Mail=_038DD2C8-AAB4-4942-A3F7-BD9798F8C2BD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_038DD2C8-AAB4-4942-A3F7-BD9798F8C2BD
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_F6EECC91-0279-49EA-84FD-753D0689CA66"

--Apple-Mail=_F6EECC91-0279-49EA-84FD-753D0689CA66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 16, 2016, at 12:53 PM, kyle.unice@L-3com.com wrote:
>=20
> Folks,
>=20
> I am having a problem doing the =E2=80=98bitbake =E2=80=93c =
do_populate_sdk fsl-image-full=E2=80=99 command using the daisy branch =
of Yocto with the freescale b4860qds-64b evaluation board.
>=20
> Here is the error I get:
>=20
> ERROR: Unable to install packages. Command =
'/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroot=
s/x86_64-linux/usr/bin/smart =
--data-dir=3D/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release=
/tmp/work/b4860qds_64b-fsl-linux/fsl-image-full/1.0-r0/sdk/image/opt/fsl-n=
etworking/QorIQ-SDK-V1.8/sysroots/ppc64e6500-fsl-linux/var/lib/smart =
install -y libgcc1@lib32_ppce6500 gcc@lib32_ppce6500 =
libgcov-dev@lib32_ppce6500 libgcc-s-dev@lib32_ppce6500 =
valgrind@lib32_ppce6500 binutils@lib32_ppce6500 g++@lib32_ppce6500 =
ldd@lib32_ppce6500 gcov@lib32_ppce6500 cpp@lib32_ppce6500 =
eglibc-utils@lib32_ppce6500 eglibc-dev@lib32_ppce6500' returned 1:
> Loading cache...
> Updating cache...               =
######################################## [100%]
>=20
> Committing transaction...
> Preparing...                    =
######################################## [  0%]
> error: file /usr/include/gnu/lib-names.h from install of =
eglibc-dev-2.19-r0.lib32_ppce6500 conflicts with file from package =
libc6-dev-2.19-r0.ppc64e6500
>=20

You seem to have run into a glibc multilib namespace issue as I see you =
are building an SDK with both 32bit and 64bit support. Problem is that =
this version of libc
does not seem to generate and install lib-names.h in a multilib safe =
way.

you can backport this patch =
https://github.com/kraj/glibc/commit/93ae1ebaa6df1a0c188614bd0a601ab6e2671=
1c5 =
<https://github.com/kraj/glibc/commit/93ae1ebaa6df1a0c188614bd0a601ab6e267=
11c5>
to eglibc  and retry. Keep in mind that you might need to hand pick the =
patch if it does not apply cleanly.


>=20
> Installing packages (19):
>   binutils-2.23.2-r4@lib32_ppce6500 =
<mailto:binutils-2.23.2-r4@lib32_ppce6500>      =
libgcc-s-dev-4.9.2-r0@lib32_ppce6500 =
<mailto:libgcc-s-dev-4.9.2-r0@lib32_ppce6500>
>   cpp-4.9.2-r0@lib32_ppce6500 <mailto:cpp-4.9.2-r0@lib32_ppce6500>     =
       libgcc1-4.9.2-r0@lib32_ppce6500 =
<mailto:libgcc1-4.9.2-r0@lib32_ppce6500>
>   eglibc-2.19-r0@lib32_ppce6500 <mailto:eglibc-2.19-r0@lib32_ppce6500> =
         libgcov-dev-4.9.2-r0@lib32_ppce6500 =
<mailto:libgcov-dev-4.9.2-r0@lib32_ppce6500>
>   eglibc-dbg-2.19-r0@lib32_ppce6500 =
<mailto:eglibc-dbg-2.19-r0@lib32_ppce6500>      =
libgmp10-5.1.1-r0@lib32_ppce6500 =
<mailto:libgmp10-5.1.1-r0@lib32_ppce6500>
>   eglibc-dev-2.19-r0@lib32_ppce6500 =
<mailto:eglibc-dev-2.19-r0@lib32_ppce6500>      =
libmpc3-1.0.2-r0@lib32_ppce6500 <mailto:libmpc3-1.0.2-r0@lib32_ppce6500>
>   eglibc-utils-2.19-r0@lib32_ppce6500 =
<mailto:eglibc-utils-2.19-r0@lib32_ppce6500>    =
libmpfr4-3.1.2-r0@lib32_ppce6500 =
<mailto:libmpfr4-3.1.2-r0@lib32_ppce6500>
>   g++-4.9.2-r0@lib32_ppce6500 <mailto:g++-4.9.2-r0@lib32_ppce6500>     =
       libstdc++6-4.9.2-r0@lib32_ppce6500 =
<mailto:libstdc++6-4.9.2-r0@lib32_ppce6500>
>   gcc-4.9.2-r0@lib32_ppce6500 <mailto:gcc-4.9.2-r0@lib32_ppce6500>     =
       libz1-1.2.8-r0@lib32_ppce6500 =
<mailto:libz1-1.2.8-r0@lib32_ppce6500>
>   gcov-4.9.2-r0@lib32_ppce6500 <mailto:gcov-4.9.2-r0@lib32_ppce6500>   =
        valgrind-3.10.1-r1@lib32_ppce6500 =
<mailto:valgrind-3.10.1-r1@lib32_ppce6500>
>   ldd-2.19-r0@lib32_ppce6500 <mailto:ldd-2.19-r0@lib32_ppce6500>
>=20
> 206.4MB of package files are needed. 498.9MB will be used.
>=20
> Saving cache...
>=20
>=20
> ERROR: Function failed: do_populate_sdk
> ERROR: Logfile of failure stored in: =
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/b48=
60qds_64b-fsl-linux/fsl-image-full/1.0-r0/temp/log.do_populate_sdk.57975
> ERROR: Task 9 =
(/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-fsl-networking/images/fsl-image-f=
ull.bb, do_populate_sdk) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 6311 tasks of which 6310 didn't need to =
be rerun and 1 failed.
>=20
> Summary: 1 task failed:
>   =
/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-fsl-networking/images/fsl-image-fu=
ll.bb, do_populate_sdk
> Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.
> =
kyle@ubuntu:/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release$=
 =
<mailto:kyle@ubuntu:/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_=
release$>
>=20
>=20
> Is there a way to fix this issue?
>=20
> Thanks,
> Kyle
>=20
>=20
> W. Kyle Unice
> Staff Engineer
> MS F1H03
> 322 North 2200 West Dock 3
> Salt Lake City, Utah 84116-0850
>=20
> Voice: 801-594-2687
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>

--Apple-Mail=_F6EECC91-0279-49EA-84FD-753D0689CA66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 16, 2016, at 12:53 PM, <a =
href=3D"mailto:kyle.unice@l-3com.com" class=3D"">kyle.unice@L-3com.com</a>=
 wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"WordSection1" style=3D"page: WordSection1; font-family: =
Times-Roman; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;"><div style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; =
font-family: Calibri, sans-serif;" class=3D""><span style=3D"font-size: =
12pt; font-family: Candara, sans-serif;" class=3D"">Folks,<o:p =
class=3D""></o:p></span></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><span =
style=3D"font-size: 12pt; font-family: Candara, sans-serif;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></span></div><div style=3D"margin: =
0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><span style=3D"font-size: 12pt; font-family: Candara, =
sans-serif;" class=3D"">I am having a problem doing the =E2=80=98bitbake =
=E2=80=93c do_populate_sdk fsl-image-full=E2=80=99 command using the =
daisy branch of Yocto with the freescale b4860qds-64b evaluation =
board.<o:p class=3D""></o:p></span></div><div style=3D"margin: 0in 0in =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><span style=3D"font-size: 12pt; font-family: Candara, =
sans-serif;" class=3D""><o:p class=3D"">&nbsp;</o:p></span></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D""><span style=3D"font-size: 12pt; =
font-family: Candara, sans-serif;" class=3D"">Here is the error I =
get:<o:p class=3D""></o:p></span></div><div style=3D"margin: 0in 0in =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><span style=3D"font-size: 12pt; font-family: Candara, =
sans-serif;" class=3D""><o:p class=3D"">&nbsp;</o:p></span></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: =
Candara, sans-serif; font-style: italic;" class=3D"">ERROR: Unable to =
install packages. Command =
'/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroot=
s/x86_64-linux/usr/bin/smart =
--data-dir=3D/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release=
/tmp/work/b4860qds_64b-fsl-linux/fsl-image-full/1.0-r0/sdk/image/opt/fsl-n=
etworking/QorIQ-SDK-V1.8/sysroots/ppc64e6500-fsl-linux/var/lib/smart =
install -y libgcc1@lib32_ppce6500 gcc@lib32_ppce6500 =
libgcov-dev@lib32_ppce6500 libgcc-s-dev@lib32_ppce6500 =
valgrind@lib32_ppce6500 binutils@lib32_ppce6500 g++@lib32_ppce6500 =
ldd@lib32_ppce6500 gcov@lib32_ppce6500 cpp@lib32_ppce6500 =
eglibc-utils@lib32_ppce6500 eglibc-dev@lib32_ppce6500' returned 1:<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 12pt; font-family: Candara, sans-serif; font-style: italic;" =
class=3D"">Loading cache...<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: =
Candara, sans-serif; font-style: italic;" class=3D"">Updating =
cache...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; ######################################## [100%]<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 12pt; font-family: Candara, sans-serif; font-style: italic;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 12pt; font-family: Candara, sans-serif; =
font-style: italic;" class=3D"">Committing =
transaction...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: =
Candara, sans-serif; font-style: italic;" =
class=3D"">Preparing...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
######################################## [&nbsp; 0%]<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 12pt; font-family: Candara, sans-serif; font-style: italic;" =
class=3D"">error: file /usr/include/gnu/lib-names.h from install of =
eglibc-dev-2.19-r0.lib32_ppce6500 conflicts with file from package =
libc6-dev-2.19-r0.ppc64e6500<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: =
Candara, sans-serif; font-style: italic;" class=3D""><o:p =
class=3D"">&nbsp;</o:p></div></div></div></blockquote><div><br =
class=3D""></div><div>You seem to have run into a glibc multilib =
namespace issue as I see you are building an SDK with both 32bit and =
64bit support. Problem is that this version of libc</div><div>does not =
seem to generate and install lib-names.h in a multilib safe =
way.</div><div><br class=3D""></div><div>you can backport this =
patch&nbsp;<a =
href=3D"https://github.com/kraj/glibc/commit/93ae1ebaa6df1a0c188614bd0a601=
ab6e26711c5" =
class=3D"">https://github.com/kraj/glibc/commit/93ae1ebaa6df1a0c188614bd0a=
601ab6e26711c5</a></div><div>to eglibc &nbsp;and retry. Keep in mind =
that you might need to hand pick the patch if it does not apply =
cleanly.</div><div><br class=3D""></div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div class=3D"WordSection1" =
style=3D"page: WordSection1; font-family: Times-Roman; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;"><div style=3D"margin: =
0in 0in 0.0001pt; font-size: 12pt; font-family: Candara, sans-serif; =
font-style: italic;" class=3D""><o:p class=3D"">&nbsp;</o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: =
Candara, sans-serif; font-style: italic;" class=3D"">Installing packages =
(19):<o:p class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 12pt; font-family: Candara, sans-serif; font-style: italic;" =
class=3D"">&nbsp;<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:binutils-2.23.2-r4@lib32_ppce6500" style=3D"color: =
purple; text-decoration: underline;" =
class=3D"">binutils-2.23.2-r4@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:libgcc-s-dev-4.9.2-r0@lib32_ppce6500" style=3D"color: =
purple; text-decoration: underline;" =
class=3D"">libgcc-s-dev-4.9.2-r0@lib32_ppce6500</a>&nbsp;&nbsp;<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 12pt; font-family: Candara, sans-serif; font-style: italic;" =
class=3D"">&nbsp;&nbsp;<a href=3D"mailto:cpp-4.9.2-r0@lib32_ppce6500" =
style=3D"color: purple; text-decoration: underline;" =
class=3D"">cpp-4.9.2-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:libgcc1-4.9.2-r0@lib32_ppce6500" style=3D"color: purple; =
text-decoration: underline;" =
class=3D"">libgcc1-4.9.2-r0@lib32_ppce6500</a>&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: =
Candara, sans-serif; font-style: italic;" class=3D"">&nbsp;&nbsp;<a =
href=3D"mailto:eglibc-2.19-r0@lib32_ppce6500" style=3D"color: purple; =
text-decoration: underline;" =
class=3D"">eglibc-2.19-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:libgcov-dev-4.9.2-r0@lib32_ppce6500" style=3D"color: =
purple; text-decoration: underline;" =
class=3D"">libgcov-dev-4.9.2-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 12pt; font-family: Candara, sans-serif; font-style: italic;" =
class=3D"">&nbsp;&nbsp;<a =
href=3D"mailto:eglibc-dbg-2.19-r0@lib32_ppce6500" style=3D"color: =
purple; text-decoration: underline;" =
class=3D"">eglibc-dbg-2.19-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:libgmp10-5.1.1-r0@lib32_ppce6500" style=3D"color: purple; =
text-decoration: underline;" =
class=3D"">libgmp10-5.1.1-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;<o:p class=3D""></o:p></div><div style=3D"margin: 0in 0in =
0.0001pt; font-size: 12pt; font-family: Candara, sans-serif; font-style: =
italic;" class=3D"">&nbsp;&nbsp;<a =
href=3D"mailto:eglibc-dev-2.19-r0@lib32_ppce6500" style=3D"color: =
purple; text-decoration: underline;" =
class=3D"">eglibc-dev-2.19-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:libmpc3-1.0.2-r0@lib32_ppce6500" style=3D"color: purple; =
text-decoration: underline;" =
class=3D"">libmpc3-1.0.2-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;<o:p class=3D""></o:p></div><div style=3D"margin: 0in 0in =
0.0001pt; font-size: 12pt; font-family: Candara, sans-serif; font-style: =
italic;" class=3D"">&nbsp;&nbsp;<a =
href=3D"mailto:eglibc-utils-2.19-r0@lib32_ppce6500" style=3D"color: =
purple; text-decoration: underline;" =
class=3D"">eglibc-utils-2.19-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:libmpfr4-3.1.2-r0@lib32_ppce6500" style=3D"color: purple; =
text-decoration: underline;" =
class=3D"">libmpfr4-3.1.2-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;<o:p class=3D""></o:p></div><div style=3D"margin: 0in 0in =
0.0001pt; font-size: 12pt; font-family: Candara, sans-serif; font-style: =
italic;" class=3D"">&nbsp;&nbsp;<a =
href=3D"mailto:g++-4.9.2-r0@lib32_ppce6500" style=3D"color: purple; =
text-decoration: underline;" =
class=3D"">g++-4.9.2-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:libstdc++6-4.9.2-r0@lib32_ppce6500" style=3D"color: =
purple; text-decoration: underline;" =
class=3D"">libstdc++6-4.9.2-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;<=
o:p class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 12pt; font-family: Candara, sans-serif; font-style: italic;" =
class=3D"">&nbsp;&nbsp;<a href=3D"mailto:gcc-4.9.2-r0@lib32_ppce6500" =
style=3D"color: purple; text-decoration: underline;" =
class=3D"">gcc-4.9.2-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:libz1-1.2.8-r0@lib32_ppce6500" style=3D"color: purple; =
text-decoration: underline;" =
class=3D"">libz1-1.2.8-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;<o:p class=3D""></o:p></div><div style=3D"margin: =
0in 0in 0.0001pt; font-size: 12pt; font-family: Candara, sans-serif; =
font-style: italic;" class=3D"">&nbsp;&nbsp;<a =
href=3D"mailto:gcov-4.9.2-r0@lib32_ppce6500" style=3D"color: purple; =
text-decoration: underline;" =
class=3D"">gcov-4.9.2-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:valgrind-3.10.1-r1@lib32_ppce6500" style=3D"color: =
purple; text-decoration: underline;" =
class=3D"">valgrind-3.10.1-r1@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<o:p class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 12pt; font-family: Candara, sans-serif; font-style: italic;" =
class=3D"">&nbsp;&nbsp;<a href=3D"mailto:ldd-2.19-r0@lib32_ppce6500" =
style=3D"color: purple; text-decoration: underline;" =
class=3D"">ldd-2.19-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: =
Candara, sans-serif; font-style: italic;" class=3D""><o:p =
class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 12pt; font-family: Candara, sans-serif; font-style: italic;" =
class=3D"">206.4MB of package files are needed. 498.9MB will be =
used.<o:p class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 12pt; font-family: Candara, sans-serif; font-style: italic;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 12pt; font-family: Candara, sans-serif; =
font-style: italic;" class=3D"">Saving cache...<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 12pt; font-family: Candara, sans-serif; font-style: italic;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 12pt; font-family: Candara, sans-serif; =
font-style: italic;" class=3D""><o:p class=3D"">&nbsp;</o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: =
Candara, sans-serif; font-style: italic;" class=3D"">ERROR: Function =
failed: do_populate_sdk<o:p class=3D""></o:p></div><div style=3D"margin: =
0in 0in 0.0001pt; font-size: 12pt; font-family: Candara, sans-serif; =
font-style: italic;" class=3D"">ERROR: Logfile of failure stored in: =
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/b48=
60qds_64b-fsl-linux/fsl-image-full/1.0-r0/temp/log.do_populate_sdk.57975<o=
:p class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 12pt; font-family: Candara, sans-serif; font-style: italic;" =
class=3D"">ERROR: Task 9 =
(/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-fsl-networking/images/fsl-image-f=
ull.bb, do_populate_sdk) failed with exit code '1'<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 12pt; font-family: Candara, sans-serif; font-style: italic;" =
class=3D"">NOTE: Tasks Summary: Attempted 6311 tasks of which 6310 =
didn't need to be rerun and 1 failed.<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: =
Candara, sans-serif; font-style: italic;" class=3D""><o:p =
class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 12pt; font-family: Candara, sans-serif; font-style: italic;" =
class=3D"">Summary: 1 task failed:<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: =
Candara, sans-serif; font-style: italic;" class=3D"">&nbsp; =
/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-fsl-networking/images/fsl-image-fu=
ll.bb, do_populate_sdk<o:p class=3D""></o:p></div><div style=3D"margin: =
0in 0in 0.0001pt; font-size: 12pt; font-family: Candara, sans-serif; =
font-style: italic;" class=3D"">Summary: There were 2 ERROR messages =
shown, returning a non-zero exit code.<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: =
Candara, sans-serif; font-style: italic;" class=3D""><a =
href=3D"mailto:kyle@ubuntu:/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860q=
ds-64b_release$" style=3D"color: purple; text-decoration: underline;" =
class=3D"">kyle@ubuntu:/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-6=
4b_release$</a><o:p class=3D""></o:p></div><div style=3D"margin: 0in 0in =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><span style=3D"font-size: 12pt; font-family: Candara, =
sans-serif;" class=3D""><o:p class=3D"">&nbsp;</o:p></span></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D""><span style=3D"font-size: 12pt; =
font-family: Candara, sans-serif;" class=3D""><o:p =
class=3D"">&nbsp;</o:p></span></div><div style=3D"margin: 0in 0in =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><span style=3D"font-size: 12pt; font-family: Candara, =
sans-serif;" class=3D"">Is there a way to fix this issue?<o:p =
class=3D""></o:p></span></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><span =
style=3D"font-size: 12pt; font-family: Candara, sans-serif;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></span></div><div style=3D"margin: =
0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><span style=3D"font-size: 12pt; font-family: Candara, =
sans-serif;" class=3D"">Thanks,<o:p class=3D""></o:p></span></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D""><span style=3D"font-size: 12pt; =
font-family: Candara, sans-serif;" class=3D"">Kyle<o:p =
class=3D""></o:p></span></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><span =
style=3D"font-size: 12pt; font-family: Candara, sans-serif;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></span></div><div style=3D"margin: =
0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><span style=3D"font-size: 12pt; font-family: Candara, =
sans-serif;" class=3D""><o:p class=3D"">&nbsp;</o:p></span></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">W. Kyle Unice<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D"">Staff =
Engineer<o:p class=3D""></o:p></div><div style=3D"margin: 0in 0in =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">MS F1H03<o:p class=3D""></o:p></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">322 North 2200 West Dock 3<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">Salt Lake City, Utah 84116-0850<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><o:p =
class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D"">Voice: =
801-594-2687<o:p class=3D""></o:p></div><div style=3D"margin: 0in 0in =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></div></div><span =
style=3D"font-family: Times-Roman; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"font-family: Times-Roman; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Times-Roman; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" =
class=3D"">_______________________________________________</span><br =
style=3D"font-family: Times-Roman; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Times-Roman; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">Openembedded-core =
mailing list</span><br style=3D"font-family: Times-Roman; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" style=3D"color: =
purple; text-decoration: underline; font-family: Times-Roman; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
style=3D"font-family: Times-Roman; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
style=3D"color: purple; text-decoration: underline; font-family: =
Times-Roman; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_F6EECC91-0279-49EA-84FD-753D0689CA66--

--Apple-Mail=_038DD2C8-AAB4-4942-A3F7-BD9798F8C2BD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlezf1gACgkQuwUzVZGdMxQgYACfZcaR2aP8MCkA25A91V2aleog
u6kAn1z1KKMk68PGEpihwcSKEAdWD2+H
=T50z
-----END PGP SIGNATURE-----

--Apple-Mail=_038DD2C8-AAB4-4942-A3F7-BD9798F8C2BD--
