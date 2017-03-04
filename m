Return-Path: <contact@huau-gabriel.fr>
X-Greylist: delayed 359 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 04 Mar 2017 22:58:39 UTC
Received: from mail.huau-gabriel.fr (ks323487.kimsufi.com [37.187.0.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7DF77745
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Mar 2017 22:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.huau-gabriel.fr (Postfix) with ESMTP id DCF857FBAB;
	Sat,  4 Mar 2017 22:53:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at huau-gabriel.fr
Received: from mail.huau-gabriel.fr ([127.0.0.1])
	by localhost (mail.huau-gabriel.fr [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3SzFF_2lo6Bk; Sat,  4 Mar 2017 22:53:16 +0000 (UTC)
Received: from [10.231.168.9] (unknown [73.109.63.165])
	(Authenticated sender: contact@huau-gabriel.fr)
	by mail.huau-gabriel.fr (Postfix) with ESMTPSA id CC10C7FB40;
	Sat,  4 Mar 2017 22:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=huau-gabriel.fr;
	s=mail; t=1488667996;
	bh=ehPLyf9fEJ9rr89S6mnZ3WMzAxnWwqTm/0NcpeX8E0I=;
	h=To:From:Subject:Cc;
	b=gZ/Y12Dd65GmfcwDf1XybFXLlOcv3sDxnS0XOU+ZSPwZeJL6xAzCYtVftkqoF39zf
	192Rw9x/KZH3k8vGjTPicEn3hoNmb25Md146k5pWgwmZiFf9wB+e7SpL9RdFvkek9c
	CEMhnVecMcxE11tOTm3uGtYFHtzAsAo9hTBlAENk=
To: openembedded-core@lists.openembedded.org
From: Gabriel Huau <contact@huau-gabriel.fr>
Message-ID: <a94ef9bf-da82-b236-6911-7bfb595797d5@huau-gabriel.fr>
Date: Sat, 4 Mar 2017 14:52:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
Cc: chris_larson@mentor.com
Subject: libglu: dependency on x11
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
X-List-Received-Date: Sat, 04 Mar 2017 22:58:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm not sure to understand why do we have a dependency on X11 in the 
libGLU package? I might miss some pieces of information here, but IMO, 
it should only depends on opengl as the libGL.so could be generated 
without X11 or any Window system.

It actually breaks some builds where we depend on libGLU but we don't 
have X11.

Thanks,
Gabriel

