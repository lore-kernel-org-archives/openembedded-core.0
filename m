Received: from mail-ie0-f178.google.com ([209.85.223.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U2lu7-00060U-FL
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 18:01:56 +0100
Received: by mail-ie0-f178.google.com with SMTP id c13so481767ieb.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 08:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=ahYs8CafjQ+XFPkCrAjNtYBGOt6GwHNgtVg/s+evvts=;
	b=tG5IVoXysXC2Iuhx30Xk4qbcnLr7zaDkeQrzIkgo7UrYh3E1rRvRwezRfCHqmas9ly
	NqBwTkJdXw+4R3t6SC8utZmjiWhOwbyLRgt+zNLBbvcjuQggD2IxKaoClw8CbYiELU2f
	fjQm96EEPdnB14WaPOmSaIi6Jw6/szKyBuItTWbEzCElh32/ZBuxixWBtMFFM4FaSFKe
	b36ryaa+5XpPbMYHugXOFqSU2IPaKdWYnlp8RPSdb+lxqkcu3aU2WIC/0mKAjyAuI/Z0
	CBUObc3t5ECle60han5ZAoLUaRYfJ00YYY/d1uXWmgfWRzx3g+yhpfSX9ISCxbTCDYC3
	sERQ==
MIME-Version: 1.0
X-Received: by 10.50.53.208 with SMTP id d16mr14762348igp.5.1360082764952;
	Tue, 05 Feb 2013 08:46:04 -0800 (PST)
Received: by 10.64.143.228 with HTTP; Tue, 5 Feb 2013 08:46:04 -0800 (PST)
In-Reply-To: <1360082302.28450.0.camel@ted>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
	<0574b409893545c5ce601853c0210e3047b02297.1360079373.git.rep.dot.nop@gmail.com>
	<1360082302.28450.0.camel@ted>
Date: Tue, 5 Feb 2013 17:46:04 +0100
Message-ID: <CAC1BbcR0JcaLqu60ZOC7eQG3kpO7y+xsu8YkBWm=U-CnOZ=Fsg@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/8] busybox: update-modules script needs id(1)
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
X-List-Received-Date: Tue, 05 Feb 2013 17:01:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 5 February 2013 17:38, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2013-02-05 at 16:55 +0100, Bernhard Reutner-Fischer wrote:
>> The update-modules script calls id(1), so turn on id in this case.
>> Bump PR.
>>
>> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>> ---
>>  meta/recipes-core/busybox/busybox.inc       |    1 +
>>  meta/recipes-core/busybox/busybox_1.20.2.bb |    2 +-
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> Wasn't update-modules just removed from OECore?

could be, i am still at 8dd608dac1e5658197078d002dc1b3dc8ac83184 here
because i feared that unrelated stuff will fail again on me (see the
Revert in this series for one example).
Please disregard this hunk if it is moot by now..
cheers,


