Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <derek.buitenhuis@gmail.com>) id 1Sy3rO-0000zo-Hy
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:39:22 +0200
Received: by yenm12 with SMTP id m12so174724yen.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=WQurZ8Xt5gfiG6bDE2dVzeyBuKrjpx2DMu3ETxGAFII=;
	b=u/V3wp9A7z47RUppZFWfEG1HReRY/oO/lKtiWx8dyMvMC+o/6ruV62iYeXXFbagXti
	h77djpRkJdyGqC5HTO41863ctMYSct71iXuJjY8yAj1qPT3+15RWjjnp4mIvuYcVUrsJ
	wxtmkEA4XX0DT9FMwhL76HLD5JKXumsKtDQdVzyNQ8NHQ6YWcD2ber3620bGZPUfTPww
	S+IvuV8hDNf94iFImnZYXzG55nLY71XFrwUWJv2NjVpAhq/Pgc2MwDwZe/lTx1Cc5TH1
	M1ufQaUBEE67+O7Bxib2/FLjIKqre2zWCZ4QYSO6VUEc8rsDhOxfKTWQBWbkjV4bz0BY
	s1KQ==
Received: by 10.50.222.200 with SMTP id qo8mr3309241igc.20.1344184058063;
	Sun, 05 Aug 2012 09:27:38 -0700 (PDT)
Received: from [192.168.1.111] (S0106586d8f4832af.tb.shawcable.net.
	[24.109.142.27])
	by mx.google.com with ESMTPS id ud8sm9029813igb.4.2012.08.05.09.27.36
	(version=SSLv3 cipher=OTHER); Sun, 05 Aug 2012 09:27:37 -0700 (PDT)
Message-ID: <501E9EF3.2020208@gmail.com>
Date: Sun, 05 Aug 2012 12:27:31 -0400
From: Derek Buitenhuis <derek.buitenhuis@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343942157-15997-1-git-send-email-yao.zhao@windriver.com>
	<501D7090.2040500@gmail.com>
	<EB05DE7F-A81E-4CF6-BD49-F93604EA1EDF@dominion.thruhere.net>
In-Reply-To: <EB05DE7F-A81E-4CF6-BD49-F93604EA1EDF@dominion.thruhere.net>
X-Enigmail-Version: 1.4.3
Subject: Re: [PATCH] gstreamer: gst-ffmpeg: fix build issues for libav
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Aug 2012 16:39:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/08/2012 7:52 AM, Koen Kooi wrote:
> I find it a lot easier to build gst-ffmpeg against an external libav, that way you don't have to jump through all these hoops to get a proper libav. That's what the meta-oe bbappend does :) 

I've always wondered why Libav was not its own recipe. It seems like it
would be a lot easier to maintain... calling its configure from gst's
configure is... unpleasant. :)

- Derek


