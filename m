Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id D2E8A71144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 11:44:45 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id z107so12529767qgd.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 03:44:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Jvgjc5/Qrlfmn8Oee0LY2Fg5sZ+55AQAi9wepV+XsjI=;
	b=Rwhjwx4+cKpyjF0g7cn7PsXRC98z22NKb7ZBXyQvGgntbMJBl3aIyY/D0Z3PdQRjm5
	Lqpvlj86pBBHGyQLtH5rwsT1ZD8vVQhKXs/0ZzuXtdK9XwCW7yFinuQ7LhPxObbR90+F
	h4F5uxz1qb5uU1xTmnrHL+29c/yN8RfOX0WUJ/XHYorHWiB4+mHzd+DrrEc65MER69xy
	t3BN0qApDCA/2Wxj4kzLWw2iDYvanwyQ/ixR32cUpa908LZ8wpMQx22OiJHA6hRtjuQL
	MP8JZec+gGWySiDoeGJB+Y0VvPj/4++qfmKTXSDkY9NuJznl02/HrzfDvFIAzvUeidhq
	t2lA==
X-Gm-Message-State: ALoCoQmcu4q33UxF8H4pXre6AUeOKS8J3KxaaKcdn+8/PTgqScr1AR3/PoWKptVHNuXgOk3ndcbK
X-Received: by 10.224.92.205 with SMTP id s13mr67174102qam.52.1421840685801;
	Wed, 21 Jan 2015 03:44:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 21 Jan 2015 03:44:25 -0800 (PST)
In-Reply-To: <54B4B8D7.5000807@windriver.com>
References: <9423a082fd3623a6b8e59611853bfaa966b9afb4.1421127484.git.hongxu.jia@windriver.com>
	<63701c385b5a6033a7d82be5c16b4ea6fb6eba87.1421127485.git.hongxu.jia@windriver.com>
	<54B4B8D7.5000807@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Jan 2015 11:44:25 +0000
Message-ID: <CAJTo0LbQTXRfJdBcsSk3gPagyLMm8TCN+m4Qw5wA84C7pjT+eQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 01/10] libxml-parser-perl: upgrade to 2.43
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
X-List-Received-Date: Wed, 21 Jan 2015 11:44:46 -0000
Content-Type: multipart/alternative; boundary=089e015375e4013571050d281533

--089e015375e4013571050d281533
Content-Type: text/plain; charset=UTF-8

On 13 January 2015 at 06:19, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> --- a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
>> +++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.43.bb
>
>
2.43 doesn't exist anymore, can you update and test 2.44?

Cheers,
Ross

--089e015375e4013571050d281533
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2015 at 06:19, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">--- a/meta/recipes-devtools/perl/<a href=3D"http://libxml-parser=
-perl_2.41.bb" target=3D"_blank">l<u></u>ibxml-parser-perl_2.41.bb</a><br>
+++ b/meta/recipes-devtools/perl/<a href=3D"http://libxml-parser-perl_2.43.=
bb" target=3D"_blank">l<u></u>ibxml-parser-perl_2.43.bb</a></blockquote></b=
lockquote></div><br>2.43 doesn&#39;t exist anymore, can you update and test=
 2.44?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Cheers,</div><div class=3D"gmail_extra">Ross</div></div>

--089e015375e4013571050d281533--
