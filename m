Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 340DD6CA0E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 10:28:55 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08ASm7B004640; Wed, 8 Jan 2014 10:28:48 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NCzJSpIIQ25G; Wed,  8 Jan 2014 10:28:48 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08AShoP004632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 8 Jan 2014 10:28:44 GMT
Message-ID: <1389176918.6899.75.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 08 Jan 2014 10:28:38 +0000
In-Reply-To: <20140107192305.GT3709@jama>
References: <52CC470A.9030302@linaro.org> <20140107192305.GT3709@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Qt in OE-core
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
X-List-Received-Date: Wed, 08 Jan 2014 10:28:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-01-07 at 20:23 +0100, Martin Jansa wrote:
> I would like to see qt4 moved from oe-core to meta-qt4.
>
> That would remove the feeling that using oe-core defaults to using qt4
> and it would be consistent with other QT layers:
> 
> meta-qt3
> meta-qt4
> meta-qt5
> 
> oe-core would stay just the "core" and if you need any QT you can select
> which one suits your needs the most (or combination of e.g. qt4+qt5 like
> most people are using now)
> 
> With PACKAGECONFIGs which can list optional dependencies which aren't
> included in the the layer itself it's now easier to have recipe with
> optional qt5 support in oe-core, but qt5 itself in separate meta-qt5.
> 
> Another interesting aspect is that with qt4 we have only 6 recipes in
> openembedded-core/meta/recipes-qt/qt4
> 
> while
> meta-qt5/recipes-qt/qt5 has 25 different recipes (many of them with
> _git.bb variant so 42 in total). And splitting the qt5 recipes (e.g. to
> have only qtbase, qtdeclarative in oe-core and "additional" modules in
> separate meta-qt5) isn't very good, because they are quite tightly
> coupled (so upgrading recipes in meta-qt5 would be in many cases
> incomatible with qtbase version in oe-core and vice-versa).

What dependencies on other layers does meta-qt5 have?

If the policy is all qt5 things into meta-qt5, the risk is a fairly
large set of layer dependencies for meta-qt5.

There is some perception I don't like external layers which isn't true. 

What I do dislike is "dependency creep". If the meta-qt5 isn't usable
without pulling in chunks of meta-oe for example, I'd think that rather
sad and it might as well move to meta-oe at that point.

Also, whilst there are only 6 qt4 recipes in core, they are (at least as
far as I know) the core qt components that people base off so in that
sense we're enabling developers and don't have a ton of "apps" around
they probably wouldn't want to use.

Cheers

Richard


