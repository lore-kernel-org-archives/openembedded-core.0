Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A4F1C7E30F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 13:22:20 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u16so702387wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 06:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=0622u0aHa3JBAe8//bTzY9a8i+nyLg3APDkO7gYfWK8=;
	b=IEa7+9IN6J/QYUBcOaCgRPhNg/+8BN5TjcInjof7f6slc7SPEBinvF+PVIR4OkO/HA
	pdsT203pz7S9wNA301GPE0SILRroYpp9EBvnby0io/jbQwXN0I4t3EbzUg0NPkcfQ4KK
	2i8x+gNPgPG7wN7R0PbLg5pCC7iL/nmpMrwwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=0622u0aHa3JBAe8//bTzY9a8i+nyLg3APDkO7gYfWK8=;
	b=Yz/zet5OU0vu9mamAIZU7Wbc7SY8+QGxkz24rVBSaz4fk8a5qcuz0D3JF4REb5BZ8N
	K/lRyYa2plFXKiVOdRff+zJlgG46l8cQeIYs3jSaUgCEmRwEh4+NHZ6BiQIDQnxg9Uyv
	d6VjxswSopxYFr1/8uxnrZCY5cYe3VQXhNZhXHC1T58Cao4ZbmIfmqNwPU4RZU4p2Nwf
	RSs2X2jrslUUUNJzi3KyyNoYlnOu8AQn6xVl5QaHq5iREvmhYrqVV/UqJn/HNgKJZgF9
	VT30ET4XF+ahrVL7xRTbElH/u2Yff1ANLw1wKCV2NjXuSxfuiradEE3fDZ8U7xlpAs4o
	WMOw==
X-Gm-Message-State: APjAAAX9JMDJSwdeTt3gRY4nWulzcc/wmxOFNNYajfrv6wE5/309uCUw
	QphAPs/B5cS2hvUZoL6eUCKqow==
X-Google-Smtp-Source: APXvYqySDgrSCvp4fHOHkicyzdi3eYbgI2tPN4WOwy/InGD/Uwpd1qqecCe2BfRic3s9OOMDz1nePA==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr6125014wmj.153.1559308941244; 
	Fri, 31 May 2019 06:22:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n14sm2350467wra.11.2019.05.31.06.22.20
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 06:22:20 -0700 (PDT)
Message-ID: <dc3b129e2bf00200521f1a86d1384a1087fa4664.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 31 May 2019 14:22:18 +0100
In-Reply-To: <CADkTA4M=hUbCPwa6H_KMFN=hDbpdy-XE5kZ8magBQFD-f=ML0w@mail.gmail.com>
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
	<18e169f17346d84787ec550696cf0cc19ea83256.camel@linuxfoundation.org>
	<CADkTA4M=hUbCPwa6H_KMFN=hDbpdy-XE5kZ8magBQFD-f=ML0w@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] linux-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 31 May 2019 13:22:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-05-31 at 08:53 -0400, Bruce Ashfield wrote:
> On Fri, May 31, 2019 at 4:01 AM <richard.purdie@linuxfoundation.org>
> wrote:
> > 
> > This fails in testing with one failure on qemuarm:
> > 
> 
> bugger, I didn't expect that!
> 
> I'll dig up how I mocked up a systemtap test environment before (it
> will be next week before I get to it though (unless I'm lucky), since
> my cycles today are spoken for)

FWIW this is some change after 5.0.13 that is triggering the issue. I
can likely merge the patches to that point (tests are still
completing).

Cheers,

Richard


