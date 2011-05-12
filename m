Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>)
	id 1QKdCX-00057f-Bj; Thu, 12 May 2011 23:13:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p4CLAp0w000213
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 May 2011 14:10:52 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 12 May 2011 14:10:51 -0700
Message-ID: <4DCC4CDA.6050701@windriver.com>
Date: Thu, 12 May 2011 16:10:50 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <4DCC3BA6.3010406@windriver.com> <4DCC4A51.9010309@linux.intel.com>
In-Reply-To: <4DCC4A51.9010309@linux.intel.com>
Cc: the oe-core layer <openembedded-core@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org,
	poky <poky@yoctoproject.org>, Patches
Subject: Re: [poky] Commit and Patch message guidelines - fifth draft
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
X-List-Received-Date: Thu, 12 May 2011 21:13:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 5/12/11 4:00 PM, Darren Hart wrote:
> Hi Mark,
> 
> Thanks for writing this up. I think this is on the right track. A few
> comments inline...
> 
> As a side note, I'm currently working with various people on improving
> our review/pull process which dovetails with this a bit, but probably
> doesn't need to be explicitly called out here.
> 
> 
> 
> On 05/12/2011 12:57 PM, Mark Hatle wrote:
>> This is the fifth draft of the guidelines... All previous feedback has been
>> incorporated...
>>
>> (The fourth draft was reviewed and found lacking in a few key areas, so I
>> skipped the public posting.)
>>
>> The new concept of Upstream-Status was added by the fourth draft as
>> something strongly suggested, but optional.  This is likely an area that may
>> still need some revision before we call this final.
>>
>> ----
>>
>> Introduction
>> ------------
>>
>> This set of guidelines is intended to help both the developer and reviewers of
>> changes determine reasonable patch headers and change commit messages. Often
>> when working with the code, you forget that not everyone is as familiar with the
>> problem and/or fix as you are. Often the next person in the code doesn't
>> understand what or why something is done so they quickly look at patch header
>> and commit messages. Unless these messages are clear it will be difficult to
>> understand the relevance of a given change and how future changes may impact
>> previous decisions.
>>
>> This policy refers both to patches that are being applied by recipes as well as
>> commit messages that are part of the source control system, usually git. A patch
>> file needs a header in order to describe the specific change that that are made
>> within that patch, while a commit message describes one or more changes to the
>> overall project or system. Both the patch headers and commit messages require
>> the same attention and basic details, however the purposes of the messages are
>> slightly different. A commit message documents all of the changes made as part
>> of a commit, while a patch header documents items specific to a single patch. In
>> many cases the patch header can also be used as the commit message.
>>
>> This policy does not cover the testing of the changes, or the technical criteria
>> for accepting a patch.
>>
>> By following these guidelines we will have a better record of the problems and
>> solutions made over the course of development. It will also help establish a
>> clear provenance of all of the code and changes within the development.
>>
>>
>> General Information
>> -------------------
>>
>> While specific to the Linux kernel development, the following could also be
>> considered a general guide for any Open Source development:
>>
>> http://ldn.linuxfoundation.org/book/how-participate-linux-community
>>
>> Many of the guidelines in this document are related to the items in that
>> information.
>>
>> Pay particular attention to section 5.3 that talks about patch preparation.
>> The key thing to remember is to break up your changes into logical sections.
>> Otherwise you run the risk of not being able to even explain the purpose of a
>> change in the patch headers!
>>
>> In addition section 5.4 explains the purpose of the Signed-off-by: tag line as
>> discussed in later parts of this document. Due to the importance of the
>> Signed-off-by: tag line a copy of the description follows:
>>
>>     Signed-off-by: this is a developer's certification that he or she has
>>     the right to submit the patch for inclusion into the [project].  It is
>>     an agreement to the Developer's Certificate of Origin, the full text of
>>     which can be found in [Linux Kernel] Documentation/SubmittingPatches.
>>     Code without a proper signoff cannot be merged into the mainline.
>>
>> For more information on the Developer's Certificate of Origin and the Linux
>> Kernel Documentation/SubmittingPatches, see:
>> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/SubmittingPatches
>>
>> Patch Headers and Commit Messages
>> ---------------------------------
>> There seems to always be a question or two surrounding what a person
>> should put in a patch header, or commit message.
>>
>> The general rules always apply, those being that there is a single line
>> short log or summary of the change (think of this as the subject when the patch
>> is e-mailed), and then the more detailed long log, and closure with tag lines
>> such as "Signed-off-by:".
> 
> 
> A complete list of acceptable tag lines should be documented. Consider:
> 
> Signed-off-by:
> Acked-by:    \__ The difference between these two is subtle. Acked-by
> Reviewed-by: /   implies a certain degree of authority over the affected
> Tested-by:       code.
> Reported-by:

