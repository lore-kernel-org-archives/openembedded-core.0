Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 9E4F26C466
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 16:51:50 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id E1D56133850;
	Tue, 12 Mar 2019 12:51:50 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id O3iHlJiwXH81; Tue, 12 Mar 2019 12:51:50 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 984DB13384D;
	Tue, 12 Mar 2019 12:51:50 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 984DB13384D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552409510;
	bh=a7Uui/exBGfjUAIL7GxSatpMvr47+h4d7VMLVpn0d0I=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Ie19FeKsrEMPG7CW2w6jOwi9kAFqeEn6Zff5cVE+IXU+cBm5uTfBP81kYynPAmYSz
	TshFuPtyJS47G2LZYtghIlxphfVhbUcuc3uDPpb0vR8vSXw7DysVwVYhh2qqw/QmDg
	Nb10gfP5CVqa9byJHxzIeZ0OoSSeWpEXHjWB0ej6G2N4EpDRqnt5oUUgBO6qQ2buh/
	WLyRpQUZRIozOf2NLilecODYYadTmsJUcbMwJmdqUHAt73ZclgWnIuGNxrV50WtGJ9
	AEx7m8K+Xu9E1BS0pETyscQEB8bJ8vLwE+RaDCdX6K3LrMM/Kzc6LpKfwnMUDAqrEr
	5Gfv70+gEvAag==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id S9zGGY6vIUHw; Tue, 12 Mar 2019 12:51:50 -0400 (EDT)
Received: from joraj-alpa (192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id 6A9FA133848;
	Tue, 12 Mar 2019 12:51:50 -0400 (EDT)
Date: Tue, 12 Mar 2019 12:51:50 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: bruce.ashfield@gmail.com
Message-ID: <20190312165150.GB25992@joraj-alpa>
MIME-Version: 1.0
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: OpenEmbedded-core <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/6] lttng: add 5.x fixup patches to 2.10.8 release
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
X-List-Received-Date: Tue, 12 Mar 2019 16:51:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bruce,

We just release LTTng-modules 2.10.9 that should remove the need for most if not
all of this patches. Could you try it out?

Cheers

-- 
Jonathan Rajotte-Julien
EfficiOS

