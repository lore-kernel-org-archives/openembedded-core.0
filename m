Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8146C734E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 09:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2O9Z9TC013955; Tue, 24 Mar 2015 09:35:09 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3wQytwVzwb7Q; Tue, 24 Mar 2015 09:35:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2O9YvOt013942
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 Mar 2015 09:35:08 GMT
Message-ID: <1427189697.14020.24.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Musat, George L" <george.l.musat@intel.com>
Date: Tue, 24 Mar 2015 09:34:57 +0000
In-Reply-To: <042E875E1B5D414CA9BB78B7D4FA691C2650EF29@IRSMSX107.ger.corp.intel.com>
References: <1427102643-19366-1-git-send-email-george.l.musat@intel.com>
	<CAJTo0LYhHBzr_pzzLSALuMsPh+WBcPu2KyLh+hfUKddEXBnR7Q@mail.gmail.com>
	<042E875E1B5D414CA9BB78B7D4FA691C2650EF29@IRSMSX107.ger.corp.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/selftest: New auto bitbake test for poky tiny.
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
X-List-Received-Date: Tue, 24 Mar 2015 09:35:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2015-03-23 at 11:54 +0000, Musat, George L wrote:
> I am viewing this as a build test for the poky-tiny image, that checks
> if the build was fine by booting it and checking that it booted fine
> and checking that it’s indeed a tiny, rather than a runtime test.

Ross does have a point, our other images automatically run their
testimage tests after each rootfs is constructed as part of the normal
build. Why wouldn't we do this for the tiny images too?

Cheers,

Richard





