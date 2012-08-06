Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1SyHQB-0006LD-01
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 09:08:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q766uNvU027592
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 5 Aug 2012 23:56:23 -0700 (PDT)
Received: from [128.224.162.182] (128.224.162.182) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Sun, 5 Aug 2012 23:56:23 -0700
Message-ID: <501F6A95.80309@windriver.com>
Date: Mon, 6 Aug 2012 14:56:21 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <cover.1343964466.git.wenzong.fan@windriver.com>	<9ed1d4d30aeac33273968b00c0b5afab059bbc0f.1343964466.git.wenzong.fan@windriver.com>
	<1344205948.3541.2.camel@lenny>
In-Reply-To: <1344205948.3541.2.camel@lenny>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] gdk-pixbuf: fix parallel install issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2012 07:08:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2012 06:32 AM, Colin Walters wrote:
> On Fri, 2012-08-03 at 11:30 +0800, wenzong.fan@windriver.com wrote:
>
>> Make an explicit dependency to the libs install targets would fix this
>> issue.
>
> I don't think Yocto should be running the 'make install' target with
> parallelism enabled; it's just going to be a source of major pain for
> small gain.  Historically Automake's install targets have had a lot of
> paralleism issues AIUI, even discarding modules which have custom
> install hooks.
>
>
Hi Richard,

What's your opinions?

Disable/Enable paralleism for 'make install', this more like a policy
issue rather than tech.

Thanks
Wenzong

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


