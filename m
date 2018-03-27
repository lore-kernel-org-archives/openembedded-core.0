Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 86DC5606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 07:44:23 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id n20so4985168ual.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 00:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=b0VnAdzD0MpqyHOTNRhFb6Py95LwfrnIWRpJmKSI7OQ=;
	b=amyyY8TKC16MtxmVSrzgnXIAgLXdvM2DsUxOrmvcagaymxJdosYcp2VU4W+COHea9u
	JI8W+pSchXoOHMPuuRXRqvQVmIODezEGHHTTkcEOYXsgV3nogR/KjcG14C0NFyOP53a6
	9aeCU0T9rc4NoqJL3rFfXmxIz6O4kCHfnFDxCSlMVDVRwNNnQ+CpR0O4vJkM6dAq3Y9m
	1AmqRXk06/Qhno8w13jdPTEXYDs37EyHgElJ1NK02U51rn0wmFDau6vetU7F2KIl91Cu
	/RN49emUrn0nMu0YaHjHF++Uq+6f8Lngu3QF24Sdl8Y0VknAbfRI/RAKvpcLF+AIH/ry
	Abmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=b0VnAdzD0MpqyHOTNRhFb6Py95LwfrnIWRpJmKSI7OQ=;
	b=M6xIvxOp1f3AG+tJXFeeyo63SLNtVpag+T/9VzLhKitU9K6GGoKJ6uEAjFdVElFzWc
	YIJv81spzLEWP15yY1Fd6bqkHAMRHIUoyor/EKpr/RA2Qi5M8RfsbF4XsyYVTqSxXaFN
	UC5b7YmJ+JXnvsXs65Du5jdM2ZHeVtYl/jq8hk+MMMbDJwDmDUrGCPUj8zcQkbe/IH/3
	xLWOeqY7k6lCqWswQoAg6fuoZTwYbg69wZU4F0p4vIv4Z+RERL8Jytt+e8i4s2jbzcij
	lvuRF2qILw5tVu40V3jjF5s7a253iPrIvw4RFHjC3AFOlQHexgPLY5NiZOuNBE/dPQK8
	WOng==
X-Gm-Message-State: AElRT7HhInhc68n5fFLRVemCwpIa3z2HA96NeRdbD3EdioRX9PtBaa+I
	QhizAijOXzxliS6UB1eSf3Xl7eGiyiJyFvRIIRYel3Ul
X-Google-Smtp-Source: AG47ELtq1i4ip//6rdfZru1ss6aS/ah7hFfhKNsjrIhwQ9Ve3IB/CONz0zDvaeiimnLiJBZBGlceFZU6FQ3sMtAigRo=
X-Received: by 10.159.61.203 with SMTP id e11mr21046146uaj.115.1522136664238; 
	Tue, 27 Mar 2018 00:44:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.219.149 with HTTP; Tue, 27 Mar 2018 00:44:23 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Tue, 27 Mar 2018 13:14:23 +0530
Message-ID: <CAPGMVzGJsYphUHa3RqTMf0hBfgVQWRpabtjv4PKzTPwXVbfD_w@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: network error
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
X-List-Received-Date: Tue, 27 Mar 2018 07:44:23 -0000
Content-Type: multipart/alternative; boundary="089e082450282befb00568600fe1"

--089e082450282befb00568600fe1
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to do a pip install on poky for one of the python package and
it is resulting in this error, do help


Retrying (Retry(total=4, connect=None, read=None, redirect=None)) after
connection broken by
'NewConnectionError'('<pip._vendor.requests.pacages.urllib3.connection.VerifiedHTPSConenction
object at 0xb68f988c>': Failed to establish a new connection: [Errno -2]
Name or service not known',): /simple/pyros-setup/
Could not find a version that satisfies the requirement pyros_setup (from
versions: ) No matching distribution found for pyros_setup

Thanks,
Rajath

--089e082450282befb00568600fe1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,<br><br>I am trying to do a pip install on po=
ky for one of the python package and it is resulting in this error, do help=
<br><br><br>Retrying (Retry(total=3D4, connect=3DNone, read=3DNone, redirec=
t=3DNone)) after connection broken by &#39;NewConnectionError&#39;(&#39;&lt=
;pip._vendor.requests.pacages.urllib3.connection.VerifiedHTPSConenction obj=
ect at 0xb68f988c&gt;&#39;: Failed to establish a new connection: [Errno -2=
] Name or service not known&#39;,): /simple/pyros-setup/<br>Could not find =
a version that satisfies the requirement pyros_setup (from versions: ) No m=
atching distribution found for pyros_setup<br><br></div>Thanks,<br></div>Ra=
jath<br></div>

--089e082450282befb00568600fe1--
