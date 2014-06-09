Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id A73ED65D63
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 10:50:49 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id 63so8641513qgz.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jun 2014 03:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YBQWJIzgy2vzfuJZutwjMhKGY+D/pIsAyuPOZyxY4nA=;
	b=dGG6TlO/5z+QPG8QVEH/6GcvvVCuVvvLpMy97zXv+S0fAo/JN3pHHeRnGV58dtARI1
	X6lsM8/aWCO2HzQgDrkBZHWR7153MVcyy0QZjQHUWMGSslr8x4Pbwb73SgunZ7C+QBe5
	gip4AP4EMrCoS8EhEhq+sUGCQrlwqXfXY3JapOPRqTUIYf7vAdrhzDdDiu0R2P8OfKkN
	Mnw3cyOzX6nVs9Ie04I7kL5fAXaO7Spvd0/PLKeEvcQQoaAd8MQ4ITK7PFKh9fgsV8x+
	8X61iMLRzwfBNi/Ou7AYMV58iM8GzARCT6wpRXaJOjyy6LFkKRJFkbTtFI/Qhe9qUkT2
	aOWw==
X-Gm-Message-State: ALoCoQlHlZrMvdySdgYigmJ3nW0lyD2bYO2cBFXx+2WR4QOuT0iRhDGqsD14Z3Bk2OxrAWeL5QcX
X-Received: by 10.140.28.3 with SMTP id 3mr30269964qgy.71.1402311050004; Mon,
	09 Jun 2014 03:50:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Mon, 9 Jun 2014 03:50:29 -0700 (PDT)
In-Reply-To: <CAMKF1spMhvvf-WgEKHo+0FXCVbqY0dym4+HPLWSZiBFuvhRCNg@mail.gmail.com>
References: <1402069681-17929-1-git-send-email-ross.burton@intel.com>
	<1402069681-17929-2-git-send-email-ross.burton@intel.com>
	<CAMKF1spMhvvf-WgEKHo+0FXCVbqY0dym4+HPLWSZiBFuvhRCNg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Jun 2014 11:50:29 +0100
Message-ID: <CAJTo0LZ4S7zRCzXyrSsPTwXYYhcGP-V7vuX7OzO5FbrHVEnkjw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gawk: remove dgawk and pgawk packages, merge gawk-common into gawk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jun 2014 10:50:52 -0000
Content-Type: text/plain; charset=UTF-8

On 7 June 2014 11:50, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Jun 6, 2014 at 8:48 AM, Ross Burton <ross.burton@intel.com> wrote:
>> -PACKAGES += "gawk-common pgawk dgawk"
>
> would it make sense to have RPROVIDES

dgawk and pgawk were debugging and profiling gawk frontends, and
whilst the new gawk binary has the same functionality it doesn't have
compatibility binaries.  So no, I don't think it's sensible to have
RPROVIDES in this case.

Ross

