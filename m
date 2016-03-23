Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0E32660118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 14:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2NEDxS5017113; Wed, 23 Mar 2016 14:13:59 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yavX2J6A33iK; Wed, 23 Mar 2016 14:13:59 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2NEDtLe017107
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 23 Mar 2016 14:13:57 GMT
Message-ID: <1458742435.3073.7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 14:13:55 +0000
In-Reply-To: <56F29A68.5030905@linux.intel.com>
References: <1458680136-5455-1-git-send-email-ross.burton@intel.com>
	<56F29A68.5030905@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Python 3 as oe-core default?
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
X-List-Received-Date: Wed, 23 Mar 2016 14:14:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-03-23 at 15:30 +0200, Alexander Kanavin wrote:
> On 03/22/2016 10:55 PM, Ross Burton wrote:
> > Ideally this would be an option but that means conditional
> > inherits.  For now
> > Python 2 is clearly the default Python in oe-core so switch to
> > Python 2 instead
> > of 3.
> 
> Shall we start the work towards making 3 the default though?

In 2.2, switching the bulk of things over to python 3 is one of the
things I'd like to see happen.

Cheers,

Richard

