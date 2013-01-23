Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Txz2p-0007WP-AB
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 13:03:08 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id EF955D22E8; Wed, 23 Jan 2013 12:47:41 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 018D3D22CD;
	Wed, 23 Jan 2013 12:47:18 +0100 (CET)
Message-ID: <50FFCDBE.7090202@linaro.org>
Date: Wed, 23 Jan 2013 12:47:10 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <807c839e2a2d9236e4b5a1425d6ca47e200aaebc.1358635193.git.ross.burton@intel.com>
	<1358941121-12772-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<CAJTo0LacJmaNqVTTbctN5Up7r65prWDeE5X9eyNn1Ar8Fo-+kw@mail.gmail.com>
In-Reply-To: <CAJTo0LacJmaNqVTTbctN5Up7r65prWDeE5X9eyNn1Ar8Fo-+kw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: unbreak all builds with custom DISTRO_FEATURES
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
X-List-Received-Date: Wed, 23 Jan 2013 12:03:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 23.01.2013 12:43, Burton, Ross pisze:
> On 23 January 2013 11:38, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
>> Commit 9e7c64ca9afbf27edd0d35a1830ce55ee6d778ab broke all builds where
>> custom DISTRO_FEATURES were used.
>>
>> Resulting images ended in non-bootable state due to lack of initscripts
>> (unless someone had sysvinit or systemd in D_E already).
>>
>> https://bugs.launchpad.net/linaro-oe/+bug/1102910
>> https://bugs.launchpad.net/linaro-oe/+bug/1099405/comments/12
>>
>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> 
> Wow, it's like you're reading my mind.  When I next realise what the
> problem is and what the solution is, I'll await eagerly your fix.

Without help from Paul Eggleton and Martin Jansa I would not get to this
fix.


