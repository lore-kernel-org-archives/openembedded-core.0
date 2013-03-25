Received: from mail-la0-f52.google.com ([209.85.215.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UKBbO-00083u-MF
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 18:54:36 +0100
Received: by mail-la0-f52.google.com with SMTP id fs12so11814585lab.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 10:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=p39Ic5KS6ORHnGI6hQM92BofOKH2HBPVUboA+WxGY9M=;
	b=FHZaPZPxy/huY/H/8QNyVKeP82eyzWS9m72Z/z+Bmj3Eja4hLFP31tE7oVEfHWN5pd
	bz+Ngf5GKiIkSktb1OGHYSivlAvOXN4t2epmBuD1/hoLU+vkw4AdbLQjCPk3/BhLKdXA
	W5z/ZiDH0Xdk+5epQyI9SKVIlhjOzUdF4XrYBOMnOzAhPgwoj/zBpq6RFDkFRcaQnohw
	wyo+fM5S2Bwt5jZoHM7z5f14aB9qREFMctlMMRI05zCRTNoj3mOWyIZP5Z/G+pvY64ui
	AzGx1dO3i+XL548mbed8RqXVF8YncDPcEdx5GFa0QA5lDejesbWYGlTiWrCR5Frd40ZL
	/hUA==
X-Received: by 10.112.28.169 with SMTP id c9mr6682675lbh.84.1364233056047;
	Mon, 25 Mar 2013 10:37:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.25.195 with HTTP; Mon, 25 Mar 2013 10:37:15 -0700 (PDT)
In-Reply-To: <1364230487.3097.62.camel@ted>
References: <1364230487.3097.62.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 25 Mar 2013 10:37:15 -0700
X-Google-Sender-Auth: ketreyW1eNi-RqBLCWWBsIIAYxM
Message-ID: <CABcZANmGsNEpnwbXtO_9mme35uiOjM_jmK903ANgMFCZDRr+-A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: package.bbclass: Handle subprocess errors correctly
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
X-List-Received-Date: Mon, 25 Mar 2013 17:54:41 -0000
Content-Type: multipart/alternative; boundary=bcaec554d832b25fc404d8c34276

--bcaec554d832b25fc404d8c34276
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 25, 2013 at 9:54 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> If an error occurs in subprocess.call() we currently don't catch it. In
> particular
> we have issues where debugedit is segfaulting unnoticed. This fixes up
> various code paths to catch the errors.
>

Well spotted, at a minimum we should be using check_call(), so an
unanticipated failure results in an uncaught exception, but explicitly
checking retval makes sense as well.
-- 
Christopher Larson

--bcaec554d832b25fc404d8c34276
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Mar 25, 2013 at 9:54 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":17x">If an error occurs in subpr=
ocess.call() we currently don&#39;t catch it. In particular<br>
we have issues where debugedit is segfaulting unnoticed. This fixes up<br>
various code paths to catch the errors.</div></blockquote></div><br>Well sp=
otted, at a minimum we should be using check_call(), so an unanticipated fa=
ilure results in an uncaught exception, but explicitly checking retval make=
s sense as well.<br>

-- <br>Christopher Larson</div></div>

--bcaec554d832b25fc404d8c34276--
