Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 13F276C0EB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 16:22:10 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 0643B1E5951;
	Fri, 17 May 2019 12:22:12 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id BbeTCPc08ohv; Fri, 17 May 2019 12:22:11 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id C3F531E594E;
	Fri, 17 May 2019 12:22:11 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com C3F531E594E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1558110131;
	bh=n+mlj/PvZUt7+JmKcxH5SwgQYG1I/u7HAzsM4pljiVs=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=RwWnAtqnghtxgYdEfrmFekJIOKzLkg3Ozel1clch6+n0/9C+tECfhSuEd7QTe/ZMr
	sgdVT0Zmwy95llrqowU+FNYLuQ/I+PU9g+vKH7+0Owny98LrH587SIjt3yLpG6BekI
	WpZzam5La6guUr/NE25LwdTw24qfge4LQ2PwmvavD8GlxfWmyRKxfXpBdelIRaBi5r
	pgpgkUA8UGRRkMNX3o0c67WbxvczxAbsDW7awjMEambaraDRBvSYGSi0TWlTUeY1BT
	omIF0lcd7mbUWq8PpHCw32NWmZh2GamDlFVmVqazuSKaFsmNVSMbjFQYFUNv4WK33k
	diQU7o/lWK5mA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id xSLTepOdgB1L; Fri, 17 May 2019 12:22:11 -0400 (EDT)
Received: from joraj-alpa (192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id A682F1E5949;
	Fri, 17 May 2019 12:22:11 -0400 (EDT)
Date: Fri, 17 May 2019 12:22:08 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190517162208.GA9052@joraj-alpa>
References: <69efb132247d1706c6c23262ea59e80f75e96768.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <69efb132247d1706c6c23262ea59e80f75e96768.camel@linuxfoundation.org>
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
X-List-Received-Date: Fri, 17 May 2019 16:22:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Its not fast to parse this creates about 59 variants of the image. Its
> (ab)using the mcextend class to an image and add the ptest to that
> image for each ptest in the PTESTS_SLOW and PTESTS_FAST variables. It
> also adds openssh since we need an ssh client in the images for
> testimage to work. I also had to add extra space and memory to the
> image config so all the tests could work.
> 
> You can get a list of the target images with:
> 

For the non-initiated, you will need to have the following in your local.conf
for this to work.

DISTRO_FEATURES_append = " ptest"

That said, I should be able to take a look at the problem related to
lttng-tools.

Thanks

-- 
Jonathan Rajotte-Julien
EfficiOS

