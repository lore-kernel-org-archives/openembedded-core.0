Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D0499770AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 22:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t91MUqBO011419; Thu, 1 Oct 2015 23:31:16 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kGuDICBT0qsG; Thu,  1 Oct 2015 23:31:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t91MV1UP011431
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 1 Oct 2015 23:31:12 +0100
Message-ID: <1443738661.14733.71.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 01 Oct 2015 23:31:01 +0100
In-Reply-To: <1443723968-43906-1-git-send-email-mark.hatle@windriver.com>
References: <1443723968-43906-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: david.reyna@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] "Finish" the IMAGE_GEN_DEBUGFS implementation
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
X-List-Received-Date: Thu, 01 Oct 2015 22:31:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-10-01 at 13:26 -0500, Mark Hatle wrote:
> It was noticed today that the IMAGE_GEN_DEBUGFS implementation was not 
> complete.  The version that was merged back in May only contained the 
> filesystem generation pieces, but not the pieces for creating the image
> from that filesystem.
> 
> The code has been tested and is working.  The only thing that I don't 
> particularly like is that the processing code and loop is a duplicate of
> the code that runs just before.  Unfortunately the only way around this
> is to change the way that way the parallel bits are processed to support
> multiple datastores..  (or create "another" function..)
> 
> Any feedback appreciated, but without this the feature is broken!

Could we not make a function which these two code points then call?

Cheers,

Richard


