Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 49484606D0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 11:27:49 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id s140so118738681qke.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 03:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=njdcu+eG8JBGJkwZ4P/3Ft/1Co8SXIxrgBwKogSDAfk=;
	b=PN0pQqsK4V19fIL2fgTF74dp4iGtU+1efR037lzVmV2n02oY0x39QpZsEKQGtuifvu
	BQpKOyKc8msdoRQcbKqgquLiwk8zC7oS6ZbgKFp9wfXyYILPiIODE40OMyYdei9CYuzS
	rxq/l0iaHTZKFtGG26ZbZXwRqoqL3tbverxm4ZsbXAbFgJS2jsl5ABLkT85MfoDhHj5V
	+MtBpVyf19T6KA7SmbMwNeVM63pYmoGCOHUTaNFhYGwTYF+SCImL/MANasjuvn9l92AK
	qv/B3BqEWSz6bWM5HraqZrnpsMAp+jygSoontrHeVncISsZGk8y8gj1YqH7fmKE5xlWX
	xFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=njdcu+eG8JBGJkwZ4P/3Ft/1Co8SXIxrgBwKogSDAfk=;
	b=YKKNp3bfYwIGDpxumXtQfH7MOzC9so9jFmdYOmUclDh0aaU6xhAMOydPKDiczqf7wF
	7Iq8WUKSlTaGfUhSxe51QNjRrryg8Av0KCGS6503KDiyCJ332l1n+aRD5UTTPsDCHfRa
	8wMwzbVFDxOe9n+FbvSrxPxb4fKQvh4JHQVdcbPtIP00yaW+iJcGnj/UM4N6Wt9qLbyN
	ZepmfhFz1mo6pq9IAIiUbukwZhRyomX7DlACnwgQKBgT8iC4WqQjGCqtOPw0hvZEB1p2
	as9U5pACbSKzQkhlPmegAccz6R0yHrcvBkyD6LjnbVIPrKFt51c8Dn9eoEtZOkd5joYc
	zZLA==
X-Gm-Message-State: AMke39k2KpDcTS2yVsZGlgfag17kO5uZ4Q4If0v901U2npAsnfl249CGkm3dUH16+ZQdoJ+xhERrXCaiwAIqgP9o
X-Received: by 10.55.31.24 with SMTP id f24mr18733996qkf.221.1486553269788;
	Wed, 08 Feb 2017 03:27:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 8 Feb 2017 03:27:29 -0800 (PST)
In-Reply-To: <5cdc7c7a-22fe-f5ad-3ff2-89f9e45cf6d1@windriver.com>
References: <cover.1486523726.git.hongxu.jia@windriver.com>
	<20170208033001.9309.89399@do.openembedded.org>
	<5cdc7c7a-22fe-f5ad-3ff2-89f9e45cf6d1@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Feb 2017 11:27:29 +0000
Message-ID: <CAJTo0LZVi93wqmrfYosGtCwT=osNeeUu0cExPDYCO7X0FQpR-A@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIDExIHBhY2thZ2VzIHVwZ3JhZGU=?=
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
X-List-Received-Date: Wed, 08 Feb 2017 11:27:51 -0000
Content-Type: multipart/alternative; boundary=001a1147e2ba9631fd05480327ed

--001a1147e2ba9631fd05480327ed
Content-Type: text/plain; charset=UTF-8

On 8 February 2017 at 05:31, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> The hurd_path.patch is cherry picked from debian which does
> not has "Upstream-Status: <status>" and "Signed-off-by", so I
> think we could ignore this warning.
>
> Here is the upstream source of debian patch:
> http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutil
> s_0.168-0.2.debian.tar.xz
>
> You may suggest to add it to SRC_URI rather than picking up manually,
> but debian frequently upgrades miner version "-0.2", and which does not
> sync up with upstream elfutils, that's why I manually cherry pick.
>

I still think the patches need SoB/US tags.

The bash patch I can grab from the git branch, patches with "interesting"
encodings don't always work over email.

Ross

--001a1147e2ba9631fd05480327ed
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 February 2017 at 05:31, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFF=
FFF" text=3D"#000000">The hurd_path.patch is cherry picked from debian whic=
h does<br>
    not has &quot;Upstream-Status: &lt;status&gt;&quot; and &quot;Signed-of=
f-by&quot;, so I<br>
    think we could ignore this warning.<br>
    <br>
    Here is the upstream source of debian patch:<br>
<a class=3D"m_3283128483417723209m_-8163783577227690470moz-txt-link-freetex=
t" href=3D"http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.=
168-0.2.debian.tar.xz" target=3D"_blank">http://ftp.de.debian.org/debia<wbr=
>n/pool/main/e/elfutils/elfutil<wbr>s_0.168-0.2.debian.tar.xz</a><br>
    <br>
    You may suggest to add it to SRC_URI rather than picking up
    manually,<br>
    but debian frequently upgrades miner version &quot;-0.2&quot;, and whic=
h does
    not<br>
    sync up with upstream elfutils, that&#39;s why I manually cherry pick.<=
/div></blockquote></div><br>I still think the patches need SoB/US tags.<br>=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">The b=
ash patch I can grab from the git branch, patches with &quot;interesting&qu=
ot; encodings don&#39;t always work over email.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147e2ba9631fd05480327ed--
