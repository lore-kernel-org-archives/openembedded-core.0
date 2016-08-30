Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 20E4D731C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 22:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UMjRXQ023552; Tue, 30 Aug 2016 23:45:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KcI2Fa9hghGi; Tue, 30 Aug 2016 23:45:27 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UMjLeL023549
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 30 Aug 2016 23:45:22 +0100
Message-ID: <1472597121.29583.59.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mattias Waldo <mattias.waldo@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 23:45:21 +0100
In-Reply-To: <1472237886-7172-1-git-send-email-mattias.waldo@gmail.com>
References: <1472237886-7172-1-git-send-email-mattias.waldo@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v4] kernel.bbclass: include signing keys when copying files required for module builds
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
X-List-Received-Date: Tue, 30 Aug 2016 22:45:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-08-26 at 20:58 +0200, Mattias Waldo wrote:
> The absence of certs/signing_key.* in $kerneldir made signing of
> out-of-tree kernel modules fail (silently). Add copying of these
> files during the shared_workdir task.
> 
> Signed-off-by: Mattias Waldo <mattias.waldo@saabgroup.com>
> ---
>  meta/classes/kernel.bbclass | 2 ++
>  1 file changed, 2 insertions(+)

Sadly this breaks the build when you don't have any keys:

e.g.: https://autobuilder.yoctoproject.org/main/builders/build-applianc
e/builds/892/steps/BuildImages_1/logs/stdio

but there were many many other failures :(

Cheers,

Richard

