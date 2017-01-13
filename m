Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0929A71CE7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 19:37:08 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id 127so35156476pfg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 11:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=h9sx+TNA//h3jMzRlMSQnx+xZH3FgxeEEUiTywVp3mA=;
	b=ZTdFj16RFL8NjcXVjnVwW7K3xLvKUJP5H74mRG+45IxdQ3HXeSWImyyV0i+/MedEmX
	nfCV44HlXTsuH9Cckl82/ttOyXrYJmQXgpm0n17FDS0jNkdrzcRHjHnKvJss/uHZjxDk
	yYYQdwkqVhPlfs3FWaiH1oBERjo33oA/qoDN+Bkh/w2FgPlpn987UzWeBAgvJ/A5Ff0c
	Y4f2MhFd1EJkZlOyl2g9SDRBcIVCyrXWZDddoYgWo4K7wZT0Laryh+u0SRvFW2uKahg0
	7vPmvOWW5AwcnyRvKpiYc0D8dU4rwWR7U3OH05uxHmM1d4dF8VAe328wEH7S38rRQRdU
	6lNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=h9sx+TNA//h3jMzRlMSQnx+xZH3FgxeEEUiTywVp3mA=;
	b=bnup4gAUyLn05fqQpo6jLi1GAjto/d76pFvTx5eUOXtqRXqtpbDlR7RFKwBMNv2fKa
	EONcM9OFQAWHbLfOIPrKXKcBRucwHRM8BFs0nmS4XBEDpmeUvEZH2+rTTFmcVenJpgeX
	JygwDkn/thmUcC+gGUEywpWFs76FY6f3kFo/UpXYF+1R1fgvBjCsf7WmaiWSRiMVy+pi
	ufpTiyAoib1+FGSSvotLBi3WLGL9swQKbhDkuP0QV3GN8z/Q+M+kpexou3RKXlPUj4Q0
	sV2HvGo2MH4V2peeHZGXl+RpLiEMsZ61iKBY3FQUrzDY5ADDQGmt3nq0bibYceZ2D9zs
	sJZw==
X-Gm-Message-State: AIkVDXJq333yXt34fhWoXBAerlKpLriKioYbXZIp82/9dfl8PT5HTlReM0LAXVUZEkTmDQ==
X-Received: by 10.98.214.209 with SMTP id a78mr24553579pfl.6.1484336228954;
	Fri, 13 Jan 2017 11:37:08 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:4198:472b:7988:3451])
	by smtp.gmail.com with ESMTPSA id
	w76sm25368790pfd.74.2017.01.13.11.37.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jan 2017 11:37:08 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1484331195-11919-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
	<1484335945.21036.8.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <9a25bae6-d409-7fdf-2219-7b68c5f03a14@gmail.com>
Date: Fri, 13 Jan 2017 11:37:07 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <1484335945.21036.8.camel@intel.com>
Subject: Re: [PATCH V2] python3-docutils: upgrade to 0.13.1
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
X-List-Received-Date: Fri, 13 Jan 2017 19:37:09 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/13/17 11:32 AM, Patrick Ohly wrote:
> On Fri, 2017-01-13 at 12:13 -0600, Edwin Plauchu wrote:
>> Changed document date field and several notes about folders
> 
> Perhaps now would be a good time to start using beginline/endline
> parameters?
> 

may be it really depends on the change and I am not sure what has changed

