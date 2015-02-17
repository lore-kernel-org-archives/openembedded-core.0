Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7198E71EC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 22:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1HMWs1O026672; Tue, 17 Feb 2015 22:32:54 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sM8SLtQNxWls; Tue, 17 Feb 2015 22:32:54 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1HMWcx3026665
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 17 Feb 2015 22:32:50 GMT
Message-ID: <1424212358.25541.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 17 Feb 2015 22:32:38 +0000
In-Reply-To: <alpine.LFD.2.11.1502170611270.21712@localhost>
References: <alpine.LFD.2.11.1502170611270.21712@localhost>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: "--disable-werror" versus "--disable-Werror"?
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
X-List-Received-Date: Tue, 17 Feb 2015 22:33:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-02-17 at 06:21 -0500, Robert P. J. Day wrote:
>   i did a "grep" just to see how other recipes were doing it, and i
> saw a mixture of "--disable-werror" versus "--disable-Werror", and
> this web page which suggests that only one of those forms is correct:
> 
> http://patchwork.openembedded.org/patch/23361/
> 
> but feel free to search for yourself to see.
> 
>   in any event, what *is* the proper local.conf fix to disable this
> option on a per-recipe basis?

It depends on the recipe in question and how its configuration is
enabling warnings as errors in the first place. There is no defined
standard mechanism for that afaik.

Cheers,

Richard


