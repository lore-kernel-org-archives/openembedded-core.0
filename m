Return-Path: <aws.ismail@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id AC1AA76643
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 22:17:14 +0000 (UTC)
Received: by oige206 with SMTP id e206so91692208oig.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 14:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JyAnoKsWQRv5mgd4edgYRedIj0EpdsuiFcS2jpYkuTM=;
	b=wjD0P3p6Pk/HL+z976ydBwmbkMGZJBwwYO+hZSqZPllxkn/NCcg3uW8edi6Pem8kLf
	S2wg5+qjf9uz9q7wR/7/qLqKYlRyVHGCZ75Zrqw9HClTKOq471dNB+riioO1xi7C3raN
	E8QF6YEgzppp94pBIV6e0H4eKmpSI/rscTGveaN7qXTeLPJ1/zznlWD5K56L9+gERb/a
	DYiLk15yojfQicP1zbfYuc8Hb8Cq3e4ljioJPliv25+GjRJ1GPw0Q2KuJSlwzj23TM+u
	F5vOFDke6Vg5oj3AfYjKzDStuhfgh/bVS/MDXzsulfXRmdR0l5sDOuZltKyikxY/z00n
	zMtA==
X-Received: by 10.202.71.132 with SMTP id u126mr21939110oia.113.1447712234869; 
	Mon, 16 Nov 2015 14:17:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.41.39 with HTTP; Mon, 16 Nov 2015 14:16:55 -0800 (PST)
In-Reply-To: <CAMHMu0MA7Sw2UbnrBZrtOYMZ141zN38+D4BU3DUeQVcV2teueQ@mail.gmail.com>
References: <1447536908-21449-1-git-send-email-adrian.freihofer@gmail.com>
	<CAMHMu0MA7Sw2UbnrBZrtOYMZ141zN38+D4BU3DUeQVcV2teueQ@mail.gmail.com>
From: Aws Ismail <aws.ismail@gmail.com>
Date: Mon, 16 Nov 2015 17:16:55 -0500
Message-ID: <CAMHMu0NAHXA305mAv4uRw-o9eVrpHCL7FOnOVPCV9iymES36dg@mail.gmail.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/3] runqemu improve networking
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
X-List-Received-Date: Mon, 16 Nov 2015 22:17:15 -0000
Content-Type: text/plain; charset=UTF-8

Hi Adrian,

What's the runqemu line you are running with ?

I am passing -net nic -net nic to the qemuparams line which works
fine, but the the two devices come up with no IP addresses.

My full qemu line is:

ROOTFS=<path to qemu.ext4> runqemu qemux86-64 nographic
qemuparams="-cpu host --enable-kvm -m 4096 -net nic -net nic"

Aws\

On Sun, Nov 15, 2015 at 1:01 AM, Aws Ismail <aws.ismail@gmail.com> wrote:
> Thanks Adrian for the patchset. I will test it and get back to you.
>
> Aws\
>
> On Sat, Nov 14, 2015 at 4:35 PM, Adrian Freihofer
> <adrian.freihofer@gmail.com> wrote:
>> This patch series adds two features to runqemu:
>> - Support the emulation of more than one NIC
>> - Add a hostonly networking mode. This networking mode enables
>>   the user to implement different virtual networking environments
>>   such as a bridged network as discussed in #7887.
>>
>> Note: Without the first patch connman fails if the virtual device
>>       provides more than one NIC.
>>
>> @Aws Ismail: I'm using this since more than one year. Would be great
>>              if you could test this and provide feedback.
>>
>> Adrian Freihofer (3):
>>   connman: fix qemu config
>>   runqemu: add support for multiple NICs
>>   runqemu: support hostonly net mode
>>
>>  .../connman/connman-conf/qemuall/wired-setup       |  6 ++--
>>  scripts/runqemu                                    |  7 +++-
>>  scripts/runqemu-gen-tapdevs                        | 11 ++++---
>>  scripts/runqemu-ifdown                             | 33 +++++++++++--------
>>  scripts/runqemu-ifup                               | 38 +++++++++++++---------
>>  scripts/runqemu-internal                           | 21 +++++++-----
>>  6 files changed, 72 insertions(+), 44 deletions(-)
>>
>> --
>> 2.4.3
>>

