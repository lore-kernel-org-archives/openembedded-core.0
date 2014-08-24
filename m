Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 8E73E706F1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 14:44:23 +0000 (UTC)
Received: (qmail 31725 invoked by uid 1003); 24 Aug 2014 14:44:24 -0000
Received: from unknown (HELO ?10.50.10.85?) (philip@opensdr.com@69.7.123.146)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	24 Aug 2014 14:44:24 -0000
Message-ID: <53F9FA38.6040809@balister.org>
Date: Sun, 24 Aug 2014 08:44:08 -0600
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>, 
	openembedded-core@lists.openembedded.org
References: <cover.1408649791.git.peter.seebach@windriver.com>	<53F77370.2060603@balister.org>
	<53F99AC9.7030604@topic.nl>
In-Reply-To: <53F99AC9.7030604@topic.nl>
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
X-List-Received-Date: Sun, 24 Aug 2014 14:44:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 08/24/2014 01:56 AM, Mike Looijmans wrote:
> On 08/22/2014 06:44 PM, Philip Balister wrote:
> ...
>> Can we also move to hard float abi?
>>
> 
> +1 to that.
> 
> Especially since "neon" implies "float" support on the Cortex.
> 
> We moved to hard float on the MIPS (mostly broadcom) many years ago. I
> always wondered why the ARM never made that move.
> 

The problem in the past has been binary blobs compiled for soft float.

Philip

