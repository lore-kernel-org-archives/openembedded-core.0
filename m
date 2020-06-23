Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
 by mx.groups.io with SMTP id smtpd.web10.11197.1592930256730987571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 09:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: herbrechtsmeier.net, ip: 85.13.157.12, mailfrom: stefan@herbrechtsmeier.net)
Received: from [192.168.178.42] (i59F77E0E.versanet.de [89.247.126.14])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id 1F42D11A221F;
	Tue, 23 Jun 2020 18:37:34 +0200 (CEST)
From: "Stefan Herbrechtsmeier" <stefan@herbrechtsmeier.net>
Subject: Status of Go support
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>, Khem Raj <raj.khem@gmail.com>
Message-ID: <c207ad43-fba6-d5ff-085a-f6be1231e230@herbrechtsmeier.net>
Date: Tue, 23 Jun 2020 18:37:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

because of the changes to the 'GO111MODULE' variable in go-dep and 
glide, I wonder if Go is ready for use. I would have expected the 
variable GO111MODULE to be set to 'off' within the go.bbclass because go 
could bypass the fetch task unobserved otherwise.

Regards
   Stefan
