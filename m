Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 15F3B759D0;
	Tue, 23 Jun 2015 23:13:15 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so16731710pdb.1;
	Tue, 23 Jun 2015 16:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=VlSuu8r312h+so5zgSNYM577U1i7drVtEKwcqrSN/2U=;
	b=e3BN3olu4wMXOAEJMeKqPnWsJy67cRocam2pzlMP0ODPPLkTL7w8JurXwfh+YKbH5v
	eEXREtQEsYJW6eeHrim83Wak62NxhWmwWogeLupJ2h+zzOaS1kiuJnAK9ZalmdvDVnJR
	dyQ4iuLhOZ28I+55kFtzfQr8tO3uTKxUw+R6sDpo7HkyTeV91XukcpXMShPKM/pABZYO
	BAw14aIr2l5GZioCqtxBN0nnPLPiRvqsGlypYfsCxD3nHEOwMo64NZE/ckOV0RWwbeCS
	ds4+ECbVkJMKGYdnkyogCwCBkfCMNL0HHchA6tBqcCTvYhOUb7IxUWCLzTvDRVu+mRCQ
	1Raw==
X-Received: by 10.66.155.36 with SMTP id vt4mr75090966pab.32.1435101196777;
	Tue, 23 Jun 2015 16:13:16 -0700 (PDT)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id
	ks7sm24410076pbc.34.2015.06.23.16.13.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jun 2015 16:13:15 -0700 (PDT)
Message-ID: <5589E809.8060000@gmail.com>
Date: Tue, 23 Jun 2015 16:13:13 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org
References: <CAJTo0LaKEvtznsdfz8gLWFSLyb6Rx2XsgbYG_cfOrAm+W2UfEg@mail.gmail.com>
In-Reply-To: <CAJTo0LaKEvtznsdfz8gLWFSLyb6Rx2XsgbYG_cfOrAm+W2UfEg@mail.gmail.com>
Subject: Re: Future of Qt4 recipes
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
X-List-Received-Date: Tue, 23 Jun 2015 23:13:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 06/22/2015 03:43 AM, Burton, Ross wrote:
> Hi,
>
> So, Qt 4.8.7 was released last month[1].  Support for Qt4 stops at the
> end of 2015, and 4.8.7 is planned to be the last ever release of Qt4.
> It's still mandated by the long-awaited LSB 5 but I think it's fair to
> say that the majority of developers have moved to Qt5. So, what should
> we do with Qt4 moving forward?[2]  I see several options:
>
> 1) There's still lots of people using Qt4 in production, please keep it
> in oe-core!  (and revisit in six months time)
> 2) Move Qt4 recipes and classes to a meta-qt4 layer now so that oe-core
> 1.9 ships without Qt4, and anyone wanting full LSB compliance or Qt4
> will need to add that layer to their distro.
>
> Personally, I vote for (2).  Any other comments?

#2 sounds fine.

would recipes-lsb move out to its own layer too?

- Armin
>
> Ross
>
> [1] https://blog.qt.io/blog/2015/05/26/qt-4-8-7-released/
> [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=7812
>
>

