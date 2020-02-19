Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
	by mail.openembedded.org (Postfix) with ESMTP id E278F6025F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 15:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id C12AB249909;
	Wed, 19 Feb 2020 10:56:27 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id q1DYwFjYyfvT; Wed, 19 Feb 2020 10:56:27 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 71ECE249908;
	Wed, 19 Feb 2020 10:56:27 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 71ECE249908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1582127787;
	bh=ZwN5PGEjJ5R7EJnOF9Gxq2AFbSCfSD+9wURTcwKG3Hg=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=etsf6eVRk6O174BP3/aBveyT0SDVGj87BkH54CXnnAp56I302QGppeLvUnDy8KhNG
	dLBfWH8G7HMaPBqGOziQEgD+ths2yWM5kaDbs4VHKPuq/ZT6DSjMh0xLD0ldcHu6Wm
	4EmLOVFwpAjOBpWFK3K8Gmss4meUneTbMbavU+OlE35NMo6J2lvPkFk1lOA+HiWEC+
	Rs3PlE9Tu7ONR3GRVf0CB9kjTcxBGLgoe36aVckYEnS2WFxqGq2MwgsbuhCVXMOv8f
	+9rj01Pckmch/GsDGxDuDDkC7aBHhYFVv7+Rby1ACTXp+J6eUhLhG2k83FShJxEJMb
	1II0a3j72roxA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id u9Bz8BRyqeeC; Wed, 19 Feb 2020 10:56:27 -0500 (EST)
Received: from joraj-alpa (192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id 353C52494DA;
	Wed, 19 Feb 2020 10:56:27 -0500 (EST)
Date: Wed, 19 Feb 2020 10:56:26 -0500
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200219155626.GN17818@joraj-alpa>
References: <20200218132054.20341-1-wallinux@gmail.com>
	<CANNYZj9nm0eqo0NtHhEJiw7nLbnYQ8r1aazXk6mGn83VXc9VNA@mail.gmail.com>
	<CAF2baFdCF-NVmUa=meNhAN5BDBqLcS4k7F+EBWtUA1ekY6OVBg@mail.gmail.com>
	<20200219152720.GM17818@joraj-alpa>
	<143f590b688ed8166a702873275c16f3c7217d52.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <143f590b688ed8166a702873275c16f3c7217d52.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] babeltrace2: added 2.0.1
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
X-List-Received-Date: Wed, 19 Feb 2020 15:56:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Let me try a different question. What is the ultimate intent here?
> 
> Will babeltrace and babeltrace2 coexist in the future or do you plan to
> rename babeltrace2 -> babeltrace at some point?

We plan on deprecating Babeltrace 1.X in the long term but Babeltrace 2 and
Babeltrace 1 will always co-exist.

> 
> There are some things where the namespaces are quite specific (python
> vs python3, gtk(+) 2/3/4, qt) but they're fairly few and far between.
> 
> If babeltrace2 will replace babeltrace and become babeltrace, we
> probably want to keep PN as babeltrace. If it will be known as
> babeltrace2 always, we probably change PN.

Babeltrace 2 executable will be forever named babeltrace2.

Hope this clear up this part a bit.

-- 
Jonathan Rajotte-Julien
EfficiOS

