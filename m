Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1U7LAS-0006XC-Kb
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 08:29:41 +0100
Received: by mail-pa0-f47.google.com with SMTP id bj3so2641592pad.20
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 23:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=SMlGBM00Vn9hwJ4jrkmnrddZjy5+/hRVi4MSXZ6gpWo=;
	b=hfiTzw19+kKqXdhQU2R4+zyWXwL7m2401yOTLArtxjqztYTKbvaNk7dgjOInVdBv6q
	bipL3FiKSZukJjtQuaYkD7ZP+brRnJWB0Q0TWx8AzYticZmvgVTeOLQlu8zRlbW/JTCt
	rm6lWxViH+lsCklZTopCWwTyqfDFmrg66pGU1IshbhTxBcpU/T/RYNPKXFif0IzaeVnB
	UR9CTJ7tG5p20JttoFCMzClb3SLCwhp+gdl4BSwYT5Hy9iWw1gW+gm04r2pjdwC7b+rk
	xWAsyXX9rkvpMcsUlz/T4He/b0u0ZgeYlYJGnYuWNfwZgOoDK+tuXwaGjv+2SLkgEA+8
	yABg==
X-Received: by 10.66.84.232 with SMTP id c8mr33582266paz.8.1361171611353;
	Sun, 17 Feb 2013 23:13:31 -0800 (PST)
Received: from yiqingliang-pc.localnet ([117.89.55.19])
	by mx.google.com with ESMTPS id q4sm102834407paz.20.2013.02.17.23.13.27
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 23:13:30 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 15:10:59 +0000
Message-ID: <12379886.4GMtmIAlan@yiqingliang-pc>
User-Agent: KMail/4.9.5 (Linux/3.6.11-1-ARCH; KDE/4.9.5; x86_64; ; )
MIME-Version: 1.0
Subject: own-mirrors parse error?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2013 07:29:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

I have set SOURCE_MIRROR_URL to my own http server.

when fetching ftp package, e.g. gcc, it will use my server, and done quickly.
but if fetching http package, e.g. db, it will not use my server, but use 
official address.

after checked meta/classes/own-mirrors.bbclass, it contain:
https?$://.*/.* ${SOURCE_MIRROR_URL}

there is not http://, after added:
http://.*/.*    ${SOURCE_MIRROR_URL}
everything is OK.

so maybe recent commit broke up the "https?$" parsing?



-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com


