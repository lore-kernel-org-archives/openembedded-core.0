Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SuVmX-00057B-Bg
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 23:39:41 +0200
Received: by eekb57 with SMTP id b57so434605eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=i/6PkmMWti1pe+s4dNKyZP+EZ3N12NBUm7QXUG1Gd5Y=;
	b=DF4QyvA/oeaPDinaZKbBync6qhKlYdR2O0z74PTn4QLw937hr6gTcJVkLEFwVSBmMY
	L86oMgidrmhqWc04KrgURs6P/DlRiL4L+NbkllTnzRo2Zz4vPDDspHslEdZzNo/xfqrD
	+20LpztBXIW48jzQrCh02ECaHIHAp8k7dFu97uW6+Cjfx8LR74F9Nm3KylMnQulQy0ba
	Swuhf8gGZRpBldI6cUxhLtASr4WTmUhZC18guZULxPNTcI1tG9goe3AYYclutO83+nkW
	RixQSG2lKrd2EGM4pOWASv0tOISBPA4HAEvnBz3nXmS+zeA1wYSfgxaIYd5PVYk7GvRW
	Uz0Q==
Received: by 10.14.173.71 with SMTP id u47mr249171eel.22.1343338090325; Thu,
	26 Jul 2012 14:28:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Thu, 26 Jul 2012 14:27:40 -0700 (PDT)
In-Reply-To: <1343335989.4470.75.camel@x121e.pbcl.net>
References: <1343328564-3644-1-git-send-email-sgw@linux.intel.com>
	<1343329086.4470.56.camel@x121e.pbcl.net>
	<CAMKF1so+OJTjN+fRP8DJK2zCNKUyTFYJ==zUMkRm1+-6FkYCvg@mail.gmail.com>
	<1343335085.9574.32.camel@ted>
	<1343335989.4470.75.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jul 2012 14:27:40 -0700
Message-ID: <CAMKF1srcDNx6cL42Lu9vyig8nHB14xp2+fapoCxd4kTh9dVGCw@mail.gmail.com>
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
X-List-Received-Date: Thu, 26 Jul 2012 21:39:41 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 26, 2012 at 1:53 PM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2012-07-26 at 21:38 +0100, Richard Purdie wrote:
>> the other alternative which comes to mind would be so set a variable
>> with the name we want used there, defaulting it to PN.
>
> That sounds like the most wholesome plan to me.

can we use BPN, unless we generate locale for native and nativesdk
cross and crosssdk
class of recipes that should work too. I thought about it  and thought
it was too
intrusive.


