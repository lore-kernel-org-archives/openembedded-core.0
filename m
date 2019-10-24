Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id A8D857F9B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:58:27 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id k15so7845873vsp.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 10:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2Z1Lh31Kdk1NU6k+8YgWbJSWWk3UFoZM2L+dwOq+0Kk=;
	b=DyyfCcIhnqNe0bp3lJhGgtsUL6mQZBH6CIE1yuzqbEXYv/LbDWV+NjQcMg/BHocrpM
	uUwKGcj/BPO7oM1EAnirIFxMrcbpBj9v2UjzDNfHZfs9zevblVyvoBxBXJx2M7sxlOn+
	+b5/N0B3RnQcrWxP3tSeN4b5p1+trH5x3oEq8pAeaMGOpdh/iUtmAobOB/doO/H0uK2T
	J+44yElx8PvM9xKc2a9G88LwlVaNWtf7beuG9h7mw/JpOaW3Ho5YASrwuwz5ZHb4V32I
	QSEGUAl1xHW9gcbfuhbsM5iCzxuEfTBLvLgl+m4T5fY49detPP3twgzbPBth0UaekE11
	53eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2Z1Lh31Kdk1NU6k+8YgWbJSWWk3UFoZM2L+dwOq+0Kk=;
	b=UhbM4JNrkXuB44IuADsBKVnBasedADcX8Qe4nah3sgoMLm/Wh5rZtdsXeojg3v3+7u
	+3zfhToZAPCa9MLwqJxYQZJAxj1D2k5idYqpRLOHWf58pkFTfDdenUcbqA+Gdhc3eGlz
	UM1ICg05tlJt5e13KBCUX39AN3Yfv3im915Bwine8q982TNsK0qboAbpbo2fIx2s7FXy
	0eG8LL7MQOUJRWImRoO/ZMDRU8a9wMYMiAitQMNW3rl/TnG3pE8Ad4Nk5Z/We/YzMpDw
	+RXxA76R+QuYrUZiDZUzN7Ko6oEKBsEuy3Au+Rk0QVhFBnOwU8JKqqKG29Sm0ZDnd3pY
	8SmQ==
X-Gm-Message-State: APjAAAXsA3GvReZXnHJ/ONjbbFn2EuW3xD4k5TeRtHa0LE3N1kz1f6gF
	gyftPn1jG1smwf8UlWegBTZmGvqWZfOL9YU4XZE=
X-Google-Smtp-Source: APXvYqwEnw/3Kjpp2Gun7C6M54wTT4MBRrMx/W2e3VH/Za9bogsPV4mX9YU0iLdv0G8kIqqg3/IvYlC4FI09G05hmtQ=
X-Received: by 2002:a67:ea09:: with SMTP id g9mr9775658vso.23.1571939908383;
	Thu, 24 Oct 2019 10:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
	<CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
	<22cbc060-0f73-4354-1edb-ca90dbed4d73@herbrechtsmeier.net>
	<CANNYZj9L7O9a9RfyXpQP7kY2X_HNt5P9yJQCmUONeZq1rWDKwQ@mail.gmail.com>
	<541b19fa-54c4-42ce-0367-27ddd403d34f@herbrechtsmeier.net>
	<CANNYZj80r-WGgREdj=2TYC-uPNpTnWEL3mfZLtG53z-XR71bOQ@mail.gmail.com>
	<24e39481-ea5c-06e9-6dbb-139a5d0dd445@herbrechtsmeier.net>
In-Reply-To: <24e39481-ea5c-06e9-6dbb-139a5d0dd445@herbrechtsmeier.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Oct 2019 19:58:13 +0200
Message-ID: <CANNYZj8Q1q-EGaUSGFCvVe2A_f4YPvQJeSmrG69bGnokHqWL2Q@mail.gmail.com>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: "Paul Eggleton \(paul.eggleton@linux.intel.com\)"
	<paul.eggleton@linux.intel.com>, rennes@savoirfairelinux.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Thu, 24 Oct 2019 17:58:27 -0000
Content-Type: multipart/alternative; boundary="000000000000d8f9e50595abc756"

--000000000000d8f9e50595abc756
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Oct 2019 at 19:45, Stefan Herbrechtsmeier <
stefan@herbrechtsmeier.net> wrote:

> > The package-lock.json in their tarball is 600K.
>
> The project use two major version and seven different versions with 30
> installations of debug. Furthermore the dependencies include build tools
> which should not be installed on the device.
>
> The "@angular/cli" (242) and "node-red" (324) package share 106 packages.
>

I have to ask: what point are you trying to make?

Here's a related lwn article describing a similar problem faced by opensuse:
https://lwn.net/Articles/712318/

""Ruby dependency hell has nothing on JavaScript dependency hell," he said.
A "hello world" application based on one JavaScript framework has 759
JavaScript dependencies; this framework is described as "a lightweight
alternative to Angular2". There is no way he is going to package all 759
dependencies for this thing; the current distribution package-management
approach just isn't going to work here."

Alex

--000000000000d8f9e50595abc756
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 24 Oct 2019 at 19:45, Stefan Herb=
rechtsmeier &lt;<a href=3D"mailto:stefan@herbrechtsmeier.net">stefan@herbre=
chtsmeier.net</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">&gt; The package-lock.json in their=
 tarball is 600K.<br>
<br>
The project use two major version and seven different versions with 30 <br>
installations of debug. Furthermore the dependencies include build tools <b=
r>
which should not be installed on the device.<br>
<br>
The &quot;@angular/cli&quot; (242) and &quot;node-red&quot; (324) package s=
hare 106 packages.<br></blockquote><div><br></div><div>I have to ask: what =
point are you trying to make?<br></div><div><br></div><div>Here&#39;s a rel=
ated lwn article describing a similar problem faced by opensuse:</div><div>=
<a href=3D"https://lwn.net/Articles/712318/">https://lwn.net/Articles/71231=
8/</a></div><div><br></div><div>&quot;&quot;Ruby dependency hell has nothin=
g on JavaScript dependency
hell,&quot; he said.  A &quot;hello world&quot; application based on one Ja=
vaScript
framework has 759 JavaScript dependencies; this framework is described as
&quot;a lightweight alternative to Angular2&quot;.  There is no way he is g=
oing to
package all 759 dependencies for this thing; the current distribution
package-management approach just isn&#39;t going to work here.&quot;</div><=
div><br></div><div>Alex<br></div></div></div>

--000000000000d8f9e50595abc756--
