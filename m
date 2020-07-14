Received: from fortimail.saucontech.com (fortimail.saucontech.com [72.2.176.80])
 by mx.groups.io with SMTP id smtpd.web12.2184.1594749360367261930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 10:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: saucontech.com, ip: 72.2.176.80, mailfrom: mdeneen@saucontech.com)
Received: from email.saucontech.com ([10.20.20.47])
	by fortimail.saucontech.com  with ESMTP id 06EHtwdU000426-06EHtwdW000426
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 14 Jul 2020 13:55:58 -0400
Received: from localhost (localhost [127.0.0.1])
	by email.saucontech.com (Postfix) with ESMTP id B7E434086EC;
	Tue, 14 Jul 2020 13:55:58 -0400 (EDT)
Received: from email.saucontech.com ([127.0.0.1])
	by localhost (email.saucontech.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id qKrNxEk9PzFx; Tue, 14 Jul 2020 13:55:58 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by email.saucontech.com (Postfix) with ESMTP id 74E144086AD;
	Tue, 14 Jul 2020 13:55:58 -0400 (EDT)
X-Virus-Scanned: amavisd-new at email.saucontech.com
Received: from email.saucontech.com ([127.0.0.1])
	by localhost (email.saucontech.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bDQMRoHYDgtj; Tue, 14 Jul 2020 13:55:58 -0400 (EDT)
Received: from email.saucontech.com (email.saucontech.com [10.20.20.47])
	by email.saucontech.com (Postfix) with ESMTP id 5B8E4408582;
	Tue, 14 Jul 2020 13:55:58 -0400 (EDT)
Date: Tue, 14 Jul 2020 13:55:58 -0400 (EDT)
From: "Mark Deneen" <mdeneen@saucontech.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <962226630.2479498.1594749358273.JavaMail.zimbra@saucontech.com>
In-Reply-To: <5d6b1fd8-ce09-ce16-d8ac-f513545d100a@gmail.com>
References: <20200714170833.2096002-1-mdeneen@saucontech.com> <5d6b1fd8-ce09-ce16-d8ac-f513545d100a@gmail.com>
Subject: Re: [OE-core] [PATCH v3] ppp: Allow arbitrary interface names to be specified in pppd config
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.9_GA_3019 (ZimbraWebClient - GC83 (Linux)/8.8.9_GA_3019)
Thread-Topic: Allow arbitrary interface names to be specified in pppd config
Thread-Index: TQRl8NjiwSnQJNH9TBEOrL8vTCX6Lw==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Nope.

However, I want to throw this whole thing away.  The patches in question have been merged upstream in 2.4.8, and I don't know how I missed that.  I was building from dunfell, which is at 2.4.7.

Sorry for the noise, everyone.

Best Regards,
Mark Deneen
Saucon Technologies

----- On Jul 14, 2020, at 1:10 PM, Khem Raj raj.khem@gmail.com wrote:

are you aware of any of these platforms being supported by OE ?
