Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9586D3BB
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 02:31:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9V2VVpb024319
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Oct 2013 19:31:31 -0700 (PDT)
Received: from [172.25.32.36] (172.25.32.36) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 30 Oct 2013 19:31:30 -0700
Message-ID: <5271C101.2050802@windriver.com>
Date: Wed, 30 Oct 2013 21:31:29 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1383173291-4017-1-git-send-email-jason.wessel@windriver.com>
	<CAMKF1srsz3njDJpvm4sr865VDkWtemeZzDshT2gY05noNqZZLA@mail.gmail.com>
In-Reply-To: <CAMKF1srsz3njDJpvm4sr865VDkWtemeZzDshT2gY05noNqZZLA@mail.gmail.com>
X-Enigmail-Version: 1.5.2
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtools, syslinux: add ability to compile with nativesdk
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
X-List-Received-Date: Thu, 31 Oct 2013 02:31:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 10/30/2013 06:47 PM, Khem Raj wrote:
> On Wed, Oct 30, 2013 at 3:48 PM, Jason Wessel
> <jason.wessel@windriver.com> wrote:
>> For regenerating and ISO or EFI boot image the nativesdk needs mtools
>> and syslinux.
>>
>> Both recipes are patched in one patch since syslinux requires
>> mtools.
>>
> as they depend on eglibc/glibc only. Can you also make sure that they
> get flagged when building
> systems with non-eglibc C libraries.


Is there an example in a recipe of what you are talking about?

I saw in another recipe:
python __anonymous() {
    if d.getVar("TARGET_OS", True) != "linux":
        return
    if d.getVar("TCLIBC", True) == "eglibc":
        raise bb.parse.SkipPackage("libiconv is provided for use with uClibc only - eglibc already provides iconv")
}

Or is there a build test I should be using to test with uClibc for when things like this change in general?

Thanks,
Jason.

