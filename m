Received: from mail-ie0-f176.google.com ([209.85.223.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U8RBB-0002cc-It
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 09:07:02 +0100
Received: by mail-ie0-f176.google.com with SMTP id k13so10751008iea.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 23:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=fSPjOB5FkVvqg1+wVLYUXL/a/o5aCW1JWBqDDQb4K54=;
	b=cDBAyEwy7UlsC3O07ig7GPaMTfpiBHCxXeQTJqQVIOnGjA4CE7PoSES7TjyKvMsJ1q
	hYhEaC/2U4yevNVm2e29debut9/JvHuzCVY8kV0qK6o0T7mXwhB4iaisFChDy3su+yYN
	j9f+xlBHMp6DQGquV64SB88urfST2quCVR738HdQmgzHcjXtueiTAIYjEfx6/bhsfq6/
	WJ7k7cNPN18x3+cKKsnWpHnoDoehsLNfiijytPJxEiwRyWt98W37Snm4F/e3TBCF9bU6
	rKuNfHlNu0QOaBg+ayt15IljqG0qiEonr/nNJdxEA0uDu4BSXe9mniEMpLJt6VuEiPSH
	dlbQ==
MIME-Version: 1.0
X-Received: by 10.50.46.197 with SMTP id x5mr12607065igm.7.1361433045392; Wed,
	20 Feb 2013 23:50:45 -0800 (PST)
Received: by 10.64.143.228 with HTTP; Wed, 20 Feb 2013 23:50:45 -0800 (PST)
In-Reply-To: <5125C921.2030407@linux.intel.com>
References: <1361394588-30527-1-git-send-email-farrah.rashid@windriver.com>
	<5125C921.2030407@linux.intel.com>
Date: Thu, 21 Feb 2013 08:50:45 +0100
Message-ID: <CAC1BbcQ-5Jh-k_1nBd0O3DXCa6EuuVBdkgmj2cPhYFSOjGH1BQ@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Fix tcp-wrappers for sshd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2013 08:07:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 21 February 2013 08:13, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/20/2013 01:09 PM, farrah rashid wrote:
>>
>> farrah rashid (2):
>>    tcp-wrappers: remove size_t.patch
>>    tcp-wrappers: add socklen_t.patch
>>
>>   .../tcp-wrappers/tcp-wrappers-7.6/size_t.patch     |   44
>> ---------------
>>   .../tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch  |   59
>> ++++++++++++++++++++
>>   .../tcp-wrappers/tcp-wrappers_7.6.bb               |    4 +-
>>   3 files changed, 61 insertions(+), 46 deletions(-)
>>   delete mode 100644
>> meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/size_t.patch
>>   create mode 100644
>> meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
>>
>
> This must be for Danny, please mark that in the patch in the future.

socklen_t is also needed on !GLIBC hosts since a long time now (IIRC
it was even in SUSv2).
I would just use most of the syndicated patches from debian/patches/ from
http://ftp.de.debian.org/debian/pool/main/t/tcp-wrappers/tcp-wrappers_7.6.q-24.debian.tar.xz
YMMV.


