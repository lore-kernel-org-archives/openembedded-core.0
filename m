Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f45.google.com (mail-vb0-f45.google.com
	[209.85.212.45])
	by mail.openembedded.org (Postfix) with ESMTP id 572D76C742
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 11:47:52 +0000 (UTC)
Received: by mail-vb0-f45.google.com with SMTP id m10so966513vbh.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 03:47:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NWDs6zScJhEJ9I5orNV0VHh6NrL0MHBIBUHFzw+3uf4=;
	b=MajrsZqf9xyVBRkAsZ0grAv7KY16VXGqgVIvuyDvSt/007vf6R43XK4YHFdIqSJ65k
	Mle4/CPrVHxKxj4/LgdRRSioQ3461SMBdfPCr4aj89Iy/W66AGnMPz2LAf7YgmipZNfx
	B3eMknlgrG0fapWDOQS0I6QX/ONl92N6FBjovDzEi7882YfoqLbjAYkkpX+wp9WZ3diL
	TfUovKzgteGW7hawEAuktObfRkFh4CMoJt+v/bkFBQoREUI4CeXoGl24vI+DT1tJcblL
	6szbqhWj0f8EDT7mARpnBgX9d2uQbXYH0avlcT5NBaDhRgZpwC2Mv25ACsAIkdpVKdkE
	c/Jw==
X-Gm-Message-State: ALoCoQlAd45GPOzhLQM/lyljTLz5UdQRo4rcEi3DgZSs45943ELPwXbJLlTW8rIBjzs2NP00sWIa
X-Received: by 10.58.50.71 with SMTP id a7mr4180808veo.32.1390477672816; Thu,
	23 Jan 2014 03:47:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Thu, 23 Jan 2014 03:47:32 -0800 (PST)
In-Reply-To: <B6D70178-C80E-4804-9786-47A67B9EB230@dominion.thruhere.net>
References: <1390467988-25693-1-git-send-email-koen.kooi@linaro.org>
	<CAP9ODKoU+va9SbCJAfZ4HMkz+==Ec9va0KjJX07c4d4cZ90bjg@mail.gmail.com>
	<17C27E68-3F62-414D-A02A-8AD06ACE0B66@dominion.thruhere.net>
	<CAP9ODKrUBJJJHTTBkRmq9j+yOrgGyUfX3TC5L69-ynaDbefo0A@mail.gmail.com>
	<B6D70178-C80E-4804-9786-47A67B9EB230@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Jan 2014 11:47:32 +0000
Message-ID: <CAJTo0Lb3xQTSJdfXHpMyGTPMALcCHki4pgG5MvEFHiX-yNYezw@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Koen Kooi <koen.kooi@linaro.org>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lz4: actually install things
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
X-List-Received-Date: Thu, 23 Jan 2014 11:47:52 -0000
Content-Type: text/plain; charset=UTF-8

On 23 January 2014 11:40, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>> Couldn't it inherit autotools?
>>>
>>> It's a handcrafted Makefile, not autotools :(
>>
>> No problem, it works as well.
>>
>> The do_configure checks for configure.ac/configure.in and it avoid you
>> to handcraft do_install and like.
>
> The recipes that used such a workaround have all been changed to remote autotools.bbclass over the years, so I'm not sure how encouraged it is.


Personally a recipe should only inherit autotools if it actually uses
autotools.  Hand crafted makefiles should mean hand-crafted recipes.

Ross

