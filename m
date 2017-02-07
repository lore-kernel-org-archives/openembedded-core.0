Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2F05271A8C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 07:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v177vAjR019030; Tue, 7 Feb 2017 07:57:10 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id L2JlpsQAy1F4; Tue,  7 Feb 2017 07:57:10 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v177v53q019025
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 7 Feb 2017 07:57:06 GMT
Message-ID: <1486454225.14144.114.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 07 Feb 2017 07:57:05 +0000
In-Reply-To: <20170206192653.GA3353@jama>
References: <1486396334-8039-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1486396334-8039-3-git-send-email-richard.purdie@linuxfoundation.org>
	<20170206192653.GA3353@jama>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] perl-native: Remove .packinfo file
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
X-List-Received-Date: Tue, 07 Feb 2017 07:57:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-02-06 at 20:26 +0100, Martin Jansa wrote:
> On Mon, Feb 06, 2017 at 03:52:11PM +0000, Richard Purdie wrote:
> > 
> > This is large and needs fixups to relocate it in each case. We can
> > drop it, save
> > the work and the ~150MB disk space its various copies take up. Its
> > not needed
> > for anything that I can see.
> -1
> 
> The subject says .packinfo, but the change is for .packlist.

Sorry, I've fixed the commit message on -next.

Cheers,

Richard

