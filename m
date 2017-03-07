Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2A74A7777D;
	Tue,  7 Mar 2017 20:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v27KnpuU016452; Tue, 7 Mar 2017 20:49:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IsoUtjdbXQoY; Tue,  7 Mar 2017 20:49:51 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v27KnjIx016448
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 7 Mar 2017 20:49:46 GMT
Message-ID: <1488919785.22968.48.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>, "Burton, Ross"
	<ross.burton@intel.com>, Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 07 Mar 2017 20:49:45 +0000
In-Reply-To: <f417ea5c-df83-ef34-648f-5a526f3d2e16@windriver.com>
References: <1488862727-25152-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LaNUQW=Qsyxm7eC9hFduzVMy5v+1Sy9aBMfgNoBgAqoow@mail.gmail.com>
	<f417ea5c-df83-ef34-648f-5a526f3d2e16@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [PATCH] meta: start to ignore the largefile distro feature
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
X-List-Received-Date: Tue, 07 Mar 2017 20:49:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-03-07 at 08:43 -0600, Mark Hatle wrote:
> On 3/7/17 4:35 AM, Burton, Ross wrote:
> > 
> > CCing openembedded-architecture to open the field for comments.
> At this point, I'm not sure there is any reason to NOT using
> largefile system
> wide.  It's a common enough feature, and even 'small' devices (with
> sdcard
> slots) can run into large file problems now.

Agreed. Where we can we need to reduce our test matrix so I think
dropping non-largefile support is a good move.

Cheers,

Richard

