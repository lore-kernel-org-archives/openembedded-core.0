Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8C13A705AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 19:07:19 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id w10so1712272pde.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 12:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=hXI8AzVqKv5UsOCjUTBu44+hquNirrzI89eRg4KZjuY=;
	b=cdQuaXRvyL53d9k6248nwVA5qH0SxVMpw6kCJ1drtrJFMR43cBgSIm0Tw0jqkEMBNJ
	kOsOdi1dKyJa3F+8ChU9bxtwbnOK80fgNLGH1UUHmic7NkgYdvdyyua6N7/62W8R9ece
	vRUj5ZRVGnruLbeCl2FPko8nOS+GpVJoJcuFYXaEPOPKGAsD0dfllsPoJpHnZPXTNuym
	7VUkgsXR84Blc3HgwK3acaJUpsOQiC5i3l7mjjhUd4pN7a8iVGn2QAnXRi601Q0b/fCM
	Jqm8o5rNqZp3vAMH/17uwMJh7MZ41Pa0E7uIgc/sB90LW5PjTJRj2Yhup1VagJSmm5CU
	fE7A==
X-Gm-Message-State: ALoCoQnpCAjDNYEV1LYdJKg93kJhWOgzZAeYhdZKFk0bfyjN7oys1+4/YkTBPS30PEJp9pijph4l
X-Received: by 10.68.166.36 with SMTP id zd4mr32048429pbb.54.1405537640868;
	Wed, 16 Jul 2014 12:07:20 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id jt7sm136733pbc.46.2014.07.16.12.07.19
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Jul 2014 12:07:20 -0700 (PDT)
Message-ID: <53C6CD64.2090807@mvista.com>
Date: Wed, 16 Jul 2014 12:07:16 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1405388483-30716-1-git-send-email-akuster@mvista.com>
	<1405501880.20402.17.camel@ted>
	<CAJTo0LY6uP-92RmP31eTNZtb5cPkor1d2Ornw0q-Okd2E0KGYg@mail.gmail.com>
In-Reply-To: <CAJTo0LY6uP-92RmP31eTNZtb5cPkor1d2Ornw0q-Okd2E0KGYg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] V2 lz4: update to latest version
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
X-List-Received-Date: Wed, 16 Jul 2014 19:07:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Did not mean to generate extra work for you all.

Thanks for the input. I will go back to the drawing board.

regards,
Armin
On 07/16/2014 06:48 AM, Burton, Ross wrote:
> On 16 July 2014 10:11, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> I'm still a little concerned about this change from svn to git. Which is
>> the definitive source? It looks like the svn repo is active too?
>>
>> I just don't want to end up in a position where we're pulling from
>> someone's hack'n'dev version of lz4 rather than the place considered the
>> real "master" source...
> The revision histories *are* different (commits marked "untested" and
> then fixed in another commit) but the owner of the git repo is the
> same as the owner of the svn repo.  It looks like git is his working
> area and then changes that have been tested are merged and committed
> to git.
>
> Unless there's a good reason I'd keep with the svn repo for now.
>
> Ross


