Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T2KCa-0001Vj-9B
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 12:54:52 +0200
Received: by ghbz2 with SMTP id z2so4181412ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 03:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=+l8ooYl0m6z+pyJjwPXf7CLB3SnQYdxSpmYfzAXquhk=;
	b=oUPUo0LhQb5x9K63iITTDIxkg7HPn/GPWJl4Sy6E5LzZQuzcw37NGfv/Y3cM7MZ0G+
	9Mbmhlzu0mKm83qjZz3lItQ2pSgHKM9l3PSKPl/hib+CQcHf7z2dmBnv8o7Un0spoxrH
	MT4kLjrTkUvG75rTNaPviWKTtrTLxw+E5bQfZlOjJ4dXmc3Tf5XSLDK80gQ1BJEGjTmu
	dCBjsj9i3pYC9iP1vimDf/39dDaGBu34U3w/15CC1IbucJ/QMk03gVwNXk2ihI60v0FH
	WQAfN4oEKdrwZLtkoVMSCmx7J+JCx6rXj12aAZoFDwY5FqPEGCuSfhYgcX1VnxzoXRYI
	IuLA==
MIME-Version: 1.0
Received: by 10.50.181.136 with SMTP id dw8mr1377056igc.31.1345200173099; Fri,
	17 Aug 2012 03:42:53 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Fri, 17 Aug 2012 03:42:53 -0700 (PDT)
In-Reply-To: <1345196331.14667.86.camel@ted>
References: <cover.1345174354.git.laurentiu.palcu@intel.com>
	<92d6de11744098c3431309c5abc2f3217e166dac.1345174354.git.laurentiu.palcu@intel.com>
	<1345196331.14667.86.camel@ted>
Date: Fri, 17 Aug 2012 12:42:53 +0200
Message-ID: <CALbNGRR3A35Jx2ia2S4s_RVQ5O2v1g1EUQALyLBtwj4=KDnXxA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] adt-installer: add support for relocatable SDK
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
X-List-Received-Date: Fri, 17 Aug 2012 10:54:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 17, 2012 at 11:38 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-08-17 at 06:44 +0300, Laurentiu Palcu wrote:
>> Since we made the SDK relocatable, we have to add this functionality to
>> adt-installer too.
>>
>> Other:
>>  - Changed tabs to spaces in the recipe file too.
>
> Shell functions use tabs, python uses spaces. The OE TSC has thought
> long and hard about this and that is the decision. Its not perfect but
> the alternatives will cause more problems than any benefit is worth.
Is there some report/log/styleguide helping me to understand why we
use two tab/space strategies instead of having spaces for all?

Andreas
>
> Cheers,
>
> Richard


