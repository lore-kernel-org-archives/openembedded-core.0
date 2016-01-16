Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 75B2B605BA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 09:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0G91r4t001471; Sat, 16 Jan 2016 09:01:53 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HW_ZRAC7f6bf; Sat, 16 Jan 2016 09:01:53 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0G91obF001466
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 16 Jan 2016 09:01:51 GMT
Message-ID: <1452934910.27999.7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 16 Jan 2016 09:01:50 +0000
In-Reply-To: <1452649638-16393-1-git-send-email-armccurdy@gmail.com>
References: <1452649638-16393-1-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] strace: clear native sysroot references from CFLAGS_FOR_BUILD etc
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
X-List-Received-Date: Sat, 16 Jan 2016 09:01:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-01-12 at 17:47 -0800, Andre McCurdy wrote:
> strace uses CC_FOR_BUILD to compile temporary utility apps to run as
> part of the build process. There's no need to build those utils
> against the native sysroot though (and things sometimes go wrong if
> we
> do), so clear CFLAGS_FOR_BUILD etc.
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>

I ran this along with the other strace patches under master-next on the
autobuilder. We saw:

https://autobuilder.yoctoproject.org/main/builders/ptest-x86-64/builds/
251/steps/BuildImages/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/b
uilds/616/steps/BuildImages/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/b
uilds/616/steps/BuildImages_1/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/build
s/615/steps/BuildImages/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/build
s/615/steps/BuildImages_1/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/bui
lds/611/steps/BuildImages_4/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/build-appliance/buil
ds/589/steps/BuildImages_1/logs/stdio

So there is still something not right here. I've not looked into the
details of the issue.

Cheers,

Richard

