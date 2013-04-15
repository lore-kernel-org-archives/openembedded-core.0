Received: from mail-qc0-f181.google.com ([209.85.216.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1URh3n-0004AB-5U
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:54:59 +0200
Received: by mail-qc0-f181.google.com with SMTP id a22so577031qcs.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 03:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=1N/a9zki2nRRu+samzz3GFU61qZt9qpt330l3N0dDNI=;
	b=U3p362oVtCPnW7cxTyzIBz8vTG57rltVpQIEO5hOhAd2SoqHqji0OgcJrw5XSbMUYp
	Jp86MYaMD4yAMdKAmJk377fflWHTCpddv0hlMFicF7D9/admNFc8DCKelgqdpOzDDxju
	WTWfeytMBAx4pwK5lwvzJ5YogYFJoAJZ0shH4U6XHzpnZE7xEM6m3KRPoAfUZoCFfRoi
	LApqn4lRKj2BHOVW4qsBH5iAJHIQafon6DjCHJ7/3zYsvkz488h2k/kId/K+epT2rXsa
	KYfZ5Kbb/vi9tRcb05d66BPLU+po2Irw2kOYMkfNm83WBlKypQzoE/wpHCiOsPGPsMN1
	7u2Q==
MIME-Version: 1.0
X-Received: by 10.224.94.4 with SMTP id x4mr21592571qam.60.1366022246288; Mon,
	15 Apr 2013 03:37:26 -0700 (PDT)
Received: by 10.49.4.170 with HTTP; Mon, 15 Apr 2013 03:37:26 -0700 (PDT)
In-Reply-To: <D36FF37C-5906-4F9E-AC08-57B159AEF560@dominion.thruhere.net>
References: <CADV-EXFrm6O3x7mNEz4X87inG-jLd6Kb5UNDhszh4hLXGgOvXw@mail.gmail.com>
	<D36FF37C-5906-4F9E-AC08-57B159AEF560@dominion.thruhere.net>
Date: Mon, 15 Apr 2013 13:37:26 +0300
Message-ID: <CADV-EXHK9oo177UySi8kcpu4xrDx_Pw8q=S=0mXts3OyJrn28w@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Multiple *.bbappend files support
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
X-List-Received-Date: Mon, 15 Apr 2013 10:55:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Great, thanks!
Best regards,
Yevhen


2013/4/15 Koen Kooi <koen@dominion.thruhere.net>:
>
> Op 15 apr. 2013, om 12:26 heeft Yevhen Kyriukha <kirgene@gmail.com> het volgende geschreven:
>
>> Is there a way to use multiple *.bbappend files in different layers?
>>
>> I'm using meta-raspberrypi and my own layer.
>> Both extend base-files with *.bbappend and both have PRINC = "1".
>> But only first of *.bbappend files applied (that is in meta-raspberrypi).
>> PR of base-files also increments by one (not by two).
>
> Yeah, try to make all bbappends use:
>
>         PRINC := "${@int(PRINC) + 1}"
>
> regards,
>
> Koen


