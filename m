Return-Path: <jcady92@gmail.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id CF3436EA91
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 17:57:35 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id f11so19784914qae.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 09:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=QHQNvwsVdqpxE05eB3lyqWw4TjvDIajWl7fy/mwiGCU=;
	b=Jb8ckp1LZ/HBf2C4slF1sNIwH22aioG/m+mpDiqILrIacxcRZV/5XRzJj8Q5Dpw24e
	+b0kq4+K/1oN83ZiAu5UeMz3B91jYiMwh04eNMcbcRxtdaCQvUYcBxPWxy5B5/lwDF6z
	sciO3vz4iLEHWx3YloIcPlA+U+YSkBp4FZJ7K6qAPMDOEQzaq3Bi5kzplFnDXtUAh5LL
	C7fOl4krF4HDyKZWVv2z2BgPfgBYnMtHPzkDn0IsBiHC/pusI9g1IiiHpKK91Z5Far61
	L8EX+qSnt9mmXjUOl8/XO+OitkSSExcQoQKkLshYLN5VSaOBaYJp2jVrGrhohUZr/iIK
	ebrQ==
X-Received: by 10.224.98.139 with SMTP id q11mr23557982qan.64.1392487056481;
	Sat, 15 Feb 2014 09:57:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.46.3 with HTTP; Sat, 15 Feb 2014 09:57:16 -0800 (PST)
From: Jay Cady <jcady92@gmail.com>
Date: Sat, 15 Feb 2014 12:57:16 -0500
Message-ID: <CANP1U1xG6AkomoUcvm=chpQ=G7HY7ruFQRgYA5We6UsoFxvBLQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Problem with libicudata.so in OE master
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
X-List-Received-Date: Sat, 15 Feb 2014 17:57:36 -0000
Content-Type: multipart/alternative; boundary=089e01536d5c5b22c404f275a857

--089e01536d5c5b22c404f275a857
Content-Type: text/plain; charset=ISO-8859-1

I'm having the exact same problem.

Latest master branch of Yocto 1.5 2/13/14.  Built with the master branch of
meta-qt5.  Wandboard-dual.

When running the Qt5_CinematicExperience app, I'm getting this error:

shared libraries: /usr/lib/libicudata.so.51: internal error

Any ideas how to fix this?

--089e01536d5c5b22c404f275a857
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m having the exact same problem.<div><br></div><div>=
Latest master branch of Yocto 1.5 2/13/14. =A0Built with the master branch =
of meta-qt5. =A0Wandboard-dual.</div><div><br></div><div>When running the Q=
t5_CinematicExperience app, I&#39;m getting this error:</div>

<div><br></div><div><div>shared libraries: /usr/lib/libicudata.so.51: inter=
nal error</div></div><div><br></div><div>Any ideas how to fix this?</div></=
div>

--089e01536d5c5b22c404f275a857--
