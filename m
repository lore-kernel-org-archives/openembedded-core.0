Received: from mailbackup.inode.at ([213.229.60.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wolfram.stering@hale.at>) id 1RNion-0005gq-5R
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 11:22:13 +0100
Received: from [62.99.145.21] (port=22746 helo=mx.inode.at)
	by mailbackup.inode.at with esmtp (Exim 4.76)
	(envelope-from <wolfram.stering@hale.at>) id 1RNiin-0002WR-HO
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 11:16:01 +0100
Received: from [83.64.51.210] (port=3253 helo=gateway1.hale)
	by smartmx-19.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <wolfram.stering@hale.at>)
	id 1RNiij-00082D-Qg for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 11:15:58 +0100
Received: from mail1.hale.at (mail2.hale [192.168.100.12])
	by gateway1.hale (8.13.8/8.13.7) with ESMTP id pA8AFvQT013842
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 11:15:57 +0100
Received: from entw42.hale ([192.168.100.73]) by hale.at with MailEnable ESMTP;
	Tue, 8 Nov 2011 11:15:49 +0100
Message-ID: <4EB90155.3070705@hale.at>
Date: Tue, 08 Nov 2011 11:15:49 +0100
From: Wolfram Stering <wolfram.stering@hale.at>
Organization: HALE electronic GmbH
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110928 Fedora/3.1.15-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1320190748.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1320190748.git.elizabeth.flanagan@intel.com>
X-Enigmail-Version: 1.1.2
X-HALE-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: pA8AFvQT013842
X-HALE-MailScanner: Found to be clean
X-HALE-MailScanner-From: wolfram.stering@hale.at
MailScanner-NULL-Check: 1321352159.58943@vSbZVDf2+VsE592/n7HOEQ
X-Spam-Status: No
Subject: Re: [PATCH 0/1] [Yocto Bug 1700] Fix for buildstats diskio on	non physical disks
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
X-List-Received-Date: Tue, 08 Nov 2011 10:22:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/02/2011 07:41 AM, Beth Flanagan wrote:
> From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
>
> tmpfs/encryptfs/ramfs have no entry in /proc/diskstats. This modifies 
> buildstats to not collect diskio statistics when we encounter a case where 
> the os.major/os.minor is not represented with an entry in /proc/diskstats.

A similar issue exists for building on a btrfs partition.
I posted a message on Oct 28 concerning buildstats on btrfs volumes.
The problem there is, that btrfs's stat() reports fake device ids that
cannot be found in /proc/diskstats.

> Longer term solution to this is to:
> - Identify all fs types that don't have representation in /proc/diskstats
> - Gather meaningful iostats of these fs types if possible.
>
> The following changes since commit 4a951e0433a99cd985515843f0a48fadc7050aca:
>
>   Fix HOMEPAGE values in libzypp and sat-solver .bb files (2011-11-01 18:28:19 +0000)
>
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib eflanagan/diskio_bug1700
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=eflanagan/diskio_bug1700
>
> Elizabeth Flanagan (1):
>   [Yocto Bug 1700] Fix for buildstats on tmpfs
>
>  meta/classes/buildstats.bbclass |   37 ++++++++++++++++++++++++++-----------
>  1 files changed, 26 insertions(+), 11 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
DI Wolfram Stering
 (Entwicklung)
HALE electronic GmbH
Eugen-Müller-Straße 18, 5020 Salzburg, Austria
 Tel: +43 (662) 439011 550
 Fax: +43 (662) 439011 9
http://www.hale.at/
Firmenbuchnummer: FN 66801m HG Salzburg



--
Scanned by MailScanner.



