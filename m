Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AEAEC7473A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 22:51:31 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w86MpUNO010493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 6 Sep 2018 23:51:31 +0100
Message-ID: <b48197954ed9e662221a9331bc80c5013798b6ac.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 06 Sep 2018 23:51:30 +0100
In-Reply-To: <d6d526241f42c97ce71280e180fd73f615a15b4c.camel@linuxfoundation.org>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
	<20180905165227.29435-7-richard.purdie@linuxfoundation.org>
	<a7d35d68-e546-408f-561e-c5a3a8f4aaa5@windriver.com>
	<4f62f20f8d4b9378684b6224ddf7d1bc5cfca814.camel@linuxfoundation.org>
	<6a9fa2c4-b21c-38c5-cd4b-f8f4cfdb39ef@windriver.com>
	<d6d526241f42c97ce71280e180fd73f615a15b4c.camel@linuxfoundation.org>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 7/8] busybox: Put klogd/syslogd alternative links in syslog package
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
X-List-Received-Date: Thu, 06 Sep 2018 22:51:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Just to follow up, I'm trying separating out busybox-syslog's
recommends from busybox into the higher level packagegroups. The patch
is in -next and will run tests overnight.

Doing this is probably good anyway but it does feel like we're working
around an rpm/dnf issue. I'm open to better ideas...

Cheers,

Richard



