Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9C70B7DEB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:44:16 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id z65so5856026oia.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HPQ0FGiIif7JXAM1lk/OuT2uSzqFaWPOy6NX/YSSHtM=;
	b=ZWB3GKHVQtbZc1I7H8jd84SNydZDzrXwB+8uudUWpgAogQzv3xEsAIU4DMRpRMaBOg
	EL3PwG/KOC6yeN4TxLqc1wezI/bw0BPjY2y6KOR4rkDoN/qUi1NzKk+8iHxSuKtJvFeB
	MMGEzZ52cjZhLdiftjUUtZ/UQC2V7QqaoPdw+PpGhd+yRe4K918pjvc7j7d0csPVS/oo
	qSP3jRut0I/nV3i1eE+joQ9B6A0KJ+lDFk2ADWPQ3Nz+3ZPJY59phHgCRee7QuEHjyvy
	AmMS4F3wLHdtp4zckmajiboc+Cpv+d8ocIAiPKkeF/9fLIZ4lMhx+R150/pX0au8V434
	oaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HPQ0FGiIif7JXAM1lk/OuT2uSzqFaWPOy6NX/YSSHtM=;
	b=VPmqvOZncXnjHqGkBq34Qf+yJBfLbJ5rTiaaT76MSw7wxTYJxzIVOW6b+OsxJYA3nm
	rHHfOR9SP8/rfWSwM0Tc2HPprTcctOV6AcQ8ndHTjn2LJsPhv+azHEtOBKdxK4Ej7FxF
	RJTO0F2e5QMb6OIXIaHERTrURGr5XERwKk1Vxhbism0hwJVNdnFYKMoO05441cMGczi4
	l326ZLnd6AYVVwDHG/ZyeROZOOX+uF4lJIZJfEIiTxP/HiU+ymWPhL3tKe40wj0Jt8OZ
	kc0GWfdQqQ4oB9rHzD1vOZbRX2CxHQ66Ewmi7RM55y5XzWPqvJAFOTNIKG3fU/wZJvs6
	JCBQ==
X-Gm-Message-State: APjAAAVFZL1O3Z7PMkM/FtQ8xj1kw/j0/BGHEUsv9bDlOViQIOWVQOJk
	Gt8PadSRk4yKGKEGW0ivfl6sJISWq8lU2A/7655b/Q==
X-Google-Smtp-Source: APXvYqz6N1YVsL3BUNVpRGQVNC5BFMid866P8StbCRDWjyx3+iBaylNdasIpZo1IIPAuo2sNlZqdW0th22jcnHS1r6I=
X-Received: by 2002:aca:c450:: with SMTP id u77mr3368795oif.119.1558118657611; 
	Fri, 17 May 2019 11:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
	<20190517181151.44001-12-alex.kanavin@gmail.com>
	<6bf67e9f-d806-5d06-a455-44211956df94@gmail.com>
In-Reply-To: <6bf67e9f-d806-5d06-a455-44211956df94@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 May 2019 20:44:06 +0200
Message-ID: <CANNYZj8Yb9Da6y_S2mdvvVM4XsCw7wB-cmWu2Fis7C4EqExjHA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/37] systemtap: upgrade 4.0 -> 4.1
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
X-List-Received-Date: Fri, 17 May 2019 18:44:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 May 2019 at 20:29, akuster808 <akuster808@gmail.com> wrote:
> On 5/17/19 11:11 AM, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
> was stap.py test run?

I assume the autobuilder will take care of this. For this batch I only
checked that things build, otherwise it'd be just too much time to
verify each update at runtime.

Alex

