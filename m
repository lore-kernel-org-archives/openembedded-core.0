Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3951260034
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 12:13:11 +0000 (UTC)
Received: by qkcl124 with SMTP id l124so53723860qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Nov 2015 04:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=tJzdBUsEHgs6FJumgnt9ewj2B9gxTfuR0WsfHvShJvY=;
	b=I84eIuFX+QLmsdafnYuYq3oUTpv6L0s9l+3sPjcFpQMtjfmmLBU6DDa7CKrIbYciN1
	wAkkxILN7hBnPkiW8zq1JH13ygYAPPMOkTXK1d8n2UFAFZ4Dbt0sEaJZCffpDeg+IL51
	xGYQxWCijW32dEUzUZImmYuxiyZkB1NREdrSRz2B8HlWI7KGkMgRKc6U+PzOTxqUv26+
	FtajQNzXBNK7cHi3BdjTlMEwXfpq25LYv+mfNn5mJMFamlUccPb3S6/yxAteKUPdCrXc
	BswnVvD73QdTJ7Sr8r0cT2MGzoR3NjVop5iIwcy5MuuQcgVeS26OdzZMcQecvQX3qdf/
	qJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tJzdBUsEHgs6FJumgnt9ewj2B9gxTfuR0WsfHvShJvY=;
	b=JN+xn5DT3uhf9l7bonD5FqHbLRFZMP9VLrE33okgmLMWKrCnt8VaxPdEfbn+crOAEb
	vclZtHffGI0/5X/KsxwXmx4rIXR9COGeczIkz+++QMsY1SXPb+tge241N25G154uboVs
	znQ1NhoWfM3GIUMgZfSKibjy/spYlcXSeHC6QSVGSmjyuvDk0OV+lOxKxPQhDtlp2uhi
	qH2VGT2v4zNQXBj7taZItnLSaEL9QXhvz+EUaV1ZegoAAQNMdbfQLBzGEXRn8y2gMX2Z
	lQibHUjJmSYTs2WymrXXiHYivPOJmkGwnyjAlVy9PYig8NqLz70orpnskDRORFaa1RUu
	PwJw==
X-Gm-Message-State: ALoCoQkRpSGLBhp9IFVQTntEv9mqCNEcaHiMjd/+oXm+JQHeHk+NXsCC6uLSplUamzQiwnMHxgcR
X-Received: by 10.55.72.70 with SMTP id v67mr28424981qka.83.1446466391902;
	Mon, 02 Nov 2015 04:13:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Mon, 2 Nov 2015 04:12:52 -0800 (PST)
In-Reply-To: <1446197957-20485-1-git-send-email-maxin.john@intel.com>
References: <1446197957-20485-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Nov 2015 12:12:52 +0000
Message-ID: <CAJTo0LZ64XfEPFS+Z1ibASPUDnGUC2XV-hp+2uKBdkj6fzjeqw@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: fix ptest output format
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
X-List-Received-Date: Mon, 02 Nov 2015 12:13:14 -0000
Content-Type: multipart/alternative; boundary=001a114a97f67822f705238db320

--001a114a97f67822f705238db320
Content-Type: text/plain; charset=UTF-8

On 30 October 2015 at 09:39, Maxin B. John <maxin.john@intel.com> wrote:

> +gnome-desktop-testing-runner glib | sed 's/FAILED/FAIL/g'
>

Don't all upstreams using the GLib test framework emit FAILED, or is this
really specific to glib?

Ross

--001a114a97f67822f705238db320
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 October 2015 at 09:39, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":141" class=3D=
"a3s" style=3D"overflow:hidden">+gnome-desktop-testing-runner glib | sed &#=
39;s/FAILED/FAIL/g&#39;</div></blockquote><div><br></div><div>Don&#39;t all=
 upstreams using the GLib test framework emit FAILED, or is this really spe=
cific to glib?</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a114a97f67822f705238db320--
