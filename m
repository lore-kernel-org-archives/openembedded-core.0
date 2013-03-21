Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1UIoar-0004ZC-L2
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 00:08:23 +0100
Received: by mail-ee0-f51.google.com with SMTP id d17so1956580eek.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 15:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:date:message-id:in-reply-to:references
	:user-agent:subject:mime-version:content-type
	:content-transfer-encoding;
	bh=WhWZFCJty9me+KdvnHROx2C8vwdJzBxGDW3A+RDljmY=;
	b=B8Gw90RyB3iKZLaknhqanPjD7/l4/LoKfoQSguFpVnDSJDOk0OaaOvpja1NvbuVJHI
	GnyfNFVlp046ZEZzcWhdmz0l2AXmqeeCmCYJ3httOGcg74oTMlx8aBAI90GOxnFIPvmn
	L5tnaPovVmEK2LfYHn2ucI1YgekB7WVoc5u0eR2IB7kGjN5sulxPuhPkz9wDah/c33d3
	VXVI99CnRSc84jZmNp7f0E9eFK2/FVYiGVc2jjj3ImDSDT61NP4iVW1h076Ywbu1F9H5
	Ro5HPHFWDKOmuVWlhSpNQ4S6pUQjrhzJGxLEDUn5lIer3w6M+6D1zlNauossgr1Wn1Iu
	CRJg==
X-Received: by 10.14.211.65 with SMTP id v41mr86594154eeo.33.1363906288606;
	Thu, 21 Mar 2013 15:51:28 -0700 (PDT)
Received: from [46.207.139.139] (046207139139.atmpu0029.highway.a1.net.
	[46.207.139.139])
	by mx.google.com with ESMTPS id 44sm11113807eek.5.2013.03.21.15.51.27
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 21 Mar 2013 15:51:28 -0700 (PDT)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Mar 2013 23:54:06 +0100
Message-ID: <13d8f28b861.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <1363881315-24352-15-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1363881315-24352-15-git-send-email-richard.purdie@linuxfoundation.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.2.2.20 (build:
	2100226)
MIME-Version: 1.0
Subject: Re: [PATCH 15/16] distro: Add separatebuilddir.inc
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
X-List-Received-Date: Thu, 21 Mar 2013 23:08:23 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 21 March 2013 16:55:14 Richard Purdie 
<richard.purdie@linuxfoundation.org> wrote:
> Going forward its going to be useful to separate build data from source data
> in those autotooled projects which support it. Unfortunately there is a lot
> of breakage so for now, this starts the creation of an opt in list which
> we can iterate over enable more recipes over time.


This does not yet seem to cover the 'O=' family, right?

Cheers,


Sent with AquaMail for Android
http://www.aqua-mail.com




