Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TU7DE-0003Ep-Nw
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Nov 2012 03:42:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA22ScPA020405
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Nov 2012 19:28:38 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 1 Nov 2012 19:28:38 -0700
Message-ID: <50932FD4.6090307@windriver.com>
Date: Fri, 2 Nov 2012 10:28:36 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <CAAQYJAtxfQDkODhaPZP1Z8honP1azA1B6PuQ_DfjtuB--8YnvA@mail.gmail.com>
	<508F8AD7.2000006@windriver.com> <1351671493.2828.71.camel@ted>
In-Reply-To: <1351671493.2828.71.camel@ted>
Cc: Morten Minde Neergaard <mneergaa@cisco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: devshell spawning twice
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
X-List-Received-Date: Fri, 02 Nov 2012 02:42:25 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/31/2012 04:18 PM, Richard Purdie wrote:
> On Tue, 2012-10-30 at 16:07 +0800, Robert Yang wrote:
>> I met the same problem on openSUSE 12.1 64 bit.
>>
>> I used ssh -X to opensuse, and my client is Ubuntu 11.10 32bit
>
> The trouble is the removal of:
>
> os.environ[export] = str(value)
>
> I think we're going to have to add this back since it looks like we need
> the parent environment adjusted as well as that of the child.
>
> For now I'm tempted to add that line back...

Hi Richard,

I'm sorry, but it doesn't work well, it only spawns once now,
but the environment is incorrect, for example, the PATH:

$ echo $PATH
/usr/lib64/ccache:/usr/local/bin:/usr/bin

I tested it on Fedore 17 64bit and openSUSE 12.1 64, either of them
didn't work.

// Robert

>
> Cheers,
>
> Richard
>
>
>
>
>


