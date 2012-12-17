Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TkQao-0000Ta-MB
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 03:38:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBH2NT5C017035
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2012 18:23:30 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Sun, 16 Dec 2012 18:23:28 -0800
Message-ID: <50CE8230.6060209@windriver.com>
Date: Mon, 17 Dec 2012 10:23:44 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1355479412.git.Qi.Chen@windriver.com>
	<2ff77d8cdc19c9040f3ede2203700ee91e878e5f.1355479412.git.Qi.Chen@windriver.com>
	<20121214205253.GE8699@jama.jama.net>
In-Reply-To: <20121214205253.GE8699@jama.jama.net>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] ICU: upgrade to 50.1
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
X-List-Received-Date: Mon, 17 Dec 2012 02:38:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/2012 04:52 AM, Martin Jansa wrote:
> On Fri, Dec 14, 2012 at 06:08:52PM +0800, Qi.Chen@windriver.com wrote:
>> From: Chen Qi<Qi.Chen@windriver.com>
>>
>> Upgrade ICU to 50.1.
>> All unnecessary patches of previous version are dropped.
> Here it fails with:
>
> ERROR: Logfile of failure stored in:
> /OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/icu/50.1-r1/temp/log.do_configure.5863
> | configure:3917: checking for gmake
> | configure:3935: found /usr/bin/gmake
> | configure:3947: result: /usr/bin/gmake
> | configure:3983: error: No such directory
> /OE/jansa-test/shr-core/tmp-eglibc/work/x86_64-linux/icu-native/50.1-r1/icu/source
> supplied as the argument to --with-cross-build. Use an absolute path.
>
> Notice native path when building for target (armv5te). Ah and I'm using
> rmwork so maybe it worked for you, because source from native build was
> still available when you started target build.
>
> Cheers,
>

Thank you for testing it :)
This failure should have been fixed in version 2. Are you using version 
1 of this patch?

Thanks,
Chen Qi



