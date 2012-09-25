Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1TGdYl-0005oi-Fd
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 00:24:55 +0200
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 8B5BB20AAA;
	Tue, 25 Sep 2012 18:12:07 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute3.internal (MEProxy); Tue, 25 Sep 2012 18:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:cc:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=5WUlFLqBjxIMUekbpW7EJQ
	fMmOI=; b=cs+zOZr+PmS9laFLWx1o0uM7yrjGM5FSoP3BNqU/Hdzd2HtTV1aKY2
	Vq9XSZ+cDvy3+qAjqUg9Eg1oQVvD6nSJulpe8PKdqWa89A9vEc5nkj+xp2lJdqoT
	Y/t67Vnc9MTelZU+dmDLf6QtYwuxBOFEoC2kZx6VKYQbZXcmAT8Jc=
X-Sasl-enc: a+Pwvqr+jPN8AZWBNZ48sVGhiYEnqyIB5KF0wNjJUOIy 1348611127
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3EAB64827D6;
	Tue, 25 Sep 2012 18:12:07 -0400 (EDT)
Message-ID: <1348611089.2853.7.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Phil Blundell <philb@gnu.org>
Date: Tue, 25 Sep 2012 18:11:29 -0400
In-Reply-To: <1348610431.1335.11.camel@x121e.pbcl.net>
References: <1348577690.31293.70.camel@phil-desktop>
	<1348610357.2853.5.camel@lenny>
	<1348610431.1335.11.camel@x121e.pbcl.net>
X-Mailer: Evolution 3.4.4 (3.4.4-1.fc17) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Remove static libraries from -dev packages
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
X-List-Received-Date: Tue, 25 Sep 2012 22:24:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-25 at 23:00 +0100, Phil Blundell wrote:

> That'd be inconsistent with other packages, since we do generally build
> and ship the static libraries.  Having a big switch to turn off static
> libraries globally seems like a fine plan, but I can't see any obvious
> reason why the util-linux ones are any more useless than the rest.

Makes sense.  I wonder if there are actually any users of the static
libraries.

For what it's worth in gnome-ostree I do just globally pass
--disable-static by default.




