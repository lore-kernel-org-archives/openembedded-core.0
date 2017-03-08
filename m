Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 37B3D774E6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 17:46:17 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id v125so76681368qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 09:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uLLH24oc8vYuuRUBvnrXt15+miTWDefCkPWX55KLTXk=;
	b=ayn50WeEpZcEqtVEC94ly1bLvit4Q4aIwhe3IlS1L3TLMqsL5WK0bpqcOT0dj1MG0z
	PsgKJKKRQQzXw7fAFXx1l7zXNyYUQCfPtFfpg++1NTQcKh99lRXkUhF7uOCKfJva3owo
	wxd3Ue2D9f0MfAEGq0TQQKRSpUjzUUSVKeQH8QA8jJJOwPxjNEV0JScKN4CSdrj8joHK
	pJ7h6Ay0vcW5Ji7x5z1Qg/t99jKksBElcdtm4FIEHuzfqYEQeHSTMN3/8mPHvtt5GpQ3
	+ESUh2VN3EjqhbWJfoJmLEbHCzt4/CI26pEBzp5A0x8EQY8z3l7X7WQnsb5NSgXJY6jF
	lFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uLLH24oc8vYuuRUBvnrXt15+miTWDefCkPWX55KLTXk=;
	b=h3Mzxj/9Wt2Dcu2gyPoweDOk0JK8rL/eskD0p/buG3+QXVl1NHz7mVHLC0qOqd1shE
	qOSUi4PoUqxbKUPMtS+RKUGGVtVQ9QTpd/9in5xRLkgqqiuX/Hi7imJfn3/0kySBA5jN
	w3gncm5d850yQXZNOUR5v3dYOpmJfvYLxyj9v5QO8iN34nZslpQJVWX8vkUZPVWfsGbK
	nxcqWzxo4rnRVbkWKDQhAQID9xt0zQxPy3+etD5RK7FKZU9MIfKd5npKMN3Ma0vu6bTQ
	EhUWZLob2C3b1PtFiB0V7LzpZ1mAyHqmQH0Rg/QGBseixhCB0zi4/XIY55mhHv3vE+wO
	TNJg==
X-Gm-Message-State: AMke39lJfmJa4h96PPrZkCzw46sZ9i/K2etpwYmDE/0NKMPkcupVSJQ9EfTBgu6kc7bUK+jlAwSgcQcdMCfVQetJ
X-Received: by 10.55.183.133 with SMTP id h127mr9066958qkf.121.1488995179043; 
	Wed, 08 Mar 2017 09:46:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 8 Mar 2017 09:45:58 -0800 (PST)
In-Reply-To: <40cc8168-6fb5-6ff2-0ae2-497a36205727@windriver.com>
References: <1488993907-13037-1-git-send-email-ross.burton@intel.com>
	<e1abebd7-dba3-0c61-a3cd-bdc5a9d39fab@windriver.com>
	<CAJTo0LbhUp_iYLyBX2VQd_P-ouZAjYqr8_vPLop2awoW-G3mhA@mail.gmail.com>
	<40cc8168-6fb5-6ff2-0ae2-497a36205727@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Mar 2017 17:45:58 +0000
Message-ID: <CAJTo0LZi3Ci+sbtrrXn9_4PEVkxZwVJ107nfq1ZQ5YWGWBB+zQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: add gitupstream class
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
X-List-Received-Date: Wed, 08 Mar 2017 17:46:18 -0000
Content-Type: multipart/alternative; boundary=94eb2c060056b8a024054a3bb475

--94eb2c060056b8a024054a3bb475
Content-Type: text/plain; charset=UTF-8

On 8 March 2017 at 17:43, Mark Hatle <mark.hatle@windriver.com> wrote:

> Devtool can do something similar, create a custom recipe... but I don't
> believe
> it has the ability to take an existing (patched) recipe, create a git tree
> somewhere [external], and then make it available for modification.
>

devtool modify RECIPE will generate this git repository for you, so doing
that and then copying the git repo somewhere reachable seems like it mostly
solves the problem?

Ross

--94eb2c060056b8a024054a3bb475
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 March 2017 at 17:43, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":23g" class=
=3D"a3s aXjCH m15aaf0478d7f1656">Devtool can do something similar, create a=
 custom recipe... but I don&#39;t believe<br>
it has the ability to take an existing (patched) recipe, create a git tree<=
br>
somewhere [external], and then make it available for modification.<br></div=
></blockquote><div><br></div><div>devtool modify RECIPE will generate this =
git repository for you, so doing that and then copying the git repo somewhe=
re reachable seems like it mostly solves the problem?</div><div><br></div><=
div>Ross</div></div></div></div>

--94eb2c060056b8a024054a3bb475--
