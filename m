Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id B6EC2601D3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 11:34:36 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id y123so733835iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 04:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vZrFGE0rEIxP5z2XZKAUWrrfrkpGAxoehboQA2dpEx0=;
	b=K4NqEiio0DxWpJcqWRFSxL8x5QpzGXh++6LJVEwEjIfmPpe6Q94uEasfGy3Cngbeqf
	FAF/JNdbCpfu7Y+hkdGjokVa4A3Fl+VyBFuHzuygOzaroWXGaYO8D0fnst9zcQnSbYYP
	3cZjHyTIlPMqp5QNupMRE+yzBGq5nXdZPSd1XelEnUrD1APux2MUTjgM6eqdjcHyZlUw
	54NrhGBFVusUxsjPujnsc3KexGfpG/movGoyezJD4UEdRNhXSG8nV/6+7QoiVOwWUlPS
	U8G9huWZSA3zEV19qsJa0M2WChhzP3hK7hoxARFAZDnNM1PbiZCxF/7QoFgeWn2O0r9D
	YBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vZrFGE0rEIxP5z2XZKAUWrrfrkpGAxoehboQA2dpEx0=;
	b=n4UdOBcM16liT9d0pyZeAX7BvIXOPDySasjY7YUjKgC93Czsm+7kSz2w7wH2vpSJDb
	cxbeWNMXh70AU5h0odtAf3NyP2s8kF5byz04o3FN/2AAcNoa+FXAEu7IJvUDRuvvB3Dm
	9v9Q/d1tNPa8q/42FZXa42b9Wluh5uO+Sf3Ac4bAXnBghiQJleboPVii6pE6CHRny1MS
	pNFZjeIYcd4ZepLPnOZS79lze/9L11Er0ib7uGDBLq0yVWCEXl1WfAa3+RrJxHN+qP9n
	MpsYFhzv2SKmZgJMpXfA9Rek6JH31jj1Jwoyydwa6otze3zVn+byAScDhFEsM8JM6QzX
	foxQ==
X-Gm-Message-State: AHPjjUju9hLO8eZqwc4yymbIZI8O79riYH4nbNzfX8o9drtyPA3GGJyq
	8uNtB17SoAadNnb3Hbi4HYmibIMMD4m8
X-Google-Smtp-Source: ADKCNb4D/zi5T1GwjeSXeYOMgKJNZ5ir2v4I+VIMP0Qf3jFBeNFb1gNvzDR+zt66rDx1uKkUCkLq3I/Hluc54Hwz0Qw=
X-Received: by 10.107.17.102 with SMTP id z99mr328694ioi.9.1504524877765; Mon,
	04 Sep 2017 04:34:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Mon, 4 Sep 2017 04:34:17 -0700 (PDT)
In-Reply-To: <78647462-c423-bdc3-8adb-544fe8eee978@siemens.com>
References: <78647462-c423-bdc3-8adb-544fe8eee978@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Sep 2017 12:34:17 +0100
Message-ID: <CAJTo0Lb+CWYiM8TJ45XyN9JRxCdwq9QknaOMp98f9DgHKdqdeg@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: bussybox: updating to new version
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
X-List-Received-Date: Mon, 04 Sep 2017 11:34:36 -0000
Content-Type: multipart/alternative; boundary="001a113f74aee54f2705585b7e8e"

--001a113f74aee54f2705585b7e8e
Content-Type: text/plain; charset="UTF-8"

On 18 August 2017 at 11:16, Andrej Valek <andrej.valek@siemens.com> wrote:

> Hello everyone,
>
> I would like to ask you a question about busybox upgrading.
>
> Is there any reason, why we are still using the version 1.24.1?
> I think that, the latest version 1.27.2 has a lot of fixes and it less
> vulnerable then the current.
>
> I have checked a license and it has not been changed.
>
> Thank you for the explanation.
>

The last time an upgrade was submitted it ended up with /bin/sh being suid
root so was understandably rejected.  Nobody has submitted an upgrade since.

Ross

--001a113f74aee54f2705585b7e8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
8 August 2017 at 11:16, Andrej Valek <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:andrej.valek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello everyone,<br>
<br>
I would like to ask you a question about busybox upgrading.<br>
<br>
Is there any reason, why we are still using the version 1.24.1?<br>
I think that, the latest version 1.27.2 has a lot of fixes and it less<br>
vulnerable then the current.<br>
<br>
I have checked a license and it has not been changed.<br>
<br>
Thank you for the explanation.<br></blockquote><div><br></div><div>The last=
 time an upgrade was submitted it ended up with /bin/sh being suid root so =
was understandably rejected.=C2=A0 Nobody has submitted an upgrade since.</=
div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113f74aee54f2705585b7e8e--
