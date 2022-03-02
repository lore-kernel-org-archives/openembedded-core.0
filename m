X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <f0076c47-b5f4-07cc-2179-04265f09829b@bootlin.com>
Date: Wed, 2 Mar 2022 14:56:16 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] Yocto Project Status WW09`22
References: <101501d82d84$69e22170$3da66450$@gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
In-Reply-To: <101501d82d84$69e22170$3da66450$@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

Hi Stephen

On 3/1/22 16:52, Stephen Jolley wrote:
>
> Current Dev Position: YP 3.5 M4
>
> Next Deadline: 4th April. 2022 YP 3.5 M4 build
>
>  
>
> Next Team Meetings:
>
>   * Bug Triage meeting Thursday Mar. 3rd 7:30 am PDT
>     (https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09
>     <https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09>)
>   * Monthly Project Meeting Tuesday Mar. 1st at 8 am PDT
>     (https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09
>     <https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09>)
>     <https://zoom.us/j/990892712>
>   * Weekly Engineering Sync Tuesday Mar. 8th  at 8 am PDT
>     (https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09
>     <https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09>)
>     <https://zoom.us/j/990892712>
>   * Twitch -  See https://www.twitch.tv/theyoctojester
>
>  
>
> Key Status/Updates:
>
>   * We are now at feature freeze for 3.5, our next LTS release
>   * YP 3.3.5 is out of QA and pending release approval
>   * Inclusive language changes have merged however there are still:
>       o Incompatible license related variable changes
>       o Function variable name changes needed
>       o No migration documentation or documentation of the changes
>       o No documentation of the bitbake rename code
>       o No updates to the manual for the variable renames
>
> We do need people to pull things together and finish things off, help
> in doing that is needed and much appreciated.
>
>   * There is a pending patch to warn about old style license
>     identifiers pending in master-next and due to be posted for
>     review. On balance this is probably a good thing to get into the
>     LTS but we’re open to input on that.
>   * The incompatible license changes will mean anyone using those
>     variables will need to update what they’re doing carefully.
>     Patches in master-next now pass testing and are due to be posted
>     on the mailing list.
>   * The python build process change to use wheels has merged. That
>     change has caused some disruption but was close enough to being
>     ready it seemed worth making the final push for inclusion.
>   * The infrastructure move was successful and all services should be
>     restored. There are some networking issues occurring on
>     autobuilder builds which are preventing release builds at this
>     time and are being looked into.
>   * As such, the M3 release build will likely happen late this week or
>     early next week.
>   * If people see intermittent issues in their own builds,
>     particularly if they’re the same as intermittent issues seen on
>     the autobuilder, please do comment in the bugs mentioning when
>     they happen as the frequency information does help us prioritize
>     fixing the most common issues.
>   * Intermittent issues continue to be at record high levels and help
>     is very much welcome in trying to resolve them. You can see the
>     list of failures we’re continuing to see by searching for the
>     “AB-INT” tag in bugzilla:
>     https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT
>     <https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT>
>
>  
>
> Ways to contribute:
>
>   * There are bugs identified as possible for newcomers to the
>     project: https://wiki.yoctoproject.org/wiki/Newcomers
>     <https://wiki.yoctoproject.org/wiki/Newcomers>
>   * There are bugs that are currently unassigned for YP 3.5. See:
>     https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_3.5_Unassigned_Enhancements.2FBugs
>     <https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_3.5_Unassigned_Enhancements.2FBugs>
>   * We’d welcome new maintainers for recipes in OE-Core. Please see
>     the list at:
>     http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintainers.inc
>     <http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintainers.inc>
>     and discuss with the existing maintainer, or ask on the OE-Core
>     mailing list. We will likely move a chunk of these to “Unassigned”
>     soon to help facilitate this.
>   * Help us resolve CVE issues: CVE metrics
>     <https://docs.google.com/spreadsheets/d/e/2PACX-1vRgNISmH0Ditf0bRtSezeR2XsgKIiSFJKF6KJUHpnzocNGzvKZbuSDKfmV3n64BFXDRqElBSJnhHtG4/pubchart?oid=1993375488&format=interactive> 
>
>  
>
> YP 3.5 Milestone Dates:
>
>   * YP 3.5 M3 build date 2022/02/21
>   * YP 3.5 M3 Release date 2022/03/04
>   * YP 3.5 M4 build date 2022/04/04
>   * YP 3.5 M4 Release date 2022/04/29
>
>  
>
> Upcoming dot releases:
>
>   * YP 3.3.5  is out of QA
>   * YP 3.3.5 Release date 2022/02/25
>   * YP 3.1.15 build date 2022/03/14
>   * YP 3.1.15 Release date 2022/03/25
>   * YP 3.4.3 build date 2022/03/21
>   * YP 3.4.3 Release date 2022/04/01
>   * YP 3.3.6 build date 2022/03/28
>   * YP 3.3.6 Release date 2022/04/08
>   * YP 3.1.16 build date 2022/04/25
>   * YP 3.1.16 Release date 2022/05/06
>
>  
>
> Tracking Metrics:
>
>   * WDD 2679 (last week
>     2652)(https://wiki.yoctoproject.org/charts/combo.html
>     <https://wiki.yoctoproject.org/charts/combo.html>)
>   * OE-Core/Poky Patch Metrics
>       o Total patches found: 1202 (last week 1202)
>       o Patches in the Pending State: 336 (28%) [last week 334 (28%)]
>
>  
>
> The Yocto Project’s technical governance is through its Technical
> Steering Committee, more information is available at:
>
> https://wiki.yoctoproject.org/wiki/TSC
> <https://wiki.yoctoproject.org/wiki/TSC>
>
>  
>
> The Status reports are now stored on the wiki at:
> https://wiki.yoctoproject.org/wiki/Weekly_Status
> <https://wiki.yoctoproject.org/wiki/Weekly_Status>
>
>  
>
> [If anyone has suggestions for other information you’d like to see on
> this weekly status update, let us know!]
>

Thanks very much for this always useful weekly status. It's a must have
when you cannot join the weekly engineering meeting.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

