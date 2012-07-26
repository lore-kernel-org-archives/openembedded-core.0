Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SuUfR-0003dy-QF
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 22:28:17 +0200
Received: by eaaq10 with SMTP id q10so287993eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 13:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=fHNsk8Qj+cU9xYlouHoDWlO/vOi6wFi313MRu14UggU=;
	b=NA3UehwdNmj4d4DdSYu1A7qCU6WQKncUwBcigk9fcVdKp5W1iMf/mLKqVlN6iz++/9
	1txNdXvp7pq86D+7UZwZtcYa7WXMMasyHkBO08jdeShsvvMejm6cZallmoNQSfFdSBM/
	jpNpqxhOQJork6hxzM24vmINlm73ak3gCAbDIccLGGJoVkVCURfQnDxCES9GhkRSPs3I
	op3uNZFu0iGpiLv6dNp9xdmnodYjXOzk2z0PtZTSm+IkHk0M1SGFZTuDhMd75pcuVmGg
	e04mP3qOOwRpDSjDfnVV43wyF9XqwSzuE/DidoGT1pkQRUcJ+GdXxyI5vBby7U/rCA8r
	wKYw==
Received: by 10.14.180.67 with SMTP id i43mr77184eem.23.1343333806957; Thu, 26
	Jul 2012 13:16:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Thu, 26 Jul 2012 13:16:16 -0700 (PDT)
In-Reply-To: <1343329086.4470.56.camel@x121e.pbcl.net>
References: <1343328564-3644-1-git-send-email-sgw@linux.intel.com>
	<1343329086.4470.56.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jul 2012 13:16:16 -0700
Message-ID: <CAMKF1so+OJTjN+fRP8DJK2zCNKUyTFYJ==zUMkRm1+-6FkYCvg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: Let pn be eglibc for eglibc-locale
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 20:28:17 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 26, 2012 at 11:58 AM, Phil Blundell <philb@gnu.org> wrote:
>
> Bletch!  There must surely be some way to solve this problem without
> hacking recipe names into package.bbclass.

Yes making eglibc-locale base package to be non empty. So if we put in
something there that it never turns out to be empty is one way


