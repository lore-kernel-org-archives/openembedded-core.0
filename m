Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id C567E78DC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 11:15:48 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h14-v6so16219373wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 04:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XoVlxhDMlBicdhKu04EkNTVRoTLXMhB1tzhfpaZSYkk=;
	b=K3/1pqV+OjwkU4g13PqLP6Bf+MpkpKOB+UlILRji4qPMdXplJJoIg0SKvb3fKLHgZI
	j+Gd2Ao8SQlGZRciphcvrPudnjk0yWUc1XJrxFDxInNofaUZmiQTiA5VA9lujxMgClJ+
	stw5Q0IX7StFh3tYjWMqG+ZxCF7UVNQBwQTn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XoVlxhDMlBicdhKu04EkNTVRoTLXMhB1tzhfpaZSYkk=;
	b=Yvcw9q4RgHx+NtobB2UWypfaiK0qCdma22TtrdgpAjxMHDpGkyU435eFgK1KGDk4Uf
	6CpbPfarenwApn8uAGUlQhP1deytsFgJ+bqoCnkmHq9FdyJsRNCffj4wu0RbPo1sJL4h
	8Mx9uLbpZkN/UzzWKRE1sz0HWeq0ZZ6dcUYgXiBebclk982JWoEELR2z0WGUOEEtFm/4
	FCboN9b0F3lHhZuLQ75EaHl+srA9Tvo1IFv4091SRd0x29IdRDYVB8cRvQ4JYxELfZE4
	eXi5jvj5tNd5UIOB+4xFX8iaHPqkekamj49xcopidTaV+CAWG4absKJf+czaGkeKcFFm
	rAQA==
X-Gm-Message-State: AOUpUlFAfDzMLLlHYqXPRjBGqrtqjShsAD6AATWBwkwVhxc4ZePZaqRX
	oYA9/iRnIZ0lqaFEv7k+VR5g+w==
X-Google-Smtp-Source: AAOMgpe9uxKtBnzF5pIYzJWWvgmHsWaKSCMztkRire4G1X4KYCBV0gG5almJRfYO4NK6ZxMPCe5M9Q==
X-Received: by 2002:adf:8796:: with SMTP id
	b22-v6mr21255564wrb.92.1533035749426; 
	Tue, 31 Jul 2018 04:15:49 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u185-v6sm2614374wmg.25.2018.07.31.04.15.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 31 Jul 2018 04:15:48 -0700 (PDT)
Message-ID: <619fe34cca9bc682823913d12cc88486f8458d72.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2018 12:15:47 +0100
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF738709F509@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<1529783581-46179-9-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<575b002da9b0b86490a3eada07f254428549965e.camel@linuxfoundation.org>
	<33D4DBCAC5F2D74E96B07F6E7632BF738709F509@G08CNEXMBPEKD01.g08.fujitsu.local>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH 8/8] [PATCH v2] meta-toolchain: Added dnf-nativesdk into cross-development toolchain.
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
X-List-Received-Date: Tue, 31 Jul 2018 11:15:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-07-31 at 02:18 +0000, Zheng, Ruoqin wrote:
> Hi Richard
> 
>       eSDK is actually a better technique for developers.  But it’s
> only suitable for those people who has experience on Yocto Project.

Remember that the eSDK can function just like the SDK. You can use more
of its tools but you don't have to.

>       In the other hand, using dnf-nativesdk in meta-toolchain to
> customize rootfs is easier fot those people who are familiar with
> dnf(I think most linux user known it).

Why not add some dnf like wrappers around the eSDK though? We have
tools like devtool and recipetool but there is a lot of potential to
add a simpler interface to enable these "customise rootfs" type of
workflows.

>       For example, developers finish the OSS build work and provide
> the toolchain and packages to users. In this case, users do not need
> to know any knowledge about yocto build system but just how to use
> dnf to install a rootfs.
> 
>       So it can reduce the workload of end-users who need to
> customize rootfs for their embedded device. At lease, they don’t need
> to maintain a yocto build server.

The eSDK behaves very much like the SDK and then you have access to
whichever tools the eSDK is providing, all the way up to the full build
system but only if you need that.

I still think there is the option of providing some simpler tooling to
the eSDK which would work for the kinds of users you're talking about.

Cheers,

Richard


