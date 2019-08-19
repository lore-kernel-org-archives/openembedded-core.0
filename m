Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 656117D27B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 02:00:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7J207Tn006597
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 18 Aug 2019 19:00:08 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 18 Aug 2019 19:00:07 -0700
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAP9ODKqnJX-fLme5JUQF8XAHr2hDzJ31auZPQGOUQCehuTb4XA@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <b3e14a93-8d27-c5f4-0895-8122a030d451@windriver.com>
Date: Mon, 19 Aug 2019 09:59:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqnJX-fLme5JUQF8XAHr2hDzJ31auZPQGOUQCehuTb4XA@mail.gmail.com>
Subject: Re: Conflict of systemd and sysvinit
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
X-List-Received-Date: Mon, 19 Aug 2019 02:00:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/8/18 上午3:27, Otavio Salvador wrote:
> Hello,
>
> I found a build error at master.
>
> Collected errors:
>   * check_data_file_clashes: Package systemd wants to install file
> .../rootfs/sbin/telinit
>          But that file is already provided by package  * sysvinit
>
> Can someone take a look?

Hi Otavio,

Would you like to give more detailed steps how the error occurred? And 
what's extra settings in you local.conf please?

Thanks,
Kai

>

-- 
Kai Kang


