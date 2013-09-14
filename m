Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F3EB661013
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 12:19:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8ECJjT4028556
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 14 Sep 2013 05:19:45 -0700 (PDT)
Received: from [172.25.32.34] (172.25.32.34) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Sat, 14 Sep 2013 05:19:44 -0700
Message-ID: <5234545F.70706@windriver.com>
Date: Sat, 14 Sep 2013 07:19:43 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
	<1379117343-29877-5-git-send-email-jason.wessel@windriver.com>
	<20130914080555.GA30637@jama>
In-Reply-To: <20130914080555.GA30637@jama>
X-Enigmail-Version: 1.5.2
Cc: dvhart@linux.intel.com, Openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH 4/7] syslinux.bbclass, syslinux: Update to syslinux 6.01
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Sep 2013 12:19:47 -0000
Content-Type: multipart/alternative;
	boundary="------------060109060002000001020703"

--------------060109060002000001020703
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 09/14/2013 03:05 AM, Martin Jansa wrote:
> On Fri, Sep 13, 2013 at 07:09:00PM -0500, Jason Wessel wrote:
>> A newer version of syslinux is required for an EFI enabled isohybrid.
>> This is used for the the capability to generate 3 types of ISO images,
>> all of which can be booted off a USB device or HDD if copied with dd.
>>
>> 1) PC BIOS only ISO
>> 2) EFI only ISO
>> 3) EFI + PC BIOS ISO
>>
>> The syslinux.bbclass required a minor tweak because ldlinux.c32 is
>> dynamically loaded and needs to be in the created media as of syslinux
>> 5 and up.
>
> Hi Jason,
>
> can you please look at
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3944
> ?


I can look at fixing the defect, but there is no description of how to use the directdisk to see the problem.  Could you provide an example?

I added the directdisk to IMAGE_FSTYPES, but didn't get a .directdisk in the deploy directory so that is not how it works.   Also I think the right solution is to simply call syslinux_hddimg_populate() from the directdisk class vs having copied code for the install of the syslinux specific files (that is how 1/2 the problem occurred in the first place).

Back to this particular patch, the ldlinux.c32 change does not affect the bootdirect class.  The ldlinux.c32 is only required for isolinux and the copy is contained with in the inherited syslinux class.

Cheers,
Jason.


--------------060109060002000001020703
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 09/14/2013 03:05 AM, Martin Jansa wrote:<br>
    <span style="white-space: pre;">&gt; On Fri, Sep 13, 2013 at
      07:09:00PM -0500, Jason Wessel wrote:<br>
      &gt;&gt; A newer version of syslinux is required for an EFI
      enabled isohybrid.<br>
      &gt;&gt; This is used for the the capability to generate 3 types
      of ISO images,<br>
      &gt;&gt; all of which can be booted off a USB device or HDD if
      copied with dd.<br>
      &gt;&gt;<br>
      &gt;&gt; 1) PC BIOS only ISO<br>
      &gt;&gt; 2) EFI only ISO<br>
      &gt;&gt; 3) EFI + PC BIOS ISO<br>
      &gt;&gt;<br>
      &gt;&gt; The syslinux.bbclass required a minor tweak because
      ldlinux.c32 is<br>
      &gt;&gt; dynamically loaded and needs to be in the created media
      as of syslinux<br>
      &gt;&gt; 5 and up.<br>
      &gt;<br>
      &gt; Hi Jason,<br>
      &gt;<br>
      &gt; can you please look at<br>
      &gt; <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=3944">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3944</a><br>
      &gt; ?</span><br>
    <br>
    <br>
    I can look at fixing the defect, but there is no description of how
    to use the directdisk to see the problem.&nbsp; Could you provide an
    example?<br>
    <br>
    I added the directdisk to IMAGE_FSTYPES, but didn't get a
    .directdisk in the deploy directory so that is not how it works.&nbsp;&nbsp;
    Also I think the right solution is to simply call
    syslinux_hddimg_populate() from the directdisk class vs having
    copied code for the install of the syslinux specific files (that is
    how 1/2 the problem occurred in the first place).<br>
    <br>
    Back to this particular patch, the ldlinux.c32 change does not
    affect the bootdirect class.&nbsp; The ldlinux.c32 is only required for
    isolinux and the copy is contained with in the inherited syslinux
    class.<br>
    <br>
    Cheers,<br>
    Jason.<br>
    <br>
  </body>
</html>

--------------060109060002000001020703--
