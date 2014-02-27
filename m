Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6B78260DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 20:13:48 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id j5so3377877qaq.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 12:13:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UBRBaiISV35aMIAg+tTKhqN9c3i5C31FZaRWiVJJT2I=;
	b=Gr0/ZJQ0iOnWTG/zum1+QTawk0ykr5wpeMcAOEhE28ABv5O0N+FYYPDBNVjieqASDP
	iJchjWQntPvYDmzaPEpEksosCl/8PqBnAmBsQtgDLVZDzOzEIMQF+Vk2mrJZak0kZllO
	oU3f8OLo4pcz2P+rPgRow9Fg62DdNZnehEBaWacMmXC4F0SR+GXT+Xuej8fqORXkFSQL
	GpBcnFIZS9WOm6Z6lwadIPs8skbgzvQOkLQUWavE3DfgEzlAGqf0423pPG/Q/mPhLHTj
	/gC1NUQj3w3E6e8IIGDHQP9II6dj17BGblrxOPy4GkvLmfE7zGlSQVyLXX/ulhQqy6jP
	j43Q==
X-Gm-Message-State: ALoCoQk7t3PURWJ+qmYQTJyxWwRVSi5AZnL3rOeH9oic11QNh8xOsskP9gh5w1++CahdWawFH7GR
X-Received: by 10.140.42.54 with SMTP id b51mr9802986qga.87.1393532028733;
	Thu, 27 Feb 2014 12:13:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 27 Feb 2014 12:13:28 -0800 (PST)
In-Reply-To: <CAP9ODKrpyH-R4LYRt6kt0SiQEfAmaVUPHZq0XEzcYJxXY7BuRQ@mail.gmail.com>
References: <1393524104.31769.148.camel@ted>
	<CAJTo0LaG9SeGd2Pi3-dksPd_FHH4TEWK2MGJU-d=2kte6aTg7Q@mail.gmail.com>
	<CAP9ODKrpyH-R4LYRt6kt0SiQEfAmaVUPHZq0XEzcYJxXY7BuRQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 27 Feb 2014 20:13:28 +0000
Message-ID: <CAJTo0LYoCqic_4OwwMHJdwMwwMDC-ARyu1e_5PdV0+HnqNxLzg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools-brokensep: Mark recipes with broken separate build dir support
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
X-List-Received-Date: Thu, 27 Feb 2014 20:13:52 -0000
Content-Type: text/plain; charset=UTF-8

On 27 February 2014 20:06, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Thu, Feb 27, 2014 at 3:52 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 27 February 2014 18:01, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> +inherit autotools
>>> +B = "${S}"
>>
>> Why is this preferable to directly setting B in the recipe, which
>> seems more obvious to me.
>
> I see one benefit for it being easier to grep for; so we know this is
> one recipe which ought to be fixed and that rely on autotools.

I'm apprehensive of adding a class whose sole purpose is to set a
variable that can be set in the recipe itself, and will be another
class to explain/document for the future.  Grepping for an assignment
to B is almost as simple too.

Ross

