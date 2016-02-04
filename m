Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 21FCB77225
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 11:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u14BLafS015262; Thu, 4 Feb 2016 11:21:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bAgHWFSRGPkz; Thu,  4 Feb 2016 11:21:36 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u14BLWPV015259
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 4 Feb 2016 11:21:33 GMT
Message-ID: <1454584892.27087.236.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Elliot Smith <elliot.smith@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 04 Feb 2016 11:21:32 +0000
In-Reply-To: <1454582844-11208-1-git-send-email-elliot.smith@intel.com>
References: <1454582844-11208-1-git-send-email-elliot.smith@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] toaster: update the openembedded-core toaster configuration file
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
X-List-Received-Date: Thu, 04 Feb 2016 11:21:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-02-04 at 10:47 +0000, Elliot Smith wrote:
> From: Belen Barros Pena <belen.barros.pena@intel.com>
> 
> It looks like the master branch will no longer build with the Fido
> release, so remove all references to fido and make sure that the file
> sets up local, master and jethro releases.

Did you mean to remove dizzy too? I suspect the answer is yes but the
commit message doesn't mention that.

Cheers,

Richard


