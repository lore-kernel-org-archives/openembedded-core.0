Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 744BB6AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 20:41:51 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id w19so5135853uac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 13:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=M/oDduxU78pQIfywYgHl3BIaEWU0TsGnL/bxphx661I=;
	b=2KFx+oPuu2KfRav2izRB5JRXP8eJIs67Fb09epTP3oroGDS+xL+GGGq6jwBvbnekHV
	U5jUx37kybPkQ/FQn6uVo7hsaxYTrDyF6CsgGyA7L1m2fHL5uiI+0S5DPWJzGY1S3ydL
	b2oMbjcJogj/QFr/O/KQStydHP1qGhEvb77vVUX9f0+PAMc+gaQgBVEnY9X8iWLb5qWU
	yk4ZFBphiMtXNsc+8lnqlqbz7RH4I8KongAsJ9kASb9XCY6nEUcS4qRTyuaKdZU+Ty+X
	tW6iyUeJURJTJDICvvJEXy8Sck/lMXuM4TqgH0AN9ncE23T3FOaitO0SIk71ZRSreuWn
	olHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=M/oDduxU78pQIfywYgHl3BIaEWU0TsGnL/bxphx661I=;
	b=Dxq9USsbDVYOW5Np+lTM+qV6UYCgrVjEp2XabtDhETAbXwzfm+IZ9Gk9C9HtKEsfcz
	x47zUKzC+3RzFKDLrK8e6zGCM3KVrl+rOJw6iK46JW7cQZs3Z5/hjJWHDCHslTrJHNgl
	lhtaasDVF+DAj0SstaanCgwrpa0itJiaYObyTSDUuN1HtAiB5hTUoQI9+6iV7p9ZvjBB
	NM+WQBI8UplSoyVvLOvUJDnrmfqaH98T8I5C+yB69lfXw+ebH8xx6NUA0BpDaZXzqoaw
	ZfZ6kELS4lSZ6UZQ35030iWVJWF/kYLxPUztEB+kssi4AZAQsKIDerYrLxZKTJPXpXHE
	/qAA==
X-Gm-Message-State: AKS2vOy8ym53n71V6FVQOD1GGOBPUm2To/kZp2LVpTYOTSE0SQDOsG4M
	XKYghphIArxSG0gpiSeYiw==
X-Received: by 10.176.93.2 with SMTP id u2mr3833679uaf.109.1498596111794;
	Tue, 27 Jun 2017 13:41:51 -0700 (PDT)
Received: from [10.5.3.6] ([179.105.243.125])
	by smtp.gmail.com with ESMTPSA id e186sm81990vkf.5.2017.06.27.13.41.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 13:41:50 -0700 (PDT)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Ed Bartosh <ed.bartosh@linux.intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1498569961.git.ed.bartosh@linux.intel.com>
	<CAP9ODKopDxEYw9vereQjoHve=n2Of2v-3EHbxaiumZN3T0hH8Q@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Organization: OS Systems
Message-ID: <823180ba-066d-747d-8112-a110633a03a8@ossystems.com.br>
Date: Tue, 27 Jun 2017 17:41:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKopDxEYw9vereQjoHve=n2Of2v-3EHbxaiumZN3T0hH8Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/5] #11662 - wic should mount /boot
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
X-List-Received-Date: Tue, 27 Jun 2017 20:41:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The last patch I sent is here: 
https://patchwork.openembedded.org/patch/139252/

We're using this patch internally with Pyro branch. I can rework to 
apply on master.

On 06/27/2017 05:35 PM, Otavio Salvador wrote:
> On Tue, Jun 27, 2017 at 10:28 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
>> The patchset also fixes long standing bug: wic updated fstab
>> inplace in rootfs directory. This causes other tasks working with
>> rootfs directory to produce incorrect results or crash. This is
>> fixed by copying rootfs to the temporary directory before updating
>> fstab.
> 
> As you is working on this, please also include Fabio's patch on the
> patchset. It includes a command like option to disable fstab change at
> all. For delta-based updates this is imperative.
> 
> Fabio, could you point him the last patch revision?
> 

