Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1999F77352
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 14:35:38 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id ik10so41412582igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 06:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2a/Dbzp0U7zrQf8lR5f0JXdY7ZBhEemfb+CrzR12m6o=;
	b=BtroSjXZVSnipoER6j3KYGi+wbObO9BG8Pxp5LPv3wk3uk2icu+hOUJIKtlXcXGmIU
	Mja0YmaN1+IfFyBVJflTvQUxzcpP1+W26qnbhq8o0nB4OZzjJx04RvF8Iktq4Vq06uSc
	PEpTKI1xX2/e3iyhSBLcVlvVcRCAybEelZdTj+3ad1nuMQZ0tW3/VnlLMAZzLGXWQlAT
	RLD9SXufMBSv5c51sFL4tmLtnsML6VzV8ZSNrkzHvEUyOvk5VZyu3h46cO8vtJ5Mffds
	PnzOId5LOC3QjJc6i3mY2pugX1cNU5FNRdkSbh7mcgPt4hjH8kStm31BySJhSr7fOSh6
	4uPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2a/Dbzp0U7zrQf8lR5f0JXdY7ZBhEemfb+CrzR12m6o=;
	b=h5YooeSpvb5F2pAO93NxeR4d2FdGsPpCmwBtR0gqd9Avs6rg1Q9q4H2q+LqtV/Aht2
	mmMW1HXwzmkjbbgKNMOu8cise/5344TCNycdl5DZ7Cx7qJtmdXIZiOSTZ9Pg77xCeJ7i
	RmVD89wPQqe8FUcoCrlhQv8Dd8nbukNB3cESqT72AYcwteWXMoBWi7oNr95RyqoPbV3D
	5oIpzMS1R6I0eyQwuadyba2P+XVaZgMw0pRGUf+GrPaaAB/AnKbioj5Mk6dc24ySaZlm
	5MLlThiG6XlfvJzM8jRDKwb7/UQtzBNANxN5gbxOmhmq5DdXUf/4XGjP6L7u55BrLMJW
	fWoQ==
X-Gm-Message-State: AG10YORzqPt3LaCPPpaxo6K8Ze2PUFBVMcT8Fuq51HS9XFqcKIvq7anGrCjfC2+bRkRb+3Tq0BBoGX5sGXuQ9dvv
X-Received: by 10.50.41.38 with SMTP id c6mr9779802igl.64.1454682939612; Fri,
	05 Feb 2016 06:35:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 5 Feb 2016 06:35:20 -0800 (PST)
In-Reply-To: <1454679172.3210.10.camel@linux.intel.com>
References: <1454672856-13680-1-git-send-email-ross.burton@intel.com>
	<1454672856-13680-3-git-send-email-ross.burton@intel.com>
	<1454679172.3210.10.camel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Feb 2016 14:35:20 +0000
Message-ID: <CAJTo0LZu-B9M3t93OH7972TJZdyNVsV5f1nXuQvfX5iCs9nbvA@mail.gmail.com>
To: Joshua G Lock <joshua.g.lock@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] glib-2.0: use the system libpcre
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
X-List-Received-Date: Fri, 05 Feb 2016 14:35:39 -0000
Content-Type: multipart/alternative; boundary=089e0117689fe07e32052b06c3ab

--089e0117689fe07e32052b06c3ab
Content-Type: text/plain; charset=UTF-8

On 5 February 2016 at 13:32, Joshua G Lock <joshua.g.lock@linux.intel.com>
wrote:

> We could do with a convention for documenting this kind of trap (where
> a PACKAGECONFIG in foo requires one in bar).
>
> Maybe you could a comment here in this case?
>

Yeah fair point.  Comment added in my branch.

Ross

--089e0117689fe07e32052b06c3ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 February 2016 at 13:32, Joshua G Lock <span dir=3D"ltr">&lt;<a href=3D=
"mailto:joshua.g.lock@linux.intel.com" target=3D"_blank">joshua.g.lock@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":exf" class=3D"a3s" style=3D"overflow:hidden">We could do with a conven=
tion for documenting this kind of trap (where<br>
a PACKAGECONFIG in foo requires one in bar).=C2=A0<br>
<br>
Maybe you could a comment here in this case?</div></blockquote></div><br>Ye=
ah fair point.=C2=A0 Comment added in my branch.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e0117689fe07e32052b06c3ab--
