Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TkebI-0000Ca-6F
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 18:35:37 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so2546744dak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 09:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=orcaDj8/qt/JeGXsCUe5eDBcSxK0gLfTxy25N71Mb0g=;
	b=H66ShaY7VG/UKAXY/Hcjv7BQCa5OdGEDrvaTg9xK0L9+uToVQ/v0zopJzbkCsdwimz
	svDHx0ecfApXDqZqX3wH7DdaWIiLygl+4h6jmaTAmmlbEl2FqHT+sa739ZTpwWtnYShQ
	9gFAPiglStiXhnjR0Ff4Cd7hzd63AMrp/p5BrLAo848X5DxIHk53BTKeJiX/ukdBA0MV
	pmLW3cECdUMoTQpHC8j8lJP4lDz80Oxk/t6yzLbra2x9G8HiWg1eil9moWfuoZCUpVfS
	yX4Uph9XHP6nBgbr49v7B3WLPEc6clCf/IGGawNquPKkWJHpOxukoSMaFaVEbRhQ2hDV
	7M6Q==
MIME-Version: 1.0
Received: by 10.66.72.198 with SMTP id f6mr44090800pav.42.1355764854712; Mon,
	17 Dec 2012 09:20:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.51.193 with HTTP; Mon, 17 Dec 2012 09:20:54 -0800 (PST)
In-Reply-To: <CAJTo0LY-4rWHbRRkq8K2YkWOuxFsi9+8XfDyjwUCfDqTyjrUAg@mail.gmail.com>
References: <1355743753-12947-1-git-send-email-alexandru.damian@intel.com>
	<1355748923-24459-1-git-send-email-alexandru.damian@intel.com>
	<50CF510B.7040705@linux.intel.com>
	<CAP9ODKrDoJ8fSYtV0__F2m=n5tP+44RphzFCYEUM9jjXuPk6tQ@mail.gmail.com>
	<CAJTo0LY-4rWHbRRkq8K2YkWOuxFsi9+8XfDyjwUCfDqTyjrUAg@mail.gmail.com>
Date: Mon, 17 Dec 2012 15:20:54 -0200
X-Google-Sender-Auth: RWJgwBBwBH-XDlIQa3G3c5sxd8I
Message-ID: <CAP9ODKoa6_sXxMQwfnuw_Uwxt0PyjPcX=eoiLMXRcVV+ChbZhA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Alex DAMIAN <alexandru.damian@intel.com>, damien.lespiau@intel.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] init-live: default to initrd shell if image isn't found
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
X-List-Received-Date: Mon, 17 Dec 2012 17:35:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 17, 2012 at 3:12 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 17 December 2012 17:09, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> One possible improvement (not for this patch but long term) is to use
>> initramfs-framework for this. It provides a modular system and has
>> some nice featues for debug and shell handling so you can say:
>>
>> debug=before:udev shell=after:e2fs
>>
>> Just an example. Another good thing about it is it allow for less code
>> duplication.
>
> Good point - I only noticed last week that we've duplicated udev logic
> in the live scripts and the initramfs-framework (that isn't used by
> oe-core).  Clearly this is Wrong and if we're shipping a framework for
> a initramfs, we should be using it in our initramfs...

When I wrote the framework I had this on mind and we've been using the
framework extensively as it is quite flexible. I do believe all
initramfs scripts that are available today in oe-core would be quite
simple to convert.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


