Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id E119D7870F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 13:16:29 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id p188so8045457ioe.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 05:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uOwOrSUWc+u1C+oxBq2MpZ8N9eEGOT50BJI1H6oCIYw=;
	b=EXoBhpc6Jq8xuYZfqSApznV67vmc5vjgsBhRmdfQrsOV6zuXEhUrC8WdLtnZ0P/rzD
	xIjTK+dSZPOVXu+zTik55qV1mvSV4IXVd+nF7/BPejLMjIiNaJ26U/qVNofq3mJk+Rbd
	oKVGUYm4FDNndFdyrOPzQvVkfcqlU+daxBlTYydk5zhEOX+eE4QJ+ZvSjedRgGrJs5K3
	jTCazpY2dAWALJtW/Mf5RbTTbpll19pD7N3freim5RjrgKdPWJpD4XqTObhS/qHqgpoK
	luxsZFDylNApDPt2MTlJxthtzlAn+E2SSfpPe6Lj0H8WzUSAtjffTeZtHSD8VyyyNfxH
	etWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uOwOrSUWc+u1C+oxBq2MpZ8N9eEGOT50BJI1H6oCIYw=;
	b=EvWLjqFYVRAgvM6qt/3pMSH3pexxHRJY8BWLFMSXG/ffWGyM6wcMS8YmX0VXhGgMHX
	Piod7CwctgK3CxlMcsbJSh8Wu5EtcgNque4qJSE8F2WYXmE/9RWRws0oQ96nBqGeL3tb
	yE6ECNhfLdxkc2vWeESfM0cBZHDQuMYCBnoMrhWzD3U07uV8iKpsrXKAEWgUWRkjjNV1
	u88FF7FrbSXh2J1QmyenbAFTgzgL1YmucMjWjFO7T5c0vAJ/er6hkntKerTCsyeMl56i
	dV2lEMbWf6guo2bK32Ipcp+U/6g8lr7/GK3v2ALo4gNiwjrt7q0LegA1bWCcZTh8+t0N
	b8ng==
X-Gm-Message-State: AKwxytd0kQ0DzQhO5a2MZGeOaH6HAn33yG+qn5170st0w4LZazMSsOLW
	m+reu5zBc0HPjW+uN/JEIKjJi16qkAcsoxdpjbgiCw==
X-Google-Smtp-Source: ACJfBov9dwYi+XYoDX5fN43uVfim4zLQBsmtrZiDbvaOuKkJHnJmIrxSi6cJ+i9SEL2WhQtZk9NUqcS9at8/E/RfcAc=
X-Received: by 10.107.47.137 with SMTP id v9mr2876430iov.217.1516194991301;
	Wed, 17 Jan 2018 05:16:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.157.202 with HTTP; Wed, 17 Jan 2018 05:16:10 -0800 (PST)
In-Reply-To: <20180117131155.2297-3-otavio@ossystems.com.br>
References: <20180117131155.2297-1-otavio@ossystems.com.br>
	<20180117131155.2297-3-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Jan 2018 13:16:10 +0000
Message-ID: <CAJTo0LYONEvXNkEYzanBQXseap_vG=5BA9sRbRtXsK+PdwLwHA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/3] cmake: upgrade 3.9.5 -> 3.10.1
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
X-List-Received-Date: Wed, 17 Jan 2018 13:16:30 -0000
Content-Type: multipart/alternative; boundary="001a1136f566ddff460562f8a75f"

--001a1136f566ddff460562f8a75f
Content-Type: text/plain; charset="UTF-8"

On 17 January 2018 at 13:11, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> Changes in v2:
>  - add make-native dependency


I can't see a dependency on make-native anywhere, and we've always relied
on the host make so why do you need to do this?

Ross

--001a1136f566ddff460562f8a75f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 January 2018 at 13:11, Otavio Salvador <span dir=3D"=
ltr">&lt;<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavi=
o@ossystems.com.br</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Changes in v2:<br>
=C2=A0- add make-native dependency</blockquote><div><br></div><div>I can&#3=
9;t see a dependency on make-native anywhere, and we&#39;ve always relied o=
n the host make so why do you need to do this?</div><div><br></div><div>Ros=
s</div></div></div></div>

--001a1136f566ddff460562f8a75f--
