Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SvaCM-0006en-V2
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Jul 2012 22:34:47 +0200
Received: by eaai10 with SMTP id i10so59877eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 13:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=LHzt/f6qgeGXqZtOSrSStfYfMlHpC7xeJnlJ5Ddx7HI=;
	b=NzpAIAasQos7lvKxdedPt3TIEvWLOcoHoMYwQGyfQMAOO3zorkKxZ/3lE0NKNUu4F0
	lUl1ZBHpqBihIcEdXfW1vBRJvnRIetNEITGPuqtyqAcqhAumFBbMJAuDS3ws+watjIYD
	Qd2Y+9OtKeTc5o0Qb/FyEQylAmAvSvWa95r4yI/JUCpkz2PtDfC51x+9nBGutG1J4O6m
	AOKVL1zJh7+Yh935tDpw2kwa66kbsRs8itjViyp7MHReBVtpEMRMIWc3Lwy2nzKZR8EC
	v0qn0BKX54Bw7ytjsCb2NlE4RTox02NQgucVAflqjA8FM6jgILTYpi6/m5ZZnKMLziDh
	pLJA==
Received: by 10.14.180.67 with SMTP id i43mr9535296eem.23.1343593392168; Sun,
	29 Jul 2012 13:23:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Sun, 29 Jul 2012 13:22:41 -0700 (PDT)
In-Reply-To: <5011BAF4.7090301@windriver.com>
References: <1343328564-3644-1-git-send-email-sgw@linux.intel.com>
	<1343329086.4470.56.camel@x121e.pbcl.net>
	<CAMKF1so+OJTjN+fRP8DJK2zCNKUyTFYJ==zUMkRm1+-6FkYCvg@mail.gmail.com>
	<1343335085.9574.32.camel@ted>
	<1343335989.4470.75.camel@x121e.pbcl.net>
	<CAMKF1srcDNx6cL42Lu9vyig8nHB14xp2+fapoCxd4kTh9dVGCw@mail.gmail.com>
	<5011BAF4.7090301@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Jul 2012 13:22:41 -0700
Message-ID: <CAMKF1srV+21Gm_rTCuaGdJuC3aLjYwwQtVm3sXQWpGA2CwEo9w@mail.gmail.com>
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
X-List-Received-Date: Sun, 29 Jul 2012 20:34:47 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 26, 2012 at 2:47 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 7/26/12 4:27 PM, Khem Raj wrote:
>>
>> On Thu, Jul 26, 2012 at 1:53 PM, Phil Blundell <philb@gnu.org> wrote:
>>>
>>> On Thu, 2012-07-26 at 21:38 +0100, Richard Purdie wrote:
>>>>
>>>> the other alternative which comes to mind would be so set a variable
>>>> with the name we want used there, defaulting it to PN.
>>>
>>>
>>> That sounds like the most wholesome plan to me.
>>
>>
>> can we use BPN, unless we generate locale for native and nativesdk
>> cross and crosssdk
>> class of recipes that should work too. I thought about it  and thought
>> it was too
>> intrusive.
>
>
> There are cases for multilibs where locales for specific multilib packages
> will be generated.  We theoretically could generate them for native(sdk) and
> cross(sdk) as well, but I don't believe we do that in the general cases.
>
> --Mark


After RPs fix and Paul's root file system rework I am still seeing

temp/run.do_rootfs.25593: 932: local: locale-base-en-gb: bad variable name



>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


