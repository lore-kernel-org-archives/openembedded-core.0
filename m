Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1SAyrr-0007pi-U8; Fri, 23 Mar 2012 08:25:00 +0100
Received: by yhjj56 with SMTP id j56so2523030yhj.6
	for <multiple recipients>; Fri, 23 Mar 2012 00:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=DyPzERTgb+RSziirYGszvl9DHNyJUZ6fQ3wNcVCUdr4=;
	b=qafuxOtDYhZO63I9GBgGZic9Zyrf+k78D2lLc2Ke74I8hJ1jvEy8ncb7t2mit2TU5G
	LtCwoUnou4ekYQyFRenBeoVsS0SoC6cLMWvoQ/JzYvC2nIUMYKntBP7t2iAquOV2GDR8
	+CRes0ZVfBpXpaUB8sQ+zwa7Ra+GobwMVtoM/7O6hJXV/dJvmWi6hK3EyJCp6ZVr8WJL
	8sI3kY37AyTtT1tgsim7HQ5MkKH8xZhX5HGInjLysORdURkk5SgsAmIoozjMue4cZ9dR
	yXWGWmxYyLeA4YcoKr2Vk+gMt7HlAtl13xo+u0qFtUrlryvZHilQ7JDegyZ9s9hYmurK
	eqHQ==
Received: by 10.68.234.193 with SMTP id ug1mr14591067pbc.161.1332486963356;
	Fri, 23 Mar 2012 00:16:03 -0700 (PDT)
Received: from [192.168.1.79] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id f7sm5249257pbr.3.2012.03.23.00.16.01
	(version=SSLv3 cipher=OTHER); Fri, 23 Mar 2012 00:16:02 -0700 (PDT)
Message-ID: <4F6C232F.30103@gmail.com>
Date: Fri, 23 Mar 2012 00:15:59 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120313 Thunderbird/11.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
Subject: gcc 4.7.0 released and available for OE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 07:25:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi

GCC 4.7.0 has been released and I have updated the recipes and I have 
been using them for past 3-4 weeks. I was able to build sato images for 
both uclibc and eglibc and also meta-toolchain targets for all combos 
Please help in testing them and report
any issues you see.

The branch is

http://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.7

Thanks

-Khem


