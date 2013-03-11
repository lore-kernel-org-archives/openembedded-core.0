Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UF6aG-0006Gd-6Z
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 18:32:30 +0100
Received: by mail-pb0-f42.google.com with SMTP id xb4so3981533pbc.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 10:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=MmnK6CeP8QDqhYogGCN4F9lxDrJ5613uLx56Aro4Itk=;
	b=NE7JAq/mQVDaplXEIDUmV+Dzzld1cKmdvDHWbG3UdBWiqr4Q46s5e6vlo++K1bcOf+
	hOsyshUUIHiPcq8IIlIXcaRvqoDfw8KDBNa+Zv/xqgbBmXh+1U6a/IojKkhS/T3//Klr
	7gTzGVgKFS4onK5bZlh2fsdX6t4S/cD4cATsgQ0sAaQqYY6tmCp+Z61cPcM0o/bAL1l1
	9xKVzZOzDnVCfkWIRKarrFfWkUImwH+s2YQjJRvQRb+DNMJZBjMvUYCjog7hh7X2bUky
	p24iILtjGFaGRYfyrmxKotGVVKCVIV/krH3gUVK/p3k1YigVA5LiFoxIw3sbih/EY1zh
	fksg==
X-Received: by 10.68.248.74 with SMTP id yk10mr22228994pbc.38.1363022145283;
	Mon, 11 Mar 2013 10:15:45 -0700 (PDT)
Received: from [172.23.7.5] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id wm3sm21204587pbc.4.2013.03.11.10.15.43
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 10:15:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <582c0b810b5ca744b7c83f3df2cc80a42571e85c.1362979546.git.hongxu.jia@windriver.com>
Date: Mon, 11 Mar 2013 10:15:42 -0700
Message-Id: <50A4BAC6-D1E6-4F33-A961-450D7D4CCF5E@gmail.com>
References: <cover.1362979546.git.hongxu.jia@windriver.com>
	<582c0b810b5ca744b7c83f3df2cc80a42571e85c.1362979546.git.hongxu.jia@windriver.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Mailer: Apple Mail (2.1499)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] qemu-native:fix do_compile failed on SLED 11.2
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
X-List-Received-Date: Mon, 11 Mar 2013 17:32:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Mar 11, 2013, at 4:07 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> ++// include this one last due to some versions of it being buggy:
> ++// http://www.linuxtv.org/pipermail/vdr/2009-August/021194.html
> ++#include <sys/capability.h>

upstream will probably complain about C++ style comments. 



