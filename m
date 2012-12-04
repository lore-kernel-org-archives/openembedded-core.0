Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Tfi57-0003Uz-P9
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 03:17:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB423YR0024896
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Dec 2012 18:03:34 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Mon, 3 Dec 2012 18:03:33 -0800
Message-ID: <50BD5A15.3020806@windriver.com>
Date: Tue, 4 Dec 2012 10:04:05 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1354531187.git.Qi.Chen@windriver.com>
	<4973f2f88641f8a8c02b0062b31f159977d9ba0a.1354531187.git.Qi.Chen@windriver.com>
	<CAJTo0LZOOuZ7RJ+f+hXPckxRrPr9CU8c4KPT5sgSSo1rm7q=eQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZOOuZ7RJ+f+hXPckxRrPr9CU8c4KPT5sgSSo1rm7q=eQ@mail.gmail.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] ICU: add pkgconfig support
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
X-List-Received-Date: Tue, 04 Dec 2012 02:17:58 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/2012 07:50 PM, Burton, Ross wrote:
> On 3 December 2012 10:42,<Qi.Chen@windriver.com>  wrote:
>> +ICU-3.6 has no pkgconfig, so I add it here.
>> +But ICU has had pkgconfig support since 4.6.
> Is there a reason we can't just bump oe-core to 4.6?
>
> Ross
>

I'm not sure. Maybe we bump ICU to the latest version later. (If nobody 
does it, I'll find time to do it, and test it.)
The reason I add pkgconfig to ICU-3.6 is that I think it's better to do 
one thing at a time.

Thanks,
Chen Qi


