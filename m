Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1TQgW4-0005Ox-0N
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 17:35:40 +0200
Received: by mail-oa0-f47.google.com with SMTP id h1so3665259oag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 08:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=1ln4fLMpYgggLAUA8XGM/rUzIwXEljRFfIcaN2kh0nA=;
	b=a2R+DrfMuu/V+ym5NX1Gek8NSA2Om0xzxIKTq5jwrM3dm0oB8lkgb231B/Fcqj/dyY
	QlOmILo0Qd9DUMDqtc3UV9b9lj2c9x8qpAnfPx3TKDGLl3j0MWaugfZUfQcnJzkAHkdD
	NEJ2Y37f4lDFMlINmBru4l3Psi3beJIdKpdDYZtPWkJktlhzXleNNE59Uv3e8vqwGwkd
	blHklZNnBzF0aXTpaodvZhWtZhHWVR0ajb8YPxUiJGHFZERhuXQXuBuQuftU3icHG5dh
	7aKhnX6m4o4p9QRVEDuLA7VgHQEDmJ0T6OngIWnRJAt1Uqyqe/JAil0GwCWPWaDJmqPy
	DAeg==
MIME-Version: 1.0
Received: by 10.60.20.41 with SMTP id k9mr8089822oee.39.1351005733295; Tue, 23
	Oct 2012 08:22:13 -0700 (PDT)
Received: by 10.60.123.47 with HTTP; Tue, 23 Oct 2012 08:22:13 -0700 (PDT)
Date: Tue, 23 Oct 2012 17:22:13 +0200
Message-ID: <CAOHjBZtTso5LuxjUX=Y+z7UNwnBLKo2rsYRs1oOyMeNfc5oTJg@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: add init applet to busybox
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 15:35:40 -0000
Content-Type: multipart/alternative; boundary=e89a8fb20710d2970604ccbb8801

--e89a8fb20710d2970604ccbb8801
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I need to enable init applet in the current version of busybox.
Do I have to create my own defconfig to pass via .bbappend file or
there is another way to do this setting something for example in
DISTRO_FEATURES (I don't think...).
I saw in the past "stat" applet were added simply patching the already
available defconfig.
Please can you address me?

Many thanks,
Giuseppe

--e89a8fb20710d2970604ccbb8801
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>=A0</div><div>I need to enable init applet in the cu=
rrent version of busybox.</div><div>Do I have to create my own defconfig to=
 pass via .bbappend file or</div><div>there is another way to do this setti=
ng something for example in DISTRO_FEATURES (I don&#39;t think...).</div>
<div>I saw in the past &quot;stat&quot; applet were added simply patching t=
he already available defconfig.</div><div>Please can you address me?</div><=
div>=A0</div><div>Many thanks,</div><div>Giuseppe</div>

--e89a8fb20710d2970604ccbb8801--
