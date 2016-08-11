Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2F538771A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 09:22:48 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id 38so870324iol.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zYscAQMFytxYnU5oTUHcl7RiYqvMBcXOmtLf/DdMHSU=;
	b=CZ79UCs5b9zotYxYPU+74/tKGxJ+1DfoOSx0Dx2X/gTBOExIdC5lVTJzdrhEsNuSrH
	VOuR6trueUvhJ2k4UTRo+H+RLoCbPT4DmRfFI+DgaswgqCV506JTtG3LfhaKVg5IVM46
	fwF8MSv7psGHyphr8k39s0RYC/MfMv44uA64qDchALlwBIyJqjkfV72LzBTTnT4xNHIb
	fojBnfhE7pWY/usrcy0N5vNLwAPJl8BJibL2f7uvYplmMYj8xRDYCrSwG9sPCSdJzvdd
	je3dgFLK7WMMVuaV6wK8VbDGAjAHuS3LPOQYF4KXYgdJUF7Du1XS70e97lluxsL+dKl5
	3C7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zYscAQMFytxYnU5oTUHcl7RiYqvMBcXOmtLf/DdMHSU=;
	b=LVJ2ugUpfnQh8kQrdyHix89ied3ObLT+4bknY/493Ilae0tzgRzJVgRTKSffS8oYb+
	+YHFSr+MjKFTvMk5Guxeos/g/nCWfNogDKjyPOmjsVFh6S+bj+GXo1zGzQjPqfSlKaIc
	XCY5MLIEa/Qi39BqEiD5crmXoqFYHM1MdvpCsXSwtpW52GzZirxSiKJob9bZadZbfRLo
	+qy8rHJ814lU2kSn3TYDpcoW1O8eNx8H1ans9nsIdIPc/aV6/PE5wv+mWMY/4PV8//Xd
	0iZG2vMXEyh18xqsgpQ6DhB1u2LtMstSMenB4E/G+EDyr2xJc+Q+tili4RbT/aEs87E7
	wiyg==
X-Gm-Message-State: AEkoout03VqvHWaP/PzDUhAQlqBWl6aRWX7ZoMf+3i5fMSutQayjDfBcD8PuughEbgxf9m03iJSDxySJTNsPcsaV
X-Received: by 10.107.135.142 with SMTP id r14mr11106073ioi.133.1470907369804; 
	Thu, 11 Aug 2016 02:22:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 11 Aug 2016 02:22:29 -0700 (PDT)
In-Reply-To: <57AC3D0E.9010502@windriver.com>
References: <bfe3a375-f09b-7617-c209-0df28b24325a@case.edu>
	<57AC3D0E.9010502@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Aug 2016 10:22:29 +0100
Message-ID: <CAJTo0LbasdBhroVaVUZwqYPCHxPa680pYRgs4d1Cz21G6dYuWg@mail.gmail.com>
To: "dengke.du@windriver.com" <dengke.du@windriver.com>
Cc: "openembedded-core@lists.openembedded.org >> Patches and discussions about
	the oe-core layer" <openembedded-core@lists.openembedded.org>
Subject: Re: bash: remove the format string "%q" in the unicode3.sub
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
X-List-Received-Date: Thu, 11 Aug 2016 09:22:50 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc46653c0539c84f71

--001a113eccbc46653c0539c84f71
Content-Type: text/plain; charset=UTF-8

Great, thanks Dengke!

Ross

On 11 August 2016 at 09:53, dengke.du@windriver.com <dengke.du@windriver.com
> wrote:

> Hi ross
>
> After querying for the current maintainer of bash Chet Ramey, he said the
> devel
> branch of bash have fixed it. So I will import those patchs later for the
> bash tests
> suite.
>
> We can check the patchs at:
>
>      http://git.savannah.gnu.org/cgit/bash.git/commit/tests/
> intl.right?h=devel&id=85ec0778f9d778e1820fb8c0e3e996f2d1103b45
>      http://git.savannah.gnu.org/cgit/bash.git/diff/tests/intl.
> right?h=devel&id=74b8cbb41398b4453d8ba04d0cdd1b25f9dcb9e3
>
> //dengke
>
>
> -------- Forwarded Message --------
> Subject: Re: bash: remove the format string "%q" in the unicode3.sub
> Date: Tue, 9 Aug 2016 10:39:13 -0400
> From: Chet Ramey <chet.ramey@case.edu> <chet.ramey@case.edu>
> Reply-To: chet.ramey@case.edu
> To: dengke.du@windriver.com <dengke.du@windriver.com>
> <dengke.du@windriver.com>, bug-bash@gnu.org
> CC: chet.ramey@case.edu
>
> On 8/9/16 3:18 AM, dengke.du@windriver.com wrote:
> > Hi all
> >
> > When I run the tests for the bash, the sub-test unicode3.sub of intl.tests
> > failed.
> >
> > The sub-test unicode3.sub contain the following:
> >
> >     payload=$'\065\247\100\063\231\053\306\123\070\237\242\352\263'
> >     "$payload"
> >     printf %q "$payload"
> >
> > In this situation, the format string "%q" in command printf means that when the
> > character in the payload is not in {alpha & digit & punctuation & ISO
> > 646(7-bit)}, it
> > would print the string with ANSI-C style quoted string: $'...' , we can
> > check the source code
>
> This has already been changed in the devel branch (back in May, 2015), and
> the test case and tets output was changed at the same time.
>
> --
> ``The lyf so short, the craft so long to lerne.'' - Chaucer
> 		 ``Ars longa, vita brevis'' - Hippocrates
> Chet Ramey, UTech, CWRU    chet@case.edu    http://cnswww.cns.cwru.edu/~chet/
>
>
>
>

