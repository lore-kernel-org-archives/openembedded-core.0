Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 44D6B74EBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 13:50:18 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id y10-v6so25344494otg.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t/KQ/dRRLPsyokDCgokfsyF1GapVSmIHu3ddghbHOfQ=;
	b=DuJBCQFG71MIcBCxICUspxclJxVAkYLRoBai/LrLBhtl/kWcKSqfbyTtVSiu2z/gj7
	lU+PFprMPzuQ6eXApjoFdbxFKU1Zq6y7ipF7BHw70Ow+TO0RQmM4uiwHFh8PsvvRr2ws
	hLMfl8x5TiG6XA9k6Tj/UCLpv/dlqwEdgkiLnFh2dQn5GfijhVSWCgKL5QfjUnki3QP8
	FZgvvDuEgakrMwbFjiIBSYwwjDUxQvQ2P4Wj6j/GP+zPpXDl7mUA0QUJD5c5MGqzylkx
	xq7rATQBDvIxqI6N1nE5mNYYFypVfkMiA4wjjXMYir9812jlg/uB1syuHIUUQoD54O0F
	cPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t/KQ/dRRLPsyokDCgokfsyF1GapVSmIHu3ddghbHOfQ=;
	b=s46amhn3AxTNYClUbSzIM60a+lxAtmLPaHJY9eU9JkLNnwRuC5rRvHlTagj1+yomK4
	S7wkdrR2DGGmQqbsl0qfsEN8rrE15zIM8DHjPSOCOsMnkPr6bJkqSV/BVrSyVF8lRica
	aO0JExv+MKR1+RsDY3DjRi0CbXWvv2FJJsQMdWhZrG2rBUi/F49S6efa3CIQ2jlWN2n+
	HWRbkrih6MxXvZ69DsoyHutgT1FpIOZ0nqthz8cl9vfcL94OoX0IMpLYirRQIqBKkAYA
	aoI5f1Dt6o6dp1pxYOT8tQKK/XNqfoxPw/H2MTxiIFq3TQv3h9fVt1ZZFE1ZWob/kJn5
	49cQ==
X-Gm-Message-State: ALKqPwcNmBg5qGUb3v7CkHZJ0jj7EtO+1OTYS6BmOXOCt5TorwETUSvU
	FI2Vlvgb9WptfvJzFwK3i6UeNPIvVXZwIrCyWz8=
X-Google-Smtp-Source: ADUXVKIIQDDMtZ+lRpgKzlDJYxvq+OjKbY8+sQk3mBmcS6vYPSQf98ZxwITojqBskqeJoB/h04mM/kZME9q2lCNU5eE=
X-Received: by 2002:a9d:3023:: with SMTP id
	d32-v6mr4287238otc.23.1527774620104; 
	Thu, 31 May 2018 06:50:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Thu, 31 May 2018 06:50:19
	-0700 (PDT)
In-Reply-To: <7874302a34c726c1980006cfeb0850a755a99f12.1527755435.git.Qi.Chen@windriver.com>
References: <cover.1527755434.git.Qi.Chen@windriver.com>
	<7874302a34c726c1980006cfeb0850a755a99f12.1527755435.git.Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 31 May 2018 16:50:19 +0300
Message-ID: <CANNYZj_JiC4h8s7oqgrw_Faq-2K2Hm64Zy0ZjfdBvQCdWAB7cQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 13/14] testimage-auto.bbclass: execute the same codes as testimage task
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
X-List-Received-Date: Thu, 31 May 2018 13:50:19 -0000
Content-Type: text/plain; charset="UTF-8"

2018-05-31 11:45 GMT+03:00 Chen Qi <Qi.Chen@windriver.com>:
>  python do_testimage_auto() {
> +    testimage_sanity(d)
> +
> +    if (d.getVar('IMAGE_PKGTYPE') == 'rpm'
> +       and ('dnf' in d.getVar('TEST_SUITES') or 'auto' in d.getVar('TEST_SUITES'))):
> +        create_rpm_index(d)
> +
>      testimage_main(d)

Why not simply move these lines to testimage_main()? They might become
out of sync again in the future otherwise.

Alex

