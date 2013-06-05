Return-Path: <net147@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF1061AD1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 08:13:28 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id ha11so886869vcb.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 01:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vWNrjeysKhDZHRqYIQ2bQgpnGF+MFuWRvHDmNy02ScM=;
	b=rAea12h8V3u8UkepgEBBh5WWykfj6Ga8znrAKqnLqTp4Jqps1reCPEEFBX5qNgFlaM
	4c31WnYFC7DKnL2auctr2qIhXVismNGkFfoQ+1RID9ZionmPnUU1dhe4GOCqblNiZWnj
	RYo7QG5mP68sT5UgrK1u/OBg1geo/1eNtDrvBy1BkArRRNL3BgOFKrGvNiAPobDTOCid
	Q78ZJTH654ihjMoBF4Ndkini+qmlZa7ANIqDntl9W6DQB3XZGEV7Qs2mGb1zweBGE0gv
	88hHWw+iSEqtyELf7MWZN8T/8PIUXVSAq7r/m9sG8zhUC5pq8ju2ScW/NUzYrgMPbU8F
	6uxg==
MIME-Version: 1.0
X-Received: by 10.52.164.98 with SMTP id yp2mr3658013vdb.111.1370420008892;
	Wed, 05 Jun 2013 01:13:28 -0700 (PDT)
Received: by 10.58.34.132 with HTTP; Wed, 5 Jun 2013 01:13:28 -0700 (PDT)
In-Reply-To: <1370419439.1640.38.camel@ted>
References: <1370401139-15582-1-git-send-email-net147@gmail.com>
	<1370419439.1640.38.camel@ted>
Date: Wed, 5 Jun 2013 18:13:28 +1000
Message-ID: <CANwerB1jH1dZrRQdMyJPqjrXyP5KYdz9XCmFX=O8i9g8yFq-2w@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: allow native builds
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
X-List-Received-Date: Wed, 05 Jun 2013 08:13:28 -0000
Content-Type: text/plain; charset=UTF-8

On 5 June 2013 18:03, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2013-06-05 at 12:58 +1000, Jonathan Liu wrote:
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>  meta/recipes-devtools/valgrind/valgrind_3.8.1.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
>> index 3520d49..503e996 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
>> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
>>
>>  X11DEPENDS = "virtual/libx11"
>>  DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
>> +BBCLASSEXTEND = "native"
>>  PR = "r8"
>>
>>  SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>
> Why? Commit message is rather short.
>
> Cheers,
>
> Richard
>
I have a recipe that can make use of it.

Regards,
Jonathan

