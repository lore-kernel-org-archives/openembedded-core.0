Return-Path: <abuse@basmevissen.nl>
Received: from hosting.emcodev.net (hosting.emcodev.net [178.18.92.162])
	by mail.openembedded.org (Postfix) with ESMTP id 9589071B18
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 17:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id DAA0712AE8C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 18:59:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at hosting.emcodev.net
Received: from hosting.emcodev.net ([127.0.0.1])
	by localhost (hosting.emcodev.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PM7x0NvjQ-we
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 18:59:01 +0100 (CET)
Received: from whisper.local (541CD0EC.cm-5-5d.dynamic.ziggo.nl
	[84.28.208.236]) (Authenticated sender: bas@emcodev.nl)
	by hosting.emcodev.net (Postfix) with ESMTPSA id 598DA12AE84
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 18:59:01 +0100 (CET)
From: Bas Mevissen <abuse@basmevissen.nl>
To: openembedded-core@lists.openembedded.org
References: <CAJ86T=Wp0B_kpgD20y2q89cL=C8hfy5AT0jF42-hiSDE-L+wKA@mail.gmail.com>
	<CAJTo0LZdGvZ2wvuwQR6v-daF8yHyq9+hTrNNAgxj2GHwMEZnBA@mail.gmail.com>
	<CAMKF1src9Pw2=6T7V3J7vmrccFkU5-POCukerpZYFQDxj8we+A@mail.gmail.com>
	<CAMKF1sp2Bft-bhJqT_C0siXFiHJyT8ouqoNQ2vmt-XGnJqw9Wg@mail.gmail.com>
	<13e6f9fa-fc42-68cf-3961-33c43d26e13f@linux.intel.com>
	<CAJTo0LayXt5s0d+Sho6HtWiU53vnoJ5=JaZPLz5hKDXsCB_jtw@mail.gmail.com>
	<d65d071b-28bc-5513-75f1-a609472e6a95@windriver.com>
Message-ID: <bac6804a-6714-a330-3eff-7be20ab16145@basmevissen.nl>
Date: Thu, 3 Nov 2016 18:59:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <d65d071b-28bc-5513-75f1-a609472e6a95@windriver.com>
Subject: Re: version of gdb in morty
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
X-List-Received-Date: Thu, 03 Nov 2016 17:59:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/11/16 16:29, Mark Hatle wrote:
> On 11/3/16 9:06 AM, Burton, Ross wrote:
>>
>> On 3 November 2016 at 13:32, Alexander Kanavin
>> <alexander.kanavin@linux.intel.com <mailto:alexander.kanavin@linux.intel.com>>
>> wrote:
>>
>>     Update to 7.12 for master branch please.
>>
>>
>> To ease backporting to morty, taking 7.11.1 and then 7.12 makes sense to me.
>
> I'm fine with this as well..  The third digit release is small enough of a
> change, I don't think it will impact stability on such a new release.
>

+1

7.11.1 is bugfix only.

7.12 is removing some stuff that might cause breakage. The only new 
thing worth mentioning is Rust support.

-- 
Bas.

