Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QXMRU-0006G0-1J
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 01:57:44 +0200
Received: by pvc30 with SMTP id 30so49084pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2011 16:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=pzkNEIV1aNUkT675R9+R6FFEy++t1r957x4K5yOeUVg=;
	b=RXeuqzXi1SFA/zRCb9O8s7MG2XV2MflD26woQ5x//O2AJxX8kqytzH8rH630J40WIQ
	G+qdGP8CND2Z+yVq+z/V5mjpwxxVJ/ol1VM/kqQ4QCFoax++1ZM37JmSGZDPuUeXDLT6
	aJzhdZHxq8qOyzX8d3Aff66FvPiRjLJRMZsR4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=W2K/N46Qd/c19epX+Ew52jhqXfOROmVBHf9mkkCcZzgLlLuGS1rzqi6upjTuD0+0kH
	KAO00LWeALjHFGdkRAPPpUFHrSbfvBkcXASTn76i/xR45jJ+rIfWzIXxoJ9X+T5OS6r+
	c6qBl3BaeOqBl4N+VliEuwSQaqVRapXVOVYaA=
Received: by 10.143.62.8 with SMTP id p8mr286780wfk.328.1308268455076;
	Thu, 16 Jun 2011 16:54:15 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id t15sm2125171wfh.16.2011.06.16.16.54.13
	(version=SSLv3 cipher=OTHER); Thu, 16 Jun 2011 16:54:14 -0700 (PDT)
Message-ID: <4DFA97A1.9090909@gmail.com>
Date: Thu, 16 Jun 2011 16:54:09 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308249837.git.scott.a.garman@intel.com>
	<3a0dd72238fb6dbdbfc9ff1f0230f310fde0fff9.1308249837.git.scott.a.garman@intel.com>
In-Reply-To: <3a0dd72238fb6dbdbfc9ff1f0230f310fde0fff9.1308249837.git.scott.a.garman@intel.com>
Subject: Re: [PATCH 1/1] base-passwd: disable problematic login.defs options
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2011 23:57:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2011 11:50 AM, Scott Garman wrote:
> This resolves the following runtime errors when various shadow-utils
> binaries are run:
>
> configuration error - unknown item 'FAILLOG_ENAB' (notify administrator)
> configuration error - unknown item 'LASTLOG_ENAB' (notify administrator)
> configuration error - unknown item 'OBSCURE_CHECKS_ENAB' (notify administrator)
> configuration error - unknown item 'PORTTIME_CHECKS_ENAB' (notify administrator)
> configuration error - unknown item 'QUOTAS_ENAB' (notify administrator)
> configuration error - unknown item 'MOTD_FILE' (notify administrator)
> configuration error - unknown item 'FTMP_FILE' (notify administrator)
> configuration error - unknown item 'NOLOGINS_FILE' (notify administrator)
> configuration error - unknown item 'ENV_HZ' (notify administrator)
> configuration error - unknown item 'PASS_MIN_LEN' (notify administrator)
> configuration error - unknown item 'SU_WHEEL_ONLY' (notify administrator)
> configuration error - unknown item 'CRACKLIB_DICTPATH' (notify administrator)
> configuration error - unknown item 'PASS_CHANGE_TRIES' (notify administrator)
> configuration error - unknown item 'PASS_ALWAYS_WARN' (notify administrator)
> configuration error - unknown item 'CHFN_AUTH' (notify administrator)
> configuration error - unknown item 'ENVIRON_FILE' (notify administrator)
>
> This fixes bug [YOCTO #1170]
>
> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
> ---
>   .../base-passwd/base-passwd-3.5.22/login.defs      |   32 ++++++++++----------
>   .../recipes-core/base-passwd/base-passwd_3.5.22.bb |    2 +-
>   2 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs b/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
> index 1d392ac..2708eb6 100644
> --- a/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
> +++ b/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs

I wonder if login.defs should be provided at all by base-passwd package.
It should come from shadow isnt it ?


