Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RQvlV-0006yJ-2y
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 07:48:05 +0100
Received: by faat2 with SMTP id t2so2571430faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 22:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=P5b8mkQfD2Zklr1BAfWNUYrxkut/8WKtHzyhsgCPOSc=;
	b=DFLzPOplZfooQj6eDFSSP2mk4l/W8lOzcTc2jSucndJPxvHAGttzgeq0nev7l7T+s2
	F7Hj0vsLpSgrRnNii/xvsq8zH7/xqRCtRZDsVufxHIntr0c0ptWo3UDgnh5QC8jO/4j7
	8+jIJsoqi1PdEUxZjT9lEAdCm+Q9uja9opM9c=
Received: by 10.152.102.138 with SMTP id fo10mr22573431lab.44.1321512100101;
	Wed, 16 Nov 2011 22:41:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.12.36 with HTTP; Wed, 16 Nov 2011 22:41:09 -0800 (PST)
In-Reply-To: <1321497356.1264.26.camel@localhost.localdomain>
References: <4EAE0428.2020209@windriver.com>
	<CAMKF1spV_BiCTo1YCoKL7XUTqRWtFJFYP4yB16FoyETjYzAuxg@mail.gmail.com>
	<4EC47257.5030302@windriver.com>
	<1321497356.1264.26.camel@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Nov 2011 22:41:09 -0800
Message-ID: <CAMKF1sp4BQc1huW2et1hBUHX-sG9hKh=NA=0ZcFWQVDuyWPRJw@mail.gmail.com>
To: niqingliang@insigma.com.cn, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Saul Wold <saul.wold@intel.com>
Subject: Re: What is the strategy to update eglibc?
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
X-List-Received-Date: Thu, 17 Nov 2011 06:48:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2011 at 6:35 PM, Ni Qingliang
<niqingliang@insigma.com.cn> wrote:
> it looks like there is 2.14 bb file already, why the default eglibc stay
> on 2.13?

2.14 removed some functionality rpc which is used extensively
alternative to use libtirpc is not sufficient atm. Therefore we
readded the functionality into 2.14 recipes and they need testing.
Some distros e.g. angstrom-bleeding use 2.14 but its not default in
oe-core yet for same reasons that it needs to be
tested

>
> On Thu, 2011-11-17 at 10:32 +0800, Kang Kai wrote:
>> On 2011=E5=B9=B411=E6=9C=8817=E6=97=A5 05:38, Khem Raj wrote:
>> > On Sun, Oct 30, 2011 at 7:12 PM, Kang Kai<Kai.Kang@windriver.com> =C2=
=A0wrote:
>> >> Hi Saul,
>> >>
>> >> I just want to update eglibc but eglibc is using its 2.14 branch and =
use svn
>> >> commit revision "15225" as current version. Of course it is behind th=
e
>> >> latest svn revision, but I don't quit sure about which is the right r=
evision
>> >> to update eglibc.
>>
>> Hi Khem,
>> > since release branches of eglibc only get bug fixes in ideal case it
>> > should be good at any revision. However if we have bug
>> > fixes that dont affect us immediately we do not tend to update
>> > the revision. If you find that some bug fix thats applied upstream is
>> > needed it certainly can be a reason to bump up srcrev given we do some
>> > level of build and runtime testing
>> > with new revision.
>>
>> Thanks very much for your detailed explanation.
>> I check the changelog of eglibc 2.13 branch(latest is 15508), and they
>> are some tiny updates except the revision 15226 that is same with
>> current patch
>>
>> glibc_bug_fix_12454.patch
>>
>> And I made the rough tests of image-sato of qemu-x86 and qemu-arm and
>> results are fine.
>>
>> Regards,
>> Kai
>> >
>> >> Could you give me some guide? Thank you!
>> >>
>> >> Regards,
>> >> Kai
>> >>
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >>
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Yi Qingliang
> niqingliang@insigma.com.cn
> https://niqingliang2003.wordpress.com
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


