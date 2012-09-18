Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TDwPU-0000IY-5c
	for Openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 13:56:12 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 98731D22E8; Tue, 18 Sep 2012 13:43:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (84-10-244-25.dynamic.chello.pl [84.10.244.25])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2DCA5D20E0;
	Tue, 18 Sep 2012 13:43:05 +0200 (CEST)
Message-ID: <50585E44.4090909@linaro.org>
Date: Tue, 18 Sep 2012 13:43:00 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <505837BA.2040305@linaro.org>
	<1347958808-20182-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1347958808-20182-2-git-send-email-marcin.juszkiewicz@linaro.org>
	<CAJTo0LZg-u9dePdVbM+zH-izFjiE99Ks9aRKt1=_3qZFQWnhZQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZg-u9dePdVbM+zH-izFjiE99Ks9aRKt1=_3qZFQWnhZQ@mail.gmail.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] db: Update gnu-config files to version used by OE-Core
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
X-List-Received-Date: Tue, 18 Sep 2012 11:56:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 18.09.2012 13:20, Burton, Ross pisze:
> On 18 September 2012 10:00, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
>> +# Update gnu-config files to version used by OE-Core
>> +do_configure_prepend() {
>> +       install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.{guess,sub} ${S}
>> +}
> 
> Why can't the autotools class do this for every package?

It does it in own do_configure by calling 'autoreconf'. But some
packages have their version of this function.



