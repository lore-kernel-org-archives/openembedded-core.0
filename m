Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Tl7AG-00014d-JN
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 01:05:36 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 5FF46D22E9; Wed, 19 Dec 2012 00:50:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id CCEABD22E8;
	Wed, 19 Dec 2012 00:50:01 +0100 (CET)
Message-ID: <50D10126.5080600@linaro.org>
Date: Wed, 19 Dec 2012 00:49:58 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1355821397-23458-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1355821397-23458-2-git-send-email-marcin.juszkiewicz@linaro.org>
	<50D0C156.9050500@linux.intel.com>
	<CAJTo0LZDZjg3fycmeUdgHpkxQJBd3BQXiaSEB1hwJDE7NRO-yw@mail.gmail.com>
In-Reply-To: <CAJTo0LZDZjg3fycmeUdgHpkxQJBd3BQXiaSEB1hwJDE7NRO-yw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] slang: added gnu-configize for AArch64 support
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
X-List-Received-Date: Wed, 19 Dec 2012 00:05:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 18.12.2012 20:56, Burton, Ross pisze:
> On 18 December 2012 19:17, Saul Wold <sgw@linux.intel.com> wrote:
>>> +do_configure_prepend() {
>>> +    # slang keeps configure.ac and rest of autoconf files in autoconf/
>>> directory
>>> +    # we have to go there to be able to run gnu-configize cause it
>>> expects configure.{in,ac}
>>> +    # to be present. Resulting files land in autoconf/autoconf/ so we
>>> need to move them.
>>> +    cd ${S}/autoconf && gnu-configize --force && mv autoconf/config.* .
>>> +    cd ${S}
>>> +}
>>
>> Should these be ${S} or ${B} (or some combination), I believe we are trying
>> to allow for builds to be in a different dir where ${S} != ${B}?
> 
> Yes, I would like people to consider $S and $B when writing things
> like this - whilst at the moment it's a disaster to attempt S!=B, I've
> a branch (ross/bnots on poky-contrib) where I'm fixing/disabling the
> problem recipes.
> 
> I this case, $S then $B should be right, afaik.

The problem is that $S == $B in this case so hard to check which is
proper (for me). I would love to use pushd/popd but they are bashisms iirc.


