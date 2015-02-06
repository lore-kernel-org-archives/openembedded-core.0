Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2E97E60017
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 14:21:22 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id v1so6292958yhn.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Feb 2015 06:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=A7ZoYj+V1BLAW8fVke+P8J5gjr+BSTCplAO7Er3zhQ4=;
	b=ITA3WN8aUsp6yWRRqRPoIcTrqfawworQa1OMpLtJ4nEUz6XveguAmwN7maLtp2+WK+
	N5nVJ0Dh7zTJNGdzRD6pcbo/gKTHXLVxQyCBcMNM6PJH6pFXTX0Ap90X5szq1cAD2+bW
	OhErxSB4WFPWlEJe1Vu+qnVCkWzLNd8q8brLdrjremfLC3r6JbOxZGLDcqRjQo7r02h6
	Zq8QB7PHuVmsqNWexG0nPxXgVm9tCghXKzUHOmEVlWjWho3lfkoQtWoOaZhMqrzNQjuO
	ek4wbjsRJoZQFvY2uD7SFj5Jgp4aOvhUyJkCkVah6Fo+koT2pOZvkM/KoEezw+WVA1Z4
	lWeg==
MIME-Version: 1.0
X-Received: by 10.170.188.10 with SMTP id f10mr1564410yke.22.1423232484006;
	Fri, 06 Feb 2015 06:21:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Fri, 6 Feb 2015 06:21:23 -0800 (PST)
In-Reply-To: <CAJTo0LZeVbSajYg6iNZo33O1BGRrU8SuQgnDA=Ra+XpOFprcuQ@mail.gmail.com>
References: <1423085616-6729-1-git-send-email-ross.burton@intel.com>
	<4479188.gEPuv5Te0O@peggleto-mobl5.ger.corp.intel.com>
	<1423222962.20217.13.camel@linuxfoundation.org>
	<CAP9ODKqxCyd=h0ZdyjjY+eogPumbtY3VMBwvskSBQEcw8+D5+g@mail.gmail.com>
	<CAJTo0LZeVbSajYg6iNZo33O1BGRrU8SuQgnDA=Ra+XpOFprcuQ@mail.gmail.com>
Date: Fri, 6 Feb 2015 12:21:23 -0200
X-Google-Sender-Auth: penmUKuq1qDvnuKlvq8zzvI6eYI
Message-ID: <CAP9ODKoE12hnigK3Z1MKjV5TYRu-EACd2KsCgD0M2hZSEFeNww@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "bitbake.conf: don't remove WARN_QA and ERROR_QA from hashes"
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
X-List-Received-Date: Fri, 06 Feb 2015 14:21:23 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 6, 2015 at 12:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 6 February 2015 at 14:10, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> I think they should re-run. Otherwise we can end having errors and QA
>> issues unnoticed until a full rebuild.
>
>
> That was the state of things until my original patch last week.  The patch
> had the side-effect that changing QA tasks causing *everything* to rebuild.
> I'm really not sure that's a good solution.

If someone adds a QA tasks it is because it matters. In this case we
ought to have it in an immediate effect so it does makes sense to
rerun everything.

I know it is bad from build time point of view but predictability and
correctness is more important from my point of view.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

