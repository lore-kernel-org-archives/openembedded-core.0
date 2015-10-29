Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id E32E275D4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 07:32:16 +0000 (UTC)
Received: by qgbb65 with SMTP id b65so27316849qgb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 00:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cRhx7844khOTjWRZTPpxZAgnMay93yUOOvbXaXu7N6A=;
	b=BcMgoWQPpMxM0H7mbklskhIh3Rj4KjTKsFxcRU+xoFGuTJ9XEN7JI7Q5wYTXCkvWvV
	jnFuh3OG/ZVAErUYGGLN6TWDCEy/L7JWmyxtT6aR762H81iH6rO2vISnTexPIl6q+Uya
	mLV029vcCfhdv9rPV8oRbPf0wqdEKEh7/fiahQalYmyQ1f9SfIseP1W0wkfPUVBgJUf6
	PqKAWSReIOLJBGqA6taQWQoNKcecAe/nVdcBxY6AtPyxb9oH5yJ8KyeGIQb6j7G2MDfI
	Y9n3zwPC+GmNRBKQWqouzBSuI3lcf1isPwcKocwJ0RZyKUqlv1M9d5rA2ZE0EaSiit5D
	qGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cRhx7844khOTjWRZTPpxZAgnMay93yUOOvbXaXu7N6A=;
	b=dADVhf8isMP59GModX8D1Zxxyae08wWYaFRMGI5xrXCSnHRB/9O5FrEEq51j/1vlPn
	+FqAhaulR3XomYItpivUf6OBW7ojfHxMPNYVKLpdtve/OqpVjAAhoBIr2wBE9VQdxZVw
	5UN4VtAA9LBHS5dvSFFFxSjp98/croj86sqB5sGbsC4lL1nGneC/6ssIdenGuT1OJcAg
	+fIiR3STlPj50Jc7vC5jwmHjPk5lVZdEZFjRX67Zor2FOlYJiJhn/5jJTl2Tt90FoK+0
	saZxCdIp3OvtZEgEdMxKY/Jn0k7boO1kblGoKXen5VljGAp/VHKCI3FeaE7Ur5TuC8qp
	piIQ==
X-Gm-Message-State: ALoCoQn6+EiCKOt5sG2gOqF26Nppvxvxjjd0BXn+1yRN7QXzvftcZqjtYZ2XqkHzoSkFAkwgje11
X-Received: by 10.141.28.76 with SMTP id f73mr293982qhe.17.1446103936617; Thu,
	29 Oct 2015 00:32:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Thu, 29 Oct 2015 00:31:57 -0700 (PDT)
In-Reply-To: <611CD789-ACC1-47CE-9503-2C40F26E4BB1@gmail.com>
References: <C5B806CA-2384-4924-8FA7-8BC6F146416A@gmail.com>
	<611CD789-ACC1-47CE-9503-2C40F26E4BB1@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Oct 2015 07:31:57 +0000
Message-ID: <CAJTo0LY-DAxN5+wbgkOv0TsVHUWfPtJ_yJN8cBdxCx5NP5UOJg@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] perl: fix Perl5 module builds
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
X-List-Received-Date: Thu, 29 Oct 2015 07:32:20 -0000
Content-Type: multipart/alternative; boundary=001a11423d0c7366750523394fcf

--001a11423d0c7366750523394fcf
Content-Type: text/plain; charset=UTF-8

On 28 October 2015 at 10:26, Jens Rehsack <rehsack@gmail.com> wrote:

> Since it's two weeks ago since submitted and this patch series fixes
> several problems how yocto deals with perl module distributions, I'd like
> to get a more concrete explanation why an infrastructure fix isn't
> validated during feature freeze for branching.
>
> None of the three patches adds a feature, they all fix broken
> infrastructure of perl module handling in Yocto which should better now
> validated than after branching.
> Since after freeze the master branch might become unstable for a while, I
> might not be able to re-submit.
>

These patches are in the current build under consideration for merging in
time for the Jethro release.  Sorry for the lack of feedback on them, this
release has been cursed with autobuilder stability problems which have
taken up a lot of our time.

Ross

--001a11423d0c7366750523394fcf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 October 2015 at 10:26, Jens Rehsack <span dir=3D"ltr">&lt;<a href=3D"=
mailto:rehsack@gmail.com" target=3D"_blank">rehsack@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":343" class=3D"a3s" s=
tyle=3D"overflow:hidden">Since it&#39;s two weeks ago since submitted and t=
his patch series fixes several problems how yocto deals with perl module di=
stributions, I&#39;d like to get a more concrete explanation why an infrast=
ructure fix isn&#39;t validated during feature freeze for branching.<br>
<br>
None of the three patches adds a feature, they all fix broken infrastructur=
e of perl module handling in Yocto which should better now validated than a=
fter branching.<br>
Since after freeze the master branch might become unstable for a while, I m=
ight not be able to re-submit.</div></blockquote></div><div class=3D"gmail_=
extra"><br></div>These patches are in the current build under consideration=
 for merging in time for the Jethro release.=C2=A0 Sorry for the lack of fe=
edback on them, this release has been cursed with autobuilder stability pro=
blems which have taken up a lot of our time.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11423d0c7366750523394fcf--
