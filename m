Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SUOvE-0007Em-El
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 23:04:44 +0200
Received: by eaal1 with SMTP id l1so4864eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 13:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Bow8HGaBm1zrazU7IqaZW6mWNiIcmmREi4WCVI7eFZc=;
	b=qNDXFzFDrJpl9s0lMZmUGP056GEYp+9oDeIZFHdRKhI8T9TsbwLQwJRBXXgp6bztdg
	EvjNDeTPD9rIjDGuiliL/CtRpWgfmm+U8ohEfcfp63pF+m7m0zO/8oBczgUAHeFHqWVL
	S9xYE/t9C0P318dB6Lk3kKIu/lchtqP5UFRFQA/Dm6rTIl7e1LTDVQIc3zU0q1s3/Xd7
	axns+nCv0Yqwzdxbk+y6Wxk5seiK4rhKg8nYHGvV+3zEJWyiKh5zl0lzSc63Sej0+Cej
	hLItKTQxIcPlTktccesrSjW+kWoL5yPNI/rgwXiX0xFm7ftTNKIZ4DWtM0/KMYHtH5KW
	WXaQ==
Received: by 10.213.115.193 with SMTP id j1mr826877ebq.141.1337115283888; Tue,
	15 May 2012 13:54:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Tue, 15 May 2012 13:54:13 -0700 (PDT)
In-Reply-To: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 May 2012 13:54:13 -0700
Message-ID: <CAMKF1srxyZkjFe+aypM_X+Wgyd-8b1X664Y8jWQuPF=xijeg+w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] Revert "kmod: Use base_libdir for installing libkmod"
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
X-List-Received-Date: Tue, 15 May 2012 21:04:44 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 15, 2012 at 2:32 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> The commit breaks pkgconfig and after discussing it with the kmod and udev maintainers the conclusion was reached that putting the libraries in /lib instead of /usr/lib is not supported.
>
> This reverts commit 6b74f2461735272bd950a4f060dab6e778a36f92.

while this is what I had initially it doesn't go well with kmod living in
/sbin and accessing libraries from /usr due to our QA checks although
I am all for simplifying it where we don't make this check at all.


