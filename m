Return-Path: <zboszor@pr.hu>
X-Greylist: delayed 1473 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 Oct 2018 06:16:58 UTC
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id 69FC874712
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 06:16:58 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1gD1EQ-0000DI-7y
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2018 07:52:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Ki5UNvU1yOpU7459urYRW5uRaPrFgUqv8gZRUtH+JVo=;
	b=Dwx/hMPJtUQOFMniznZDP2VlOd
	SmlPsws8fRyzIdFQT1mDHi/Ug4oqLhLDc+T3Wyr/eyNL7k7gBUEex1cx4JvD4nBvs5bskZx/JJopb
	S4Qu0HTcVndQa6POYQRciiO6QYlPHmB4TDUduE/r0rXH92RaSrDvLeF2n8SxckCnoPaYqMavS6OKN
	5qvy/te+f852AEs8er6bxkx4m0If/rM0s28I662rFZTNNe+yQdCwrOeI7Cfvu3IOL0Qwjix2O71g0
	MCfNSZktYw2mbL78KDBfbYQ2sWHIj/MQ/JUuSb6ZOcA1Ly1gCSfkYx01fxxp7wA5M5114qKm/NEZX
	zfflsIWQ==;
Received: from host-87-242-50-224.prtelecom.hu ([87.242.50.224]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>) id 1gD1EM-00013B-KC
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2018 07:52:24 +0200
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <4fc852c0-3bc3-c292-6d0e-613d16b313b3@pr.hu>
Date: Thu, 18 Oct 2018 07:52:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Scan-Signature: 590f427944e86919b339bef1bc8dcd47
X-Spam-Tracer: backend.mail.pr.hu 0.5 20181018055224Z
Subject: do_rootfs does not create /etc/shadow and /etc/gshadow
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
X-List-Received-Date: Thu, 18 Oct 2018 06:16:58 -0000
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

I have started moving my Yocto based custom OS to Yocto 2.5.

The problem is that when I want to build an image, groupadd fails
during the preinst of the mariadb-server package.

It seems the underlying problem is that both shadow and gshadow
are missing from the rootfs /etc directory, group and passwd are
there.

I checked that my previous Yocto 2.2 and 2.4 image builds both
have these files.

What has changed in Yocto 2.5 that would prevent creating
shadow and gshadow in the rootfs?

My layer has its own distro related configuration including a
custom bitbake.conf that only minimally differs from the
openembedded-core/meta one.

Thanks in advance,
Zoltán Böszörményi

