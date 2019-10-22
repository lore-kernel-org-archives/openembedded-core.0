Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 292046C0E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 06:38:55 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id z12so12089367lfj.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 23:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=/j2tOUtNgum4NclV0EJaerlry2nfD7NCQrsXsBDzhUs=;
	b=PwQf0NF8ZBX6dKADww36KOBFQHLNoZ5Z5qpbIAKIYpYdVjWZ6tfjwa1kI38aI3qBMC
	aigbgBZHgItyJ3jp8zj6gm3KJJ7Hw1WNpZcIUFQ3M8BTBMttGNsRAl1c2AYRp4uKK2a1
	hSJaX5nfrYVu7ALSjc0EU7+s5YmUIQrvuNryZrtYdza5Z6YIZvxuWmwpOSDlySoaJeQK
	M8co+E7VkxqvuvgIk5iJxMQaQCSZihNr/51zedjcYSDSrJNA0AJHXH9hOhNKPWKgKM9/
	4yNy5baWvacoXfYWgIc7YGqOUEZDDxdS0FqlFCrE7uLkEJujSpvzKtLYpBfjHD0MaXKY
	lX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/j2tOUtNgum4NclV0EJaerlry2nfD7NCQrsXsBDzhUs=;
	b=FHIqz7+Ff+eOKogDFmq7GccpWUrZemK7HNTca1xWoIW2EOUDluNWVVh30AvaSuw16H
	dn976ySMDoC2AOmHq1E8fo5R30xGfgTRPyL85uA5RqXc2lNWK6ZSKlpYPVwhvzZSCY6V
	1QyW2I42j/H3Y4XQV7ErJfd5xnoSrfnNjX91yznSqQ5LLfHfvhh9GynMHALLYgjtrRj7
	SOpTDj9n1gY3zeVl8IHnJ61JkPGShsDXYSeeyGL229QgGOKyBODnLtrRQWYvTX/vfRia
	E4M8iL5YdjkH9oI968OpBwLiZTv+PkdvME6luY6w6wLQY8G0ZkYvtTfKZKj6tEqQPmUM
	InAw==
X-Gm-Message-State: APjAAAXHET+FKW5h5i+JmTsH4dN7l+G1gTlHNhM9bW1xydgjWPbJMrxT
	vLkGpgcC7sLQQ2Es2Srr4tM=
X-Google-Smtp-Source: APXvYqx0qt4GLmSC9I4CHsgYczwwQFaMS8PiBePR3AvolK1aFWSeFIbhlCzjbVNghLkxOuNqQcWIdA==
X-Received: by 2002:ac2:5604:: with SMTP id v4mr11050878lfd.148.1571726335715; 
	Mon, 21 Oct 2019 23:38:55 -0700 (PDT)
Received: from [192.168.51.73] ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id
	t8sm12714475ljd.18.2019.10.21.23.38.53
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 21 Oct 2019 23:38:54 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>,
	openembedded-core@lists.openembedded.org,
	Joshua Watt <JPEW.hacker@gmail.com>
References: <20190204031153.1348-1-jacob.kroon@gmail.com>
	<CAJdd5GbA3MJ9KpbY81EkqfUvGwa8jZD7F8u-f+48NvKX9X+hsA@mail.gmail.com>
	<b69b9906-0ab0-3d7d-7cc1-99dafbb37528@kernel.crashing.org>
	<55271782-4edd-6591-3d5a-12bd071a0940@gmail.com>
Message-ID: <b46b712e-b2a7-15b9-c79b-3262595f50dd@gmail.com>
Date: Tue, 22 Oct 2019 08:38:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <55271782-4edd-6591-3d5a-12bd071a0940@gmail.com>
Subject: Re: [PATCH v2] base-passwd: Add kvm group
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
X-List-Received-Date: Tue, 22 Oct 2019 06:38:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Forgot to mention, the number chosen for the kvm group, 47, I just 
picked one of the available slots, no further reasoning behind that choice.

/Jacob

On 10/22/19 8:32 AM, Jacob Kroon wrote:
> Hi Joshua, Mark,
> 
>>> In general, I don't think we should be "patching in" users and groups
>>> like this to base-passwd. If upstream doesn't have them, they need to
>>> be added through the normal useradd.bbclass mechanism so that users of
>>> useradd-staticids can choose what ID they get mapped to.
>>>
>>> Is it possible to revert this and add the kvm group via the 
>>> useradd.bbclass?
>>>
>>>>
>>>>    udevd[<pid>]: specified group 'kvm' unknown
>>
>> As for this particular patch, why is adding a specific KVM group 
>> required?
>> Unless something is hardcoded in KVM to use group '47', a regular 
>> system type
>> useradd call should be done instead.  This would avoid the problem 
>> that Joshua
>> is experiencing.
>>
> 
> The groups "shutdown" and "input" were already patched in in the same 
> way, so I figured that was the way to do it. But it sounds like you're 
> pointing out that we can drop those three patches, and instead use 
> useradd.bbclass in base-passwd recipe ? Sounds like a nice cleanup.
> 
> Cheers,
> Jacob

