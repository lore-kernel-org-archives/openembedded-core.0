Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6E57260851
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 08:43:15 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id n127so124547671iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Maiw/Pbm430QpTHQGE4Q6G3XahC441i3tKPyjXV6h3w=;
	b=F6j7OAFmyoD+0Nl9N8RAPh7hAoYmsfmJB7Xh+s6fG8jCAmqBdjgkIAiLIiIol7ZEo8
	Ns15uqpDzsqyzZpYQEx4hQgi7xTOUeHllwT1jFeOqmvoDcJkqg4mN/NAPN1oWQImuAfA
	CvKhvLq6TaQLmP33Q1mZOnZzg5GLSDtmcfPerU1ZTr/tZVLFToc09J65EjLZshA9W2jO
	1jcg29l4S//dWngNe/H77CdYEW7wbL9Hw9LHK/nFo/kIGis+gxY68EVrtbdBZOgQ7u03
	x3LHdMo4yv59HLtsMmgXyHfZRKHEQSv42Qsz5Z3LqfqjlM/oYl77HC1WOPRlOddU2cmg
	+7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Maiw/Pbm430QpTHQGE4Q6G3XahC441i3tKPyjXV6h3w=;
	b=AQQa4shA6/z61rDAFMBt23BNalFrK7p724NpqBlSc7vw0rubdDtQ+wFu6YXXxJzg6q
	OCAAt7kDAo23SDMFvAwAEBwD9vzHf6bB/KwkPlB1g2+jhkFVQnzTYyalni/TkB6DdRzh
	99LE9f/FMmxg3K5yoKEt6Jx7KLtz+08km0areQdeV9iDJSdic3zVkVpyogE9W9/FoRAr
	sfpEKxpFIvhgvVc6991FtT/iUrB+dARyIAQB3v42+LdUOAq64S0gjwnSSz+hOBdtiNg2
	Z7fn1IQk6IFQ76ZGE1yJ3MnrPMH0Zzbw5XIe5weBwL8AP+k/za/tYhR8JLFqaoU6B4KH
	yv8w==
X-Gm-Message-State: ALyK8tLftacTCj8EmUWG38kl4i81ujxif5N4yPFHoiT/6q+ceZ08lw7blWzv8oEbvnk+k1P+AVXd3EkdKoPOSdOo
X-Received: by 10.107.138.201 with SMTP id c70mr19642494ioj.148.1466412196513; 
	Mon, 20 Jun 2016 01:43:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Mon, 20 Jun 2016 01:42:57 -0700 (PDT)
In-Reply-To: <F31E8FA8-4286-4FEB-9CD7-FE323E3C6C8B@dominion.thruhere.net>
References: <1466087231-14928-1-git-send-email-jpardeiro@rapyuta-robotics.com>
	<F31E8FA8-4286-4FEB-9CD7-FE323E3C6C8B@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Jun 2016 09:42:57 +0100
Message-ID: <CAJTo0LY2pXeA=ssGB12Q+4S4CZio1W_Qr3ENTL1NrzGSCq8XLA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Jose Pardeiro <jpardeiro@rapyuta-robotics.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] The CMake recipes contain a mismatch between the environmental variable which defines where the Modules are installed and the location where they actually are. This patch fixes the environmental variable to point to the proper folder defined according to the cmake version.
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
X-List-Received-Date: Mon, 20 Jun 2016 08:43:17 -0000
Content-Type: multipart/alternative; boundary=001a113e8e6a115d970535b1b216

--001a113e8e6a115d970535b1b216
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 20 June 2016 at 08:04, Koen Kooi <koen@dominion.thruhere.net> wrote:

> And I can=E2=80=99t find the patch that was committed in the mailinglist =
folder
> locally, otherwise I would have responded to that.
>

The v2 is on the list.  I think it's mostly my fault that this got merged
due to bad branch practices.  It's been reverted in master.

Ross

--001a113e8e6a115d970535b1b216
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 June 2016 at 08:04, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:koen@dominion.thruhere.net" target=3D"_blank">koen@dominion.thruhere.net</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1xb" cla=
ss=3D"a3s aXjCH m1556ca0e7427546e">And I can=E2=80=99t find the patch that =
was committed in the mailinglist folder locally, otherwise I would have res=
ponded to that.<br></div></blockquote><div><br></div><div>The v2 is on the =
list.=C2=A0 I think it&#39;s mostly my fault that this got merged due to ba=
d branch practices.=C2=A0 It&#39;s been reverted in master.</div><div><br><=
/div><div>Ross=C2=A0</div></div><br></div></div>

--001a113e8e6a115d970535b1b216--
