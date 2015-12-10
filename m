Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3F99B601D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 22:28:08 +0000 (UTC)
Received: by ioir85 with SMTP id r85so108447812ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 14:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Dspvd7g0EwsUaTX9wc4pNe344H2NOqLN2zwxcc7ahLA=;
	b=PlZHYTDtLGkEgeMEX94EU6RBzoKcaOynYahqU+l6rpBgzlJR/xDNf/GTsw3uY/SBeA
	k5gQE6fGW3a7g2HTiJ+H08CKChcL80CKG3lPWWnUdfQtkxETOrDo4qJAKYGt1dLZ4bBX
	9lAG9YM+yXbqmF7GiFPFv6sAGz2pe1zi1UlVW+IlduFuhMD7ccL2WujnUZzgSZAHXANy
	xoITknkVdfAwUdqNWZLn9oggboVeFjbJzb3mhJj0goRWhP5HECyyFs0JRMgKxyb68zjf
	Rk3tIz+JJiCFJQRjkp3VmQGsCH8iF4BOMvgUxffeq0WExjDI+JiV+r6NgqaebpMrm4/x
	RKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Dspvd7g0EwsUaTX9wc4pNe344H2NOqLN2zwxcc7ahLA=;
	b=jGV0hlUn9K3rCAE2046BEcQXtPA/aStTrZGWYLwC+PxTmCIh0a71tSJ5qKgNB10mK0
	iG9D5FC49ZhY5sHOGCY+OU/YJKBtsJsFhEJ+o1weOEScmqb1Y99iWApznr44CmYhv7uF
	uYJYcZIkpiH9pKJ30ercaSZCHg+QNIjkQOjn6iba4u24WdYkH6ncdcUM40/je401sZE4
	s+l2Pa0Na2D0zOe4uVKlnEJQYbKXkYlrNgo66d1URzE8NlPQRyAmqwmAwwhFh+PUiQUj
	8KkL5S7LHgErqqwdAL+UTBkBDMhYdc2oOunASeL08cxwfrdfkMP98dbxbBCMaLv2bsfb
	YwgQ==
X-Gm-Message-State: ALoCoQl8c03SkV7Zp9T6vu0uq95O0qFh2P2cBIDH3ue1YAtupAhMEfHszKeeQuCmuzeWD+F2YG2ACqPf+qDRpYCLo/MNF+QyS1Qev7E3RujTnQM3LFp7L5Q=
X-Received: by 10.107.130.155 with SMTP id m27mr15389743ioi.133.1449786488867; 
	Thu, 10 Dec 2015 14:28:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 10 Dec 2015 14:27:49 -0800 (PST)
In-Reply-To: <eabd8b5e8f190284202546c171b0893fe39cc3a6.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
	<eabd8b5e8f190284202546c171b0893fe39cc3a6.1449671297.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Dec 2015 22:27:49 +0000
Message-ID: <CAJTo0Lb9EU6anFAP8OaFgzrMuMnBCpcxxpxLE3hy3=WSvXRO9Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/10] gnutls: update to 3.4.7
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
X-List-Received-Date: Thu, 10 Dec 2015 22:28:09 -0000
Content-Type: multipart/alternative; boundary=001a113ecd94ab5e76052692b851

--001a113ecd94ab5e76052692b851
Content-Type: text/plain; charset=UTF-8

On 9 December 2015 at 14:40, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> libidn is needed by the new version to compare hostnames.
> Openssl compatibility is no longer enabled by default, but is
> required by other packages in oe-core.
>

ERROR: Nothing PROVIDES 'nativesdk-libidn' (but
virtual:nativesdk:/home/ross/Yocto/poky/meta/recipes-support/gnutls/
gnutls_3.4.7.bb DEPENDS on or otherwise requires it). Close matches:

Can you enable and test the native and nativesdk forms of libidn (set
BBCLASSEXTEND, check stuff builds as expected) as this breaks the building
of wget-native and nativesdk-wget (the latter is part of the buildtools
tarball, so is a blocker).

Ross

--001a113ecd94ab5e76052692b851
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 December 2015 at 14:40, Alexander Kanavin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.=
kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D":17i" class=3D"" style=3D"overflow:hidden">libidn is needed by the new =
version to compare hostnames.<br>
Openssl compatibility is no longer enabled by default, but is<br>
required by other packages in oe-core.</div></blockquote></div><br>ERROR: N=
othing PROVIDES &#39;nativesdk-libidn&#39; (but virtual:nativesdk:/home/ros=
s/Yocto/poky/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.4.7.bb"=
>gnutls_3.4.7.bb</a> DEPENDS on or otherwise requires it). Close matches:<b=
r></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Can=
 you enable and test the native and nativesdk forms of libidn (set BBCLASSE=
XTEND, check stuff builds as expected) as this breaks the building of wget-=
native and nativesdk-wget (the latter is part of the buildtools tarball, so=
 is a blocker).</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a113ecd94ab5e76052692b851--
