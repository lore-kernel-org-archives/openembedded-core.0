Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <2455ee0c-6386-f3ea-39d9-7a8f93e64d38@gmail.com>
Date: Sun, 27 Feb 2022 07:28:38 -0800
MIME-Version: 1.0
Subject: Re: [OE-core] Yocto Project Status WW08`22
References: <319f01d82804$7d7576e0$786064a0$@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
In-Reply-To: <319f01d82804$7d7576e0$786064a0$@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Stephen Jolley <sjolley.yp.pm@gmail.com>, yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org

I see there is an April release of Hardknott.  Is that the last official 
Hardknott release from the Yocto Project?

-armin

On 2/22/22 07:54, Stephen Jolley wrote:
>
> Current Dev Position: YP 3.5 M4
>
> Next Deadline: 4th April. 2022 YP 3.5 M4 build
>
> Next Team Meetings:
>
>   * Bug Triage meeting Thursday Feb. 24th 7:30 am PDT
>     (https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09
>     <https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09>)
>   * Monthly Project Meeting Tuesday Mar. 1st at 8 am PDT
>     (https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09
>     <https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09>)
>     <https://zoom.us/j/990892712>
>   * Weekly Engineering Sync Tuesday Feb. 22nd at 8 am PDT
>     (https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09
>     <https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09>)
>     <https://zoom.us/j/990892712>
>   * Twitch - See https://www.twitch.tv/theyoctojester
>
> Key Status/Updates:
>
>   * We are now at feature freeze for 3.5, our next LTS release
>   * YP 3.1.14 and YP 3.2.4 were released
>   * YP 3.3.5 is in QA
>   * After a last minute push, the base set of inclusive language
>     changes have merged. There is a conversion script which can be run
>     to convert layers. Not all changes needed have been written yet
>     but enough are present to allow the conversion process to start.
>   * There were also changes to convert LICENSE fields to use SPDX
>     identifiers and there is a second conversion script for this that
>     can be used.
>   * We have updated the core layer series name to kirkstone and other
>     layers will now need to update to confirm compatibility with
>     kirkstone.
>   * There is a patchset to update python’s build processes to use the
>     upstream preferred wheel approach which would aid support of
>     python over the next few years. It is late in the cycle for this
>     kind of change but we will give this series a few days of testing
>     to make a decision and welcome user feedback either way on these
>     changes.
>   * As such, the M3 release build will likely not happen until early
>     next week.
>   * The autobuilder infrastructure is planned to be offline 26-28th
>     February for a data center move. Public services like the website,
>     wiki and git servers will remain live but the git backend
>     (push.yoctoproject.org) will be offline, as will the downloads and
>     sstate services and the autobuilder/NAS.
>   * Capacity has been improved on the sstate server which was causing
>     intermittent timeout issues for downloads.
>   * Intermittent issues continue to be at record high levels and help
>     is very much welcome in trying to resolve them. You can see the
>     list of failures we’re continuing to see by searching for the
>     “AB-INT” tag in bugzilla:
>     https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT
>     <https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT>
>
> In particular, we’re struggling to understand the intermittent network 
> issue with external hosts we’re seeing very occasionally.
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
> YP 3.5 Milestone Dates:
>
>   * YP 3.5 M3 build date 2022/02/21
>   * YP 3.5 M3 Release date 2022/03/04
>   * YP 3.5 M4 build date 2022/04/04
>   * YP 3.5 M4 Release date 2022/04/29
>
> Upcoming dot releases:
>
>   * YP 3.1.14  is released
>   * YP 3.4.2 is released
>   * YP 3.3.5 is in QA
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
> Tracking Metrics:
>
>   * WDD 2652 (last week
>     2662)(https://wiki.yoctoproject.org/charts/combo.html
>     <https://wiki.yoctoproject.org/charts/combo.html>)
>   * OE-Core/Poky Patch Metrics
>       o Total patches found: 1202 (last week 1208)
>       o Patches in the Pending State: 334 (28%) [last week 334 (28%)]
>
> The Yocto Project’s technical governance is through its Technical 
> Steering Committee, more information is available at:
>
> https://wiki.yoctoproject.org/wiki/TSC 
> <https://wiki.yoctoproject.org/wiki/TSC>
>
> The Status reports are now stored on the wiki at: 
> https://wiki.yoctoproject.org/wiki/Weekly_Status 
> <https://wiki.yoctoproject.org/wiki/Weekly_Status>
>
> [If anyone has suggestions for other information you’d like to see on 
> this weekly status update, let us know!]
>
> Thanks,
>
> */Stephen K. Jolley/**//*
>
> *Yocto Project Program Manager*
>
> (*Cell*: (208) 244-4460
>
> * *Email*:_sjolley.yp.pm@gmail.com_
>
>
> 
>

