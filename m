Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 75B9C6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:45:26 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id q21so551386842iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 06:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Wevf34rAY8nz7QKpoinGGQp9T+3h46HqJRxKqy8JW/8=;
	b=rpLRZIPZ9kgRLCvXzqgAko4Yx6g+nuAkf0X4/XDfkt6nHvX4HQKd8aDRJ/ELiAMHA8
	hYzjdFTblq8O/Xlr+5dsNZrAPz3ckapT4q5HzkYF65W0XLYeNqn8Y214LuY47aem0j5F
	fuLjiIEx5n3AJdqqphBjeCdJD6UHQZXD8N1tO7EZED/c54ULDujhoLoarojSJd9EoxIW
	RjuXcJY5Q1SSGJnGf+PU8mG2bpImpphSJdOfBj+WxSYs+czviyAk1NGSkEVeUaco3uBd
	Q1GbyCW+4kzLUgHSyKlvfY7dyVAXphOJmONkQ9ojOsEX53S+ISwOvHL17kerXRCh0HIa
	g8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Wevf34rAY8nz7QKpoinGGQp9T+3h46HqJRxKqy8JW/8=;
	b=kF09May3FOpcNqocrFqJ0WsNr+aLlV1G4GeuQ8ub6OKbdIQihXR4kSC+r03LI8RW/Y
	ddI2qIfsF5rfY3PJkBqBwpcSfiuHVp7G3qtnu6yCEpzSW5ZRT9UDMC6LJfpaj6Kzn1Vj
	3WG0bO1/AMAvc5nXvSJ8weeT19C+qrEiKYZIVWlhLkd5p+ETav01swVsm+TomjIsbzQm
	t5q+BcQolHD+s1sO2b3Z+djm6azLfpvdTVw1QgYYhHKNNtCUPw7j4mjiunRhoZSz7gY3
	BkVyWe79O3/Hwtdi1bvmvusk7Pr3+1jtZ7KKFGJqfLaQ9OBrzG56IxTSWcXIzKIKiKWV
	tUoQ==
X-Gm-Message-State: ALoCoQl9JuqHZCpPsGKMTReOYGBURX8jUjRMBu7bEp1fMjaa9VJPHAvb/A/F1Fp/mrX3VEhN4RBxcAD/pNxPq3o6h6N1lwhFJwuSAitA/0/kwhwRTuVRBcs=
X-Received: by 10.107.135.104 with SMTP id j101mr24995430iod.133.1453128326984;
	Mon, 18 Jan 2016 06:45:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 18 Jan 2016 06:45:07 -0800 (PST)
In-Reply-To: <5695B289.1030902@jp.fujitsu.com>
References: <5695B289.1030902@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jan 2016 14:45:07 +0000
Message-ID: <CAJTo0LYSVVHUXqgGE0v5u1g8HEVMns44DO7bAYw=MUJfVyMYRg@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Mon, 18 Jan 2016 14:45:26 -0000
Content-Type: multipart/alternative; boundary=001a113ebe92be4b5105299ccde2

--001a113ebe92be4b5105299ccde2
Content-Type: text/plain; charset=UTF-8

On 13 January 2016 at 02:12, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> So I want to replace foomatic-filters with cups-filters in
> packagegroup-core-lsb.bb file and replace the foomatic-filters.bb file
> with cups-filters.bb file.
>
> How do you think about it?
>

Sounds sensible, patches welcome!

Ross

--001a113ebe92be4b5105299ccde2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2016 at 02:12, Fan Xin <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:fan.xin@jp.fujitsu.com" target=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5qa" class=3D"a=
3s" style=3D"overflow:hidden">So I want to replace foomatic-filters with <s=
pan class=3D"il">cups</span>-filters in<br>
<a href=3D"http://packagegroup-core-lsb.bb" rel=3D"noreferrer" target=3D"_b=
lank">packagegroup-core-lsb.bb</a> file and replace the <a href=3D"http://f=
oomatic-filters.bb" rel=3D"noreferrer" target=3D"_blank">foomatic-filters.b=
b</a> file<br>
with <a href=3D"http://cups-filters.bb" rel=3D"noreferrer" target=3D"_blank=
"><span class=3D"il">cups</span>-filters.bb</a> file.<br>
<br>
How do you think about it?<br></div></blockquote></div><br>Sounds sensible,=
 patches welcome!</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--001a113ebe92be4b5105299ccde2--