These were in the original guidelines, but it was decided by the OE-TSC, and
general comments from the OE users/developers that Signed-off-by is all that is
needed.

Anything beyond this is acceptable, but not part of the overall guidlines.

> 
>>
>>
>> New development
>> ---------------
>>
>> A minimal patch or commit message would be of the format:
>>
>>    Short log / Statement of what needed to be changed.
>>
>>    (Optional pointers to external resources, such as defect tracking)
>>
>>    The intent of your change.
>>
>>    (Optional, if it's not clear from above) how your change resolves the
>>    issues in the first part.
>>
>>    Tag line(s) at the end.
>>
>> For example:
>>
>>    foobar: Adjusted the foo setting in bar
>>
>>    When using foobar on systems with less than a gigabyte of RAM common
>>    usage patterns often result in an Out-of-memory condition causing
>>    slowdowns and unexpected application termination.
>>
>>    Low-memory systems should continue to function without running into
>>    memory-starvation conditions with minimal cost to systems with more
>>    available memory.  High-memory systems will be less able to use the
>>    full extent of the system, a dynamically tunable option may be best,
>>    long-term.
>>
>>    The foo setting in bar was decreased from X to X-50% in order to
>>    ensure we don't exhaust all system memory with foobar threads.
>>
>>    Signed-off-by: Joe Developer <joe.developer@example.com>
>>
>> The minimal commit message is good for new code development and simple changes.
>>
>> The single short log message indicates what needed to be changed. It should
>> begin with an indicator as to the primary item changed by this work,
>> followed by a short summary of the change. In the above case we're indicating
>> that we've changed the "foobar" item, by "adjusting the foo setting in bar".
>>
>> The single short log message is analogous to the git "commit summary". While no
>> maximum line length is specified by this policy, it is suggested that it remains
>> under 78 characters wherever possible.
>>
>> Optionally, you may include pointers to defects this change corrects. Unless
>> the defect format is specified by the component you are modifying, it is
>> suggested that you use a full URL to specify the reference to the defect
>> information. Generally these pointers will precede any long description, but as
>> an optional item it may be after the long description.
>>
>> For example, you might refer to an open source defect in the RPM project:
>>
>>    rpm: Adjusted the foo setting in bar
>>
>>    [RPM Ticket #65] -- http://rpm5.org/cvs/tktview?tn=65,5
>>
> 
> 
> Another URL example would be mailing list reference. H. Peter Anvin
> recently proposed a new automated system for dealing with this for LKML.
> We might want to do something similar.
> 

Sounds like something worth looking into.  Do you have a reference to the message?

>>    The foo setting in bar was decreased from X to X-50% in order to
>>    ensure we don't exhaust all system memory with foobar threads.
>>
>>    Signed-off-by: Joe Developer <joe.developer@example.com>
>>
>> You must then have a full description of the change. Specifying the intent of
>> your change and if necessary how the change resolves the issue.
>>
>> As mentioned above this is intended to answer the "what were you thinking"
>> questions down the road and to know what other impacts are likely to
>> result of the change needs to be reverted. It also allows for better
>> solutions if someone comes along later and agrees with paragraph 1
>> (the problem statement) and either disagrees with paragraph 2
>> (the design) or paragraph 3 (the implementation).
>>
>> Finally one or more tag lines should exist. Each developer responsible
>> for working on the patch is responsible for adding a Signed-off-by: tag line.
>>
>> It is not acceptable to have an empty or non-existent header, or just a single
>> line message. The summary and description is required for all changes.
>>
>>
>> Importing from elsewhere
>> -----------------------------
>> If you are importing work from somewhere else, such as a cherry-pick from
>> another repository or a code patch pulled from a mailing list, the minimum patch
>> header or commit message is not enough. It does not clearly establish the
>> provenance of the code.
>>
>> The following specifies the additional guidelines required for importing changes
>> from elsewhere.
>>
>> By default you should keep the original authors summary and description,
>> along with any tag lines such as, "Signed-off-by:". If the original change that
>> was imported does not have a summary and/or commit message from the original
>> author, it is still your responsibility to add them to the patch header. Just as
>> if you wrote the code, you should be able to clearly explain what the change
>> does. It is also necessary to document the original author of the change. You
>> should indicate the original author by simply stating "written by" or "posted to
>> the ... mailing list by". Only the original author can commit using a
>> Signed-off-by: tag line.
> 
> 
> Is this right? It was my understanding that the Signed-off-by come from
> each person that handles the patch between creation and commit. For the
> Linux kernel, which you reference above, many (most?) patches have
> multiple SOB lines.
> 

Ohh you found a mistake.  This was originally written when we had additional
tags beyond simply signed-off-by.  I will correct this in the next revision, the
purpose is that you can only add your OWN signed-off-by line, you may not add a
line for the original author, if they did not already add it.

Agree with the rest of the comments.  I will adjust them as appropriate for the
sixth draft..

--Mark

>>
>> It is also required that the origin of the work be fully documented. The origin
>> should be specified as part of the commit message in a way that an average
>> developer would be able to track down the original code. URLs should reference
>> original authoritative sources and not mirrors.
>>
>> If changes were required to resolve conflicts, they should be documented as
>> well.  When incorporating a commit or patch from an external source, changes to
>> the functionality not related to resolving conflicts should be made in a
>> second commit or patch.  This preserves the original external commit, and makes
>> the modifications clearly visible, and prevents confusion over the author of the
>> code.
>>
>> Finally a "Signed-off-by:" tag line should be added to indicate that you worked
>> with the patch.
> 
> 
> OK, this seems at odds with the statement 3 paragraphs up about only the
> original author adding an SOB line. A clarification is needed.
> 
> 
>>
>> Example: Importing form elsewhere unmodified
>> --------------------------------------------
>>
>> For example, if you were to pull in the patch from the above example unmodified:
>>
>>    foobar: Adjusted the foo setting in bar
>>
>>    When using foobar on systems with less than a gigabyte of RAM common
>>    usage patterns often result in an Out-of-memory condition causing
>>    slowdowns and unexpected application termination.
>>
>>    Low-memory systems should continue to function without running into
>>    memory-starvation conditions with minimal cost to systems with more
>>    available memory.  High-memory systems will be less able to use the
>>    full extent of the system, a dynamically tunable option may be best,
>>    long-term.
>>
>>    The foo setting in bar was decreased from X to X-50% in order to
>>    ensure we don't exhaust all system memory with foobar threads.
>>
>>    Signed-off-by: Joe Developer <joe.developer@example.com>
>>
>>    The patch was imported from the OpenEmbedded git server
>>    (git://git.openembedded.org/openembedded) as of commit id
>>    b65a0e0c84cf489bfa00d6aa6c48abc5a237100f.
>>
>>    Signed-off-by: Your Name <your.name@openembedded.org>
>>
>> The above example shows a clear way for a developer to find the original source
>> of the change. It indicates that the OpenEmbedded developer simply integrated
>> the change into the system without making any further modifications.
>>
>> Example: Importing from Elsewhere modified
>> ------------------------------------------
>>
>> When importing a patch, occasionally changes have to be made in order to resolve
>> conflicts.  The following is an example of the commit message when the item needed
>> to be modified:
>>
>>    foobar: Adjusted the foo setting in bar
>>
>>    When using foobar on systems with less than a gigabyte of RAM common
>>    usage patterns often result in an Out-of-memory condition causing
>>    slowdowns and unexpected application termination.
>>
>>    Low-memory systems should continue to function without running into
>>    memory-starvation conditions with minimal cost to systems with more
>>    available memory.  High-memory systems will be less able to use the
>>    full extent of the system, a dynamically tunable option may be best,
>>    long-term.
>>
>>    The foo setting in bar was decreased from X to X-50% in order to
>>    ensure we don't exhaust all system memory with foobar threads.
>>
>>    Signed-off-by: Joe Developer <joe.developer@example.com>
>>
>>    The patch was imported from the OpenEmbedded git server
>>    (git://git.openembedded.org/openembedded) as of commit id
>>    b65a0e0c84cf489bfa00d6aa6c48abc5a237100f.
>>
>>    A previous change had modified the memory threshold calculation,
>>    causing a conflict.  The conflict was resolved by preserving the
>>    memory threshold calculation from the existing implementation.
>>
>>    Signed-off-by: Your Name <your.name@openembedded.org>
>>
>>
>> Patch Header Recommendations
>> ----------------------------
>> In order to keep track of patches and ultimately reduce the number of patches
>> that are required to be maintained, we need to track the status of the patches
>> that are created. The following items are specific to patches applied by recipes.
>>
>> In addition to the items mentioned above, we also want to track if it's
>> appropriate to get this particular patch into the upstream project. Since we
>> want to track this information, we need a consistent tag and set of status that
>> can be searched.
>>
>> While adding this tracking information to the patch headers is currently optional,
>> it is highly recommended and some maintainers may require it.  It is optional at
>> this time so that it can be evaluated as to it's usefulness over time.  Existing
>> patches will be modified with the tag as they are modified.
>>
>> As mentioned in the above, be sure to include any URL to bug tracking, mailing
>> lists or other reference material pertaining to the patch. Then add a new tag
>> "Upstream-Status:" which contains one of the following items:
>>
>>    Pending
>>    - No determination has been made yet or not yet submitted to upstream
>>
>>    Submitted [where]
>>    - Submitted to upstream, waiting approval
>>    - Optionally include where it was submitted, such as the author, mailing
>>      list, etc.
>>
>>    Accepted
>>    - Accepted in upstream, expect it to be removed at next update, include
>>      expected version info
>>
>>    Backport
>>    - Backported from new upstream version, because we are at a fixed version,
>>      include upstream version info
>>
>>    Denied
>>    - Not accepted by upstream, include reason in patch
>>
>>    Inappropriate [reason]
>>    - The patch is not appropriate for upstream, include a brief reason on the
>>      same line enclosed with []
>>      reason can be:
>>        not author (You are not the author and do not intend to upstream this,
>>                    source must be listed in the comments)
>>        native
>>        licensing
>>        configuration
>>        enable feature
>>        disable feature
>>        bugfix (add bug URL here)
>>        embedded specific
>>        no upstream (the upstream is no longer available -- dead project)
>>        other (give details in comments)
>>
>> The various "Inappropriate [reason]" status items are meant to indicate that the
>> person reasonable for adding this patch to the system does not intend to upstream
>> the patch for a specific reason.  Unless otherwise noted, another person could
>> submit this patch to the upstream, if they do the status should be changed to
>> "Submitted [where]", and an additional signed-off-by: line added to the patch by
> 
> 
> s/signed-off-by:/Signed-off-by:/
> 
> 
>> the person claiming responsibility for upstreaming.
>>
>> For example, if the patch has been submitted upstream:
>>
>>    rpm: Adjusted the foo setting in bar
>>
>>    [RPM Ticket #65] -- http://rpm5.org/cvs/tktview?tn=65,5
>>
>>    The foo setting in bar was decreased from X to X-50% in order to
>>    ensure we don't exhaust all system memory with foobar threads.
>>
>>    Upstream-Status: Submitted [rpm5-devel@rpm5.org]
>>
>>    Signed-off-by: Joe Developer <joe.developer@example.com>
>>
>> A future commit can change the value to "Accepted" or "Denied" as appropriate.
>>
>> Common Errors in Patch and Commit messages
>> ------------------------------------------
> 
> 
> s/messages/Messages/
> 
> 
>>
>> - Short log does not start with the file or component being modified.  Such as
>> "foo: Update to new upstream version 5.8.9"
>>
>> - Avoid starting the summary line with a capital letter, unless the component
>> being referred to also begins with a capital letter.
>>
>> - Don't have one huge patch, split your change into logical subparts. It's
>> easier to track down problems afterward using tools such as git bisect. It also
>> makes it easy for people to cherry-pick changes into things like stable branches.
>>
>> - Don't simply translate your change into English for a commit log. The log
>> "Change compare from zero to one" is bad because it describes only the code
>> change in the patch; we can see that from reading the patch itself. Let the code
>> tell the story of the mechanics of the change (as much as possible), and let
>> your comment tell the other details -- i.e. what the problem was, how it
>> manifested itself (symptoms), and if necessary, the justification for why the
>> fix was done in manner that it was.
>>
>> - Don't start your commit log with "This patch..." -- we already know it is a patch.
>>
>> - Don't repeat your short log in the long log. If you really really don't have
>> anything new and informational to add in as a long log, then don't put a long
>> log at all. This should be uncommon -- i.e. the only acceptable cases for no
>> long log would be something like "Documentation/README: Fix spelling mistakes".
>>
>> - Don't put absolute paths to source files that are specific to your site, i.e.
>> if you get a compile error on "fs/exec.c" then tidy up the parts of the compile
>> output to just show that portion. We don't need to see that it was
>> /home/wally/src/git/oe-core/meta/classes/insane.bbclass or similar - that full
>> path has no value to others. Always reduce the path to something more
>> meaningful, such as oe-core/meta/classes/insane.bbclass.
>>
>> - Always use the most significant ramification of the change in the words of
>> your subject/shortlog. For example, don't say "fix compile warning in foo" when
>> the compiler warning was really telling us that we were dereferencing complete
>> garbage off in the weeds that could in theory cause an OOPS under some
>> circumstances. When people are choosing commits for backports to stable or
>> distro kernels, the shortlog will be what they use for an initial sorting
>> selection. If they see "Fix possible OOPS in...." then these people will look
>> closer, whereas they most likely will skip over simple warning fixes.
>>
>> - Don't put in the full 20 or more lines of a backtrace when really it is just
>> the last 5 or so function calls that are relevant to the crash/fix. If the entry
>> point, or start of the trace is relevant (i.e. a syscall or similar), you can
>> leave that, and then replace a chunk of the intermediate calls in the middle
>> with a single [...]
>>
>> - Don't include timestamps or other unnecessary information, unless they are
>> relevant to the situation (i.e. indicating an unacceptable delay in a driver
>> initialization etc.)
>>
>> - Don't use links to temporary resources like pastebin and friends. The commit
>> message may be read long after this resource timed out.
>>
>> - Don't reference mirrors, but instead always reference original authoritative
>> sources.
>>
>> - Avoid punctuation in the short log.
> 
> 
> Thanks,
> 



