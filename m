Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>)
	id 1T22Ur-00023J-HJ; Thu, 16 Aug 2012 18:00:33 +0200
Received: by lban1 with SMTP id n1so1479832lba.6
	for <multiple recipients>; Thu, 16 Aug 2012 08:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=DjeqwXMESLiyTrzXS0IWKaUh2MWI96gpHausgqs8XKc=;
	b=fc5bUUnF2zAdjw3FtBx8UX1y1Eu1RI/9Q6DkFSnAatjyYMTr+kZVWbmAIcVpYJeEm+
	qrltJIRmCpDNUc9a15BiTaRuo/bFwGGohoGPkp67dZKc3BIqGOXwMEdLOmyLV4o8nCoT
	A5N4+JOsnMJ2ktd2kN2c7oQKnQt+yR6Tl5wiM1/IpKMqSNG9rE6wufAvRvezqFyrxWxF
	vE/58qD6yVHApYi/OUmQmg5UFvwhF01l7axXP68nlgYkpxjyzgma5MI9jZkspHMkAuA1
	+Pjp0CPPNAgb35ll6TR3elS+LroRLpoqurQ5MhUWrrrn3j9OtBqURYxWKGTli6hez7Of
	tZhg==
Received: by 10.152.112.233 with SMTP id it9mr1688339lab.40.1345132116060;
	Thu, 16 Aug 2012 08:48:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.5.104 with HTTP; Thu, 16 Aug 2012 08:48:15 -0700 (PDT)
In-Reply-To: <CAOd_LFwYFHxUti-vX+QambR1y4MM++ohDCDNtUT9ZLH5woDWkg@mail.gmail.com>
References: <1345129661832.d55ecfab@Nodemailer>
	<CAOd_LFwYFHxUti-vX+QambR1y4MM++ohDCDNtUT9ZLH5woDWkg@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 16 Aug 2012 08:48:15 -0700
X-Google-Sender-Auth: ieyWbKy_EvWsLdVfJYvXtlDyLxI
Message-ID: <CABcZAN=EA_0NgOSmoc5ecsfBCy64ZPN8yGzMgutCXZw+f7oArA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: meta-ti@yoctoproject.org, angstrom-distro-devel@linuxtogo.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] [meta-ti] OE Changelog since 2012-08-05 until 2012-08-12
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
X-List-Received-Date: Thu, 16 Aug 2012 16:00:34 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 16, 2012 at 8:18 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> The OE Changelog is back.  Some time ago, I got several reports that the
> changelog was missing entries.  I have since revamped the way dates are
> handled and may have made things better (or worse).  The tool simply runs
> git shortlog --since <date> --until <date> with the dates referenced.  This
> should capture changes from Mon through Sun of that week.  The git shortlog
> --since/until uses the commit dates, not the author date, so that may
> explain some of the missing entries.  git log --format=fuller can be used
> to view commit dates.
>
> If you still see missing entries, please send me the changeset hash and
> repo, and I'll debug it.  If there are additional repos to include, please
> let me know.

Woo! Welcome back, OE Changelog.
-- 
Christopher Larson


