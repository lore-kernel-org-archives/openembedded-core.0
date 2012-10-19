Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TP1OH-00076w-I1
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 03:28:45 +0200
Received: by mail-ia0-f175.google.com with SMTP id b35so6734205iac.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2012 18:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=JBBvc7X9yONMAli7vQDuQ5sPFHXCn2jl8y5Nd5QFqnk=;
	b=ob4Eeh5J8OMvT5OL5kcTA2A6Oo2VaDOwC7k/tA/SbGlnG6m9rd4UVqEWmbNcsvxENw
	EVGTBN7Xw5Mv3CoZZ6HXGkyZSl4CyM2MnkIIwDzOp7M7ldi7gzrgfqpcc2dP0ZfSVggh
	m6R/B4i6FMJLg/noQUsjLKQU/qMty4W0k0x28qtfTLOElA5LClaUimQOvfQqYlYbe6KM
	JhVQ54zhihHChxu5cITJoQyoUiMmJSxqrLYO4pCZmGuDoCzAN5oM7EjCHimJpOrMy1Rs
	sNlDQXJV3XvYGdRrpo92BGLPfdwkc8VnhT0xEIYGDto8NbwpvXe3m7ofu8zM7SsaTCHJ
	i+oQ==
MIME-Version: 1.0
Received: by 10.50.214.10 with SMTP id nw10mr6936308igc.31.1350609324742; Thu,
	18 Oct 2012 18:15:24 -0700 (PDT)
Received: by 10.64.20.113 with HTTP; Thu, 18 Oct 2012 18:15:24 -0700 (PDT)
In-Reply-To: <50808D0A.8090103@linux.intel.com>
References: <1350394101-15120-1-git-send-email-schnitzeltony@googlemail.com>
	<50808D0A.8090103@linux.intel.com>
Date: Fri, 19 Oct 2012 03:15:24 +0200
Message-ID: <CALbNGRT_Omdw=kcj6kC6piX6-GobuVFGfhHWio9fNxCrDoiqEw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] gnome-icon-them bugfixes
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
X-List-Received-Date: Fri, 19 Oct 2012 01:28:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 19, 2012 at 1:13 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 10/16/2012 06:28 AM, Andreas M=FCller wrote:
>>
>> It caused me a lot headache to load gtk-stock-icons...
>>
>> Andreas M=FCller (2):
>>    gnome-icon-theme: fix icon mapping
>>    gnome-icon-theme: remove unused configure variable
>>
>>   .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    6 +++---
>>   1 files changed, 3 insertions(+), 3 deletions(-)
>>
> Andreas,
>
> I am having some trouble with the patches include, I think thunderbird is
> trying to encode them in non-ascii, can you resend or point me at a rebas=
ed
> branch.  I just made some changes in this also.
>
> Also, does sato-icon-theme need the same changes?
>
> Thanks
>         Sau!
Maybe caused by =FC in my family name - need to change that :). Will
check for sato-icon theme and send a pull request next week.

Andreas


