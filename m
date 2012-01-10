Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Rkf6Z-0004At-KI
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 18:03:23 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 10 Jan 2012 08:55:53 -0800
Received: by iadk27 with SMTP id k27so1133379iad.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 08:55:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.73.138 with SMTP id s10mr22441701icj.38.1326214552838; Tue,
	10 Jan 2012 08:55:52 -0800 (PST)
Received: by 10.231.162.131 with HTTP; Tue, 10 Jan 2012 08:55:52 -0800 (PST)
In-Reply-To: <CABcZANnXksgwqbgU_mhD4ptgEx_0=M9MUHV2uagi3owEU2yrrg@mail.gmail.com>
References: <1326208678-17244-1-git-send-email-andrei@gherzan.ro>
	<CABcZANnzU_5LTeRV=UjPiUWn6rqnZS6RR_yhsUKE_C_ap-PZ9g@mail.gmail.com>
	<4F0C623B.7050209@gherzan.ro>
	<CABcZANmcdGtOa+K9=6Ei_vAF=BVQwa6BYAYTjpeEuCDcqPcPnQ@mail.gmail.com>
	<4F0C637E.8050704@gherzan.ro>
	<CABcZANnXksgwqbgU_mhD4ptgEx_0=M9MUHV2uagi3owEU2yrrg@mail.gmail.com>
Date: Tue, 10 Jan 2012 08:55:52 -0800
Message-ID: <CAPhnLPB=UDp7P=G+TO7i0KBYhyDoZUw1g4ZSto4fFCm3ExsXLw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] license.bbclass base.bbclass: support for 'or' operand in LICENSE and for SPDX license names
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
X-List-Received-Date: Tue, 10 Jan 2012 17:03:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 10, 2012 at 8:34 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Tue, Jan 10, 2012 at 9:12 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
>> No worries. Anyway, you are right about the "+" mechanism but right now this
>> is a fast and complete solution.
>
> Indeed, nice work on this.

Agreed! One note about "+". There is still a discussion about "or
greater" licensing within the SPDX community about how "or greater"
should be dealt with.

http://www.spdx.org/wiki/proposal-2010-11-16-1-or-later-version-licensing
https://bugs.linuxfoundation.org/show_bug.cgi?id=591

I'm partial to, as a stop gap, re-including L/GPL-x.0+ license files
into common-licenses until they hash it out and treating "+" as just
part of the license name. It's not a perfect solution but it should
solve most "or greater" use cases.

-b

> --
> Christopher Larson
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


