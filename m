Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 99F527736F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 21:31:54 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20160224213153365_0684;
	Wed, 24 Feb 2016 21:31:53 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [127.0.0.1] (port=58155 helo=localhost)
	by astoria.ccjclearline.com with esmtpa (Exim 4.80)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1aYh3Q-0006FF-Pa; Wed, 24 Feb 2016 16:33:04 -0500
Received: from 99.240.204.5 ([99.240.204.5]) by astoria.ccjclearline.com
	(Horde Framework) with HTTP; Wed, 24 Feb 2016 16:33:04 -0500
Message-ID: <20160224163304.55482wad36phjtmo@astoria.ccjclearline.com>
Date: Wed, 24 Feb 2016 16:33:04 -0500
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Christopher Larson <clarson@kergoth.com>
References: <20160224152850.164043qmdvkuzbeo@astoria.ccjclearline.com>
	<CABcZAN=RefHwBnF+8oEu6uDmxe-LCMoVs94XK=MOEsr7VmJ6xw@mail.gmail.com>
In-Reply-To: <CABcZAN=RefHwBnF+8oEu6uDmxe-LCMoVs94XK=MOEsr7VmJ6xw@mail.gmail.com>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.3.11)
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: what is the priority of wildcarded .bbappend files?
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
X-List-Received-Date: Wed, 24 Feb 2016 21:31:55 -0000
Content-Type: text/plain;
 charset=UTF-8;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Quoting Christopher Larson <clarson@kergoth.com>:

> All appends that apply to a given recipe will be applied to that recipe.
> Order is determined solely by layer priority.

   wait ... so *all* bbappend files that match a recipe will be applied?
i'm embarrassed that i didn't know that, is that mentioned in the
documentation somewhere?

rday



