Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TGaiQ-000626-65
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 21:22:42 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 25 Sep 2012 12:09:51 -0700
Received: by oagn9 with SMTP id n9so7146263oag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2012 12:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=aLHnk9X0wdzS8KyY3y0ScOxaySqAhD2UmEFgaRar3ng=;
	b=EjELa/CylH4BFMb3fLK0ABwwCXUI6Fm9cKTOJPTWsuIaqdNiQvLTXZXhm0MwuECYtu
	qg9PkeNbcp+zsFNJbEELR1wF4dOKKcGTaU2twbA6dxWNxPbPyLm1PEKnL7BpFCUnPEm3
	V8VdVXpclzxJddX2sFdnQdg/viQiyuz+DMHzhr6SzkzyUOChaEqoU5V+e9Hxln1mDYVu
	cf/lhiPPaCTVq21JzLqsQBgr/W/D0zrxseMgcFFSK73bOpcVPL2a5DVER9UCwpklQujF
	J/n4VlwFqPahaleAF/nU4xEYQk1IRHxAG8avdxG9sRJjwdE36hQqhRQoLhlAwVYQDbB/
	1HpQ==
Received: by 10.60.12.106 with SMTP id x10mr12957278oeb.103.1348600189907;
	Tue, 25 Sep 2012 12:09:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 25 Sep 2012 12:09:28 -0700 (PDT)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6A7790@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
	<1348516546-26005-2-git-send-email-msm@freescale.com>
	<CAJTo0LYe6LuFQJS_36PYVsjwnp=N9J-XuiFVMntBi76qt+i4aw@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6A6CE2@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAJTo0LZ7LrDg8JfOH6bVDV2PK6mnpqUsdHPwnvmUm1uen8uzMQ@mail.gmail.com>
	<CAEsOVNfCLUhhpM91OBLC_paOXzsoS6PMeVXdp2xSnajqGuBcyg@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6A7790@039-SN1MPN1-001.039d.mgd.msft.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Sep 2012 20:09:28 +0100
Message-ID: <CAJTo0LYcfqespv9vnEWUASJN6-Psh954FGHRoWhAmUYkFWwtEw@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
X-Gm-Message-State: ALoCoQnAoeyfIniS7jtt5z0UVhOo4HO+rgI/AsoyMqSAKTejqUXvopCnrcxUV8IR0tM9dSMUGPSG
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libx11: fix nativesdk build on older distros
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
X-List-Received-Date: Tue, 25 Sep 2012 19:22:42 -0000
Content-Type: text/plain; charset=UTF-8

On 25 September 2012 19:55, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
>> I read somewhere (very informative - I know - but I've forgot where)
>> that you are not supposed to include config.h for CC_FOR_BUILD
>> targets? I'm not expert and just double checking on this bit as the
>> correct solution.
>
> Found it: http://sources.redhat.com/autobook/autobook/autobook_270.html

That is a very good point, hadn't thought of that (and I recommend
that book to everyone, clearly I should re-read it).

The best fix is to just #define _GNU_SOURCE at the top of makekeys
then, and push that upstream (mail patch to xorg-devel@lists.x.org).

Ross


