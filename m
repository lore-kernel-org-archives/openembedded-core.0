Return-Path: <dvorkin@tibbo.com>
X-Greylist: delayed 401 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 Aug 2016 12:59:49 UTC
Received: from smtp.tibbo.com (smtp.tibbo.com [93.174.104.90])
	by mail.openembedded.org (Postfix) with ESMTP id 25CA37720D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 12:59:48 +0000 (UTC)
Received: (qmail 32138 invoked by uid 508); 9 Aug 2016 15:53:08 +0300
Received: from unknown (HELO ?192.168.75.150?)
	(dvorkin@tibbo.com@176.114.204.12)
	by smtp.tibbo.com with SMTP; 9 Aug 2016 15:53:08 +0300
To: openembedded-core@lists.openembedded.org
From: Dvorkin Dmitry <dvorkin@tibbo.com>
Message-ID: <2f15b5a4-8802-115b-1f2e-9800c8555287@tibbo.com>
Date: Tue, 9 Aug 2016 15:53:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Subject: how build but do not install package
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
X-List-Received-Date: Tue, 09 Aug 2016 12:59:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear OE-developers!

I'm building an image and SDK for my device without any problem. But I'd 
like to build some extra packages during the time I'm building my image 
or SDK, but I don't want to install this group of packages. Just keep 
them in /deploy/rpm/ or /deploy/ipk, available for installation by the 
package manager. Also I'd like to automatically rebuild them if some 
dependencies are changed.

How to do it correctly using bitbake/yocto/oe?

How to create group of packages and rebuild them if something is 
changed, but do not install into SDK or image.


