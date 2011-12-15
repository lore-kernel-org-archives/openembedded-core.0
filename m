Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RbFvU-0006IA-T8
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 19:21:05 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 15 Dec 2011 10:14:05 -0800
Received: by iazz13 with SMTP id z13so1373688iaz.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 10:14:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.184.168 with SMTP id ev8mr3857289igc.62.1323972844770; Thu,
	15 Dec 2011 10:14:04 -0800 (PST)
Received: by 10.50.66.2 with HTTP; Thu, 15 Dec 2011 10:14:04 -0800 (PST)
In-Reply-To: <alpine.DEB.2.00.1112150931060.350@entw48>
References: <alpine.DEB.2.00.1112150931060.350@entw48>
Date: Thu, 15 Dec 2011 10:14:04 -0800
Message-ID: <CAPhnLPAu-EJ_t4FzE8FJUiB8oAri-+11=pzRYJkxf4Y0uW-cKQ@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: SPDX vs LICENSE field valid licenses
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
X-List-Received-Date: Thu, 15 Dec 2011 18:21:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 15, 2011 at 12:36 AM, Bernhard Guillon
<Bernhard.Guillon@hale.at> wrote:
> Hi all,
> I want to ask which license style is currently the preferred one? At
> license.bbclass this comment appears:
>
> # Standards are great! Everyone has their own. In an effort to standardize
> licensing
> # names, common-licenses will use the SPDX standard license names. In order
> to not
> # break the non-standardized license names that we find in LICENSE, we'll
> set
> # up a bunch of VarFlags to accomodate non-SPDX license names.
> #
> # We should really discuss standardizing this field, but that's a longer
> term goal.
> # For now, we can do this and it should grab the most common LICENSE naming
> variations.
>
> So the valide license names for recipes are e.g. MPLv1 while the SPDX
> license is MPL-1. Why are we not using MPL-1 at the LICENSE field from
> recipes?

Bernhard,

I'm writing an RFC for this both with a suggestion for a naming
convention, the field's format and some issues I've found with the
current model (mainly around most recipes having LICENSE as a recipe
value when in practice, it should be assigned to the package).

With all the OE-Core recipes out there, changing those fields without
a documented agreed upon standard would be the wrong thing to do. I've
been trying to make all the license.bbclass work compatible with OE
LICENSE values that have traditionally been there.

So, for example, I want to support both MPLv1.0 and MPL-1.0 in order
to be backwards compatible.  However, certain values (GPL, MPL, LGPL)
have no actual meaning due to missing version indicators. Those need
to be fixed.

I'll have a draft for this early next week.

Thanks,

-b

>
> Best regrads,
> Bernhard Guillon
>
>
> --
> Scanned by MailScanner.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


