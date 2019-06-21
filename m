Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 155AF7E1DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 09:21:57 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id x17so5811965wrl.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 02:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=uI84g4Nu3y0VUmf2x0oIoFVUSiBholNShHjQSUf3234=;
	b=DDC7OwDQLY/qiKakHEwqZM/mf1z2LBpn0KFtOuPurdr2h+7ZWr/8A9e7VGFkOVYz4d
	WNTZODWJhzKvJZJo7Sb+bxqBKcFqS0jj/xTwQ6YQdnnRuSYKXQd6o2wiQUu0Fvoq3lTK
	fBgbgKkhgbWf6l5bZX1MMkwfazOH8/qojkL1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=uI84g4Nu3y0VUmf2x0oIoFVUSiBholNShHjQSUf3234=;
	b=FtI+/m5lyKQgi2LSCrJWpeumpUw19VGZyM2toZGwX2ApbeAgRVBLm/krn1pOTw08o6
	lxdTfCbGRX+NT9WVK2TI1ctezgxNBMJUTdsdjKroSwYkrCUBfqMjfnCXyqmlLlwkyeMO
	Zzo74cgftuTLOuJeBBQTvc8ba81QgBP6J3Uw5aOrcH0Gw4gc2ubppUE2b3AQdPTpXhQX
	DtX2QpOM45NNpW1ZCVsAKuNW0tbdYcDNieB9mKcL8eCm1bqoRUdX3+RIEKNyPKBD+ard
	GgfWDjfvk3hYwmIklaiPwLlGkuhCj9NVLJ/WvBc/pgCJJtQbTeTKqVreL54xN2JTHJKm
	5NdA==
X-Gm-Message-State: APjAAAVuLFzVE9YlnEnXaGHdB++VHoIX12H8miniGv7zCtZCkIYFvi7I
	H6TplKy6o6zPp+2OO+ZkE13pvg==
X-Google-Smtp-Source: APXvYqxETiHlBOv8/Qq/lDSLj7R48cg017zJz9zI/VMB7mjq5tmBYC08yJQJUp+OQyEZayFmhMmRYA==
X-Received: by 2002:adf:f046:: with SMTP id t6mr45595808wro.307.1561108918772; 
	Fri, 21 Jun 2019 02:21:58 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id l8sm3994187wrg.40.2019.06.21.02.21.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 02:21:58 -0700 (PDT)
Message-ID: <62cb3c6a955138027492c53846e65ae02efdba36.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joseph Reynolds <jrey@linux.ibm.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 21 Jun 2019 10:21:56 +0100
In-Reply-To: <bda7b5327801b5556be27645fde22d04@linux.vnet.ibm.com>
References: <bda7b5327801b5556be27645fde22d04@linux.vnet.ibm.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] dropbear: new feature: disable-weak-ciphers
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
X-List-Received-Date: Fri, 21 Jun 2019 09:21:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-06-20 at 16:29 -0500, Joseph Reynolds wrote:
> dropbear: new feature: disable-weak-ciphers
> 
> Enhances dropbear with a new feature "disable-weak-ciphers", on by 
> default.
> This feature disables all CBC, SHA1, and diffie-hellman group1
> ciphers 
> in
> the dropbear ssh server and client.
> 
> Disable this feature if you need to connect to the ssh server from
> older
> clients.  Additional customization can be done with local_options.h
> as 
> usual.
> 
> Tested: On dropbear_2019.78.
> 
> Upstream-Status: Inappropriate [configuration]

Unfortunately this patch has come through line wrapped. I did manage to
unwrap it and get it to apply, only to find the patch itself within the
patch was broken due to missing whitespace line endings.

Also, the Upstream-Status needs to go in the patch itself along with a
Signed-off-by in the patch.

Since I was most of the way there I've fixed this all up and queued it
in master-next for testing.

Cheers,

Richard


