Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD796E253
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 17:34:44 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id e14so6666636iej.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2013 09:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gguF4dfFeE14f5u9guOGm5sgat+CcKKl5s1coAKiW+M=;
	b=D6+mB62ryuRygQqCnNz7W6rfrOdU6MxCv/MYhy/vqf7cdhZEVxN1OQ3ev+GF8h78B/
	VvNaeEglMd4E/xMvhovicD/EUS8LrKafo1IZdVuBihHzz7KC5vnOkxa54GJOXh8YEBN6
	n6LcbY9VzxU1jVfk7UHNUiGov2cClevpD091C3VixkBn7SWYF2UVU2Gnhgf/DjjY6N/M
	3cfA5FhcOxyngHd6voNmXjuGE0Ae+7xZLj21NfDTtfbMNGsBQ2KBUm3G2A4k4bMiclxx
	CJ+lqYJouSqXLZtcSKW/9q6r/HAfTge5Rsg00WFOAEJOIVungwyOj8Qf9ULngb8CKmgW
	3+XA==
X-Received: by 10.50.40.102 with SMTP id w6mr16678799igk.20.1386610483892;
	Mon, 09 Dec 2013 09:34:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.79.167 with HTTP; Mon, 9 Dec 2013 09:34:13 -0800 (PST)
In-Reply-To: <1386589722.25847.79.camel@ted>
References: <1386380546-13936-1-git-send-email-raj.khem@gmail.com>
	<1386589722.25847.79.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Dec 2013 09:34:13 -0800
Message-ID: <CAMKF1sokZrHWRn_2RGT3pKN_RZMy1MnvXCUXn-gDdm4p-1iHvQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: Convert ??= weaker assingment to weak ?= assignment
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
X-List-Received-Date: Mon, 09 Dec 2013 17:34:45 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 9, 2013 at 3:48 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> To illustrate why I'm struggling to follow this, "bitbake boost -e |
> grep BOOST_LIBS" on OE-Core does not show python in the list...
>


I can see it. Its on debian python is 2.7.3

kraj@builder:~$ cat /etc/os-release
PRETTY_NAME="Debian GNU/Linux 7 (wheezy)"
NAME="Debian GNU/Linux"
VERSION_ID="7"
VERSION="7 (wheezy)"
ID=debian
ANSI_COLOR="1;31"
HOME_URL="http://www.debian.org/"
SUPPORT_URL="http://www.debian.org/support/"
BUG_REPORT_URL="http://bugs.debian.org/"

