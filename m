Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjbEB-0006j8-JR
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 20:10:35 +0200
Received: by iyj12 with SMTP id 12so431561iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 11:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Mpj8bwxQVHI6HzzSA2vJFSHdRMQPGi9e9VD5n+1zBOo=;
	b=pO6kTKz5xKASjrFZhVpygwYZCVuDcVbVn9a6rSawfuh+DK52+e/g2LCOjr2crKGrqO
	Tnh+kj8nGSZQo+juJImJk9SqqWhBm9wXuUKSklb9qJfts+akhB+ayS3IujEhzOpCBk4a
	q5CgiiwNtFgMnGxfl3m+USJL2cKfYQPyNRXZg=
Received: by 10.231.26.205 with SMTP id f13mr8590054ibc.56.1311185188515;
	Wed, 20 Jul 2011 11:06:28 -0700 (PDT)
Received: from [172.23.10.146] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id d3sm297619iba.57.2011.07.20.11.06.26
	(version=SSLv3 cipher=OTHER); Wed, 20 Jul 2011 11:06:27 -0700 (PDT)
Message-ID: <4E271921.9050803@gmail.com>
Date: Wed, 20 Jul 2011 11:06:25 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1311150183.git.sgw@linux.intel.com>	<b2ea206c2113d6c4549c52d97e09542a78d96f0e.1311150183.git.sgw@linux.intel.com>
	<1311171248.2344.38.camel@rex>
In-Reply-To: <1311171248.2344.38.camel@rex>
Subject: Re: [PATCH 03/50] libiconv: Add recipes for 1.13.1
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
X-List-Received-Date: Wed, 20 Jul 2011 18:10:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2011 07:14 AM, Richard Purdie wrote:
> On Wed, 2011-07-20 at 01:27 -0700, Saul Wold wrote:
>> From: Khem Raj<raj.khem@gmail.com>
>>
>> Import 1.13.1 recipes from meta-oe
>> share common code through libiconv.inc
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>>   .../libiconv/libiconv-1.13.1/autoconf.patch        |16018 ++++++++++++++++++++
>>   meta/recipes-support/libiconv/libiconv.inc         |   18 +
>>   meta/recipes-support/libiconv/libiconv_1.11.1.bb   |   24 +-
>>   meta/recipes-support/libiconv/libiconv_1.13.1.bb   |   20 +
>>   4 files changed, 16061 insertions(+), 19 deletions(-)
>>   create mode 100644 meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
>>   create mode 100644 meta/recipes-support/libiconv/libiconv.inc
>>   create mode 100644 meta/recipes-support/libiconv/libiconv_1.13.1.bb
>
> I've given feedback elsewhere about this. Please can we combine the best
> bits of the recipes rather than overwrite one with the other. I think
> removing the libtool.m4 file directly rather than patching is a better
> approach as per the current recipe for example.
>

yes I will test it out and resubmit

> I also suspect the .inc file wasn't used specifically due to the
> gplv2/v3 contamination issue.

ok makes sense. i will rework it to be separate

  I'm fine with having a .inc file but the
> gplv2 recipe probably shouldn't use it.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



