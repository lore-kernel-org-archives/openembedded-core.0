Return-Path: <grant@hcubed.com>
X-Greylist: delayed 2224 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 May 2015 13:09:40 UTC
Received: from circini.lunarpages.com (circini.lunarpages.com [216.97.225.100])
	by mail.openembedded.org (Postfix) with ESMTP id C180970331
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 13:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hcubed.com;
	s=default; 
	h=Message-ID:Subject:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version;
	bh=FQgImR2lBblPh7+omrFimvu/HErZJGT+OaMt96eNVz0=; 
	b=KsLt1vWRsyNIwtcn7srqZ9KW+KFmpFEDgMytwFWLUSI+/UglziGxjNLW21TsSOxSPG/tpcFXJeXcdrdEtDma6TOApihc5TsUD4zJdy0dp9wbcoSyWqNo290JV0laad/txPNhS/2OmpEBK2UzUwf5r5qwa2MCHv6QdLYJkeWVRq0=;
Received: from localhost ([127.0.0.1]:35578 helo=circini.lunarpages.com)
	by circini.lunarpages.com with esmtpa (Exim 4.82)
	(envelope-from <grant@hcubed.com>)
	id 1YxE25-00082S-Q9; Tue, 26 May 2015 05:32:33 -0700
MIME-Version: 1.0
Date: Tue, 26 May 2015 05:32:33 -0700
From: grant@hcubed.com
To: openembedded-core@lists.openembedded.org
Message-ID: <36f457602f1854379a8b3c75c36d9c14@hcubed.com>
X-Sender: grant@hcubed.com
User-Agent: Roundcube Webmail/1.0.1
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - circini.lunarpages.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - hcubed.com
X-Get-Message-Sender-Via: circini.lunarpages.com: authenticated_id:
	grant@hcubed.com
Subject: Multi-Lib Address Sanitizer
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
X-List-Received-Date: Tue, 26 May 2015 13:09:41 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

I have a need to have GCC's address sanitizer work in a 32-bit and a 
64-bit environment. The current address sanitizer only produces the base 
library. Does someone have patches that would allow the address 
sanitizer to produce the libraries for both architectures?

Thanks,
Grant Haidinyak

