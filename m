Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 641A56C5DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 22:53:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wARMr5Qv030055
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 22:53:06 GMT
Message-ID: <6ab425f5eb6eb2b3d68cdb1492e8d811eafcb573.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 27 Nov 2018 22:53:05 +0000
In-Reply-To: <1ce120dd374a4af1e47cfc6ad6fb0d1be9132d8a.camel@linuxfoundation.org>
References: <1ce120dd374a4af1e47cfc6ad6fb0d1be9132d8a.camel@linuxfoundation.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: oe-selftest instability - help needed!
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
X-List-Received-Date: Tue, 27 Nov 2018 22:53:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-11-27 at 15:24 +0000, Richard Purdie wrote:
> I think the cpio segfault may be
> files changing from under it and was thinking about some kind of
> inotify watch to try and spot it.

I hacked this up:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=c5787a6ddbfd2c1acc0e33fa158c238e6145351e

and found the files are not being changed so it isn't the cause...

Cheers,

Richard


