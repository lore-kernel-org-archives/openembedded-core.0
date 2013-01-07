Received: from mail-oa0-f49.google.com ([209.85.219.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TsBtz-0002CH-MQ
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:34:04 +0100
Received: by mail-oa0-f49.google.com with SMTP id l10so17450621oag.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 04:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=E+H4Fm492r6xTR9G37zv7VXecLRi7we+9pOCuT8a3+U=;
	b=CfL5x0Wp6XzOqc3IAQ5M+srJUr3rxeKrKt40pEDJFNAQXxlmQfWBrGAxvuiy7+qeCR
	AcvvTrkPj+wAqiFBWYCBrPlALN3KMP6fhb7eOd+wR79bF8L+2u7CKQgBbDrykhM2Qp39
	iYWJJrE6StAhBgHRib37W+Z+BBZ0H2uugpJMD9+OUUi5v3IWBzCqZvOIC5fH1uCEwp8N
	HI916K/9fOFntw4mgcnN0HKN6xB107MANm9w4dohIlYChpC9wBPSot3DFnzlrzlXW04n
	P8sQ0o/YkYgfqVNb1xsHoFCYPcAvT5txCwRFGvPYbSx2g95H29SOtezcdlgIjVQpOhBV
	SViA==
MIME-Version: 1.0
Received: by 10.182.21.135 with SMTP id v7mr43875607obe.101.1357561134081;
	Mon, 07 Jan 2013 04:18:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Mon, 7 Jan 2013 04:18:54 -0800 (PST)
In-Reply-To: <CAJTo0LYXWwLEwmz+oWT4Lo6PL1naJxP0NV5DKcEBbJvyLPh0cw@mail.gmail.com>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-4-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-5-git-send-email-cazfi74@gmail.com>
	<1357559941.25855.7.camel@ted>
	<CAF6bG8eMo0c=e8G2zd_Y4ST0hG-S2Zx4f4f7hhO8PPML7Ozs7Q@mail.gmail.com>
	<CAJTo0LYXWwLEwmz+oWT4Lo6PL1naJxP0NV5DKcEBbJvyLPh0cw@mail.gmail.com>
Date: Mon, 7 Jan 2013 10:18:54 -0200
X-Google-Sender-Auth: 9upcEH9H1VHG9uZ62UGN556HdqI
Message-ID: <CAP9ODKq2UVEmG11WFNHNdvE5+-X5NW6azhaQsxxGPbC05+j8og@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 04/15] file: replace obsolete automake macros with working ones
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
X-List-Received-Date: Mon, 07 Jan 2013 12:34:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 7, 2013 at 10:16 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 7 January 2013 12:11, Marko Lindqvist <cazfi74@gmail.com> wrote:
>> What's the correct status for fixes that are not really backports,
>> but have happened independently in oe and upstream?
>>  - If practically identical, still mark as "Backport"?
>>  - If different solution, "Inappropriate [not needed]"?
>
> If you did it and then later discovered it's happened upstream
> independently, it's essentially a backport.

Maybe it'd be better to not patch at all and update to the newer recipe version?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


