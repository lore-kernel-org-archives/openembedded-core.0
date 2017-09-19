Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id A8327780F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 12:34:29 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id e189so9613248ioa.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 05:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rh0wrPEmizRXUCHtoQydzJQv8KzJc4BVIGUdTKzhvBM=;
	b=qQSynbCxf40N2aPJnO6wuXzm9N1gsM37arOPD8evTMYi8Uc4vbXgikVkQLcpmCRxB/
	jTQqQGEZCZXlXu6UUwrpPehDuKL/yPzruvoT8b1SKqvJue2L6ClXwoDeB0eUVqscXJgb
	6NHllc4zr1VO02NRHhtk0qeJtSQEXySDea5CJfiOFC3XN6cNo9RiMHLa3swtpqV1Im7a
	J88P43AbANrHTZqipbRrYJC2J2Z5MErL8KUs8uRnhl+z4bzijX/OKBjOEiyU+4elUobD
	my2W4SK5Hp8Xc4nSq6b1UXuyw3VXvuQo36MMuei8HsSQYFMQxUBsa3Mlp1v2qIqr2LrA
	B+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rh0wrPEmizRXUCHtoQydzJQv8KzJc4BVIGUdTKzhvBM=;
	b=t9clcDo4mh5Q9Baciwz/9aSFEgRwZdjEarlZcOmXrZd6jnoAvab7RHM6qsc6QoLG4h
	HzBL+vzXcLbocbLY4xXRC/ertns6KMl5CWQWBk6+NtBv/wMwbjKKNAxX1IxHhLYlB5Mk
	fASuSqNEkMRW9UNHdGYxRIBMu0pw4iy7+A24SFtYYrxLri1iQg8AVhbcPZrbkXrYrY4I
	GEgS8ypxBBkiMTPtxzcXNwHuJXtH4VY2NEAKaDxnfyKi5C749OCozpncim0+b1unybIr
	Va9iju7laozVTBtH+T64QAIxDThHq5m6HELQJL8UrS9TIrm9btA487520dc+N2VpVBg8
	mZwA==
X-Gm-Message-State: AHPjjUjy479OkDWIyxsMDyT+hFa/nfF+thn0XRVsGiv9Zry/w+Dw9LWq
	6C3E/SZOHprOQ5ISL0J7ifM9+QlGUhcY0hcn7nSp6g==
X-Google-Smtp-Source: AOwi7QAdLjjPevvtYO/Ie4Pn5M+boC803ztYTHL4YRVMbjeR5YUkHemb+23QpY/ixktZ5QmWshGQauLNqA6aVH+V0y4=
X-Received: by 10.107.41.135 with SMTP id p129mr1578521iop.142.1505824467807; 
	Tue, 19 Sep 2017 05:34:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 19 Sep 2017 05:34:06 -0700 (PDT)
In-Reply-To: <CAJ86T=XiebPX6z1zPReWd1cZ3U1Hz_rEZ6_8w=oLfZPFv1K5EQ@mail.gmail.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
	<a6389819751745fb864af89806f86b5d@XBOX02.axis.com>
	<CAJTo0LaZo2Jhh7Jj=RAUzOzXq_FcXnobu-idL7RFnbq84iR_VA@mail.gmail.com>
	<CAJ86T=UqdDrT2ApxMiM=g__pTftCc5g0-gzs20vd-jV06+6x7w@mail.gmail.com>
	<CAJTo0LZrPSoVNAX6onFFsGgkD1LEm=2DLdBOecnhNEQBRDnS6A@mail.gmail.com>
	<CAJ86T=X5xAtSL4bK9tGLxrdxqtNh6ewG0n8rLfeiewL=cWA6xA@mail.gmail.com>
	<CAJTo0Lag_GCyfHCcEnNbfLOXSB+qyDhQHxUkdTF5RacgfxQEWg@mail.gmail.com>
	<CAJ86T=XFBTNtAg2_xPEFGTiH2Y_gZnRS_LZWkBWL2kPiUYARpA@mail.gmail.com>
	<CAJTo0LbOtfMY7mo5ASNZY0g3yd8+cwLEoWyMc4HifHH_nnyrjw@mail.gmail.com>
	<CAJ86T=XiebPX6z1zPReWd1cZ3U1Hz_rEZ6_8w=oLfZPFv1K5EQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Sep 2017 13:34:06 +0100
Message-ID: <CAJTo0LaidWQxAaxq+Uu9dwCJxxh20Vgxv5RisYMRAfUUAQSimw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: profile: Get rid of "resize"
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
X-List-Received-Date: Tue, 19 Sep 2017 12:34:29 -0000
Content-Type: multipart/alternative; boundary="001a1141f2267fdd3905598a1438"

--001a1141f2267fdd3905598a1438
Content-Type: text/plain; charset="UTF-8"

On 18 September 2017 at 22:11, Andre McCurdy <armccurdy@gmail.com> wrote:

> The "get rid of resize" patch seems to have made it into mut.
>

It was reverted at 8pm last night but I didn't push.

Ross

--001a1141f2267fdd3905598a1438
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 September 2017 at 22:11, Andre McCurdy <span dir=3D"=
ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy=
@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">The &quot;get rid of resize=
&quot; patch seems to have made it into mut.<br>
</blockquote></div><br></div><div class=3D"gmail_extra">It was reverted at =
8pm last night but I didn&#39;t push.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a1141f2267fdd3905598a1438--
