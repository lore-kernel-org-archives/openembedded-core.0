Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TQI0U-0001D8-T9
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 15:25:27 +0200
Received: by mail-oa0-f47.google.com with SMTP id h1so2347148oag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 06:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=y+IMf1PT+K0wCmtCWCMOfykVUOOvHb9YdPraAvNcmBA=;
	b=Kax6ubUYRETrSygF+DxMQrwI40jWbevrkx/V8aa/Eg0f6TidWDNpUQ1JTiru872V+Y
	LDekVVbRiMVZ+rEqwnsjly3M/FWgfrAXoORU/gWPxpmmqoq99HAjMbyM9M7sZe0mzhHb
	HJ267vzc3UImekCx1YtcbeBShkY7L6MlDLmeFn07ZjIT1rHQZr3sncyC8Vy8Quk/C9J/
	b6yWGj8XCyrbQmLdB7W+iaRcj7MIFfyW4nuXD0D+iZNOcilWRKV8QCRrWHr/2yvLTLDY
	/kZXEKLu0H62F3FZJJObtU2kAUPC+X/kDWEkiSAYDzBXy7jefUfCWzjTyk0t13VgQWYk
	ls0Q==
MIME-Version: 1.0
Received: by 10.182.150.37 with SMTP id uf5mr6930755obb.10.1350911521633; Mon,
	22 Oct 2012 06:12:01 -0700 (PDT)
Received: by 10.76.25.227 with HTTP; Mon, 22 Oct 2012 06:12:01 -0700 (PDT)
In-Reply-To: <50854312.5040502@dresearch-fe.de>
References: <50854312.5040502@dresearch-fe.de>
Date: Mon, 22 Oct 2012 15:12:01 +0200
Message-ID: <CAGiJk9dt0OTOMG5T7DoomCfXxp+FUw15PWTXnaCSm=BJOpfjnw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Profiling binaries?
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
X-List-Received-Date: Mon, 22 Oct 2012 13:25:27 -0000
Content-Type: text/plain; charset=UTF-8

2012/10/22 Steffen Sledz <sledz@dresearch-fe.de>:
> Just a short question: Does oe[-core] provide a generic method to create packages containing binaries/libraries with profiling support?
>

Depending on your platform you could use Valgrind [1], or to be more
specific Callgrind [2].

The recipe is in .../openembedded-core/meta/recipes-devtools/valgrind/
you can check there if your arch/platform is supported.

[1] http://valgrind.org/
[2] http://valgrind.org/docs/manual/cl-manual.html



-- 
Regards
Samuel


