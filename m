Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2409373C0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 13:52:19 +0000 (UTC)
Received: by ignm3 with SMTP id m3so73337050ign.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 06:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=2Kuj42/RdVvgowD776wNONqK6Nkb2VZkgIyKneQbqEg=;
	b=JSwud8Vluo7qYi+hO1QRnRgxlpUK/ob0rV9X+kQvkaMKe6tLP+DnfRUy/mNGOo3bUJ
	w9gom6j7ihoagGi/jUIKorQ2E+x4NR4foUmMLcegknDT3Ve2cdqVa/JvxX8ygnfl2KrT
	AkLT4qKBpO1itiBAiGXhYQHg2rA/UrwMXEP1Zg91oglmNjWlT2HJKhVXP5DMC2yrUlIB
	DZAlLsVPoL9t2wrasECkgsXc+VIUmvL8pLRcZk7V+7mgFFkGBn477mWd7bEprYzAGQNR
	u/AwN3XP86EUWiNs+fEkiO/yCx9r5HSuQNE9K8W5bD9R29qI5zsbA0EEn9EGIVqtj3ZP
	vg+g==
MIME-Version: 1.0
X-Received: by 10.107.34.210 with SMTP id i201mr49153597ioi.1.1427723540794;
	Mon, 30 Mar 2015 06:52:20 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Mon, 30 Mar 2015 06:52:20 -0700 (PDT)
In-Reply-To: <1427532627.14020.217.camel@linuxfoundation.org>
References: <1427532627.14020.217.camel@linuxfoundation.org>
Date: Mon, 30 Mar 2015 10:52:20 -0300
X-Google-Sender-Auth: MyKdNUVsXPpIOSdyHHh2OOMmZbI
Message-ID: <CAP9ODKoPyP-Ynsg4KeL9wCNf+f04xWQJR=FUVt3o0QWjPKNbcg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dpkg-native: Avoid 'file changed' errors from tar
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
X-List-Received-Date: Mon, 30 Mar 2015 13:52:20 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 28, 2015 at 5:50 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> See the patch header for details. Hardlink count duing do_package_write_deb
> can change causing dpkg-deb failures. We don't care about this error
> case so avoid it by checking the tar exit code.
>
> [YOCTO #7529]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Please don't ask someone to see the patch header for information. This
should be in the commit log and not necessarily read the diff to find
this information.

Please send a v2 adding this information in the commit log.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

