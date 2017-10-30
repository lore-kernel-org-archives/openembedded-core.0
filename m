Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8586E70018
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 16:31:43 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id j17so28503776iod.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 09:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SVegqAuEwuqCWh0l737qWvgZdDgKbdSxAbRRqP7SUT0=;
	b=0xorL0x2Sqe3muPuIhiVT8UBcYtD3K3dn87z2cw/OrbA3RLh+SXGZY+eEi51XgbnfR
	ZL/MX1arGBrcQlTpLcttZyNFGhFU8im3jG0jxrT7/KPa2Nz1QEQdfVV/JasmuJlNoWPv
	krG2yLusFmW5b1exWW0/pXsnCUjMBH3Jn5zZpHnIe0hXukeYjVoWIT5nlmwCi5HwuCow
	87uFJd6dLw8+afHDR92hxkxV0KHAtjMB8WQOaUlJJDE19F5yqHwe43ll/7FFcrc7T/BR
	gi/Crzbu9jLHrmEofxCY0wAhYpbgxusePbPtqHGXHywt7pcNkf2yktsFhTKxe6tg9Tbr
	Qq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SVegqAuEwuqCWh0l737qWvgZdDgKbdSxAbRRqP7SUT0=;
	b=R7Jbb53kwkALKxIgaFSRtpZHgoa8wfIX0wP/nGW7LTa4G/YXpFtPLFQkP1A94nu/Fi
	DdwdUMQTlxqzMDmbgvkadiZCIEAUpywXgQKlRyq9n/8tO2DskdGgtZEYI01p2kUdUMBh
	2X1kpI5VEhLAKL7UHYLfcG0Yiin6eT1KpVRqSxQqjl5TMJZBOKk6sBDChkJmoxix4g7w
	3NqPwHDq8EUW2hOOXozsGF3LFVac/4E09V1nTvDiW179lk1EA176ObMvQF/Dw9MvKyDN
	pQa+pebbLy1ImPwiZ3yL4IyhriN85Ls9ASadQIzCOLYVXKoBMt+8wCv02ngdMCCJnj7d
	qn8g==
X-Gm-Message-State: AMCzsaXbwTDL4nJLt3q8yJZ6j/nNcnHDPbwYZ2jLA14aIsrdLmZAL5RG
	kqIy2UG6fpeCXK5xXSXRLfTwgpREgpD/fzxVsGxSBA==
X-Google-Smtp-Source: ABhQp+Qw0KCaqpcuacXMgONuOutdd12MUlGugDIOvPuTv5b3SZSi5HIoRq+KwPs2aRT7xJkd3saqT0HHSeEtvixw7G8=
X-Received: by 10.107.18.67 with SMTP id a64mr12129189ioj.165.1509381104559;
	Mon, 30 Oct 2017 09:31:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Mon, 30 Oct 2017 09:31:24 -0700 (PDT)
In-Reply-To: <20171027110503.8293-1-timothy.t.orling@linux.intel.com>
References: <20171027110503.8293-1-timothy.t.orling@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Oct 2017 16:31:24 +0000
Message-ID: <CAJTo0LbsVsyE-MvyMTPCF=dm1GtDs27_7tVyxdZ1JU2YZ=RRZw@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pigz: use archive tarball instead of Github generated tarball
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
X-List-Received-Date: Mon, 30 Oct 2017 16:31:43 -0000
Content-Type: multipart/alternative; boundary="001a113ee9b291954c055cc62c30"

--001a113ee9b291954c055cc62c30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 27 October 2017 at 12:05, Tim Orling <timothy.t.orling@linux.intel.com>
wrote:

> Github-generated tarballs are known to change over time, so
> use an archive tarball provided by zlib.net instead.
>

Looks like a good idea but the maintainer removes the old releases:

