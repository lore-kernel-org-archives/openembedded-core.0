Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31D7A7721C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 19:32:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7BJWg1c029873
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 11 Aug 2016 12:32:42 -0700
Received: from msp-dhcp10.wrs.com (172.25.34.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 11 Aug 2016 12:32:41 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1470636212.git.Qi.Chen@windriver.com>
	<8374cee610f770f4e027f92785bc0bed13334fbb.1470636212.git.Qi.Chen@windriver.com>
	<CAJTo0LaULRXouHYMfKCMUmtFERseR9vZhWXeC-yK9GLrMTwofQ@mail.gmail.com>
	<6cac214c-b73f-af4d-655f-f911788cdc3e@windriver.com>
	<CAJTo0LZ__iBciY-YgeDXebKBXUVh4Snapz9+Yj0QDME34U783Q@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <53d8c342-4769-ace9-91c9-bfd561717825@windriver.com>
Date: Thu, 11 Aug 2016 14:32:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ__iBciY-YgeDXebKBXUVh4Snapz9+Yj0QDME34U783Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bitbake.conf: change localedir
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
X-List-Received-Date: Thu, 11 Aug 2016 19:32:43 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 8/11/16 2:14 PM, Burton, Ross wrote:
> 
> On 11 August 2016 at 18:11, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
> 
>     Binary locales have an endian and alignment setting to them.  If a platform
>     supports both big and little endian, this common locale would not work.  (That
>     is extremely rare....)  Also if a platform supports different alignments in
>     different libraries that could cause an impact as well.  (This is also extremely
>     unlikely.)
> 
> 
> So by that logic this patch should be rejected, right?

The binary bits was why it was not originally implemented this way.  HOWEVER,
are there are conflicting cases we have to worry about for the binaries?  If
there are not any reasonable cases -- then this may save a huge amount of space
for a device that contains a number of binary locales.

(In otherwords, I don't object to the patch due to those reasons -- I just want
it to be clear to folks that there are binary nuances to this, it is extremely
rare that it's a problem, so rare it may simply NOT be an issue in our
configuration.  But these can never be 'noarch' packages as they are tied to an
arch.)

--Mark

> This path is for the compiled locale definitions - LC_TYPE etc and the locale
> archive, right?  So it's only glibc-locales that ships in here, not other
> packages (just trying to check my assumptions)
> 
> Ross


