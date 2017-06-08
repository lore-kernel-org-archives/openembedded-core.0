Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5CECC781F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 11:18:49 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id u12so37078893qth.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 04:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zxmK3Bb1SB+I0sG4iCzFYlbhIxRwV1y8sEqDZllPso0=;
	b=i+nE/m4efgP/d/z775puF9CMhkuJ7LZuBgxCXv+fG3cCxri7kJ+9AUSJlWNwRDY+xC
	2i/EzhNuoeBWwhfHnLZqo0GfnjKoBH3B5uVidVAvecwtPjrhY8PB4MhmEWkAjTjW4MQB
	Hf0C7glPeyii4kl2C8COVQ6jPa3a9D1QvqyUFcEk6i4PyLNLPEEeq2jtrFq5qvQHdmZt
	JsCGx/NAcCP9N6wtuC/wpJXgp2WSeK8MVuvtWWZAuNCdkaOJtIyrBccDqR3/svMN6Dz7
	4cvAYlwTW5RLoE+//ouoo4w8xx/PbKJtpyAfaJ5Oi/X096P1/yoRrNc7p701W81nQVA9
	SS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zxmK3Bb1SB+I0sG4iCzFYlbhIxRwV1y8sEqDZllPso0=;
	b=PvX3BIhkZfy52+KeJvKk95+UX7g1o7kaqfUDfwW6KaUSXMumyTcca/olPZDfkF3oPb
	dLn1irEctH97uCAZqzNH//xmiKE+kXcZAXPnODiCNLHi9aw0MoLxycGbzOvUvtZMOISS
	Ok5gvYwJxuf5WSahjmpV1RfSCMKHV37Yp9UBvC0z1rFcq1nsTCEhe7DJLHpUtt3UibRx
	docx+mJ8tqB9Gcaigs0F1a+y1mq1u3irCEa1jgCpY/wJCrxWgTwABH/3HBF3wp+gruM6
	y4ZKqkiJSbelfstcsANsaxBVXZUvkeJLAIzMRCKoNIMfkdVBA5Zi2PkzzUL2Ac/tCKGs
	dajg==
X-Gm-Message-State: AKS2vOzpeL9ewgSHF9xSA8S65xWKZmF8L/hlE7tEOSABHtQjcJu8aHWr
	dEdxs+XrLya6+GSZZM37yuvruxTXjUiP
X-Received: by 10.55.102.214 with SMTP id a205mr36947615qkc.154.1496920731015; 
	Thu, 08 Jun 2017 04:18:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 8 Jun 2017 04:18:30 -0700 (PDT)
In-Reply-To: <20170608110754.32445-1-net147@gmail.com>
References: <20170608110754.32445-1-net147@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Jun 2017 12:18:30 +0100
Message-ID: <CAJTo0LZcKVgrHp4M+7JizD+KM2S-qCxi=yKDnGBJ9AvziLikuQ@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][pyro][PATCH] image-vm: Avoid use of fold, tac and paste commands for DISK_SIGNATURE
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
X-List-Received-Date: Thu, 08 Jun 2017 11:18:50 -0000
Content-Type: multipart/alternative; boundary="94eb2c0580a86e016905517104c3"

--94eb2c0580a86e016905517104c3
Content-Type: text/plain; charset="UTF-8"

On 8 June 2017 at 12:07, Jonathan Liu <net147@gmail.com> wrote:

> These commands are not whitelisted by the HOSTTOOLS variable which
> silently prevents the MBR disk signature from being written to the
> image.
>

Silently, ouch.  Thanks, awk.

Ross

--94eb2c0580a86e016905517104c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 June 2017 at 12:07, Jonathan Liu <span dir=3D"ltr">&lt;<a href=3D"mail=
to:net147@gmail.com" target=3D"_blank">net147@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":69m" class=3D"a3s aXjCH m1=
5c8763b03ba74be">These commands are not whitelisted by the HOSTTOOLS variab=
le which<br>
silently prevents the MBR disk signature from being written to the<br>
image.<br></div></blockquote></div><br>Silently, ouch.=C2=A0 Thanks, awk.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--94eb2c0580a86e016905517104c3--
