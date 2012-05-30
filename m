Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SZlZm-0003dg-7B
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 18:16:46 +0200
Received: by eaal1 with SMTP id l1so1824080eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 09:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=3jI6kgw2pZPCF6hNghNJlVv5ISgMsIA2yV8BPrVRKVI=;
	b=CwN6jm4UY7RdtqoFQfFNBdbcYtIX5P18ZUd1poJTaS7wvnBi8tze/i/SysMJrrSwXE
	wgy1t8rFjzwPKA//y2+BrBDzE/QWjA48ZM/sIdnuIC7C5tTSX2jfGsrIOTbEmozr+zJ2
	mvtuBkpk1JcK+GquNutalx9MCjc7UAhGrlsg7AcZrpQEoj3Yz3hh5YQvV+vJd7K31vb4
	g9IYpIo32e3zHoKIuyCzojSisD3GfE8gpMq3Uu3LiQKj4kU6/ZApPe/eL7IlDd58poQL
	MC8ZxyIpnhIpXmvOLJvRTM5yF40wpdYsxoGIQ7yeuOSlX8sc/qbUPB/V5IrSgRaFlMaK
	nf+Q==
Received: by 10.14.97.135 with SMTP id t7mr6283580eef.177.1338393987590; Wed,
	30 May 2012 09:06:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Wed, 30 May 2012 09:05:57 -0700 (PDT)
In-Reply-To: <CAOHjBZsptjefvQA3od1HV4s_fVcoHidWs5qUm-2A5+Fr9ZrRLg@mail.gmail.com>
References: <CAOHjBZsptjefvQA3od1HV4s_fVcoHidWs5qUm-2A5+Fr9ZrRLg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 May 2012 09:05:57 -0700
Message-ID: <CAMKF1spunqV3__K7_jEt5oQwg=J0v+TwZSUtGOv=DeipCPkzSA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: target rpm build failure
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
X-List-Received-Date: Wed, 30 May 2012 16:16:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 30, 2012 at 8:18 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> It fails on undefined reference to xmalloc, xcalloc, etc... that however are
> internally defined and used as wrapper for real malloc, etc...
> Please, can somebody try to build this package for me?

are you using  uclibc for system C library ?


