Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TDvTu-00077X-Mi
	for Openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 12:56:42 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 38512D22DD; Tue, 18 Sep 2012 12:44:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (84-10-244-25.dynamic.chello.pl [84.10.244.25])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 8EB5FD20E0
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 12:43:46 +0200 (CEST)
Message-ID: <5058505C.2040602@linaro.org>
Date: Tue, 18 Sep 2012 12:43:40 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Openembedded-core@lists.openembedded.org
References: <505837BA.2040305@linaro.org>
	<1347958808-20182-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<D02B9EB5-5B6A-4418-A625-DF29275C8703@dominion.thruhere.net>
In-Reply-To: <D02B9EB5-5B6A-4418-A625-DF29275C8703@dominion.thruhere.net>
Subject: Re: [PATCH 1/2] ncurses: Update gnu-config files to version used by OE-Core
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
X-List-Received-Date: Tue, 18 Sep 2012 10:56:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 18.09.2012 12:40, Koen Kooi pisze:
>> +# Update gnu-config files to version used by OE-Core
>> +do_configure_prepend() {
>> +	install -m 0755
${STAGING_DATADIR_NATIVE}/gnu-config/config.{guess,sub} ${S}
>> +}

> Apart from the missing PR bumps

For normal OE builds situation does not change too much so that's why I
skipped PR bump. For 64-bit ARM it does not build without it so no PR as
well.

> isn't autotools.bbclass supposed to handle this?

autotools.bbclass does it in own do_configure. But both db and ncurses
uses own do_configure without calling autoreconf.




