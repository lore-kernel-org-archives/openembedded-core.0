Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UMrmX-0008U2-IC
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 05:21:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3233xmk012461
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Apr 2013 20:03:59 -0700 (PDT)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 1 Apr 2013 20:03:58 -0700
Message-ID: <515A4AA7.2050006@windriver.com>
Date: Tue, 2 Apr 2013 11:04:07 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1364793033.git.Qi.Chen@windriver.com>
	<be55160b84e74f803f6dce4ba755225538a76651.1364793033.git.Qi.Chen@windriver.com>
	<24D31CC5-0333-455D-BE77-A4D0DF9E8AD7@gmail.com>
In-Reply-To: <24D31CC5-0333-455D-BE77-A4D0DF9E8AD7@gmail.com>
X-Originating-IP: [128.224.163.154]
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] core-image-sato.bb: increase free space size
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
X-List-Received-Date: Tue, 02 Apr 2013 03:21:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/02/2013 10:59 AM, Khem Raj wrote:
> On Apr 1, 2013, at 7:30 PM, Qi.Chen@windriver.com wrote:
>
>> +
>> +# Override IMAGE_OVERHEAD_FACTOR to increase the free space size on sato images.
>> +IMAGE_OVERHEAD_FACTOR = "2.0"
> what is the size of image before and after ?
>
roughly 100M -> 300M.
smart automatic testing will use over 90M. see 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4109 for more details.

IMAGE_OVERHEAD_FACTOR defaults to 1.3.

Thanks,
Chen Qi


