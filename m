Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9AFB860089
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 21:27:43 +0000 (UTC)
Received: by iget9 with SMTP id t9so37359222ige.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Apr 2015 14:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=rVun6bBNF5KroPL12GUs1+LUQzKD+Erq/TfcJzCKj9Q=;
	b=sN3V2BZbatA423A2u6eC6ol7zH2DOHHNu/u/n8LFWk8Rpdq+cHUdKkSQP1KHMrxIq8
	KDMJgpmzNFNogTtTyBax/6YkwhbTVlZQXNzPNkI5mkRub/t9AccR/kChf0XO3jATleK/
	1CHucUdK5kj+yn8ZvJB0IB3AF5Z/ju1+JCwBtD/y1MqNg6RB4Erxf5q1UZ3ykBo41Ot1
	CrKZW11+pHeiVTnBei1J34vL3UqqvyXMmajk66Ol6nc8o/W2r4Pp+X0+F8eY0hNFxBmx
	qE8uyy+lnX2mEwp3bVTaqgcYKQMvf/t4hhJdMosrQ2TO6PWpfJpt0K+/eMhqOeIUUY6F
	6JeA==
X-Received: by 10.50.64.244 with SMTP id r20mr9681555igs.48.1428528465238;
	Wed, 08 Apr 2015 14:27:45 -0700 (PDT)
Received: from [192.168.34.210] (static-66-11-92-234.ptr.terago.net.
	[66.11.92.234])
	by mx.google.com with ESMTPSA id ka2sm7690790igb.2.2015.04.08.14.27.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 14:27:44 -0700 (PDT)
Message-ID: <55259D4F.1050106@gmail.com>
Date: Wed, 08 Apr 2015 17:27:43 -0400
From: Trevor Woerner <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: akuster808 <akuster808@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
References: <551EA4E6.4090304@gmail.com>
In-Reply-To: <551EA4E6.4090304@gmail.com>
Subject: Re: combo-layer issue
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
X-List-Received-Date: Wed, 08 Apr 2015 21:27:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 15-04-03 10:34 AM, akuster808 wrote:
> I am trying to replicate how Poky is created using combo-layer.  I 
> have referenced  https://wiki.yoctoproject.org/wiki/Combo-layer

Interesting! I had never heard of this :-)

> The issue seems to be related when I define "branch". Not defining it 
> works fine (ie, master default). I suspect I am doing something 
> incorrectly or a compatibility issue with my local git version 1.9.1.

I just tried with git version 2.4.0.rc0.43.gcf8a8c6 and had the same 
result, so it's not related to git version (or its relying on a very old 
version of git).

