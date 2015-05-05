Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3E6BD71144
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 15:34:53 +0000 (UTC)
Received: by qcbgu10 with SMTP id gu10so49535689qcb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 08:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=08251F+abgjwy7/XsgwV67ah1lHf8/TDDeWn3xNld68=;
	b=U/eHyNPZvUlUvyVNI+8wwRVI2f8gwc1D2K7SS402CMWCXZBKWGdJv1hydYYlbmBixK
	iZzMgNmgYX2R0jUKhG97HRSdrugx3bFTALuQQh6rnYv8E0ItfOU+ejxeTJNNXDKZfb8a
	uWS8xhXFPKHI6jbdO351AHTMDS0TWhMJKPzRxYNiAtK5pEJ3erl7yb0hkzJCEr8s3Z5n
	AmE31pTKsLQJkdqtK5NK3syouiaNoBmgzk5u86qJMkYjgF1/6o7XPAplXvFQ+FgmTt98
	VlPqSQoLcEWprLIos7un+3/YHUTxHzslmiHm0oh/k0U10ey7MH8xV7x4blFbJTi5GEgi
	YJuQ==
X-Gm-Message-State: ALoCoQnYN5jaZWSK4k6mdkWyVdWrypNdyGSzOcfO4NI3N1uy8KAWUStqVCVSEBe4fUfWpof5x2fT
X-Received: by 10.140.88.35 with SMTP id s32mr33459923qgd.59.1430840094930;
	Tue, 05 May 2015 08:34:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 5 May 2015 08:34:34 -0700 (PDT)
In-Reply-To: <1430810046-27021-1-git-send-email-rongqing.li@windriver.com>
References: <1430810046-27021-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 May 2015 16:34:34 +0100
Message-ID: <CAJTo0LZegzqLHxrTkyyH3ybErWejuZLQh9ZgFCxcJJwfEaPswQ@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] apt: upgrade to 1.0.9.9
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
X-List-Received-Date: Tue, 05 May 2015 15:34:54 -0000
Content-Type: multipart/alternative; boundary=001a11c11d0296e7600515576b47

--001a11c11d0296e7600515576b47
Content-Type: text/plain; charset=UTF-8

On 5 May 2015 at 08:14, <rongqing.li@windriver.com> wrote:

> Upgrade to fix the several CVEs: CVE-2014-0488, CVE-2014-0490
> Remove apt-0.9.9.4-CVE-2014-0478.patch, which was backport.
> Romve no-ko-translation.patch, apt-1.0.9.9 has ko translation
> Update use-host.patch no-curl.patch db_linking_hack.patch and
> noconfigure.patch
> Not build the test cases since it requires gtest
>

What runtime testing was done with this upgrade in place?

Ross

--001a11c11d0296e7600515576b47
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 May 2015 at 08:14,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqing.l=
i@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":c8g" class=3D"a3s" st=
yle=3D"overflow:hidden">Upgrade to fix the several CVEs: CVE-2014-0488, CVE=
-2014-0490<br>
Remove apt-0.9.9.4-CVE-2014-0478.patch, which was backport.<br>
Romve no-ko-translation.patch, apt-1.0.9.9 has ko translation<br>
Update use-host.patch no-curl.patch db_linking_hack.patch and<br>
noconfigure.patch<br>
Not build the test cases since it requires gtest</div></blockquote></div><b=
r>What runtime testing was done with this upgrade in place?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c11d0296e7600515576b47--
