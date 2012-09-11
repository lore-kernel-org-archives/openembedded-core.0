Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1TBIkd-00084M-Et
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 07:11:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8B4wYLi022519
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Sep 2012 21:58:34 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.19.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 10 Sep 2012 21:58:34 -0700
Message-ID: <504EC4F3.30705@windriver.com>
Date: Tue, 11 Sep 2012 00:58:27 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1347300360.git.bruce.ashfield@windriver.com>
	<cc8bfedabfe61a0e06a8a8199f8c0fce4738260a.1347300360.git.bruce.ashfield@windriver.com>
	<20120911045038.GE2980@sakrah.homelinux.org>
	<504EC385.6060008@windriver.com>
	<20120911045557.GF2980@sakrah.homelinux.org>
In-Reply-To: <20120911045557.GF2980@sakrah.homelinux.org>
Subject: Re: [PATCH 1/1] linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates
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
X-List-Received-Date: Tue, 11 Sep 2012 05:11:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-09-11 12:55 AM, Khem Raj wrote:
> On (11/09/12 00:52), Bruce Ashfield wrote:
>> On 12-09-11 12:50 AM, Khem Raj wrote:
>>> On (10/09/12 14:11), Bruce Ashfield wrote:
>>>> Updating to 3.4.10 which has been soaking for a bit now, as well
>>>> as picking up the following meta commits from Tom Z:
>>>
>>> would it also need bumping linux-libc-headers too ?
>>
>> There's no new interfaces in the -stable updates, so there's no reason
>> to bump. I typically elect to jump to a 3.x.0 and leave it there, but
>> we had an interim bump that I wouldn't have done .. so we sit at 3.4.3
>> at the moment (which is still fine).
>
> OK. Next question is, do stable updates get changes such that we need to
> bump the linux-libc-headers ?

Not that I've ever seen. Since there are no new features or user exported
defines that make it into the -stable updates, using the base version 
headers
is reasonable. It saves churn, and keeps all of the QA and testing
results directly applicable throughout feature freeze by leaving the
the stable.

Cheers,

Bruce




