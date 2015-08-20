Return-Path: <0xf777@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2326873DF0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 14:18:47 +0000 (UTC)
Received: by ykfw73 with SMTP id w73so38737435ykf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 07:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=x2IE+Fr0LsnhmgFz/duWJNBKK7N+J5S+20KvHtZN/IQ=;
	b=hJfjRApYH/5z0Hyx4pRnZOY1DEKvYdDm9EUT5ChqUpgAmmpJ/yzWxg8hkUb/mhMUzV
	P77PQ9cxyYa2SQ9Q35ugF8+mZ5nAD/2FzyRQ1LNrw2ZNNqZS/MsGtf7wB3/dmDDy2vQk
	Zj0jYKGnO4yj9bd8UTuYDdjhwMyxofh1yWspKPyTCGyyFmO0XPxQnRTqf56nosM0Akzf
	dsC3mlElZLXfnA54xOlhKncNSTepZtDs54YZ1krIXb/wKgNXNnptx0vept9THKh3snUS
	EmGIT1F+NLNAgIoNlvTjvkUBpz+jfR481A5zHNvm3H3nfUzQduN7B6mwxV4y6l+Fso6t
	pNPg==
MIME-Version: 1.0
X-Received: by 10.170.212.193 with SMTP id d184mr3379977ykf.51.1440080327628; 
	Thu, 20 Aug 2015 07:18:47 -0700 (PDT)
Received: by 10.13.221.147 with HTTP; Thu, 20 Aug 2015 07:18:47 -0700 (PDT)
Date: Thu, 20 Aug 2015 17:18:47 +0300
Message-ID: <CAHyyKNnpUqqsDahww8wCKbDCrFSS8Ry7cdnpmTYXx0ipgxx0JA@mail.gmail.com>
From: Alex M <0xf777@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Phonon is not available Qt 4.8.7
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
X-List-Received-Date: Thu, 20 Aug 2015 14:18:48 -0000
Content-Type: multipart/alternative; boundary=001a11393888605c1f051dbed404

--001a11393888605c1f051dbed404
Content-Type: text/plain; charset=UTF-8

Hello!
I have a piece of my custom software which is depends on Qt4 + Phonon +
gstreamer 0.1 and two years ago I had successfully built oe-core image.
Recent version of oe-core (19 Aug 2015) contain QT_PHONON ?= "-no-phonon"
option inside qt4.inc file. Why this option banned in default Qt 4
configuration? Also I do not see qt4-plugin-phonon-backend-gstreamer
package in recent version, which my software also requires. Other
gstreamer-0.1 components is fine and already built. What I should do to
activate Phonon support for Qt4 in oe-core?

Also I saw "Phonon for Qt5" meta layers in meta-qt5-extra however I don't
understand how it will work without "***-plugin-phonon-backend-gstreamer"?
Is this package required in case of "Phonon for Qt5"? Should I rewrite my
old Qt4/Phonon code for this?

Thank you for attention :)

--001a11393888605c1f051dbed404
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello!<br>I have a piece of my custom software which is de=
pends on Qt4 + Phonon + gstreamer 0.1 and two years ago I had successfully =
built oe-core image. Recent version of oe-core (19 Aug 2015) contain QT_PHO=
NON ?=3D &quot;-no-phonon&quot; option inside qt4.inc file. Why this option=
 banned in default Qt 4 configuration? Also I do not see qt4-plugin-phonon-=
backend-gstreamer package in recent version, which my software also require=
s. Other gstreamer-0.1 components is fine and already built. What I should =
do to activate Phonon support for Qt4 in oe-core?<br><br>Also I saw &quot;P=
honon for Qt5&quot; meta layers in meta-qt5-extra however I don&#39;t under=
stand how it will work without &quot;***-plugin-phonon-backend-gstreamer&qu=
ot;? Is this package required in case of &quot;Phonon for Qt5&quot;? Should=
 I rewrite my old Qt4/Phonon code for this?<br><br>Thank you for attention =
:)</div>

--001a11393888605c1f051dbed404--
