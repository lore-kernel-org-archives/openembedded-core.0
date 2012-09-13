Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TCGNk-0006CZ-Pe
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 22:51:28 +0200
Received: by daks35 with SMTP id s35so1835337dak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 13:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=dL6hoFUCiF70HvwO6xmLfZwDBH4OnBjWAHb1gqiQIeo=;
	b=GJXw64Q1uj68HMVXzmnemvrsWGusnjf+puKr5+/VYLl6rsenAwEGS9rzNAzsro4zlB
	GzWlAfiJvS92HyIGOi6TNKknUJ7Mo0zvdTQFb7ysPCkoo+oDCj4f0L6yhDDtZJlhZ3ok
	Yx2osnBwyOvN77ZhaB3Hz8uLyJ2nNckyCIbQqPhINsuEmmjyueJS6FFW7TTfkDJfDQDc
	KqL3Y75TJnSH+e7rmXM5JxDZuZh9Ehj0sJVenfwMMDp6wUy9E7tLbz82yVGtkgp0GaoL
	WI9n5tlQpx562M8NJYImzs5DrGjnQJh0sCVy7MPzLEIpFSiw5z1CzPi4UwS2hGHwoPWu
	72WQ==
MIME-Version: 1.0
Received: by 10.68.202.193 with SMTP id kk1mr1045486pbc.136.1347568725239;
	Thu, 13 Sep 2012 13:38:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Thu, 13 Sep 2012 13:38:45 -0700 (PDT)
In-Reply-To: <1347568349-28024-1-git-send-email-otavio@ossystems.com.br>
References: <1347568349-28024-1-git-send-email-otavio@ossystems.com.br>
Date: Thu, 13 Sep 2012 17:38:45 -0300
X-Google-Sender-Auth: UD4PoO94jNkTMh5Lvz3xqkYYKr4
Message-ID: <CAP9ODKr3i3AdM1bbN5q1v0rapqnuPPsspjmyFH6gYhqTxajGqA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perf: Refactor code so it is easier to read
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
X-List-Received-Date: Thu, 13 Sep 2012 20:51:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 13, 2012 at 5:32 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-kernel/perf/perf_3.4.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Please ignore this patch ...

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


