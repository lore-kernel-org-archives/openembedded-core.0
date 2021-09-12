Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.17425.1631462346731130220
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 08:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from [::1] (port=44304 helo=cpanel8.indieserve.net)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mPRsm-0002f9-JU
	for openembedded-core@lists.openembedded.org; Sun, 12 Sep 2021 11:59:05 -0400
Received: from [136.2.33.162] ([136.2.33.162]) by crashcourse.ca (Horde
 Framework) with HTTPS; Sun, 12 Sep 2021 11:59:04 -0400
Date: Sun, 12 Sep 2021 11:59:04 -0400
Message-ID: <20210912115904.Horde.6nJmYj61-vIFfHaSeplD14N@crashcourse.ca>
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] can one identify how much work sstate cache would save a build?
References: <9c5322ee-8fcb-180-133d-d96610f31440@crashcourse.ca>
 <7af69960b5cc22aa021b1814c883a3ac8ff8c592.camel@linuxfoundation.org>
In-Reply-To: <7af69960b5cc22aa021b1814c883a3ac8ff8c592.camel@linuxfoundation.org>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline


Quoting Richard Purdie <richard.purdie@linuxfoundation.org>:

> On Sun, 2021-09-12 at 10:00 -0400, Robert P. J. Day wrote:
>>   off the wall question from a friend, but is there a way to get a
>> general idea of how much work (how many tasks?) could be saved for a
>> build based on some available sstate cache directory?
>
> Run a build with bitbake -n against it and there is a summary  
> printed near the
> start of the build which says something like:
>
> Sstate summary: Wanted 1525 Local 0 Network 1515 Missed 10 Current 0  
> (99% match, 0% complete)

    that's it, that's what i was looking for, thanks.

rday


