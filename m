Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id CECB871CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 07:57:04 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161209075700416_0684;
	Fri, 09 Dec 2016 07:57:00 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=53834 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cFG33-0001u5-W7; Fri, 09 Dec 2016 02:56:54 -0500
Date: Fri, 9 Dec 2016 02:55:36 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Chen Qi <Qi.Chen@windriver.com>
In-Reply-To: <f26e3de2a7a94cb9618f4cc957fe37cbb820a716.1481269071.git.Qi.Chen@windriver.com>
Message-ID: <alpine.LFD.2.20.1612090255100.13215@localhost.localdomain>
References: <cover.1481269071.git.Qi.Chen@windriver.com>
	<f26e3de2a7a94cb9618f4cc957fe37cbb820a716.1481269071.git.Qi.Chen@windriver.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] Use weak assignment for SERIAL_CONSOLES in qemu configuration files
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
X-List-Received-Date: Fri, 09 Dec 2016 07:57:05 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 Dec 2016, Chen Qi wrote:

> Use weak assignment for SERIAL_CONSOLES in qemu configuration files so that
> the value could serve as a default value and could be easily overridden in
> configuration files like local.conf.
>
> When using the default value for SERAIL_CONSOLES in qemux86-64,we would have
                                   ^^^^^^


rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


