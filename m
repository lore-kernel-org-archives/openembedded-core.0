Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TfodF-0007XY-70
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 10:17:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB493D7t015831
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Dec 2012 01:03:13 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 01:03:12 -0800
Message-ID: <50BDBC70.701@windriver.com>
Date: Tue, 4 Dec 2012 17:03:44 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1354084523.git.Qi.Chen@windriver.com>
	<22684c7fc852e5c43d241e760fe8e1af7095f9ff.1354084523.git.Qi.Chen@windriver.com>
	<50BD667C.6040005@windriver.com> <1354610385.25268.28.camel@ted>
In-Reply-To: <1354610385.25268.28.camel@ted>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] autotools.bbclass: use relative path for acpaths whenever possible
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
X-List-Received-Date: Tue, 04 Dec 2012 09:17:37 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/04/2012 04:39 PM, Richard Purdie wrote:
> On Tue, 2012-12-04 at 10:57 +0800, ChenQi wrote:
>> Hi Richard,
>>
>> I saw that this series of patches have been merged except this one.
>> Is there any problem with this patch?
>>
>> The thing is, if we don't fix autotool.bbclass like this, building
>> coreutils will fail with a long TMPDIR (bug#2766). I tried to build
>> coretuils with TMPDIR of 200 char length, it failed.
> I know but I'm rather unhappy having the autotools code work two rather
> different ways depending on the number of configure scripts a project
> has, it all seems like a bit of a hack :(
>
> I don't like the fix but I haven't found time to propose any
> alternative...
>
> Cheers,
>
> Richard
>
>
OK. I see.
I've tried a lot but I can't figure out a better way to do it.
Hope someone could come up with a better proposal to this problem:)

Thanks,
Chen Qi


