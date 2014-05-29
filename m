Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (unknown [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C84D76FC6E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 15:20:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 May 2014 08:20:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,934,1392192000"; d="scan'208";a="546791263"
Received: from unknown (HELO [10.255.12.174]) ([10.255.12.174])
	by fmsmga002.fm.intel.com with ESMTP; 29 May 2014 08:20:06 -0700
Message-ID: <53875026.60107@linux.intel.com>
Date: Thu, 29 May 2014 08:20:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Diego Sueiro <diego.sueiro@gmail.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAMCfZKEnyyR9ADx1H2X7=9kdCRPU14DRHFgMuhu9gzFnHxP1ag@mail.gmail.com>
In-Reply-To: <CAMCfZKEnyyR9ADx1H2X7=9kdCRPU14DRHFgMuhu9gzFnHxP1ag@mail.gmail.com>
Subject: Re: intltool version check errors
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
X-List-Received-Date: Thu, 29 May 2014 15:20:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/29/2014 06:17 AM, Diego Sueiro wrote:
> Folks,
>
> I'm facing with a strange error on daisy branch.
> Some native recipes are failing on do_configure step with this message:
>
> checking for intltool >= 0.35.0...
> /<snip>/tmp/sysroots/x86_64-linux/usr/bin/nativeperl found
> configure: error: Your intltool is too old.  You need intltool 0.35.0 or
> later.
> Configure failed. The contents of all config.log files follows to aid
> debugging
>
>
> But intltool-native version is 0.50.2.
> What am I missing?
>
>
What is your Host OS in this case, it seems like you might be having 
somekind of host contamination issue.

Can you also look at your config.log and see what it was actually 
testing for.

Or attach your config.log for us to review

Thanks

Sau!

> Regards,
>
> --
> *dS
> Diego Sueiro
>
> Administrador do Embarcados
> www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>
>
> /*long live rock 'n roll*/
>
>
>

