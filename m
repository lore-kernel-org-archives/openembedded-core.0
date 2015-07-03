Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id DE59475CEE;
	Fri,  3 Jul 2015 02:16:26 +0000 (UTC)
Received: by pdjd13 with SMTP id d13so54852297pdj.0;
	Thu, 02 Jul 2015 19:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=0/E7gjlrEijN45/6q8p/9gqUR963mGxFpuzPeXnDtkg=;
	b=fJtJGG5sywLQThWuWqrCz3scd6NC5a3yZx2zPN5a5cuJ0aI1hh3gP2ux/L9itgbhuG
	LA1GtubNizhQwLzlzT0p9Gtch/TstBXmwywmSR71hJobrYiwsjB97lpNcsuh8q99bOmg
	vAsWT9ZxVB0sKdpmI+P4+f1kAtbEDo3TuJo38kAMR8nEdjfVOU0yrENONVITb1GCv220
	PsQ1H1juq1zVV9NcWOiNWraBpE4E/aI1CBPQ2LGaFdahn8UwX8EiMQV3uGTw1++JpqMP
	K0Q8dVX74ViL4k8fVkoOTb27BzGjaD85TdII0+WuXzsir1w7fnZbWC9zU7/EX7tRWV2i
	RIag==
X-Received: by 10.68.202.7 with SMTP id ke7mr72234159pbc.114.1435889786924;
	Thu, 02 Jul 2015 19:16:26 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:fd0f:148b:b7ea:7d8b?
	([2601:202:4000:1239:fd0f:148b:b7ea:7d8b])
	by mx.google.com with ESMTPSA id
	ri11sm7069115pbb.92.2015.07.02.19.16.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jul 2015 19:16:25 -0700 (PDT)
Message-ID: <5595F075.5010309@gmail.com>
Date: Thu, 02 Jul 2015 19:16:21 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <558B6EE7.5090107@gmail.com> <20150625105906.GA2394@jama>
In-Reply-To: <20150625105906.GA2394@jama>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: google mercurial repo issues
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
X-List-Received-Date: Fri, 03 Jul 2015 02:16:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

It seems to be working today. wonder if it is do to mercurial-native update?

- armin

On 06/25/2015 03:59 AM, Martin Jansa wrote:
> On Wed, Jun 24, 2015 at 08:00:55PM -0700, akuster808 wrote:
>> Hello all,
>>
>> I have run into an issue trying to build vim.
>
> That's broken for a while (see world reports), because bitbake mercurial
> fetcher is broken.
>
>> /usr/bin/env hg pull
>> /home/akuster/oss/downloads/hg/vim.googlecode.com/hg/vim
>> | DEBUG: Python function base_do_unpack finished
>> | DEBUG: Python function do_unpack finished
>> | ERROR: Function failed: Fetcher failure: Fetch command failed with
>> exit code 255, output:
>> | abort: repository
>> /home/akuster/oss/downloads/hg/vim.googlecode.com/hg/vim not found!
>>
>>
>> there is a note on google regarding their hg repos: "We have some known
>> issues with hg repositories."
>> 	
>> https://groups.google.com/forum/#!topic/google-code-hosting/Gh3kl9MrzY4
>>
>>
>> is anyone else seeing this?
>>
>> - armin
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

