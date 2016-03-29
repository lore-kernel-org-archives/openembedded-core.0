Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ADB9062136
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 11:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2TBxI1Q020638; Tue, 29 Mar 2016 12:59:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id i5sVe0iDSyT0; Tue, 29 Mar 2016 12:59:18 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2TBxFf2020634
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 29 Mar 2016 12:59:16 +0100
Message-ID: <1459252755.21672.21.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Mar 2016 12:59:15 +0100
In-Reply-To: <3148e125ec883b341b1bbbc8bb3f8845bde01eb2.1459238263.git.liezhi.yang@windriver.com>
References: <cover.1459238263.git.liezhi.yang@windriver.com>
	<3148e125ec883b341b1bbbc8bb3f8845bde01eb2.1459238263.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] image-live.bbclass/image-vm.bbclass: remove duplicated code
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
X-List-Received-Date: Tue, 29 Mar 2016 11:59:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-03-29 at 00:59 -0700, Robert Yang wrote:
> Move the common code to image.bbclass and remove duplicated ones.

Whilst I do like the idea of this patch set, I don't like generic
functions called "populate", or adding EFI variables to image.bbclass
itself.

I believe that some refactoring does make a lot of sense here but this
doesn't look right. The diffstats don't seem to suggest a large volume
of common code either (as yet).

Cheers,

Richard


