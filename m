Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.521.1616538888622872672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 15:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local (068-117-040-126.res.spectrum.com [68.117.40.126])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 12NMYj1Z007645
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 17:34:46 -0500
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Subject: PR Service and eSDK
Message-ID: <4196565e-34b9-ae0d-dbaf-c3292efa1ba0@kernel.crashing.org>
Date: Tue, 23 Mar 2021 17:34:44 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

For some reason I thought if PR service was enabled, when the eSDK was generated
it would export the pr service information and include it within the eSDK.

I'm not finding the file, or even code that does this.  Am I having a fever
dream, or is there code that should be doing this?

What I'm trying to build is an eSDK that the user can use devtool and construct
a new version of a package, then they can deploy the new package within their
package feed to update their targets.  Without the PR service in the eSDK, there
won't be any way to get a correct PR number.

--Mark
