Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 40A977C4F9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 13:18:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44k5Xy5bQCz2s;
	Tue, 16 Apr 2019 15:18:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555420723;
	bh=L46oP3KW87nCMYw0IEHU9gFAYeeJtsgVVcZaaDoFoLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eCnmeue3j/ufRCzVYdWL3Y4/IAO2yknPBmaabqVue57sP05jPAKeW5ONkogPgObGH
	IZTmz+Tfk21hkcAe4u5FdiYUF7XkWMjqnwq92LrNdhVmwDAR6fBwf41MKC+tMZwSq1
	GDitkDYq5PfeDFBHxYEF7N0zK2OjEhYgBSFBkfLDgiI+KofGo4n86CnVCLtgkCg3qS
	EMOhwykwIXyUnfUQQ4tEHztay8CcnuLCtB1noVKltIMalFEIxQE3SPNeZvgtzrnBRR
	WC4Fi/J/U7LULaN29lJS+zcyF9Wz41i0XLrAszwofmT4f45nfF9aLgjD3RDCM/jOlw
	Gotbx1MrkmnP7SLT7pfZEkj59oXPGt5tX+25aWyKsPCm+2wWB4rZQlhuFbtHhezbpn
	HGyrej6KMzbPo80d7RWcuwDC+Shy8XOmHQRKvZAn7cxqepyqB4ao/MZ0h9zJceC9yr
	OmWB+M569WEEGl7nfJpFyD5ApZMtG+iJXmMakLrMB0Ip/YZmvuF/VCFMV1g19wjjTY
	4uiRwco6qco/GoLbmQ6s5rcNMKY3exiaPNP2USjGwNwW5jNNuI7ZZMRYcwF7ak2klh
	w7kjrxnvkQChrXzcwlZ0E3CmlYwP2k9q7lGs4emX2maZ9Ehqg2C97UoTU83xNrStAF
	J6JhT1IOfo7D8XlSXhMtJRvI=
Date: Tue, 16 Apr 2019 16:18:39 +0300
From: Adrian Bunk <bunk@stusta.de>
To: changqing.li@windriver.com
Message-ID: <20190416131839.GA29433@localhost>
References: <1555408184-375724-1-git-send-email-changqing.li@windriver.com>
	<1555408184-375724-2-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1555408184-375724-2-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] glibc: Add a C.UTF-8 locale
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
X-List-Received-Date: Tue, 16 Apr 2019 13:18:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 16, 2019 at 05:49:44PM +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> * This patch is get from fedora project, link:
> https://src.fedoraproject.org/rpms/glibc/blob/0457f649e3fe6299efe384da13dfc923bbe65707/f/glibc-c-utf8-locale.patch
> 
> * At this point, most major distro have support this locale
>...

Is there now agreement on the exact semantics of this locale?
I remember this was a problem when it was suggested for upstream
inclusion ~ 5 years ago.

E.g. the Debian definition of C.UTF-8 is very different to and
more than 10 times to size of the Fedora definition of C.UTF-8.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


