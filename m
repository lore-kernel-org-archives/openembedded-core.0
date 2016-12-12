Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 795B471A19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 07:56:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBC7tsCU020778
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 11 Dec 2016 23:55:54 -0800 (PST)
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Sun, 11 Dec 2016 23:55:53 -0800
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <cover.1481269071.git.Qi.Chen@windriver.com>
	<f26e3de2a7a94cb9618f4cc957fe37cbb820a716.1481269071.git.Qi.Chen@windriver.com>
	<alpine.LFD.2.20.1612090255100.13215@localhost.localdomain>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <38a21765-d7bb-04ae-8ac4-88fe0896f1c9@windriver.com>
Date: Mon, 12 Dec 2016 15:56:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1612090255100.13215@localhost.localdomain>
X-Originating-IP: [128.224.162.184]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] Use weak assignment for SERIAL_CONSOLES in qemu configuration files
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
X-List-Received-Date: Mon, 12 Dec 2016 07:56:01 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/09/2016 03:55 PM, Robert P. J. Day wrote:
> On Fri, 9 Dec 2016, Chen Qi wrote:
>
>> Use weak assignment for SERIAL_CONSOLES in qemu configuration files so that
>> the value could serve as a default value and could be easily overridden in
>> configuration files like local.conf.
>>
>> When using the default value for SERAIL_CONSOLES in qemux86-64,we would have
>                                     ^^^^^^
>
>
> rday
>
Thanks for spotting this.

I've fixed the typo and updated the remote repo.

   git://git.openembedded.org/openembedded-core-contrib ChenQi/qemu-console
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/qemu-console

Best Regards,

Chen Qi


