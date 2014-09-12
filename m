Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 18EE171368
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 10:32:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8CAWRPk012850
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Sep 2014 03:32:27 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 12 Sep 2014 03:32:26 -0700
Message-ID: <5412CBB8.5080409@windriver.com>
Date: Fri, 12 Sep 2014 18:32:24 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1410507789-9307-1-git-send-email-kai.kang@windriver.com>
	<CAJTo0La9+9YnJPPaCNXp_7H+_ejYVuOgKb8QRNkV0q3hdZRnAw@mail.gmail.com>
	<5412CA29.1090001@windriver.com>
	<CAJTo0LbogmM5pnT8Y9ZhyS5-Vq63pHU71c2P02yy3v_jbGciRw@mail.gmail.com>
In-Reply-To: <CAJTo0LbogmM5pnT8Y9ZhyS5-Vq63pHU71c2P02yy3v_jbGciRw@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: Joe Slater <jslater@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add machine qemuarm64
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
X-List-Received-Date: Fri, 12 Sep 2014 10:32:30 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年09月12日 18:29, Burton, Ross wrote:
> On 12 September 2014 11:25, Kang Kai <Kai.Kang@windriver.com> wrote:
>> Thanks for try. I just thought to send the patch of gcc  to upstream  first
>> then fill the Upstream-Status. I'll send it now.
> Ah, that would be the problem. :)

Oops. The patch of gcc is for another issue about directory of 
ld-linux-aarch64.so.
I once met this linux-yocto issue but it builds pass after adding

BASELIB_aarch64 = "lib64"

I'll check it.


Thanks,
Kai

>
> Ross
>
>


-- 
Regards,
Neil | Kai Kang


