Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RaQjn-0007WT-Cu
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 12:41:35 +0100
Received: by bkbzt4 with SMTP id zt4so6503454bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 03:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=RJ1AO3cMhM59H7WCIGML/D+hYjhMxIC5B37RTWv1vb4=;
	b=BMy8Vu9prCU/fjfMV4dV8D6Yg9J4zUkuw9cJZpw1NaReGjrBDIYfkmnB8jnjiiHab4
	6x9emZlPEBeb3CcXRSw11LlxE2XuMKcEEU7j6YbSsMoi3PJPNOeChz7zl2Ij+Oxr6Fkp
	c/P/iSibxHj2uMUfPjJUW5tuXbLb7Vj7Ktvh8=
MIME-Version: 1.0
Received: by 10.180.104.41 with SMTP id gb9mr33436617wib.9.1323776064478; Tue,
	13 Dec 2011 03:34:24 -0800 (PST)
Received: by 10.223.69.133 with HTTP; Tue, 13 Dec 2011 03:34:24 -0800 (PST)
In-Reply-To: <CAGiJk9eeFGqwtTmbasesoZ5NP_kv2QR6pZJ4xQTqWm4O7X_QOw@mail.gmail.com>
References: <CAGiJk9cfqfhg6DqY4hMBVXnABaCw1Ff9Gbojoa1B=+TvWvU9DA@mail.gmail.com>
	<1323771701.2731.43.camel@ted>
	<CAGiJk9eeFGqwtTmbasesoZ5NP_kv2QR6pZJ4xQTqWm4O7X_QOw@mail.gmail.com>
Date: Tue, 13 Dec 2011 12:34:24 +0100
Message-ID: <CAGiJk9eo1wzZcQT0MUnaRqG6Tmqg9+dhj8i_dAAmQ9Q8EjG6zg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Dependency resolving ignores changed sstate-cache?
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
X-List-Received-Date: Tue, 13 Dec 2011 11:41:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2011/12/13 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> 2011/12/13 Richard Purdie <richard.purdie@linuxfoundation.org>:
> [snip]
>> Usually the above is a sign of a dependency bitbake has not been aware
>> of. Could you see which .ipk has the dependency on fbset?
>
> It looks like this is the ipk:
> | Installing qt4-x11-free (4.7.4-r33.3) to root...
> | Downloading file:/work/oe-core/tmp-eglibc/deploy/ipk/armv7a/qt4-x11-fre=
e_4.7.4-r33.3_armv7a.ipk.
>
>
> This article may be related?
> http://labs.qt.nokia.com/2009/11/20/building-qt-to-make-use-of-the-beagle=
-boards-sgx-gpu/
>
> --
> Regards
> Samuel

it seems that my citation paste got lost:
"=C3=85ngstr=C3=B6m is busybox based, and the fbset command you will need t=
o set 32
bit color depths on the console will not work with the default fbset
busybox symlink. You will therefore have to install and use fbset(.real)
in order to get 32bit color depths, which is a simple opkg install away for
the connected Beagle board and a bitbake away for the stranded."


--=20
Regards
Samuel


