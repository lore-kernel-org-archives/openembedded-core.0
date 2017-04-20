Return-Path: <koenraad.verheyden@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8622773124
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 12:25:19 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id y11so16396292oie.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 05:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=P+dDvA4fRm+Fzh3kKkQr70VqNuRltO3jNF9hBY7aT6g=;
	b=TQciurAcOeonlJHGpzNCVUyuDRZADxMGlf8yPYFWskJPd0gS5Zo2Kiy/c93D5NG6tM
	/gc1z7qZFoDY9xGEgnbChvwVrLq1TiQT26OWy6+2VVRfMae7WVsYUjl56AQ27rSHE0Em
	sNH7NVQY7SmzQmfk8nhnvakNO3ZYV24Q489m9iYRmyhSzb0C0VZnsyU96v5OQI9TK1XR
	Mic7cwHP8iasPrQL190DEnY9qlOErjklnZJSGFHoCItXXDu5djeEyohgx33TBrs51Hwy
	N6eeS4r8hfC9/WtC1wMBgyhXjVX7W7VqlnnsoeqB37vp2LP3jzgK1ehjQyGTQNwYQiOG
	E+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=P+dDvA4fRm+Fzh3kKkQr70VqNuRltO3jNF9hBY7aT6g=;
	b=YbBcpZRgU6zMX8ZSntxRwr/CVVn9RzPmlz0DDhxkjW4dKT1rQWXi2CHWxj8ffIVdNs
	Z6/EKFlvGElYJ6lSNPROcMjfi6q4XomA4PDvFYwBNy4IvgPOJuF12BQpP1JmMDFV8mVL
	jDyrjcE0XnSjE6K/XCJfy3kDtROUvR75pYw69d804MWSb/1l93lhshpTgKh5jaz5j44Z
	i1ERWTYHQ+OBpOqMXpiw6Ab+FVEMGj6XhopOmfc9X+Gp06b9rE5hl6XYElpgdYwPELTx
	AmnaXjJnvxjaUB+CZuWmrLDiT/u1sY5m8wXulqcs1628ZQehMzK4dE19mkk91u3qzLi6
	Kp2Q==
X-Gm-Message-State: AN3rC/51AaJ4NTQiS7QAfvS7EICE5cj4UpM7OnkqW4ssH34eaSRGEuqI
	idgE1U0a46p/S/UXn2bvBxQ/pcbFd6PvFco=
X-Received: by 10.202.175.23 with SMTP id y23mr4016107oie.155.1492691120075;
	Thu, 20 Apr 2017 05:25:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.25.232 with HTTP; Thu, 20 Apr 2017 05:25:19 -0700 (PDT)
From: Koenraad Verheyden <koenraad.verheyden@gmail.com>
Date: Thu, 20 Apr 2017 14:25:19 +0200
Message-ID: <CA+rFJSHcJbmnrtA0jqXXscj7LpV3GR6EcGeBWCGdSPbZeES+SA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: PulseAudio with WebRTC echo cancellation (aec): support for webrtc-audio-processing package
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
X-List-Received-Date: Thu, 20 Apr 2017 12:25:19 -0000
Content-Type: multipart/alternative; boundary=001a113ce6b0f8b884054d983ba7

--001a113ce6b0f8b884054d983ba7
Content-Type: text/plain; charset=UTF-8

Hey all,

I want to use PulseAudio with WebRTC echo cancellation. Enabling this
depends on the webrtc-audio-processing library [1].
In an earlier message to this list [2] it was decided to add the
configuration option to the pulseaudio recipe, although the
webrtc-audio-processing package isn't implemented yet in OE-core

Is there any progress on this?

With kind regards,
Koenraad

[1]:
https://www.freedesktop.org/software/pulseaudio/webrtc-audio-processing/
[2]:
http://lists.openembedded.org/pipermail/openembedded-core/2016-July/124131.html

--001a113ce6b0f8b884054d983ba7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey all,<br><br>I want to use PulseAudio with WebRTC echo =
cancellation. Enabling this<br>depends on the webrtc-audio-processing libra=
ry [1].<br>In an earlier message to this list [2] it was decided to add the=
<br>configuration option to the pulseaudio recipe, although the<br>webrtc-a=
udio-processing package isn&#39;t implemented yet in OE-core<br><br>Is ther=
e any progress on this?<br><br>With kind regards,<br>Koenraad<br><br>[1]: <=
a href=3D"https://www.freedesktop.org/software/pulseaudio/webrtc-audio-proc=
essing/">https://www.freedesktop.org/software/pulseaudio/webrtc-audio-proce=
ssing/</a><br>[2]: <a href=3D"http://lists.openembedded.org/pipermail/opene=
mbedded-core/2016-July/124131.html">http://lists.openembedded.org/pipermail=
/openembedded-core/2016-July/124131.html</a></div>

--001a113ce6b0f8b884054d983ba7--
