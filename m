Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1R83Nf-0002pb-8V
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 07:05:27 +0200
Received: by wwf27 with SMTP id 27so4853837wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 22:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=d8KwWjoXsQ38c02IgpHE2BEMgPr/8iFjLyamiL+jds4=;
	b=H6f5Bfkr8ljiSaAjR7e8/AV04La/hTqTRQTSACKrWCPnShpPu6fGHbnkytRF9FVgXq
	gLpuIQQs9AKZEopVYVHry9Jy8pwjP8UecnuzztsYcSf7mPXQmth7HBtBIC2TblAhmE9o
	JqIdZ1OKc4ANhzDaqgrNm2Gisyk5RCKMer8wQ=
Received: by 10.216.137.94 with SMTP id x72mr7680239wei.9.1317013203111; Sun,
	25 Sep 2011 22:00:03 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.184.7 with HTTP; Sun, 25 Sep 2011 21:59:42 -0700 (PDT)
In-Reply-To: <CAP9ODKoqywvZQyAJ=Jz8wh4hVoucJvo-QpyTZ_cpP8MhnEXb3w@mail.gmail.com>
References: <CAP9ODKpF7hQQmB7YWE4RCWDbEfZwv8432KJrBmvpwe1u_SaCTg@mail.gmail.com>
	<1316734501.28323.18.camel@ted>
	<CAP9ODKqWLVrKRE+HT4k82f+BYdY96N_h581dp8u0AETWBTQV0w@mail.gmail.com>
	<1316799031.3125.3.camel@ted>
	<CAP9ODKoqywvZQyAJ=Jz8wh4hVoucJvo-QpyTZ_cpP8MhnEXb3w@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 25 Sep 2011 21:59:42 -0700
X-Google-Sender-Auth: RiagMZqr6mr-8lPOn8s5C2P9yuA
Message-ID: <CABcZAN=S-M1wDRDcPddn4y4xjYxY7VZywNsOTxDnxhz3DwzdKw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Branch management for OE-Core release
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
X-List-Received-Date: Mon, 26 Sep 2011 05:05:27 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 23, 2011 at 11:12 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Fri, Sep 23, 2011 at 14:30, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> ...
>> I don't really see the point of this. Basically you're asking that every
>> time there is a commit to the branch there is also a merge commit. You
>> can just as easily either force a checkout of master, or merge against
>> master with a one sided merge. Git doesn't have the confidence to do
>> that automatically but I'm pretty sure there is a simple way to tell git
>> to do a one sided merge...
>
> Not every time but at every release and point release.
>
> one sided merge make you lose all local changes you did. Doesn't seems
> a valid upgrade path but a "replace path".

I agree that we should do this, personally. I think there's almost
always value in merging things back to master on occasion, whether a
release branch or a stable branch or anything of the sort.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


