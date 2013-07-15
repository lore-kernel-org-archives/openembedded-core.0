Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 43EBF6A463
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 11:43:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6FBh5jZ029309
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Jul 2013 04:43:05 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 15 Jul 2013 04:43:04 -0700
Message-ID: <51E3E043.40907@windriver.com>
Date: Mon, 15 Jul 2013 19:42:59 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1373872671.git.sgw@linux.intel.com>
	<1510613.ezlYfIjzn1@helios>
In-Reply-To: <1510613.ezlYfIjzn1@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/18] Final Review Pending
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
X-List-Received-Date: Mon, 15 Jul 2013 11:43:04 -0000
Content-Type: multipart/alternative;
	boundary="------------080709030409060404050009"

--------------080709030409060404050009
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2013 05:24 PM, Paul Eggleton wrote:
> I have some reservations about these changes. pmount is obsolete
> according to its author:
>
> https://lists.ubuntu.com/archives/ubuntu-devel-discuss/2011-February/012421.html
>
> I appreciate it may solve the problem we're trying to solve but we need
> to be pretty confident about pulling this in before we do so since we'll
> likely be supporting it ourselves.
Agree, if we choose pmount, we will maintain it ourselves.

But if not use this, we have to investigate the udev rules to finish the
similar job, it's filesystem type dependency, and this makes the udev
script more complicated and frequently modified with more and more
filesystems supported.

The pmount is an easy way to handle this, and it has supported to
process udf, iso9660, vfat, ntfs, hfsplus, hfs, ext3, ext2, ext4, reiserfs,
reiser4, xfs, jfs, omfs, ntfs-fuse, ntfs-3g; and it also easy to maintain
for us to support other filesystem in future (such as exfat).

//Hongxu

--------------080709030409060404050009
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 07/15/2013 05:24 PM, Paul Eggleton
      wrote:<br>
    </div>
    <blockquote cite="mid:1510613.ezlYfIjzn1@helios" type="cite">
      <pre wrap="">I have some reservations about these changes. pmount is obsolete
according to its author:

<a moz-do-not-send="true" class="moz-txt-link-freetext" href="https://lists.ubuntu.com/archives/ubuntu-devel-discuss/2011-February/012421.html">https://lists.ubuntu.com/archives/ubuntu-devel-discuss/2011-February/012421.html</a>

I appreciate it may solve the problem we're trying to solve but we need
to be pretty confident about pulling this in before we do so since we'll
likely be supporting it ourselves.
</pre>
    </blockquote>
    Agree, if we choose pmount, we will maintain it ourselves. <br>
    <br>
    But if not use this, we have to investigate the udev rules to finish
    the<br>
    similar job, it's filesystem type dependency, and this makes the
    udev<br>
    script more complicated and frequently modified with more and more<br>
    filesystems supported.<br>
    <br>
    The pmount is an easy way to handle this, and it has supported to<br>
    process udf, iso9660, vfat, ntfs, hfsplus, hfs, ext3, ext2, ext4,
    reiserfs,<br>
    reiser4, xfs, jfs, omfs, ntfs-fuse, ntfs-3g; and it also easy to
    maintain<br>
    for us to support other filesystem in future (such as exfat).<br>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <br>
    //Hongxu<br>
  </body>
</html>

--------------080709030409060404050009--
