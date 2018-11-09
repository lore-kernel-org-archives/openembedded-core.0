Return-Path: <anonumiko@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id BA09A6011B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 17:36:31 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id t22-v6so2273178lji.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 09:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=f11jyfUVjOHuRDfVEFIrrNIpHHjnqKwJUtLER7GLaw8=;
	b=hBhfXWBSwovxVxTg7lZ3i7pJ1omELDdxVby5kwdrMZCH5q2q+MY31kRp5u81WRnTUF
	DMtPVAV3yICRj9pM6cUyJO49mKGAZWpcVLfox2q/beepQNgfMGUVGcYydREhLXl4e9+v
	PI+MX72Onf6uWgpHNp7L7184AbqN1Fa2Ii9teIzemFxSrR+iQKHRjqfSOXr9WApbuOpz
	dxIgMynQFzMqXHVf92TUt5SIKgBL5ZUgQ+jddbGaVGcw38CI+rquO+i9N7G+6qWUh5EK
	MuyfaJcNB3kBaM8iSSN6s+oZ4vUKAJawiMqVBqggFnTGAg8UBihxuI4lozBx4k4MH3i+
	xK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=f11jyfUVjOHuRDfVEFIrrNIpHHjnqKwJUtLER7GLaw8=;
	b=IQymarpUbOJd4iI+sBH/kaMYLeez46AnJyVI1K2/wgydPTMU78RkdyCaq+2Z1xIdao
	IPCfb7ZzDohcRdIl6wWbIhAyiS3z9KtYg/DOswJWVrcFq9TIf2DNBJ9k75oobakH/QEQ
	SFBXt3lL6Q55K7/6ZMs9zrSpjCHtwxG7nrwJBjmn1cocJfB+9+FNagFPn+t53oJ9Udkw
	2s+0M9MSQMHbzcb9XIT3dgq5iMjbwPrQurZDVYSuT3QYGzP05DAoz6nhNdXTccJB9MxW
	XkOpxESH3s/QwcGZeGOU86YPGclaQ70cfkjZ5pbb7eLxPOVz4aP43M87UQCMgPkmtu/r
	F6yw==
X-Gm-Message-State: AGRZ1gLyYpTj3f06K2QhF7qD3y1IKS4az5dABgnm1lEbJ824bokDy7oS
	e65n0BT3aP/z7m+SEe9pqkNjml4g
X-Google-Smtp-Source: AJdET5cikE17yaj3ygnJsAdSYA5Dr323hcaOsqVApwLcJDoW2adZbyEOe9LIkSPloJugSwZrllKYXw==
X-Received: by 2002:a2e:449c:: with SMTP id
	b28-v6mr6056209ljf.47.1541784991813; 
	Fri, 09 Nov 2018 09:36:31 -0800 (PST)
Received: from [82.181.15.94] (82-181-15-94.bb.dnainternet.fi. [82.181.15.94])
	by smtp.gmail.com with ESMTPSA id
	a15sm1349519lfj.95.2018.11.09.09.36.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 09:36:31 -0800 (PST)
Sender: anonumiko <anonumiko@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	Pascal Bach <pascal.bach@siemens.com>
References: <20181108105737.21810-1-pascal.bach@siemens.com>
	<CAJTo0LYaW8at7hyOGr2=qwEhSjd22YsZVKghawOjZz78iNuvNw@mail.gmail.com>
From: Niko Mauno <niko.mauno@iki.fi>
Message-ID: <faabaea1-4869-be52-e1f9-9c4ee5dca4fd@iki.fi>
Date: Fri, 9 Nov 2018 19:36:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYaW8at7hyOGr2=qwEhSjd22YsZVKghawOjZz78iNuvNw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: make alternatives for rev and ionice work with busybox
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
X-List-Received-Date: Fri, 09 Nov 2018 17:36:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/9/18 2:24 AM, Burton, Ross wrote:
> On Thu, 8 Nov 2018 at 10:58, Pascal Bach <pascal.bach@siemens.com> wrote:
>> Busybox can provide ionice and rev. They are both installed to /bin
>> The corresponding util-linux variant is installed to /usr/bin
>>
>> This causes the following error during the do_rootfs task:
>>
>>> update-alternatives: renaming ionice link from /bin/ionice to /usr/bin/ionice
>>> mv: cannot stat '/bin/ionice': No such file or directory
>>
>> Moving the util-linux binaries to /bin avoids this error.
> 
> Isn't it simpler to just set ALTERNATIVE_LINK_NAME[ionice] =
> "${base_bindir}/ionice" (so the system knows to use the same symlink
> for this and busybox) instead of actually moving the binary too?
> 
> Ross
> 

Case being that busybox has ionice and rev under /bin/ whereas 
util-linux under /usr/bin/, I wonder would the prudent course of action 
at this point rather be to revert the 'ionice' and 'rev' specific bits 
that were introduced (along 'cal') in 
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-core/util-linux/util-linux.inc?id=78db831a7b0c2361a266eb37c7cbf2e368d2280a 


-Niko

