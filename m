Return-Path: <scerveau@connected-labs.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 652A4601A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 15:06:40 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id b13so8239686wgh.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 08:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Kj01Z+Wb+KMnKVQww+etNtmTmRhQUBbwRzW8weetL4s=;
	b=WgqLDM3bPQbzZOFfgK4mXggs29HQpY43Q8eLjKLJah4Q6oP+krKIjpWRJrAqiEwd6W
	m4yCCH/SjdWIN3+7KI51U3QAKkdeXJ+v0kQ93+Jbigft1dPHySs37uFyqDR8xGY5leA+
	7H4kUJ9s5QQtQSB2TCal3Jshr9ptEZJmFQeYzq4Vtr5rPLH9X38V2L1PPxpUcHJFUpBu
	sq0bNYOAtRP2FXSdJGushcvVpzfzapMaE/oFON4GheeKtvLlgW5Vinqvp5B1U+kC47+x
	MLhJ2zWXjwd1RmCSNrqdWATbotjjoRhV0LfC291uSy9DhTlbexkz6vTLaXUi0MCTw3ME
	NNDg==
X-Gm-Message-State: ALoCoQmgwPRANiwftO3viVnM4Ktabji49IuAFvSABpqxjx+FPAC9gtVSPrUrUzvcJ9LkVlgm555Z
X-Received: by 10.194.92.177 with SMTP id cn17mr46041257wjb.71.1404140801208; 
	Mon, 30 Jun 2014 08:06:41 -0700 (PDT)
Received: from [172.24.63.14]
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id
	by3sm22589058wjc.10.2014.06.30.08.06.39 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 30 Jun 2014 08:06:40 -0700 (PDT)
Message-ID: <53B17CF5.9020008@connected-labs.com>
Date: Mon, 30 Jun 2014 17:06:29 +0200
From: Stephane Cerveau <scerveau@connected-labs.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1404137924-14085-1-git-send-email-scerveau@connected-labs.com>	
	<53B17224.4050602@connected-labs.com>
	<1404139876.6362.13.camel@ted>
In-Reply-To: <1404139876.6362.13.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dora][PATCH] e2fsprogs: Fix populate-extfs.sh
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
X-List-Received-Date: Mon, 30 Jun 2014 15:06:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry i have been fooled by the poky web interface :(
Anyway the bug is real on dora branch.
Cheers

Stéphane

On 06/30/2014 04:51 PM, Richard Purdie wrote:
> On Mon, 2014-06-30 at 16:20 +0200, Stephane Cerveau wrote:
>> This patch applies to master and daisy branches too.
> Really?
>
> That is a little odd since populate-extfs.sh was removed in them?
>
> Cheers,
>
> Richard
>


