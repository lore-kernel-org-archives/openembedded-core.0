Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R3jS2-0007Gu-RI
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 09:00:07 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Sep 2011 23:54:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="48222883"
Received: from unknown (HELO [10.255.14.252]) ([10.255.14.252])
	by orsmga001.jf.intel.com with ESMTP; 13 Sep 2011 23:54:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2011 23:54:55 -0700
In-Reply-To: <4E6FFC50.3070700@windriver.com>
References: <1315961204.2252.32.camel@scimitar>
	<4E6FFC50.3070700@windriver.com>
Organization: Yocto Project / OTC / Intel
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1315983295.1058.22.camel@swold-mobl.bigsur.com>
Mime-Version: 1.0
Subject: Re: [RFC] Suggestion of minor change to patch submission policy re: long descriptions in commit headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: sgw@linux.intel.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 14 Sep 2011 07:00:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-13 at 19:58 -0500, Mark Hatle wrote:
> On 9/13/11 7:46 PM, Joshua Lock wrote:
> > Our patch submission policy[1] 
> > 
> > "Optionally, you may include pointers to defects this change corrects.
> > Unless the defect format is specified by the component you are
> > modifying, it is suggested that you use a full URL to specify the
> > reference to the defect information. Generally these pointers will
> > precede any long description, but as an optional item it may be after
> > the long description."
> > 
> > I've been guilty of always having the defect id after the description,
> > and have never included the defect URL (though my reading suggests this
> > is not required for Yocto defects I still believe this will make the
> > defect id's more useful for fellow OE-Core developers).
> > 
> > Whilst I intend to rectify the latter I'd like to propose we change the
> > former such that the defect information is at the end of the commit
> > message.
> > 
> > I believe this is more suitable for the project because the defect
> > information and its relevance should be summarised in the long
> > description, and therefore the defect id and link to the defect tracker
> > are supplemental information for interested readers.
> > 
> > IMHO this supplementary nature should lead us to request submitters
> > provide defect information after the long description.
> > 
> > Thoughts?
> 
> We talked about this a bit while doing the original guidelines.  We debated between:
> 
>   Summary
> 
>   [BUG #XXXX or URL]
> 
>   Long description
> 
>   Signed-off-by:...
> 
> or
> 
>   Summary
> 
>   Long description
> 
>   [BUG #XXXX or URL]
> 
>   Signed-off-by:...
> 
> The former was chosen simply cause it shows the reader that we have a fixed a
> bug (at the external reference) without them having to read or skim the long
> description.  I can't say I care either way, other then I agree the former is a
> bit quicker to read -if- the goal of reading is to determine which commits are
> bug fixes, vs general development.
> 
So, I agree with Mark here, while the reference may not be immediate to
people non familiar with the project directly, it is very helpful to a
maintainer that needs so see this information.  As a maintainer if I
have to constantly read through the long description only to find that I
understand it via a quick reference to a bug number I already know means
additional work. 

If one is not familiar with the bug numbers it's no great pain to skip
this information and read the full description.

I think the general benefit of having the bug number up front is helpful
vs having to scroll for it later in the text. 

Sau!



> BTW -- [YOCTO #XXXX] is one of the "well defined" formats that is mentioned in
> the guidelines document.  But if I was to point to a bug fix in say the GNU Hurd
> bugzilla (is there such a bugzilla?) that should likely contain the full URL, as
> people won't be used to seeing it...
> 
> --Mark
> 
> > Regards,
> > Joshua
> > 
> > 1.
> > http://openembedded.org/index.php?title=Commit_Patch_Message_Guidelines#New_Development
> > 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




