Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1S0hgR-0006VE-Ba
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 00:02:43 +0100
Received: by werc1 with SMTP id c1so1150927wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:54:21 -0800 (PST)
Received-SPF: pass (google.com: domain of andrei@gherzan.ro designates
	10.180.7.231 as permitted sender) client-ip=10.180.7.231; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrei@gherzan.ro
	designates 10.180.7.231 as permitted sender)
	smtp.mail=andrei@gherzan.ro
Received: from mr.google.com ([10.180.7.231])
	by 10.180.7.231 with SMTP id m7mr951295wia.3.1330037661568 (num_hops =
	1); Thu, 23 Feb 2012 14:54:21 -0800 (PST)
Received: by 10.180.7.231 with SMTP id m7mr767369wia.3.1330037661199; Thu, 23
	Feb 2012 14:54:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.227.113.67 with HTTP; Thu, 23 Feb 2012 14:54:01 -0800 (PST)
X-Originating-IP: [79.117.107.69]
In-Reply-To: <4F45C9CE.3040407@linux.intel.com>
References: <1328613884-19288-1-git-send-email-andrei@gherzan.ro>
	<4F45C9CE.3040407@linux.intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 24 Feb 2012 00:54:01 +0200
Message-ID: <CAK18fxHAqgP4iD6pYF7iK9=rsHeA=exKqDv0VXko0GtR_yoUCw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQlqKQroMYzW5c+JP2dpeqay1Q/aHwQRAEXXTgX25YeSAJ3vEZvqIVhXvCBWlN2/eoVduAtH
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] js: Update to v1.8.5
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
X-List-Received-Date: Thu, 23 Feb 2012 23:02:43 -0000
Content-Type: multipart/alternative; boundary=90e6ba211f1b556d8104b9a986cf

--90e6ba211f1b556d8104b9a986cf
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 23, 2012 at 07:08, Saul Wold <sgw@linux.intel.com> wrote:

> On 02/07/2012 03:24 AM, Andrei Gherzan wrote:
>
>> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
>> Signed-off-by: Sergey 'Jin' Bostandzhyan<jin@mediatomb.cc>
>> ---
>>  meta/recipes-support/js/files/**buildcc.patch       |   22 ------
>>  meta/recipes-support/js/files/**configure.ac <http://configure.ac>
>>    |   28 --------
>>  meta/recipes-support/js/files/**jsautocfg.h         |   74
>> ---------------------
>>  meta/recipes-support/js/files/**link_with_gcc.patch |   15 ----
>>  meta/recipes-support/js/files/**usepic.patch        |   26 -------
>>  meta/recipes-support/js/js_1.**7.0+1.8.0rc1.bb      |   50
>> --------------
>>  meta/recipes-support/js/js_1.**8.5.bb <http://js_1.8.5.bb>
>>   |   50 ++++++++++++++
>>  7 files changed, 50 insertions(+), 215 deletions(-)
>>  delete mode 100644 meta/recipes-support/js/files/**buildcc.patch
>>  delete mode 100644 meta/recipes-support/js/files/**configure.ac<http://configure.ac>
>>  delete mode 100644 meta/recipes-support/js/files/**jsautocfg.h
>>  delete mode 100644 meta/recipes-support/js/files/**link_with_gcc.patch
>>  delete mode 100644 meta/recipes-support/js/files/**usepic.patch
>>  delete mode 100644 meta/recipes-support/js/js_1.**7.0+1.8.0rc1.bb
>>  create mode 100644 meta/recipes-support/js/js_1.**8.5.bb<http://js_1.8.5.bb>
>>
>>
> I still seem to be getting a compile failure with js.  See the attached
> failure log.
>
>
>
Something changed from the latest commits. I will look into it. It fails in
my build as well. But with another error... I will look into this.

@g

--90e6ba211f1b556d8104b9a986cf
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Feb 23, 2012 at 07:08, Saul Wold <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

On 02/07/2012 03:24 AM, Andrei Gherzan wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Andrei Gherzan&lt;<a href=3D"mailto:andrei@gherzan.ro" targe=
t=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
Signed-off-by: Sergey &#39;Jin&#39; Bostandzhyan&lt;jin@mediatomb.cc&gt;<br=
>
---<br>
 =A0meta/recipes-support/js/files/<u></u>buildcc.patch =A0 =A0 =A0 | =A0 22=
 ------<br>
 =A0meta/recipes-support/js/files/<a href=3D"http://configure.ac" target=3D=
"_blank"><u></u>configure.ac</a> =A0 =A0 =A0 =A0| =A0 28 --------<br>
 =A0meta/recipes-support/js/files/<u></u>jsautocfg.h =A0 =A0 =A0 =A0 | =A0 =
74 ---------------------<br>
 =A0meta/recipes-support/js/files/<u></u>link_with_gcc.patch | =A0 15 ----<=
br>
 =A0meta/recipes-support/js/files/<u></u>usepic.patch =A0 =A0 =A0 =A0| =A0 =
26 -------<br>
 =A0meta/recipes-support/js/js_1.<u></u>7.0+<a href=3D"http://1.8.0rc1.bb" =
target=3D"_blank">1.8.0rc1.bb</a> =A0 =A0 =A0| =A0 50 --------------<br>
 =A0meta/recipes-support/js/<a href=3D"http://js_1.8.5.bb" target=3D"_blank=
">js_1.<u></u>8.5.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 50 +++++++++++++=
+<br>
 =A07 files changed, 50 insertions(+), 215 deletions(-)<br>
 =A0delete mode 100644 meta/recipes-support/js/files/<u></u>buildcc.patch<b=
r>
 =A0delete mode 100644 meta/recipes-support/js/files/<a href=3D"http://conf=
igure.ac" target=3D"_blank"><u></u>configure.ac</a><br>
 =A0delete mode 100644 meta/recipes-support/js/files/<u></u>jsautocfg.h<br>
 =A0delete mode 100644 meta/recipes-support/js/files/<u></u>link_with_gcc.p=
atch<br>
 =A0delete mode 100644 meta/recipes-support/js/files/<u></u>usepic.patch<br=
>
 =A0delete mode 100644 meta/recipes-support/js/js_1.<u></u>7.0+<a href=3D"h=
ttp://1.8.0rc1.bb" target=3D"_blank">1.8.0rc1.bb</a><br>
 =A0create mode 100644 meta/recipes-support/js/<a href=3D"http://js_1.8.5.b=
b" target=3D"_blank">js_1.<u></u>8.5.bb</a><br>
<br>
</blockquote>
<br>
I still seem to be getting a compile failure with js. =A0See the attached<b=
r>
failure log.<br>
<br><br></blockquote><div><br></div><div>Something changed from the=A0lates=
t=A0commits. I will look into it. It fails in my build as well. But with an=
other error... I will look into this.</div><div><br></div><div>@g=A0</div><=
/div>


--90e6ba211f1b556d8104b9a986cf--