$ wget https://zlib.net/pigz/pigz-2.3.4.tar.gz
--2017-10-30 16:28:55--  https://zlib.net/pigz/pigz-2.3.4.tar.gz
Resolving zlib.net (zlib.net)... 69.73.182.198
Connecting to zlib.net (zlib.net)|69.73.182.198|:443... connected.
HTTP request sent, awaiting response... 200 OK
...
2017-10-30 16:28:56 (302 KB/s) - =E2=80=98pigz-2.3.4.tar.gz=E2=80=99 saved =
[105412/105412]

ross@flashheart ~/Programming/libsoup (master %)
$ wget https://zlib.net/pigz/pigz-2.3.3.tar.gz
--2017-10-30 16:28:58--  https://zlib.net/pigz/pigz-2.3.3.tar.gz
Resolving zlib.net (zlib.net)... 69.73.182.198
Connecting to zlib.net (zlib.net)|69.73.182.198|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2017-10-30 16:28:59 ERROR 404: Not Found.

The moment a new tarball comes out we'll need to fix all previous oe-core
releases...  maybe the author has a secret directory of all releases, or
could be talked into not deleting future releases?

Ross

--001a113ee9b291954c055cc62c30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 27 October 2017 at 12:05, Tim Orling <span dir=3D"ltr">=
&lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com" target=3D"_blank">t=
imothy.t.orling@linux.intel.com</a>&gt;</span> wrote:<br><div class=3D"gmai=
l_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">Github-generated tarba=
lls are known to change over time, so<br>
use an archive tarball provided by <a href=3D"http://zlib.net" rel=3D"noref=
errer" target=3D"_blank">zlib.net</a> instead.<br></blockquote><div><br></d=
iv><div>Looks like a good idea but the maintainer removes the old releases:=
</div><div><br></div><div>$ wget <a href=3D"https://zlib.net/pigz/pigz-2.3.=
4.tar.gz">https://zlib.net/pigz/pigz-2.3.4.tar.gz</a></div><div>--2017-10-3=
0 16:28:55-- =C2=A0<a href=3D"https://zlib.net/pigz/pigz-2.3.4.tar.gz">http=
s://zlib.net/pigz/pigz-2.3.4.tar.gz</a></div><div>Resolving <a href=3D"http=
://zlib.net">zlib.net</a> (<a href=3D"http://zlib.net">zlib.net</a>)... 69.=
73.182.198</div><div>Connecting to <a href=3D"http://zlib.net">zlib.net</a>=
 (<a href=3D"http://zlib.net">zlib.net</a>)|69.73.182.198|:443... connected=
.</div><div>HTTP request sent, awaiting response... 200 OK</div><div>...</d=
iv><div>2017-10-30 16:28:56 (302 KB/s) - =E2=80=98pigz-2.3.4.tar.gz=E2=80=
=99 saved [105412/105412]<br></div><div><br></div><div>ross@flashheart ~/Pr=
ogramming/libsoup (master %)</div><div>$ wget <a href=3D"https://zlib.net/p=
igz/pigz-2.3.3.tar.gz">https://zlib.net/pigz/pigz-2.3.3.tar.gz</a></div><di=
v>--2017-10-30 16:28:58-- =C2=A0<a href=3D"https://zlib.net/pigz/pigz-2.3.3=
.tar.gz">https://zlib.net/pigz/pigz-2.3.3.tar.gz</a></div><div>Resolving <a=
 href=3D"http://zlib.net">zlib.net</a> (<a href=3D"http://zlib.net">zlib.ne=
t</a>)... 69.73.182.198</div><div>Connecting to <a href=3D"http://zlib.net"=
>zlib.net</a> (<a href=3D"http://zlib.net">zlib.net</a>)|69.73.182.198|:443=
... connected.</div><div>HTTP request sent, awaiting response... 404 Not Fo=
und</div><div>2017-10-30 16:28:59 ERROR 404: Not Found.=C2=A0</div><div><br=
></div><div>The moment a new tarball comes out we&#39;ll need to fix all pr=
evious oe-core releases... =C2=A0maybe the author has a secret directory of=
 all releases, or could be talked into not deleting future releases?</div><=
div><br></div><div>Ross</div></div></div></div>

--001a113ee9b291954c055cc62c30--
