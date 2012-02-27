Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S26Qu-0002pg-VZ
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 20:40:29 +0100
Received: by bkcjg15 with SMTP id jg15so1648238bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 11:32:02 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.42.72 as permitted sender) client-ip=10.112.42.72; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.42.72 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.42.72])
	by 10.112.42.72 with SMTP id m8mr6370750lbl.10.1330371122406 (num_hops
	= 1); Mon, 27 Feb 2012 11:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=TYvP9z+hR6RTHPuexUw3t/z8iOlgioH5P+hgdDoWahQ=;
	b=tz+a4PXS1jCjjAsc9SS1V4mPFdIYvtBhM18HgyAmdKs596MkaTcbXRDNMJ47NOSYXl
	Du+FXo1VPikzjKlQSRVJHP+XJSJpMsjcOTP9lG5YlCBBq3HkqXT3mz9rek214uUNkc3w
	Y+5WH4T93ButnjpxSumMnIwfjwMi5C7YMJau0=
Received: by 10.112.42.72 with SMTP id m8mr5339843lbl.10.1330371122316; Mon,
	27 Feb 2012 11:32:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Mon, 27 Feb 2012 11:31:32 -0800 (PST)
In-Reply-To: <1917f9e3ccf8558491f0f671ba0525319cd3cf02.1330369680.git.sgw@linux.intel.com>
References: <cover.1330369680.git.sgw@linux.intel.com>
	<1917f9e3ccf8558491f0f671ba0525319cd3cf02.1330369680.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Feb 2012 11:31:32 -0800
Message-ID: <CAMKF1sq+4=fD2kyK2BHjuCcompqcb01ThpJak+59VvD1EycDxw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/13] util-linux: Update to 2.21
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
X-List-Received-Date: Mon, 27 Feb 2012 19:40:29 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 27, 2012 at 11:10 AM, Saul Wold <sgw@linux.intel.com> wrote:
>
> -CACHED_CONFIGUREVARS += "scanf_cv_type_modifier=as"
> +CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"

can you explain this change ?


