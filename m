Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2B89160248
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 15:08:31 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id ir4so77018852igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 07:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z4i+6EX9R1OFcXGILFuP5hoLPSyqvPSd0S3T4Zn8loc=;
	b=Wi06vzg8h3Jc2hejExx791sUlMBE7oOZ2wKWjt5W7plRPzstF/Z+Pnn6Pz9y0YXgB7
	AMYjGX4KMjbnii0QZCMJjVP6bFnNhHXdVLBMpIetwASXxCLr8VCe0Q8g3iqlyusY601i
	BtHW48nkZveDhKFfpAVMkzjtJto81Cg2SWYyIfJooogA1wsR+v19b3QHpGHe9OBcE8j8
	RxQEACQ3/x2+ACT1LiXytefUauvev3mfKBuXGzuEtVMF+E1rGVxc5v/bGf4P4yOa5iEt
	77uPM36YWJitMjk6chpsPhuObPMI7iTtnAHK8aoztWp9QHqoX05sZTA6LvhbJ7luyUvR
	Id7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z4i+6EX9R1OFcXGILFuP5hoLPSyqvPSd0S3T4Zn8loc=;
	b=jTlPkHXvScoY+qsTTDX0Rvt5gR0IsRKHwf9cKlVG/j9aXw4tSPOqlflLrJT+NcizZe
	7H9SSZXNQStHeZFdm9zayucm+C+f8SewwGlIQUaSumfobmttpENIkvcXIO6jWqChjd0h
	Pp6Ew5jzhhN0ot0LOa286RTAGiF9HUfBYDYIbLyLRW7mJBMvS7ot37JEMJ5jHe18DHxN
	wEvKkRtzdTZUfFQt3h/SlDmob189BPPoT1ITiqGcObOWJZHw+2uQCdZ9L8bZ4dHmuofv
	vVUMcXZ6ybd6pSebPE38sgI+XXxIHLZwVe+ufxuPNA01MdjjNnYAb7T9KyjSoSV0IpEW
	85og==
X-Gm-Message-State: AD7BkJL4Mp/zF/VQKjCLbtSoVQXydGSJUhPVdcx57nw6LAgCztNgDfNgucIQjf636sv3vxZvQjQkdltOG/GUd6oY
X-Received: by 10.50.150.41 with SMTP id uf9mr16047512igb.64.1457449711970;
	Tue, 08 Mar 2016 07:08:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 8 Mar 2016 07:08:12 -0800 (PST)
In-Reply-To: <f20640eec6e027b1e3b905a3357c934a4fe93d98.1457438802.git.dengke.du@windriver.com>
References: <cover.1457438802.git.dengke.du@windriver.com>
	<f20640eec6e027b1e3b905a3357c934a4fe93d98.1457438802.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Mar 2016 15:08:12 +0000
Message-ID: <CAJTo0LZBXfcUxUqCPP+S9mUbUq1vZO3XWHUOWKrV7Gqznuu_fg@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] quilt: fix ptest faildiff.test failed
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
X-List-Received-Date: Tue, 08 Mar 2016 15:08:34 -0000
Content-Type: multipart/alternative; boundary=001a11345c0c5c435f052d8af4a6

--001a11345c0c5c435f052d8af4a6
Content-Type: text/plain; charset=UTF-8

On 8 March 2016 at 12:11, Dengke Du <dengke.du@windriver.com> wrote:

> So I change the file "meta/recipes-devtools/quilt/quilt/run-ptest",
> when it meet the faildiff.test it skipped. I will report this bug to
> quilt upstream.
>

We're seeing a number of tests that expect to run as a non-root user.
Maybe ptest-runner should create a ptest user and run the test suites as
that user instead?

Ross

--001a11345c0c5c435f052d8af4a6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 March 2016 at 12:11, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"mailto=
:dengke.du@windriver.com" target=3D"_blank">dengke.du@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":l4" class=3D"a=
3s" style=3D"overflow:hidden">So I change the file &quot;meta/recipes-devto=
ols/quilt/quilt/run-ptest&quot;,<br>
when it meet the faildiff.test it skipped. I will report this bug to<br>
quilt upstream.</div></blockquote></div><br>We&#39;re seeing a number of te=
sts that expect to run as a non-root user.=C2=A0 Maybe ptest-runner should =
create a ptest user and run the test suites as that user instead?</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--001a11345c0c5c435f052d8af4a6--
