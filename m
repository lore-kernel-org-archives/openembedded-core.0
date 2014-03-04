Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DDCEB6E9A3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 12:29:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s24CTTAQ026485; Tue, 4 Mar 2014 12:29:29 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UanLHcUarLIp; Tue,  4 Mar 2014 12:29:29 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s24CTPWt026482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 4 Mar 2014 12:29:26 GMT
Message-ID: <1393936157.31845.68.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 04 Mar 2014 12:29:17 +0000
In-Reply-To: <CAP9ODKo48jjpaCW3=rcMZDWYRv1wQi8toK=unzyeCe885v4dVA@mail.gmail.com>
References: <1393781961.22581.7.camel@ted>
	<CAP9ODKo48jjpaCW3=rcMZDWYRv1wQi8toK=unzyeCe885v4dVA@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] bitbake.conf/base.bbclass: Drop PRINC support
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
X-List-Received-Date: Tue, 04 Mar 2014 12:29:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-03-03 at 22:44 -0300, Otavio Salvador wrote:
> On Sun, Mar 2, 2014 at 2:39 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > PRINC is no longer needed since we have the PR service instead
> > which people should be using. Drop the PRINC code.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Nack! Layers still use it. Please, delay removal for 1.7 and add a
> WARNING for 1.6.

I sent this out to test the situation, I don't think we can remove it
for 1.6, we should add warnings though...

This is a reminder for layer maintainers using this to stop though! :)

Cheers,

Richard