--001a113eccbc46653c0539c84f71
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great, thanks Dengke!<div><br></div><div>Ross</div></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 11 August 2016 =
at 09:53, <a href=3D"mailto:dengke.du@windriver.com">dengke.du@windriver.co=
m</a> <span dir=3D"ltr">&lt;<a href=3D"mailto:dengke.du@windriver.com" targ=
et=3D"_blank">dengke.du@windriver.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
 =20

   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hi ross<br>
    <br>
    After querying for the current maintainer of bash Chet Ramey, he
    said the devel <br>
    branch of bash have fixed it. So I will import those patchs later
    for the bash tests<br>
    suite.<br>
    <br>
    We can check the patchs at:<br>
    <br>
    =C2=A0=C2=A0=C2=A0=C2=A0
<a href=3D"http://git.savannah.gnu.org/cgit/bash.git/commit/tests/intl.righ=
t?h=3Ddevel&amp;id=3D85ec0778f9d778e1820fb8c0e3e996f2d1103b45" target=3D"_b=
lank">http://git.savannah.gnu.org/<wbr>cgit/bash.git/commit/tests/<wbr>intl=
.right?h=3Ddevel&amp;id=3D<wbr>85ec0778f9d778e1820fb8c0e3e996<wbr>f2d1103b4=
5</a><br>
    =C2=A0=C2=A0=C2=A0=C2=A0
<a href=3D"http://git.savannah.gnu.org/cgit/bash.git/diff/tests/intl.right?=
h=3Ddevel&amp;id=3D74b8cbb41398b4453d8ba04d0cdd1b25f9dcb9e3" target=3D"_bla=
nk">http://git.savannah.gnu.org/<wbr>cgit/bash.git/diff/tests/intl.<wbr>rig=
ht?h=3Ddevel&amp;id=3D<wbr>74b8cbb41398b4453d8ba04d0cdd1b<wbr>25f9dcb9e3</a=
><br>
    <br>
    //dengke<br>
    <div><br>
      <br>
      -------- Forwarded Message --------
      <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0">
        <tbody>
          <tr>
            <th align=3D"RIGHT" nowrap valign=3D"BASELINE">Subject:
            </th>
            <td>Re: bash: remove the format string &quot;%q&quot; in the
              unicode3.sub</td>
          </tr>
          <tr>
            <th align=3D"RIGHT" nowrap valign=3D"BASELINE">Date: </th>
            <td>Tue, 9 Aug 2016 10:39:13 -0400</td>
          </tr>
          <tr>
            <th align=3D"RIGHT" nowrap valign=3D"BASELINE">From: </th>
            <td>Chet Ramey <a href=3D"mailto:chet.ramey@case.edu" target=3D=
"_blank">&lt;chet.ramey@case.edu&gt;</a></td>
          </tr>
          <tr>
            <th align=3D"RIGHT" nowrap valign=3D"BASELINE">Reply-To:
            </th>
            <td><a href=3D"mailto:chet.ramey@case.edu" target=3D"_blank">ch=
et.ramey@case.edu</a></td>
          </tr>
          <tr>
            <th align=3D"RIGHT" nowrap valign=3D"BASELINE">To: </th>
            <td><a href=3D"mailto:dengke.du@windriver.com" target=3D"_blank=
">dengke.du@windriver.com</a> <a href=3D"mailto:dengke.du@windriver.com" ta=
rget=3D"_blank">&lt;dengke.du@windriver.com&gt;</a>,
              <a href=3D"mailto:bug-bash@gnu.org" target=3D"_blank">bug-bas=
h@gnu.org</a></td>
          </tr>
          <tr>
            <th align=3D"RIGHT" nowrap valign=3D"BASELINE">CC: </th>
            <td><a href=3D"mailto:chet.ramey@case.edu" target=3D"_blank">ch=
et.ramey@case.edu</a></td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      <pre>On 8/9/16 3:18 AM, <a href=3D"mailto:dengke.du@windriver.com" ta=
rget=3D"_blank">dengke.du@windriver.com</a> wrote:
&gt; Hi all
&gt;=20
&gt; When I run the tests for the bash, the sub-test unicode3.sub of intl.t=
ests
&gt; failed.
&gt;=20
&gt; The sub-test unicode3.sub contain the following:
&gt;=20
&gt;     payload=3D$&#39;\065\247\100\063\<wbr>231\053\306\123\070\237\242\=
<wbr>352\263&#39;
&gt;     &quot;$payload&quot;
&gt;     printf %q &quot;$payload&quot;
&gt;=20
&gt; In this situation, the format string &quot;%q&quot; in command printf =
means that when the
&gt; character in the payload is not in {alpha &amp; digit &amp; punctuatio=
n &amp; ISO
&gt; 646(7-bit)}, it
&gt; would print the string with ANSI-C style quoted string: $&#39;...&#39;=
 , we can
&gt; check the source code

This has already been changed in the devel branch (back in May, 2015), and
the test case and tets output was changed at the same time.

--=20
``The lyf so short, the craft so long to lerne.&#39;&#39; - Chaucer
		 ``Ars longa, vita brevis&#39;&#39; - Hippocrates
Chet Ramey, UTech, CWRU    <a href=3D"mailto:chet@case.edu" target=3D"_blan=
k">chet@case.edu</a>    <a href=3D"http://cnswww.cns.cwru.edu/~chet/" targe=
t=3D"_blank">http://cnswww.cns.cwru.edu/~<wbr>chet/</a>
</pre>
      <br>
    </div>
    <br>
  </div>

</blockquote></div><br></div>

--001a113eccbc46653c0539c84f71--
