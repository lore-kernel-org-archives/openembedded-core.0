Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 4ABBC7E727
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 15:00:32 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 5BC61249CA3;
	Wed, 12 Jun 2019 11:00:33 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id le-gZxfHV3yG; Wed, 12 Jun 2019 11:00:33 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 1762E249CA0;
	Wed, 12 Jun 2019 11:00:33 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 1762E249CA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1560351633;
	bh=iBfpxVV6du6jtlEFCenIUf2HQX2yKeesYnZM27r4ULg=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=IDECbn4RRVhNb22c2h4cNpyATuZ+nKq5h/VKvzB80b2nvz4XzCiJf5UlSZE4bsELg
	sRMYlGg4qzC1/EMH/QI9ptJG5YlBNL0RFzs6ZjNEhYQoZ1Km35tHtvNSNC8fBw9BvB
	WfXbfN/j/Arbd6DtyB+rBpv/mdumC4wVJmcyjydh5ugIlx29eqVcz7MDBiGMrWqnz/
	GDUNB9/604Kq8+EztsyShYC88WCJicTJRKGJk7q0RybDdIUvq4PFWFJWOFmbU2LI2P
	Di56uqbwk873GpJj+5IOZEc9o1equ8BQZkDgGSyiefSUiqYTzn+vNNfPlSWauytPDL
	YCHUZN7FGmfPw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id ERpMlhsmKImN; Wed, 12 Jun 2019 11:00:33 -0400 (EDT)
Received: from joraj-alpa (192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id E061B249C9B;
	Wed, 12 Jun 2019 11:00:32 -0400 (EDT)
Date: Wed, 12 Jun 2019 11:00:32 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: zhe.he@windriver.com
Message-ID: <20190612150032.GB972@joraj-alpa>
References: <1560337967-208223-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1560337967-208223-1-git-send-email-zhe.he@windriver.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] lttng-modules: Add git based recipe
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
X-List-Received-Date: Wed, 12 Jun 2019 15:00:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> +BBCLASSEXTEND = "devupstream:target"
> +LIC_FILES_CHKSUM_class-devupstream = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
> +DEFAULT_PREFERENCE_class-devupstream = "-1"
> +SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=master \
> +           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
> +           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> +           "

Please use the head of the stable release. 2.10 in this case.

> +SRCREV_class-devupstream = "${AUTOREV}"
> +PV_class-devupstream = "2.11.0-rc+git${SRCPV}"

This should be 2.10.

-- 
Jonathan Rajotte-Julien
EfficiOS

