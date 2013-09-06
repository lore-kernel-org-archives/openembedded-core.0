Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 506BF6BF8D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 14:50:45 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r86F3prZ025113; Fri, 6 Sep 2013 16:03:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xAT00QR7RESH; Fri,  6 Sep 2013 16:03:51 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r86F3ixB025104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 6 Sep 2013 16:03:46 +0100
Message-ID: <1378479022.3484.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 06 Sep 2013 15:50:22 +0100
In-Reply-To: <CAJTo0LZ_bA0ctzS3qrPdoOVhLSLZbVu9Nyk8WKNvaqe517RsCA@mail.gmail.com>
References: <1378478579.3484.4.camel@ted>
	<CAJTo0LZ_bA0ctzS3qrPdoOVhLSLZbVu9Nyk8WKNvaqe517RsCA@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oeqa/qemurunner: Use a timeout in select() call
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
X-List-Received-Date: Fri, 06 Sep 2013 14:50:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-06 at 15:46 +0100, Burton, Ross wrote:
> On 6 September 2013 15:42, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > -                sread, swrite, serror = select.select(socklist, [], [], 0)
> > +                sread, swrite, serror = select.select(socklist, [], [], 0.1)
> 
> As discussed on IM, for the purposes of this loop a timeout of seconds
> instead of fractions of seconds would be more correct, although we're
> obviously going to be having diminishing returns.

Basically, agreed. I've pushed this into master-next for testing
purposes whilst we discuss what this really should be. I think 5 might
be a good number. 

Cheers,

Richard


