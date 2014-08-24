Return-Path: <mike.looijmans@topic.nl>
Received: from smtp01.online.nl (smtp01.online.nl [194.134.41.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0C9C2601A8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 07:56:57 +0000 (UTC)
Received: from smtp01.online.nl (localhost [127.0.0.1])
	by smtp01.online.nl (Postfix) with ESMTP id BEC5C8E173
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 09:56:57 +0200 (CEST)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp01.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 09:56:57 +0200 (CEST)
Message-ID: <53F99AC9.7030604@topic.nl>
Date: Sun, 24 Aug 2014 09:56:57 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1408649791.git.peter.seebach@windriver.com>
	<53F77370.2060603@balister.org>
In-Reply-To: <53F77370.2060603@balister.org>
X-Online-Scanned: by Cloudmark authority (on smtp01.online.nl)
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Sun, 24 Aug 2014 07:56:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2014 06:44 PM, Philip Balister wrote:
...
> Can we also move to hard float abi?
>

+1 to that.

Especially since "neon" implies "float" support on the Cortex.

We moved to hard float on the MIPS (mostly broadcom) many years ago. I 
always wondered why the ARM never made that move.

-- 
Mike Looijmans

