Received: from mail-ie0-f171.google.com ([209.85.223.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TvFdJ-0005Mo-Vu
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 00:09:59 +0100
Received: by mail-ie0-f171.google.com with SMTP id 17so1297462iea.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 14:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Mwx8fcV57G+SyUT8WC3NXvW0n92/DGw8hs+HMuIlKR8=;
	b=i76HvMvjM5aQloAB3v0kayfqDfY638Ab0Lyk5LV3vdH0cBOYuRf8N0J9B7JiIuXPRi
	P+yhXt8+P33zq6dJL4ylIKv+b4AqYzGfXHs1JJHOnr8MzXBeAFQ9sNDdpYWnGub2jGOb
	WOqxFGXgjSRS8UjSBetSZe5u1Jf6G8b5E16eIN0zdpByGwYNe+pxToIe4yihYBwIFWMw
	2VulvUY+u7oB+i29V+W+z92YPN3F+/+wxywOqEOK2hRCfT+XO05xZ9qj/6oxUjveiFcZ
	Q6+8HDwpoqRhT0F3+oxG+2BZlM6pQPpK0KRNgfzRbwQpV8Y5ZvBQdhnEJMVDbOl+f1Ii
	0MxA==
Received: by 10.50.150.142 with SMTP id ui14mr3113366igb.93.1358290441242;
	Tue, 15 Jan 2013 14:54:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.18.169 with HTTP; Tue, 15 Jan 2013 14:53:31 -0800 (PST)
In-Reply-To: <50ED9C11.4060502@linux.intel.com>
References: <cover.1357343832.git.raj.khem@gmail.com>
	<50ED85D4.9000806@linaro.org>
	<CAMKF1srWtx55LRNM6_Dkrfsvb3N-kLnpNofjPwx8eeNV4TnMqA@mail.gmail.com>
	<50ED9C11.4060502@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Jan 2013 14:53:31 -0800
Message-ID: <CAMKF1sqO8DGu6=2xjzDEzQAOyfqTDk6AoUPE9_BqiNG-=2-JnA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 0/4] eglibc 2.17 upgrade
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2013 23:09:59 -0000
Content-Type: text/plain; charset=UTF-8

>>
>> cool the patching error is now fixed. I have updated the contrib tree so
>> if you
>> reapply the patches then meta-toolchain issue should be gone too.
>>
> I will update  the MUT branch also, I saw this issue last night on the
> Autobuilder and was going to send email, glad I read email first!
>

The tar files are now uploads to dl yp org and I have updated the recipes
to reflect the new download location in recipes and pushed to pull branch
this would be the last update before pushing this change. Please update

Thanks
-Khem


