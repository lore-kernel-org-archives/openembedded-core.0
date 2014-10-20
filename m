Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4900165CA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 03:15:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9K3FhUu009189
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 19 Oct 2014 20:15:43 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sun, 19 Oct 2014 20:15:42 -0700
Message-ID: <54447E62.2050905@windriver.com>
Date: Mon, 20 Oct 2014 11:15:46 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1413452836.git.kai.kang@windriver.com>
	<6958f500cac37c3534a9f58a8bc7b90cc4c94b7f.1413452836.git.kai.kang@windriver.com>
	<CAJTo0LYZHWzJFtt3xZksna7dj7qx9Esqkn+ONwRBz=S66-sEJQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYZHWzJFtt3xZksna7dj7qx9Esqkn+ONwRBz=S66-sEJQ@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] readline: Security Advisory - readline - CVE-2014-2524
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
X-List-Received-Date: Mon, 20 Oct 2014 03:15:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年10月16日 19:20, Burton, Ross wrote:
> On 16 October 2014 10:48, Kai Kang <kai.kang@windriver.com> wrote:
>> +++ b/meta/recipes-core/readline/readline_6.3.bb
>> @@ -1,5 +1,7 @@
>>   require readline.inc
>>
>> +SRC_URI_append = " file://readline63-003"
> Doing SRC_URI += is the usual thing to do.

OK. I'll send V2.

Thanks,
Kai

> Does this CVE also apply
> to readline 5.2 that we ship as a non-GPLv3 alternative?
>
> Ross
>
>


-- 
Regards,
Neil | Kai Kang


