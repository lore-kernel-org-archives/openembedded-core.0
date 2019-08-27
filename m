Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C77B26B07E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 13:56:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Hr4p2sPWz3J;
	Tue, 27 Aug 2019 15:56:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566914170;
	bh=FlyZuDWlRIusLcab71WaMs65KfBOui3YS646YVMx7Tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F6x9k8YiTrj5loBPMtJmIbsV4eZwruLvqeieOiB+1ruxaelyiVK0n3gWsKcjJZjDU
	xDDist0TZ49fA4l036SbSizx+AIzBRNhagmeS7Jug/g7pbbMBtu85qOGO2sJIA2f43
	eMHTHmCkDRy2rDFMZUD1hj/tBh4dHrvhPVHmMYcJf+G1rKMLIDyrxwyax1jyQkqGzq
	bOLWyCP/lgwDX0F1lJvokLXZxdLrjDPLqFKJq0USNt4kErKKvhiJoxKbz8eGxORUNj
	+5FhoGf/2QmsqpvE12ZTakek10tsI4nMIJrXpzxtDKSthWQtG+DXJKIJvjz+c673Qk
	bsRI1irkRY6COiKg/dr8mlf44TnUwZ0KpP09uOSVS8SkZJQBQEAmgMajqwUAx5kdf+
	JowTOwmt4TsDEH6rFC7Gt2q1L/YpP7cCf3XracHE4txMZSylPagE33dv5yoLevdFMX
	46kNrOj2BI/y5HegQhCQcvTjtWSQ5ehEqq6RI/0DWzRXVDNLkNF8g8baOTGDYA5GlO
	37wXsvHTKm75UCjdTvdNBFkur1x4iuMa9OO7a03qjgMIQdTcwNPzAyvZY+kk3uZ3gx
	ZCLcAxrXgFzdfVM8wlpcMhCvnoxod/R9JFWlOX7qee/B1C4bMA5/mZLT7mlmfG0HND
	S2Tqn0EV9Y5C0YaZWUo+nEww=
Date: Tue, 27 Aug 2019 16:56:08 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20190827135608.GA19259@localhost>
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
	<1566593504-21918-9-git-send-email-armccurdy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1566593504-21918-9-git-send-email-armccurdy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/13] glibc: drop obsolete packaging of glibc libnsl libs
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
X-List-Received-Date: Tue, 27 Aug 2019 13:56:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Aug 23, 2019 at 01:51:40PM -0700, Andre McCurdy wrote:
> Packaging rules were left behind when libnsl was removed:
>...

How has this change been tested?

ERROR: glibc-2.30-r0 do_package: QA Issue: glibc: Files/directories were installed but not shipped in any package:
  /lib/libnsl-2.30.so
  /lib/libnsl.so.1
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
glibc: 2 installed and not shipped files. [installed-vs-shipped]
ERROR: glibc-2.30-r0 do_package: Fatal QA errors found, failing task.


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


