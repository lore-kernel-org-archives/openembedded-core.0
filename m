Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1S0pc3-0001uo-IT
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 08:30:43 +0100
Received: by werc1 with SMTP id c1so1302503wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 23:22:21 -0800 (PST)
Received-SPF: pass (google.com: domain of s.stirtzel@googlemail.com designates
	10.180.83.70 as permitted sender) client-ip=10.180.83.70; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	s.stirtzel@googlemail.com designates 10.180.83.70 as permitted
	sender) smtp.mail=s.stirtzel@googlemail.com;
	dkim=pass header.i=s.stirtzel@googlemail.com
Received: from mr.google.com ([10.180.83.70])
	by 10.180.83.70 with SMTP id o6mr2318759wiy.19.1330068141542 (num_hops
	= 1); Thu, 23 Feb 2012 23:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=RPoaT8Bu+nPo5xAhdL3YVCG6cWpNoHXuu8GLCHKikwo=;
	b=kgxVu3hFT2U3H/8hyHuv2Go07AR1jRa0b7D4Wb3ppv9gmUz/V9jKcZS4qnR1M78VR+
	ezhXD2LwabBSaNWy978CIeTLg0K0rlMYiZi0SYcz/ejMCompsr+cEoHfrAkVON3GrbRq
	ZpGgCPFhYsP9icARFhcBHdRcKmjn8J2jkEnXk=
MIME-Version: 1.0
Received: by 10.180.83.70 with SMTP id o6mr1879247wiy.19.1330068141451; Thu,
	23 Feb 2012 23:22:21 -0800 (PST)
Received: by 10.223.104.8 with HTTP; Thu, 23 Feb 2012 23:22:21 -0800 (PST)
In-Reply-To: <CAP9ODKowxJ6+9EtLmMuO27yEM9bRvu-2aUKo5AsuZCdS_Yks9g@mail.gmail.com>
References: <CAGiJk9fWz97OC-wbpAroJdPUYP7+GTKcOG-00a0tP4R_jfWFPA@mail.gmail.com>
	<CAP9ODKpPNJn-PRijKasZnomGOPuQ5ugBadJGxCdtwSu5FxAUJQ@mail.gmail.com>
	<CAGiJk9fjz9JdhTaKW23e_cmBSW2baPf4DmPgSDq08znPA9nh5Q@mail.gmail.com>
	<CAP9ODKpKZ6LyYMiTYj_Rv9CE+DMNhHePWOKxRRVrW7EHuWE34w@mail.gmail.com>
	<CAGiJk9eXiSXuyZyFwdK_pSZD2_zfyBmZHSqoD4FW_fUJLCJ60g@mail.gmail.com>
	<CAP9ODKowxJ6+9EtLmMuO27yEM9bRvu-2aUKo5AsuZCdS_Yks9g@mail.gmail.com>
Date: Fri, 24 Feb 2012 08:22:21 +0100
Message-ID: <CAGiJk9c95rrsDpi8y=bdGhUvbTUfC18N9brf8wRJQbcs=rKayQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Linker error while cross compiling, (Qt issue?)
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
X-List-Received-Date: Fri, 24 Feb 2012 07:30:43 -0000
Content-Type: text/plain; charset=UTF-8

2012/2/23 Otavio Salvador <otavio@ossystems.com.br>:
> On Thu, Feb 23, 2012 at 05:27, Samuel Stirtzel
> <s.stirtzel@googlemail.com> wrote:
>> It is still odd that this only occurs while cross compiling.
>> More odd seems that the same error happens to Soprano, it also uses
>> Q_DECL_EXPORT [1].
>
> http://developer.qt.nokia.com/doc/qt-4.8/sharedlibrary.html
>
> You need to play with Q_DECL_EXPORT / Q_DECL_IMPORT so most probably
> code is doing it wrong.

Coudln't it be possible that Qt (or something else) does it wrong?
The same code without the workaround is working fine when compiling native..
IMHO I can't imagine how this would be no problem native (and on the
meego cross compiling toolchains) but here on OE.


-- 
Regards
Samuel


