Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id B022F781EF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 16:20:48 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id p21so39417383qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 09:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JpmGgedrASWU1NcxbfWnYpaIb3Zy+jTDtm2B3pcY87o=;
	b=c5b5I4vYEOsMGA7R8YeUJS2mg9BJALH+jq/4VAqz/7aHpH5vN7Z31/7p2Rnw7597eU
	AjNVZzBb31WETFRWyw50jrH28EwSzSa7HldEIzGQGkPYcKTQxeAefXXHkMyQc0miNXnT
	tzIT6HLS10lhaWj4hIsq/TItDXbmzG1PWJJUUZO7af9ifrl/2zPJ18Go9JUng/s+2zIg
	OeIjZ2IsQhFOHYZcC3GqzavS+dekyf82BjM+C5o6DwlYHernHs8yhJTpUskEacZQVAtW
	2Cq/7EequkofJ0hcF+VsbF987GWyk4IknmpaFaRy6jpn9ABFWfetlLr6qaqaIMKWTHyi
	6gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JpmGgedrASWU1NcxbfWnYpaIb3Zy+jTDtm2B3pcY87o=;
	b=hqQh0Nv4YztvI51cqHN7/9cVgZ+kFEOMi8e3yq+/KX1AQYO+1Z1E0URswoPqVDrY/d
	h++Il7WmJlueVzIXRTifSZNXFgiodEW6C4NcOFxTRwx5MyEBnex3W8nS2orRrK3IqKaI
	LJ8dWCz/Q3dXiEGyzAYwniRCATpAeq44buENWa2NVNhdwiEyJ0TSgJwDevUkRpvPa11K
	M4aWXvQJpQSo4+valhOASJ4hySs93yp0sdirjQbBwtHm8uBAJhlvE3kM8eR5cuz8GFxh
	o/Pol7KMCax7sBFjuA88L43OKEOzQ9apcvX7CSwNd2wTJeFA935q/4MA32RixDidzH5l
	RiLQ==
X-Gm-Message-State: AKS2vOyG1qIiVfumQJltspn1VMcZifR8GXNl9xILaK8qzr6kjNMqJY4d
	j1icqkmNSV4+H5FVOINmJZxZQIgKtDh+
X-Received: by 10.55.181.69 with SMTP id e66mr9609240qkf.109.1498234849733;
	Fri, 23 Jun 2017 09:20:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 23 Jun 2017 09:20:29 -0700 (PDT)
In-Reply-To: <20170623161903.GV28053@denix.org>
References: <20170623154544.28745-1-ross.burton@intel.com>
	<20170623161903.GV28053@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Jun 2017 17:20:29 +0100
Message-ID: <CAJTo0LZwEeAUopRPm+9SV0ZhVD9=u-3bvkjsK9dy2PJdKZ6UFw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: Fix malformed Upstream-Status tags
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
X-List-Received-Date: Fri, 23 Jun 2017 16:20:48 -0000
Content-Type: multipart/alternative; boundary="94eb2c05d2220245a60552a2fcd3"

--94eb2c05d2220245a60552a2fcd3
Content-Type: text/plain; charset="UTF-8"

On 23 June 2017 at 17:19, Denys Dmytriyenko <denis@denix.org> wrote:

> > -Upstream-status: Not sent yet
>
> Should this one be "Pending" instead?
>

There's another upstream-status tag in that patch, this was deleting the
duplicate.

Ross

--94eb2c05d2220245a60552a2fcd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 June 2017 at 17:19, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=
=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div c=
lass=3D"">&gt; -Upstream-status: Not sent yet<br>
<br>
</div></div>Should this one be &quot;Pending&quot; instead?<br></blockquote=
><div><br></div><div>There&#39;s another upstream-status tag in that patch,=
 this was deleting the duplicate.</div><div><br></div><div>Ross</div></div>=
</div></div>

--94eb2c05d2220245a60552a2fcd3--
