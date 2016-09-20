Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id E5048606CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 07:53:56 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id r145so12018809ior.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 00:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lLuEmlKGiWFSi1iM26jOheN9ueamNW0uu4Bmdpd/nm0=;
	b=I/tfY9aH/CEzv0oqJulkShbevOmLl5OWBJhSFnSpAwMKifHvFre0uCIWN5LwdZLPVp
	jUptb8zSvKb73JJrA854kBBJeSr2ReWhi/27N1D4eRLcflTjSt7OYb0zxaaC7U7/q+wu
	858yvcJoAvBpbP8EFtxJYq+aQS1ZWyTIYfF2rwCUbUm5xnXoG9Y48Ap+rbdqZyaPve49
	tKgin1dNmfcmP5ZsylD+UVtuK27qSPqgAiAeIVumhVgF3W24MbT+AgAMwS3BLrE+z8qU
	qODEnOfOPO5+zqepdNwzWSY0/mZZKgQU0iYKvAri6fYyPwOl/QzLCFUPd+ZffKJhjY7S
	yzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lLuEmlKGiWFSi1iM26jOheN9ueamNW0uu4Bmdpd/nm0=;
	b=Ebo2ScdkkOmQiirgl7VI+OPS7p255fhnP4Smhkcb6mu1NxhiK9OGI2/fm8HNV3b+im
	T960+k6J6Lps/0mj+4I8PybMnBGG7Ro8App4RRixSLShqyIJYwQnjjE+x9Yl2gzvrwoq
	nK+3easDP9HEHPrgGyruQlf4dRzEBfiDV+LQMN4/pOsI8j7HbhV3Hw5QSgwtIV+PsEKD
	a76pdCAbwT2A2Sq0OKT0FrMLsIOmtKe18Gvz/20IkkdAHgEt5wiYxR2wjsH/rQu3U/hw
	HBe1MgW5TwWXc3QnCVHA+vFG1Z5GOC0wis0sT2wbmkS0Vfdcj4dYCfwvpScsm1T1potu
	T37A==
X-Gm-Message-State: AE9vXwNca3uldMwfpy2YoM/oVVtpUzM7lTEDxfQkGdRmDhKYXXhhrde/JO2fpHuhJAodSyfdwGgvQd/ZJOHFOBSM
X-Received: by 10.107.142.5 with SMTP id q5mr17137457iod.201.1474358037732;
	Tue, 20 Sep 2016 00:53:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Tue, 20 Sep 2016 00:53:37 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA013A2D2400@ALA-MBA.corp.ad.wrs.com>
References: <20160901024821.28166-1-jackie.huang@windriver.com>
	<1B858668EC6A94408DCA5225FDFA85AA013A2D2400@ALA-MBA.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Sep 2016 08:53:37 +0100
Message-ID: <CAJTo0LY_98XwoHr_utj4bGvTBJh7MYOdGC_9R0v1D=XqtXCJRw@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] default-distrovars.inc: remove libidn from LGPLv2_WHITELIST_GPL-3.0
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
X-List-Received-Date: Tue, 20 Sep 2016 07:53:57 -0000
Content-Type: multipart/alternative; boundary=94eb2c0627101c7cbc053cebbb05

--94eb2c0627101c7cbc053cebbb05
Content-Type: text/plain; charset=UTF-8

On 20 September 2016 at 01:50, Huang, Jie (Jackie) <
Jackie.Huang@windriver.com> wrote:

> Ping.
>

It's queued locally now, should be in master shortly.

Ross

--94eb2c0627101c7cbc053cebbb05
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 September 2016 at 01:50, Huang, Jie (Jackie) <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:Jackie.Huang@windriver.com" target=3D"_blank">Jackie.Huang@=
windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":1g8" class=3D"a3s aXjCH m157451318562e598">Ping.<div class=3D"yj6qo =
ajU"><div id=3D":2cf" class=3D"ajR" tabindex=3D"0"></div></div></div></bloc=
kquote></div><br>It&#39;s queued locally now, should be in master shortly.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--94eb2c0627101c7cbc053cebbb05--
