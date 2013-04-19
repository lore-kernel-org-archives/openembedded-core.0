Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UTHsJ-0008AB-Iv
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 22:25:44 +0200
Received: by mail-wi0-f176.google.com with SMTP id hj19so1381827wib.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2013 13:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=4x8Xw8XQ4zrsTQfDsnT8/4nnLz2E+aA2FGQOHPibdbc=;
	b=rJJpcB1U+h45fKNnoAxf8oq9d1/gsZ3wQ3YvlxBvbEoZYVNHXVxw8BXhZjka9kYBwn
	eU2xRkwY1mGnDvr+NuZJ7bURRRhycZ1dwQ1cK5AY61Sj2V68XL/ljh2VSrTS/szZU7XT
	1Xtzly+uGpU7uYH8Z2xWeXkr6w8xFxkNLFnmty0vwpmkHn3p+ICZtNLCUgqCma2Nz7ak
	mv6XqMYnO2NJHuJuqhM9ueFqYUw5YyR4VIqwvF+IKA1RXq71aDlZIW+TXlslIHjphqNA
	x0hq0PQx0qv/BDta/oHWstRFuHDZM++d6ZPwSuO8/2tEFl0WJoSTWvDZbluwl+bi8VXD
	daZA==
MIME-Version: 1.0
X-Received: by 10.194.109.227 with SMTP id hv3mr28473468wjb.32.1366402084516; 
	Fri, 19 Apr 2013 13:08:04 -0700 (PDT)
Received: by 10.194.167.73 with HTTP; Fri, 19 Apr 2013 13:08:04 -0700 (PDT)
In-Reply-To: <2526326.CAbek543yF@yiqingliang-pc>
References: <alpine.DEB.2.02.1304181219550.8010@oneiric>
	<alpine.DEB.2.02.1304181250070.20260@oneiric>
	<41F644AD-691F-443B-A267-8562E5DDC3BC@gmail.com>
	<2526326.CAbek543yF@yiqingliang-pc>
Date: Fri, 19 Apr 2013 16:08:04 -0400
Message-ID: <CAHUNapT8_t2g9=ixW1zRsMgvdHqLnpWOzn1Ak6Zz9d=RFPkmcA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample: Have comments ready to go for quad-core (4 -> 8).
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
X-List-Received-Date: Fri, 19 Apr 2013 20:25:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

All of these "solutions" assume the user wants to use all of their
entire computing resources to do nothing other than their Yocto build.
This isn't _always_ the case, is it? :-)

Personally, I know this build is going to take time. So I start it,
then go off and do other things with my computer. In my case, I don't
like it when the other things I'm trying to do on the computer are
bogged down due to this all-consuming, background build task. I would
much rather that whatever else I'm doing remain responsive to me.
Whether the build finishes in 20 minutes or 25 is irrelevant because
I'll only notice it's done 30 minutes from now :-) As such I never set
my settings to "full power"... knowingly and purposefully.

This being said, I think what is currently in the sample config file
(which are roughly half of full power) are good defaults. If you're
new to this kind of stuff, these settings will suit just fine. If
you're a power user, you'll know how to set them to 8 or 16 or any
other setting which suits your needs.


