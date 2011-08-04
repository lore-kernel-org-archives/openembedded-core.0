Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1Qp6nr-0007No-U6
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 00:54:12 +0200
Received: by ywe9 with SMTP id 9so1440690ywe.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 15:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=LyVW2oimTSIuVEHnKagUGRfEajkzA3q4re84cLwh9pI=;
	b=aVjsNjYp6merZsUHENal8tN9ylAPlWKwqHw9glh+zqxFIGAUEMFKC+Rgzl62uxX9NJ
	CB78oKUKT3wLdcRyZ5pOdwkuiUaJtFWYRjTKPO5Xcc1CI8icC+jjnIUIdH9jrnpESjjO
	8P1w0aWKdJcuCmMEJcIB6iP2ru+jQAExG0aXM=
MIME-Version: 1.0
Received: by 10.43.131.73 with SMTP id hp9mr1164038icc.238.1312498187442; Thu,
	04 Aug 2011 15:49:47 -0700 (PDT)
Received: by 10.42.228.73 with HTTP; Thu, 4 Aug 2011 15:49:47 -0700 (PDT)
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE85F563@orsmsx504.amr.corp.intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<03d062a7104f31d03893833485ec3836c07e8f90.1312469790.git.nitin.a.kamble@intel.com>
	<1312494646.3169.2.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F4C1@orsmsx504.amr.corp.intel.com>
	<1312495815.3169.9.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F563@orsmsx504.amr.corp.intel.com>
Date: Thu, 4 Aug 2011 15:49:47 -0700
Message-ID: <CA+M6bXmzQdpJfADuj65emFTfED=o-HhF7QufdVtMTJCbcCgGGQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/10] glibc: bring back the needed support for glibc recipes
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
X-List-Received-Date: Thu, 04 Aug 2011 22:54:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 4, 2011 at 3:47 PM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Phil Blundell
>> Sent: Thursday, August 04, 2011 3:10 PM
>> To: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH 04/10] glibc: bring back the needed
>> support for glibc recipes
>>
>> On Thu, 2011-08-04 at 15:04 -0700, Kamble, Nitin A wrote:
>> >
>> > > -----Original Message-----
>> > > From: openembedded-core-bounces@lists.openembedded.org
>> > > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> Of
>> > > Phil Blundell
>> > > Sent: Thursday, August 04, 2011 2:51 PM
>> > > To: Patches and discussions about the oe-core layer
>> > > Subject: Re: [OE-core] [PATCH 04/10] glibc: bring back the needed
>> > > support for glibc recipes
>> > >
>> > > On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
>> > > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
>> > > >
>> > > > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>> > >
>> > > This commit message is very terse. =A0Why is this change necessary?
>> >
>> > Because meta-x32 layer has glibc, which needs these support files. I
>> will update the commit message in the tree.
>>
>> Can't the tclibc-glibc file go in meta-x32 as well, then?
>>
> It can go in the meta-x32 layer, but I think better place for this suppor=
t file is in the meta layer. It would help avoid duplication of the code in=
 multiple layers.

Part of the answer here is that obsolete / etc things don't belong in
the core, but in other layers that need them.  My read on things is
that we've removed glibc in favor of eglibc...

--=20
Tom


