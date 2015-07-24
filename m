Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 673AA76248
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 16:18:39 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id BC33DF811DE; Fri, 24 Jul 2015 10:18:39 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 57C31F811D8;
	Fri, 24 Jul 2015 10:18:39 -0600 (MDT)
Message-ID: <55B26564.2000807@mlbassoc.com>
Date: Fri, 24 Jul 2015 10:18:44 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1437610956-27049-1-git-send-email-gary@mlbassoc.com>	<CAJTo0Lb41pKOft88tttTNE-47wDekSbSUbYyUWT12WydtKgaCw@mail.gmail.com>	<55B16CF0.80405@mlbassoc.com>	<CAJTo0Lb9npwcdNkLbifoaR6P+QgAX76d0go8pq7ozCpEiW7k-w@mail.gmail.com>	<55B171F3.4010009@mlbassoc.com>
	<CAJTo0LbL3bcH_EpWG_WLJhtV14f_cXF5MLVV4oeAqDd7-T0ZKQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbL3bcH_EpWG_WLJhtV14f_cXF5MLVV4oeAqDd7-T0ZKQ@mail.gmail.com>
Subject: Re: [PATCH] libepoxy: Use native python3
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
X-List-Received-Date: Fri, 24 Jul 2015 16:18:39 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-07-24 09:08, Burton, Ross wrote:
>
> On 24 July 2015 at 00:00, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>
>     It seems that my host python3 is broken and doesn't have a working 'argparse'
>        $ python3
>        Python 3.1.2 (r312:79147, Aug 23 2010, 05:17:13)
>
>
> argparse is part of 3.2 onwards (and 2.7 onwards...).  If the script is going to use functions that only exist in specific versions of Python then it should really check.
> Personally I'd say patching the python check to only look for "python" or "python2" would be a reasonable workaround.

I tried that and it worked fine on my [semi-broken-python3] host.

Patch sent.

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

