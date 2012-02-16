Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1Ry2Rv-0000yZ-3c
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 15:36:43 +0100
Received: by bkwq11 with SMTP id q11so2107212bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2012 06:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=emVBqHSHdL8WEm0DqvfhlwqiemwVdMSdxUbX9vptbXo=;
	b=FI/3ApOjgQ2G6+Hblfvk9P27NrcEoDG605sflFTca8q2ac/uV7gTid0m0hBjZbFqaT
	fyyoP9mFmvYoAWOFgbh2G6CWxfXRoOoJZX7a7lE1UonadaKq/H1WmFG/wy9K3emjXQiB
	iwNYRN00L1Um2+b/z0tXQ3ZEv56aJihGTRCc0=
MIME-Version: 1.0
Received: by 10.204.151.196 with SMTP id d4mr1306285bkw.29.1329402510197; Thu,
	16 Feb 2012 06:28:30 -0800 (PST)
Received: by 10.223.89.135 with HTTP; Thu, 16 Feb 2012 06:28:30 -0800 (PST)
In-Reply-To: <CAP9ODKoFQbOm12SMW-VGpBdHKbd9+A9_V0kGQHvaAwCtrxifGg@mail.gmail.com>
References: <CAGiJk9ddcv7C7gZbR7a5+YVXfwyX_igRWCWyCR16TggQUrfcYg@mail.gmail.com>
	<CAP9ODKoFQbOm12SMW-VGpBdHKbd9+A9_V0kGQHvaAwCtrxifGg@mail.gmail.com>
Date: Thu, 16 Feb 2012 15:28:30 +0100
Message-ID: <CAGiJk9dWF3JQfjhZPj-hKx59egJ1SXsT_O_mLfCk8GFrpZZ_tw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Qt session management is disabled via QT_DISTRO_FLAGS
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
X-List-Received-Date: Thu, 16 Feb 2012 14:36:43 -0000
Content-Type: text/plain; charset=UTF-8

2012/2/16 Otavio Salvador <otavio@ossystems.com.br>:
> On Thu, Feb 16, 2012 at 11:04, Samuel Stirtzel <s.stirtzel@googlemail.com>
> wrote:
>>
>> Anyone knows if enabling session management in Qt is a bad idea, or if
>> there is another way of solving this?
>
>
> I don't think it is going to be a problem to have it enabled on x11 flavour.
Since it is a distro variable, I consider to ask before this breaks
anything or the like.

I'd suggest to change this line from:
QT_DISTRO_FLAGS ?= "-no-accessibility -no-sm"
To:
QT_DISTRO_FLAGS ?= "-no-accessibility -sm"

So distributions that don't want a Qt session manager could just
disable it, or is there another preferred way to enable "-sm"?


-- 
Regards
Samuel


