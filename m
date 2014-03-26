Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 21DE76F898
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:56:16 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2QFu6Ic025951; Wed, 26 Mar 2014 15:56:07 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yOolTOedCANe; Wed, 26 Mar 2014 15:56:06 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2QFu4Vc025941
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 26 Mar 2014 15:56:05 GMT
Message-ID: <1395849358.24890.103.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chris Larson <clarson@kergoth.com>
Date: Wed, 26 Mar 2014 15:55:58 +0000
In-Reply-To: <CABcZANkY+HBcQf4mxQkyFkmT+1RvyGOuQG_zKKbmzBoOGMNGwg@mail.gmail.com>
References: <1395826233.24890.81.camel@ted>
	<CABcZANkY+HBcQf4mxQkyFkmT+1RvyGOuQG_zKKbmzBoOGMNGwg@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/3] base.bbclass: Run oe_import before other INHERITs
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
X-List-Received-Date: Wed, 26 Mar 2014 15:56:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-03-26 at 08:34 -0700, Chris Larson wrote:
> 
> On Wed, Mar 26, 2014 at 2:30 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>         +# We need the oe module name space early (before INHERITs get
>         added)
>         +# and whilst ugly, abusing inherit like this is quite
>         effective
>         +BASEIMPORTS = "${@oe_import(d)}"
>         +inherit ${BASEIMPORTS}
> 
> Wouldn't OE_IMPORTED := "${@oe_import(d)}" work as well, or am I
> missing something?

That would work as well. I just came to the other solution though a
different route... :)

Cheers,

Richard





