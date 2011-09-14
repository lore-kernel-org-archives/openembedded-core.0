Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R3dtb-0003QM-PG
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 03:04:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8E0wvqb010817
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 17:58:57 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 13 Sep 2011 17:58:57 -0700
Message-ID: <4E6FFC50.3070700@windriver.com>
Date: Tue, 13 Sep 2011 19:58:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1315961204.2252.32.camel@scimitar>
In-Reply-To: <1315961204.2252.32.camel@scimitar>
Subject: Re: [RFC] Suggestion of minor change to patch submission policy re: long descriptions in commit headers
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
X-List-Received-Date: Wed, 14 Sep 2011 01:04:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/13/11 7:46 PM, Joshua Lock wrote:
> Our patch submission policy[1] 
> 
> "Optionally, you may include pointers to defects this change corrects.
> Unless the defect format is specified by the component you are
> modifying, it is suggested that you use a full URL to specify the
> reference to the defect information. Generally these pointers will
> precede any long description, but as an optional item it may be after
> the long description."
> 
> I've been guilty of always having the defect id after the description,
> and have never included the defect URL (though my reading suggests this
> is not required for Yocto defects I still believe this will make the
> defect id's more useful for fellow OE-Core developers).
> 
> Whilst I intend to rectify the latter I'd like to propose we change the
> former such that the defect information is at the end of the commit
> message.
> 
> I believe this is more suitable for the project because the defect
> information and its relevance should be summarised in the long
> description, and therefore the defect id and link to the defect tracker
> are supplemental information for interested readers.
> 
> IMHO this supplementary nature should lead us to request submitters
> provide defect information after the long description.
> 
> Thoughts?

We talked about this a bit while doing the original guidelines.  We debated between:

  Summary

  [BUG #XXXX or URL]

  Long description

  Signed-off-by:...

or

  Summary

  Long description

  [BUG #XXXX or URL]

  Signed-off-by:...

The former was chosen simply cause it shows the reader that we have a fixed a
bug (at the external reference) without them having to read or skim the long
description.  I can't say I care either way, other then I agree the former is a
bit quicker to read -if- the goal of reading is to determine which commits are
bug fixes, vs general development.

BTW -- [YOCTO #XXXX] is one of the "well defined" formats that is mentioned in
the guidelines document.  But if I was to point to a bug fix in say the GNU Hurd
bugzilla (is there such a bugzilla?) that should likely contain the full URL, as
people won't be used to seeing it...

--Mark

> Regards,
> Joshua
> 
> 1.
> http://openembedded.org/index.php?title=Commit_Patch_Message_Guidelines#New_Development
> 



