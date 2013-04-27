Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UW6gd-0001Vp-3I
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Apr 2013 17:05:19 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id C01FBD231E; Sat, 27 Apr 2013 16:46:55 +0200 (CEST)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 11B02D22E8;
	Sat, 27 Apr 2013 16:46:23 +0200 (CEST)
Message-ID: <517BE4DF.5000009@linaro.org>
Date: Sat, 27 Apr 2013 16:46:55 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <5E6BBD57-21F8-4282-97F0-567ACFB008CD@dominion.thruhere.net>
	<517BB1B6.1000307@linaro.org>
	<D91948D7-E76F-45D9-B3F8-B2297AA8EF12@dominion.thruhere.net>
In-Reply-To: <D91948D7-E76F-45D9-B3F8-B2297AA8EF12@dominion.thruhere.net>
X-Enigmail-Version: 1.4.6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Annoyances with dylan
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
X-List-Received-Date: Sat, 27 Apr 2013 15:05:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 27.04.2013 14:18, Koen Kooi pisze:
> 
> Op 27 apr. 2013, om 13:08 heeft Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> het volgende geschreven:
> 
>> W dniu 26.04.2013 16:47, Koen Kooi pisze:
>>
>>> I have 2 big annoyances with dylan:
>>
>>> To trigger 2) I updated meta-linaro
>>
>> Do you want 'dylan' branch of meta-linaro?
> 
> That would make life easier, yes :)

No problem:

16:46 hrw@puchatek:meta-linaro$ git checkout -b dylan
Switched to a new branch 'dylan'
16:46 hrw@puchatek:meta-linaro$ git push git.linaro.org
Total 0 (delta 0), reused 0 (delta 0)
To ssh://git.linaro.org/srv/git.linaro.org/git/openembedded/meta-linaro.git
 * [new branch]      HEAD -> dylan
16:46 hrw@puchatek:meta-linaro$ git log -1
commit 79d20a4127639e961e671de24c94ea2621fce93e
Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date:   Fri Apr 26 11:53:06 2013 +0200

    linaro images: add libunwind to SDK

    Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>



