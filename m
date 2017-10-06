Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 41946780A1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 10:23:13 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id w1so4711904itd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 03:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hJ6mwkmgFWbpMzQjk2+QqVKTXgXWm7JYueIuTZ4i5n4=;
	b=nh/9H0FsA6D1eopQWyuEWCs15sEmF1Oe8bSMKI51MxD8ZopVpZ8uX86E3I5S9yFqW7
	tHL9BI/d4DWytDvycar5Ot+F1xdWNOca89aylcjAwPs0BUbQ3JfuvoB9YbZTMNhOVqjN
	tih5mnzdqQJnVy7g3SqdXttdvpf6Rm9poqZtL+PPhYMd5XWIoMFCrmAnW7SwhmLps77x
	innO3m3Lna/TzSmkjDxgpYMpSI1BjwIxyTzUMSHfvBwspxzA5sPBOsACi6RksEAPpGQl
	hWFKYapQoCYSyE31tVYAtockGS522WFDYO/2/8cINXttBkFmARFbVk1UBFSgkG/xtRWk
	ibNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hJ6mwkmgFWbpMzQjk2+QqVKTXgXWm7JYueIuTZ4i5n4=;
	b=aXFRVwxJQEKyO5JgW/fXPFBTd5styk+XaPW0ZhOcAA/EAeAuV97O3/bi40pDFOzT6W
	xtjmQk61/WNk/8H4WKMT2FiB64zG2zMX4BteTxF3EAH+iBVAampt3vWUkhDmKv4Grk0I
	uM7Wt/Et3/fT6sebkk39/ras8wzAGfTPRkxAhTgmLKXAXlVJ8D2DJolQTs2V9kNj9i1o
	OaYQrRIqnkQUPoqMEs7WJM2XyASIL7q7OeJtDtHoKXASAjZjGim+PROo2xgJ6FlvKKM3
	YhnMOmtgKr/YO1QlzhtA86JeBWlmsf0LJHrk4SVktERhMhaViK3iPMyb7dw5mVchT/3Y
	BzWA==
X-Gm-Message-State: AMCzsaWZ4jPhbyzYUht7rodgF1q/6lDhJbn8XCOGwbHNkYKhS1nHiAWs
	up/l5OBRMQhEuvKbNu0lKkeNCw4w80N1XxyxYCp5Gw==
X-Google-Smtp-Source: AOwi7QAQl3ELYySeL4IjDq2Tb1drIjq47GKgpuxP66LqF/h92cnGblHpDJBP31OtFuiQcp3Q2GOG09i52Fy+0m2hrqc=
X-Received: by 10.36.167.79 with SMTP id s15mr1684673iti.6.1507285395388; Fri,
	06 Oct 2017 03:23:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.59.22 with HTTP; Fri, 6 Oct 2017 03:22:54 -0700 (PDT)
In-Reply-To: <1231bf23c001d44632edf9061b87ac6629d2fc83.1507250774.git.raj.khem@gmail.com>
References: <cover.1507250774.git.raj.khem@gmail.com>
	<1231bf23c001d44632edf9061b87ac6629d2fc83.1507250774.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Oct 2017 11:22:54 +0100
Message-ID: <CAJTo0Lb=YeOC-B5xQa8jPPsja+DCTdq9SAAOm4FfWzsMdcisvw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/10] binutils: Convert SRC_URI and SRCREV to weak defines
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
X-List-Received-Date: Fri, 06 Oct 2017 10:23:14 -0000
Content-Type: multipart/alternative; boundary="f403045fb21891733e055ade3a22"

--f403045fb21891733e055ade3a22
Content-Type: text/plain; charset="UTF-8"

On 6 October 2017 at 01:50, Khem Raj <raj.khem@gmail.com> wrote:

> This makes it easy to override them in bbappends
>

Doesn't a straight forward assignment work in a bbappend?

Ross

--f403045fb21891733e055ade3a22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 6 October 2017 at 01:50, Khem Raj <span dir=3D"ltr">&lt=
;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com=
</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">This makes it easy to override them in =
bbappends<br></blockquote><div><br></div><div>Doesn&#39;t a straight forwar=
d assignment work in a bbappend?</div><div><br></div><div>Ross=C2=A0</div><=
/div></div></div>

--f403045fb21891733e055ade3a22--
