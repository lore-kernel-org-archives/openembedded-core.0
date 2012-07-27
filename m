Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <manuel.bessler@gmail.com>) id 1SulEz-00076D-B9
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 16:10:05 +0200
Received: by vbbfr13 with SMTP id fr13so2626987vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 06:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=gQj+VyEMjLCYXbqEL0f+MPJ1foiVl+0+S3ny8h4oeVU=;
	b=DSM98mMuAw6eeV6Uix3Ha1skfuiCRVfILO3DieMaLCcraiSmdAEzLN++ijp6FRXsc6
	P3pvNVFeWAKhKCDzBHNuFkMtYrLhz6uKUorUJG1owRhRGih8MOt3sJSVgA83tFwt7Tpu
	gufLH7T4jPrSCdkPDQL3NQqnMyMM7WMq8CH3cRkmO10hTxVfZ79EwxoN7N6okmxaOLUn
	FhKeTyu8Tc6cszFl50wvTncRTLqze0ENW/8KEMnRSgJiv4uQRAVzZ25biRW4KTgBJ40S
	IzGbNbxlUFqWSIjaIDfGsLx4LeP6Zgczt7w/qyz0K/JDN6zChuip1w9qVJx83A1rO9rf
	/5kQ==
MIME-Version: 1.0
Received: by 10.220.107.15 with SMTP id z15mr2529764vco.36.1343397512731; Fri,
	27 Jul 2012 06:58:32 -0700 (PDT)
Received: by 10.220.35.132 with HTTP; Fri, 27 Jul 2012 06:58:32 -0700 (PDT)
In-Reply-To: <1343341065.4470.79.camel@x121e.pbcl.net>
References: <CAKSdS8LwF4XvBcuAoJ=36tOMMGF=VRLPoar5Tp9dCf+69JtiOw@mail.gmail.com>
	<1343341065.4470.79.camel@x121e.pbcl.net>
Date: Fri, 27 Jul 2012 09:58:32 -0400
Message-ID: <CAKSdS8+nnK0+0LTCn0yb0=-5Ye+9p=ab6MtTbFT5Uwv5qWTP=Q@mail.gmail.com>
From: Manuel Bessler <manuel.bessler@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libc-common.bbclass and uclibc
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
X-List-Received-Date: Fri, 27 Jul 2012 14:10:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 26, 2012 at 6:17 PM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2012-07-26 at 17:51 -0400, Manuel Bessler wrote:
>> =========================================
>> python populate_packages_prepend () {
>>         if d.getVar('DEBIAN_NAMES', True):
>>                 bpn = d.getVar('BPN', True)
>>                 d.setVar('PKG_'+bpn, 'libc6')
>> ...
>> =========================================
>
> That particular piece of code does seem bogus for many reasons and
> should probably go away.  I think it is a historical relic.
>
> But, that said, libc-common.bbclass is poorly named and is really
> specific to (e)glibc.  You don't want to use that for uclibc.

Ok, thanks, good to know. I just confirmed that my build indeed
succeeds without it.

Thanks,
Manuel


