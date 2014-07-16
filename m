Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4C49870588;
	Wed, 16 Jul 2014 16:40:10 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id tp5so996655ieb.37
	for <multiple recipients>; Wed, 16 Jul 2014 09:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Y6iNgh2TaHms2K/bFTkDaIbQgMsYH3+pDsK4Mw2HyDc=;
	b=L8akcPdsdpVUIs09qKN/5J1OvqEcw37Ggrx+b0RcX4BfFkYFMXjVD2SICueOOU3239
	8LDxLdjNnzxGQBSI/QL6CzTOyP8JJDiLeCmqxTFgqs3w6BRSWeJYjGqqatn7wmmgQkhb
	EyrdKuKqeKmpnlKk0u1gzLEeHEANKToMaG8N0pLwXL2m3gkjksUZAYqyVl+gLalHDf9A
	yi1oFPz1ep2YNssF7Ft0TN5f/I7uD4kqDu7JUmaSbLoeRGPuAsQmZOA3j8sQj/9VkFmQ
	yrfbZhCAaz3ZPtWfKP13U/BOkE3hWbxgn+wHDZPzLh9uNE847ceURaBWN+4PGEONOQO1
	xlGg==
X-Received: by 10.50.176.202 with SMTP id ck10mr18323003igc.2.1405528811908;
	Wed, 16 Jul 2014 09:40:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Wed, 16 Jul 2014 09:39:41 -0700 (PDT)
In-Reply-To: <CAJTo0LajRNrS1nWfnE1n=ar6tO3A6US4too4sf8GwxZU1KyDwQ@mail.gmail.com>
References: <cover.1405440532.git.ross.burton@intel.com>
	<406153008dc78f4e3198c012f2db98fcac09b5c1.1405440532.git.ross.burton@intel.com>
	<CAMKF1sptj_ctzUmMSxm+6VW5LYG8xCm26b3_j4=8GMMS1HPr8w@mail.gmail.com>
	<CAJTo0LajRNrS1nWfnE1n=ar6tO3A6US4too4sf8GwxZU1KyDwQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Jul 2014 09:39:41 -0700
Message-ID: <CAMKF1soF6tLi+=tOMULDAfDV33XPi8=oWLnVoeriS8ogjrPsOw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH 7/7] autoconf: remove automake patch enforcing --foreign
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
X-List-Received-Date: Wed, 16 Jul 2014 16:40:18 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 15, 2014 at 2:51 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 15 July 2014 21:14, Khem Raj <raj.khem@gmail.com> wrote:
>> can it be somehow made such that it can be passed via option flags so we
>> dont have to patch the packages not using above automake macro
>
> Packages that don't use the right automake macro are generally very
> old and we're already carrying patches to fix the autoconf/automake
> files, so I'm not sure this is actually worth it.  I'm trying to drop
> the patches we're carrying against core build tools, not increase it.
> :)

While I understand that, I am also worried about breakage/work it will
cause for layers additional to OE-Core
thats why providing a least impact migration path is desirable.

