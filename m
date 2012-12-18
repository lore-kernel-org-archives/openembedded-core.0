Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Tkmxj-0000xc-EI
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 03:31:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBI2Ga2P008154
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Dec 2012 18:16:36 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Mon, 17 Dec 2012 18:16:36 -0800
Message-ID: <50CFD215.6000008@windriver.com>
Date: Tue, 18 Dec 2012 10:16:53 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1355479412.git.Qi.Chen@windriver.com>
	<2ff77d8cdc19c9040f3ede2203700ee91e878e5f.1355479412.git.Qi.Chen@windriver.com>
	<20121214205253.GE8699@jama.jama.net>
	<50CE8230.6060209@windriver.com> <20121217194203.GI3448@jama>
In-Reply-To: <20121217194203.GI3448@jama>
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
X-List-Received-Date: Tue, 18 Dec 2012 02:31:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/2012 03:42 AM, Martin Jansa wrote:
> On Mon, Dec 17, 2012 at 10:23:44AM +0800, ChenQi wrote:
>> On 12/15/2012 04:52 AM, Martin Jansa wrote:
>>> On Fri, Dec 14, 2012 at 06:08:52PM +0800, Qi.Chen@windriver.com wrote:
>>>> From: Chen Qi<Qi.Chen@windriver.com>
>>>>
>>>> Upgrade ICU to 50.1.
>>>> All unnecessary patches of previous version are dropped.
>>> Here it fails with:
>>>
>>> ERROR: Logfile of failure stored in:
>>> /OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/icu/50.1-r1/temp/log.do_configure.5863
>>> | configure:3917: checking for gmake
>>> | configure:3935: found /usr/bin/gmake
>>> | configure:3947: result: /usr/bin/gmake
>>> | configure:3983: error: No such directory
>>> /OE/jansa-test/shr-core/tmp-eglibc/work/x86_64-linux/icu-native/50.1-r1/icu/source
>>> supplied as the argument to --with-cross-build. Use an absolute path.
>>>
>>> Notice native path when building for target (armv5te). Ah and I'm using
>>> rmwork so maybe it worked for you, because source from native build was
>>> still available when you started target build.
>>>
>>> Cheers,
>>>
>> Thank you for testing it :)
>> This failure should have been fixed in version 2. Are you using version
>> 1 of this patch?
> Ah you're right, it was probably from version 1 you've sent me off list..
>
> BTW: can we stage only parts of native build which are really needed
> instead of whole workdir?

I though about that too. In fact, I tried it out. I finally decided not 
to do so because:
1) The source dir is not very large.
2) Copying all those necessary directories would make the code look 
strange. After all, at least the following directories have to be 
copied, config, bin, lib, stubdata, tools. I'd rather prefer a one-line 
solution.


Cheers,
Chen Qi
> Cheers,
>



