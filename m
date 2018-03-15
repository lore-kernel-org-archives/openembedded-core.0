Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1E8D677E66
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 18:39:17 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id j2so3151299pff.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 11:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xubvkQNi7pssa6e03UZeJBC7IlV6lk61d6QUJr7zQAM=;
	b=ZEfzGjYbloGYpbv6Eeneii4kFXl1slDo91f16TdhSZe7Oms+iBBXo6NDr81s6wH66y
	gI/yaxHgHO8XmTE0aFopoZ3nGgqoysS5RazEIL4CSaISRq79WS9t0KJ8mI/0I+CBYTQ6
	12XF7UPy6+lARolV7TVBkFznintGZqw4D8GAVT3bVaTmjEh50fn1SeqxOIYovIFDIsqc
	F3kVOOUn+TJw2MaDQqit8lidHJaRsfoRMMGKHepdy+hRDPRiaPzPUICmx3CR7W2aezwC
	6OWKyMed3FHyMD7KLHhXGX6ZfemyTR848X0NXS5Wz/ZoCZL6XfffVWEc3ZnI+jNWuzQk
	mY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xubvkQNi7pssa6e03UZeJBC7IlV6lk61d6QUJr7zQAM=;
	b=MQGBYIQ2qYJDeYgXhp1By33TSdQd0JNYuyxzOWfvbU6JR9qM6FF5nx8PweK1bZPjrN
	GNgvOtbl8PQQYHQ+31kvkiQA1z4HLsfCj62giodPGU5SS40y2O3gWgCQbQv0l7NvF5r2
	T3tPP2+YHKUKpw38DbTHy0JgHG42wpVL0F78MQ/mOM8b7DYJvsEcRUwZ95J8K+gNKdsP
	ZKU2HBZY2Aj2YeijcYgFsBdxhDlR+u3ke6MWS9DkOs5YKhx2eR2eT+2kgdME230IevMM
	Q/ZIzFQaY937FIDiMehjRT3uHBELWIQU1dQoT1FOFq+pSjUsoGyXM07eLmASy9IU/cs4
	4HDA==
X-Gm-Message-State: AElRT7FWtiWTa4jkp03QQ23EskwzkshR0/V2P14lDHYdkI+JZLKiikbz
	EyH1LVOhf98jnpCMCHph2iR7iUF4y2EBPnGtylI=
X-Google-Smtp-Source: AG47ELsLAGIaePI6P2mML7WzUerEd/XzCUd/NYfxxyY2s4gNoHul87ashyCFeQjiJOPZ8t6AnHVl9BZHjz2oWubFPrI=
X-Received: by 10.99.170.73 with SMTP id x9mr7452620pgo.393.1521139159035;
	Thu, 15 Mar 2018 11:39:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.162.16 with HTTP; Thu, 15 Mar 2018 11:38:48 -0700 (PDT)
In-Reply-To: <CA+chaQctko3eBUWpySaiZ19WXH+5cDrAu4Kh6TGLd9r4MTx-Qw@mail.gmail.com>
References: <20180312164944.39923-1-alexander.kanavin@linux.intel.com>
	<20180312164944.39923-4-alexander.kanavin@linux.intel.com>
	<CA+chaQctko3eBUWpySaiZ19WXH+5cDrAu4Kh6TGLd9r4MTx-Qw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Mar 2018 11:38:48 -0700
Message-ID: <CAMKF1spuqjunoYyf0qENJufkeONd90aCEz5giFE3QssFP_rucQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] lib/oe/patch.py: add a warning if patch context was ignored
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
X-List-Received-Date: Thu, 15 Mar 2018 18:39:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 15, 2018 at 8:13 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Now when more people will use devtool to refresh patches, would it make
> sense for devtool to use --no-signature when refreshing patches?
>
> I think git version is not important in this context and causes extra
> changes in .patch files (when refreshed by different people with different
> git version) or extra work removing that chunk from resulting diff.
>

and also time/date in diff if they are not pruned already

