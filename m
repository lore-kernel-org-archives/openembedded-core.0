Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id ED06C6E593
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:13:12 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id v10so3603646qac.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 09:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OBa7BobqeoWDigpv8KjoI53+vAbVyus5GU/jbJYlLq4=;
	b=On3BiSl7Zv9g0m9CFa9wAFeE8Ul7QAP+8B1IYBzb0rW54F4DMokGymylDadxtsO6/R
	AWAdyMXkIgB0w7QJSa9x89vwpMFg7gvz6cqkPOdVq1IjUMWebQ2GbGz9o8eXfsdUxoqq
	AAD8PT54hOEUQMSG66lXSP+7wkT1zgBQrJ3cyDBCuB13KSWQarnf4gyTcBf+aGAiuz4K
	SrbXF5S/l9lkhmt/T3lOsyrf57RRxp2ri/dkkFQ0ROa4sq/W9+wl1DR45we3jvPhAEQz
	I5n+wr6rLKVv/m+qHbYCeOhWoyQilQ+Hxj7WAS7oYEVVMngsbnFjmaAC0TF+E1f4x+jc
	xprg==
X-Gm-Message-State: ALoCoQme/uuchLc6ngwx03v18QTnk4KfyxnXPu1rPTRe9gbuNqrLufuUuxPlrmcDqXa+9WmQvhC2
X-Received: by 10.224.171.67 with SMTP id g3mr48390572qaz.17.1423588394114;
	Tue, 10 Feb 2015 09:13:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 10 Feb 2015 09:12:53 -0800 (PST)
In-Reply-To: <20150210170921.GD14949@denix.org>
References: <1423584126-27786-1-git-send-email-denis@denix.org>
	<CAJTo0LZHiTSkhv9YPobmssY_szH4jyzBeUXVyZnnTGYo5oAf4Q@mail.gmail.com>
	<CAP9ODKogEuxRj0QoO-t5S3svVq9gYUjceBg5LfBrXS8k54US_w@mail.gmail.com>
	<20150210162902.GC14949@denix.org>
	<CAJTo0LbFdzSv3V7vwPj0hQrE70JRu=GGh=6qzJgxrXOwobKHeg@mail.gmail.com>
	<CAJTo0LY-Jg4kTPiGZfhHFECy2KFWQ7+5dq8jAMcn+NHZBC=R5Q@mail.gmail.com>
	<20150210170921.GD14949@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Feb 2015 17:12:53 +0000
Message-ID: <CAJTo0LZSM4B5HLRh-FQOdf7hRcRb8TnpcFkK7+cRu_o43o3d=g@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH v2] u-boot: update to version 2015.01
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
X-List-Received-Date: Tue, 10 Feb 2015 17:13:16 -0000
Content-Type: multipart/alternative; boundary=047d7b67768889d052050ebf00e2

--047d7b67768889d052050ebf00e2
Content-Type: text/plain; charset=UTF-8

Hi Denys,

On 10 February 2015 at 17:09, Denys Dmytriyenko <denis@denix.org> wrote:

> D'oh! I should have dug dipper and notice the native sysroot is not being
> used... Thanks, I'll send a fixed patch shortly.
>

Fresh eyes and all that. :)  Can you add V=1 to EXTRA_OEMAKE so this sort
of thing is easier to debug in the future?

Cheers,
Ross

--047d7b67768889d052050ebf00e2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Denys,</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On 10 February 2015 at 17:09, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5ii" class=3D"a3s"=
 style=3D"overflow:hidden">D&#39;oh! I should have dug dipper and notice th=
e native sysroot is not being<br>
used... Thanks, I&#39;ll send a fixed patch shortly.</div></blockquote><div=
><br></div><div>Fresh eyes and all that. :) =C2=A0Can you add V=3D1 to EXTR=
A_OEMAKE so this sort of thing is easier to debug in the future?</div><div>=
<br></div><div>Cheers,</div><div>Ross</div></div></div></div>

--047d7b67768889d052050ebf00e2--
