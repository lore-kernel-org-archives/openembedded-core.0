Return-Path: <fpiechocki@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 44FFC6E8E6
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 11:18:47 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id w7so6842051lbi.7
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 03:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=1pG/qcqHh/F0x/sh++vfPx/ibCoXv6w5rCuqvaZFhvw=;
	b=mYxiXNOmE5OFJkPPA8FKSYBzDUyTLcPVoDVP7JAxQTqIJq1/v73uSxA6aSaIapRZzr
	t+xvHS93IRXlyWsWlRfAGvZXc8ViJBRVjnMzBexL6lUUZ5MUkCJDO3YGxmVizfFMDdH4
	zg+M5C3uicUF0anaoscgE/g15mcmvSuJcAgHc2dzEGj7eY0HXV31jVhrJxUlDlXSxQK9
	yU2sDaD24OIP3Z7j/LDcX35431ypTT0FMtA8i6ruLm1k0RrhgShhd43HdizK1E21/51i
	Uz8JHA7nVxmNfgfoB1vP1Gf+ni4UVajEIgM72lltkPpan695B52KqNM1xu1SaJCWuGVI
	A2xQ==
MIME-Version: 1.0
X-Received: by 10.112.180.72 with SMTP id dm8mr29504296lbc.28.1392203927427;
	Wed, 12 Feb 2014 03:18:47 -0800 (PST)
Received: by 10.112.199.103 with HTTP; Wed, 12 Feb 2014 03:18:47 -0800 (PST)
Date: Wed, 12 Feb 2014 12:18:47 +0100
Message-ID: <CAALoMC3-u9W024+cQXwfuD4VF7xjqLO-itjk-X8YswdeaHWJHg@mail.gmail.com>
From: Filip Piechocki <fpiechocki@gmail.com>
To: Openembedded-core@lists.openembedded.org
Subject: Re: Problem with libicudata.so in OE master
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
X-List-Received-Date: Wed, 12 Feb 2014 11:18:48 -0000
Content-Type: multipart/alternative; boundary=089e011836be8c9f0104f233bcee

--089e011836be8c9f0104f233bcee
Content-Type: text/plain; charset=ISO-8859-1

I am facing same problem on my RaspberryPi. I've build rpi-basic-image with
some additional libraries including "icu". I've added them to
IMAGE_INSTALL_append, then I've corss-compiled Qt 5.2.1 and I get the exact
same error with libicudata.so:

error while loading shared libraries: /usr/lib/libicudata.so.51: internal error


Does anybody know what is the cause of this error?

Best regards,

Filip Piechocki

--089e011836be8c9f0104f233bcee
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am facing same problem on my RaspberryPi. I&#39;ve build=
 rpi-basic-image with some additional libraries including &quot;icu&quot;. =
I&#39;ve added them to IMAGE_INSTALL_append, then I&#39;ve corss-compiled Q=
t 5.2.1 and I get the exact same error with libicudata.so:<div>
<br></div><div><pre style=3D"white-space:pre-wrap;color:rgb(0,0,0)">error w=
hile loading shared libraries: /usr/lib/libicudata.so.51: internal error</p=
re><pre style=3D"white-space:pre-wrap;color:rgb(0,0,0)"><br></pre><pre><fon=
t face=3D"arial"><span style=3D"white-space:normal">Does anybody know what =
is the cause of this error?</span></font></pre>
<pre><font face=3D"arial"><span style=3D"white-space:normal">Best regards,<=
/span></font></pre><pre><font face=3D"arial"><span style=3D"white-space:nor=
mal">Filip Piechocki</span></font></pre></div></div>

--089e011836be8c9f0104f233bcee--
