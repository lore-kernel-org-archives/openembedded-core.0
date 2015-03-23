Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8BCB66AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 17:00:13 +0000 (UTC)
Received: by qgep97 with SMTP id p97so23710312qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 10:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0J3mWM6NxJzAd4j8rgFBkzOqvq5rfGebKOWQAF30Xug=;
	b=HAMLkScSp2iJ4NKn4nbMI84sETagYRMgwmg9GEifA7e/Lpp7VEpQCDkrfVFz2NtVXt
	KS50sHXwWwGbwEwFv0PH9zhX8HO1LLZLF6/LKaDqIhXjl9aLT7+V+SQgPFro9F1kTPKt
	rxkg9OqmdxB5HE6D7ldFC5EIjRzh+Oaw1OjsKSWzqbo2M2hR3vBzBg2RkgxVVb1wKfhI
	09tnecGJEHvMBNFKVKNPXixxTmIFh6xp9JHFA+GsjMVspl7SHKfOKBi1c/n/qAsdXg79
	IYvB/8fVWMJxS2ZVrQVWLzSuPb3hZP0c/HEEKiwYkTfV7+nGsT8Qz93dKgFy3diLKOCN
	1C4w==
X-Gm-Message-State: ALoCoQktRDW3lrMfwBz3yebG8ihST5NlhWqRYHrrH3Oe0JtlhxOhyjBr83hwJlPAxDJT15L7/GzT
X-Received: by 10.229.96.194 with SMTP id i2mr256025qcn.1.1427130014485; Mon,
	23 Mar 2015 10:00:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 23 Mar 2015 09:59:54 -0700 (PDT)
In-Reply-To: <20150323164335.GB3904@jama>
References: <20150323112736.11E9B50553@opal.openembedded.org>
	<20150323164335.GB3904@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Mar 2015 18:59:54 +0200
Message-ID: <CAJTo0LbcOkfGgxLyG1kNJOpxyfOveLToO+cdSwXbEafAYFQ4xg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Jonathan Liu : systemd: fix firmware path to match linux-firmware
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
X-List-Received-Date: Mon, 23 Mar 2015 17:00:15 -0000
Content-Type: multipart/alternative; boundary=001a1133b6b48fe8e40511f799da

--001a1133b6b48fe8e40511f799da
Content-Type: text/plain; charset=UTF-8

On 23 March 2015 at 18:43, Martin Jansa <martin.jansa@gmail.com> wrote:

> WARNING: QA Issue: systemd: configure was passed unrecognised options:
> --with-firmware-path [unknown-configure-option]
>

I for one don't see that.  Do you happen to have that build to hand still?
Actually seeing log.do_configure would be useful.

Ross

--001a1133b6b48fe8e40511f799da
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 March 2015 at 18:43, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":48e" class=
=3D"a3s" style=3D"overflow:hidden">WARNING: QA Issue: systemd: configure wa=
s passed unrecognised options: --with-firmware-path [unknown-configure-opti=
on]<br></div></blockquote></div><br>I for one don&#39;t see that.=C2=A0 Do =
you happen to have that build to hand still?=C2=A0 Actually seeing log.do_c=
onfigure would be useful.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a1133b6b48fe8e40511f799da--
