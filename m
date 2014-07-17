Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id F373F609B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 11:46:58 +0000 (UTC)
Message-ID: <53C7B7B1.8010301@communistcode.co.uk>
Date: Thu, 17 Jul 2014 12:46:57 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1402915976-12506-1-git-send-email-ross.burton@intel.com>		<53B66F26.5000800@communistcode.co.uk>		<53C7AE4F.5060809@communistcode.co.uk>	<1405596838.3668.14.camel@ted>
	<53C7B5F1.1030302@communistcode.co.uk>
In-Reply-To: <53C7B5F1.1030302@communistcode.co.uk>
Subject: Re: [PATCH] wget: use GnuTLS instead of OpenSSL
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jul 2014 11:47:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Failed with gnutls config.log: http://ix.io/dr4

On 17/07/14 12:39, Jack Mitchell wrote:
> config.log: http://ix.io/dr3
> 
> and yes, gnutls is being built, or at least it's in the work dir.
> 
> [jack@jackArch gnutls]$ pwd
> /home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/core2-32-oe-linux/gnutls
> [jack@jackArch gnutls]$ ls
> 2.12.23-r8.4  3.2.13-r0  3.2.15-r0  3.3.5-r0
> [jack@jackArch gnutls]$
> 
> On 17/07/14 12:33, Richard Purdie wrote:
>> On Thu, 2014-07-17 at 12:06 +0100, Jack Mitchell wrote:
>>> So this error is still blocking my master build, any ideas?
>> Share the config.log so we can see how the configure test is failing? Is
>> gnutls actually built and in the sysroot or not?
>>
>> Cheers,
>>
>> Richard
>>
> 
> 


-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 

