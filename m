Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2A23965DB0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 22:17:41 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s41MHaOo017936; Thu, 1 May 2014 23:17:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TbHWYpVQ0yix; Thu,  1 May 2014 23:17:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s41MHYba017922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 1 May 2014 23:17:35 +0100
Message-ID: <1398982648.12731.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 01 May 2014 23:17:28 +0100
In-Reply-To: <CAP9ODKqvupLb_GR1NnkXmQt_FmJbOuQYgkLWFdiUhuBYYhw0zg@mail.gmail.com>
References: <1398973084-16849-1-git-send-email-otavio@ossystems.com.br>
	<1398978886.12731.5.camel@ted>
	<CAP9ODKqvupLb_GR1NnkXmQt_FmJbOuQYgkLWFdiUhuBYYhw0zg@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: Bump BitBake minimal version to 1.23.0
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
X-List-Received-Date: Thu, 01 May 2014 22:17:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-05-01 at 18:16 -0300, Otavio Salvador wrote:
> On Thu, May 1, 2014 at 6:14 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2014-05-01 at 16:38 -0300, Otavio Salvador wrote:
> >> The metadata started using the bb.utils.contains_any which has been
> >> add in the BitBake 1.23.0 release, set this as the minimal version to
> >> ensure parsing compatibility.
> >>
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> ---
> >>  meta/conf/sanity.conf | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Technically its not quite this simple since versions of bitbake exist
> > where the contains_any() function is missing yet the version is 1.23.0.
> > We therefore should bump bitbake, then bump the version here to do this
> > correctly.
> >
> 
> Should I send the 1.23.1 bump to BB or you do it?

I've fixed things up...

Cheers,

Richard



