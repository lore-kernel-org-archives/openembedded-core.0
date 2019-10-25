Return-Path: <twoerner@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id A15A87F8AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 13:22:07 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id t20so3132068qtr.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 06:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mhxWx2BpaMwR7ABAhYGFZ5lQ9lHCpzjzwQV1LPPptFU=;
	b=m3hcysnG3Xu2m4NW6KmWjoT2wC5aVLxsFh2ssp6V3H9yQESAPT5jaf8UqcxQFejuN3
	1BVIJbYWZyNLBZ4kjQsyflKmyF+zXLXAXEkY1h3oe2qKWU1BQvKLi7LOVjev/0TWFbjb
	vk++hdQML8Wp/sewFgtbeatMUpBAh2Ck1wM9Cv0BI1VLo5nhGWASM8Ku4dGAigTkVy/F
	vwR3hdAbDkG+IvcmIseaZ/+7+S1jSMU0Kma8DvvSQXbwjAOfotTJCvDs9sEj4MnfemXC
	Try+iEeBe1YdiYwlWmxw9B1MineqzYc9JiiOk4Bstfp9Lz0O54DBMPJ6fa4Alnbwg8bo
	kKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mhxWx2BpaMwR7ABAhYGFZ5lQ9lHCpzjzwQV1LPPptFU=;
	b=n3NZT7RPZ6ifAIvPjsf9l6SLcupRjVcDUXY9yoy7K2nk5l26nzkfkZB9IQzLfOg48T
	2sT0FHR7B0n8UVQG2IKgbqTdS6DUOfUVmZsaE31ZZjJ1w8AlFr7s60Cf6jBkAw28Q2V7
	6knvh13a3dtsmlpoxFpnFiP0dwzjL9Ypfwq/oHb1vZWqjpJevS1faqGP6jwk3rKSVa51
	KvpX3joq6BQjfhw/3EiQ2eH+2+Ialdkiyc7G+Aqy144w0V7A4uYXICjjZ8buycq8lf1l
	SuesU871MaZpo4icUZUJA+fWhv0UjHicrp/mHyZ/Ye+Ajklha+D5Y93Unn7fLH3oIVAI
	XoMQ==
X-Gm-Message-State: APjAAAVE1XBYeak+4EL5TXUNE4fvgAOYXcA+L3AB4iCi5rvpYut4b0ZB
	fJXQtIbkq+fnrZ6/GQkzmEQ=
X-Google-Smtp-Source: APXvYqw2q3U9PfsmlTYqXB0kFd33zxuifA4r3qavZ2BpB8J8a9IHaVXoCdTeRCxyW1FF8nN1XXFERg==
X-Received: by 2002:a0c:c541:: with SMTP id y1mr3054954qvi.133.1572009728404; 
	Fri, 25 Oct 2019 06:22:08 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	x64sm1051738qkd.88.2019.10.25.06.22.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Oct 2019 06:22:07 -0700 (PDT)
Date: Fri, 25 Oct 2019 09:22:04 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191025132204.GB19333@linux-uys3>
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
	<20191024230510.smxm7zf3qvpec3xy@apollo.localdomain>
MIME-Version: 1.0
In-Reply-To: <20191024230510.smxm7zf3qvpec3xy@apollo.localdomain>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcap-ng:upgrade 0.7.9 -> 0.7.10
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
X-List-Received-Date: Fri, 25 Oct 2019 13:22:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu 2019-10-24 @ 04:05:10 PM, Khem Raj wrote:
> perhaps you need to add -pthread to LDFLAGS

That's what it feels like.
I'll set up a test build.

I'm pretty sure I've stumbled across this in the past, but it seems like
different distros package the crypto things differently, therefore building on
some distros require linking to one set of libraries, and building on other
distros require linking to a different set. Does that seem right?

Is there a mechanism for telling OE to tweak a parameter based on the distro
on which it is building? A distro override of some sort?

