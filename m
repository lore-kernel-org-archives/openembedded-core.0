Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 356737E3A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 22:28:07 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 5D3CB1E59FA;
	Wed, 22 May 2019 18:28:08 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id Y4C_Xpprc6ed; Wed, 22 May 2019 18:28:08 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id E2B3A1E59F7;
	Wed, 22 May 2019 18:28:07 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com E2B3A1E59F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1558564087;
	bh=TfVWWfTnuoZ8BBwW/e0j5i+C+VSQGIk6502ak9MCfOw=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=YDtZKdDaOQUkoBvaSylMTmM3XcYlsX8FwEOU52Lj/JRoh2qxoaMFmUSloYd4I2jHf
	Hs7NDsIld18kMataqSKq9qKgbnrV/9bJ2vOAWDBJmQHUUPQvUREJhrKFOXpMy1t+Pc
	E7tEDcz19QQg7UMmc0zS4EzqXuvAVKspB3/FMzwTpSgR9Cj4KY293EVp3kO69HVHlm
	2AW75UDxGZjykxdhA/GbOBkRC+j57ClKOieFAzCz81kXITuq02ZVKR852UiFG7VEj8
	7hL2WyCGfTZ5eE/HX0CIYUQxUnMkUpfLn2KghDs6S4rosN0PgG43rej1DCwj3lPOaF
	PS0zjiskBmQzQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id 1OAqtuKBRwaZ; Wed, 22 May 2019 18:28:07 -0400 (EDT)
Received: from joraj-alpa (192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id B3B981E59F2;
	Wed, 22 May 2019 18:28:07 -0400 (EDT)
Date: Wed, 22 May 2019 18:28:07 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190522222807.GC4732@joraj-alpa>
References: <69efb132247d1706c6c23262ea59e80f75e96768.camel@linuxfoundation.org>
	<6ed430aa3e5e722cd75b1798cacab3f92eb71b71.camel@linuxfoundation.org>
	<2b4e8d0f-cbb9-d2e4-c17d-33950d3cf9df@windriver.com>
	<7134ea3a82bc3817da8bdc9f52e0867d223b2df4.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <7134ea3a82bc3817da8bdc9f52e0867d223b2df4.camel@linuxfoundation.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: ptest with BBCLASSEXTEND
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
X-List-Received-Date: Wed, 22 May 2019 22:28:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> I think Jonathan Rajotte might be able to help us with lttng-tools.

Finally had some time for this.

See [1][2].

[2] does bring the matter of forcing lttng-ust support of lttng-tools when ptest
is deployed. "lttng-ust" is already set in PACKAGECONFIG by default but is there any
way to "enforce" the lttng-ust config & dependency when lttng-tools-ptest is used?

[1] http://lists.openembedded.org/pipermail/openembedded-core/2019-May/282733.html
[2] http://lists.openembedded.org/pipermail/openembedded-core/2019-May/282734.html

Cheers
-- 
Jonathan Rajotte-Julien
EfficiOS

