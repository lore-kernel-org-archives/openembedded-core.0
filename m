Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sa6A9-0008HN-K2
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 16:15:42 +0200
Received: by eekd49 with SMTP id d49so382344eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 07:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=QppP8RMYyqUEPZ262HJ7Hy4pBcNLNanE9sblGOubPJo=;
	b=VK4plmSWB2Vk2oDtc1P97+2LHSeLJ3ZaTrXXHOwT/y8K4BQaRULcUBzYAoH5aRiXVJ
	OOwGuVoHpRoL6n/c/VQ8ceIyz+ohXZSzTi5cZFyuHXkNyZQ09CXnps6hG9jJkZXuMhEc
	pfwjCPhzXmhzNke7nIi3vbD64yGRfpDXhqDu2MZOK/kPJD1GYpU0pPoUSVW+f0VKTelh
	SSauK4QGMaHcJWLNksS0ppAtIsoRSwsIjVjKmznum32dyAFv8cKdL3I0/N6YZLqL3qhG
	ol+JB7VZGtfkbi6kyzMa1QGsurnr2Sh6tW/Mdan75SJx9oFOW5MsOSKAv9/vmC54TdJh
	ba3g==
Received: by 10.14.95.1 with SMTP id o1mr8275746eef.77.1338473121913; Thu, 31
	May 2012 07:05:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Thu, 31 May 2012 07:04:51 -0700 (PDT)
In-Reply-To: <CAOHjBZvZmXugpmxypMamZbm1LYdOqTAp4Z+1CBPn1DyohjO3Yw@mail.gmail.com>
References: <CAOHjBZsptjefvQA3od1HV4s_fVcoHidWs5qUm-2A5+Fr9ZrRLg@mail.gmail.com>
	<CAMKF1spunqV3__K7_jEt5oQwg=J0v+TwZSUtGOv=DeipCPkzSA@mail.gmail.com>
	<CAOHjBZv9jC9pVwxS9CCjvY0wFo8_9sOaFeUQwMxPEuF8EJDuiA@mail.gmail.com>
	<CAOHjBZvGY9BWkyS+9V4OtGFcQpCC2SdzKwG9pQ0wq_oeqU=uTw@mail.gmail.com>
	<CAMKF1so8aA=s7wfo9k9wGNSwyuGYXmd5Ec9x=5Bp0YJbaiJoFA@mail.gmail.com>
	<CAOHjBZvZmXugpmxypMamZbm1LYdOqTAp4Z+1CBPn1DyohjO3Yw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 May 2012 07:04:51 -0700
Message-ID: <CAMKF1spH=Hh99zwmqx6QQa7O-aa9vLQMJBbf1voaNX+-65nfkg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: target rpm build failure
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
X-List-Received-Date: Thu, 31 May 2012 14:15:42 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 31, 2012 at 6:57 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> unfortunately I depend from rpm, I need just rpm packages.
> So can you confirm the target rpm for uclibc is not building?

yes rpm needs to be patched for building on uclibc


