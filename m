Return-Path: <radek.dostal@streamunlimited.com>
Received: from bsmtp4.bon.at (bsmtp4.bon.at [195.3.86.186])
	by mail.openembedded.org (Postfix) with ESMTP id 632E775D4A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 15:19:50 +0000 (UTC)
Received: from [10.1.14.92] (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp4.bon.at (Postfix) with ESMTPSA id 3ns7nK56gqz5tlX;
	Thu,  5 Nov 2015 16:19:49 +0100 (CET)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <1446653201-6456-1-git-send-email-radek.dostal@streamunlimited.com>
	<CAP9ODKqFTU76yL_DqeNku4G3502R00C4K8qwdEtCp5zk1pmJRw@mail.gmail.com>
From: =?UTF-8?Q?Radek_Dost=c3=a1l?= <radek.dostal@streamunlimited.com>
Message-ID: <563B7395.1010104@streamunlimited.com>
Date: Thu, 5 Nov 2015 16:19:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqFTU76yL_DqeNku4G3502R00C4K8qwdEtCp5zk1pmJRw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: properly specify CC for EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 05 Nov 2015 15:19:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Otavio,

> Nack!
>
> The U-Boot is close to the Linux kernel regarding the use of the
> compiler and does a huge set of handling internally to properly pass
> options depending on the SoC, arch and others.
>
> This build error has been fixed in new U-Boot releases and if the
> board required an old version (and cannot be updated) the fix should
> be done on the recipe and not on the common file as it can change,
> behind the scenes, what is in use for several recipes without notice.

Thanks a lot for your valuable input. I was not aware of the fact that 
it was fixed in the upstream already. If you know the commit out of your 
head, it would be great if you could share it.

Thanks,
Radek

