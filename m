Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id B852477E33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 13:57:52 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id 77so461545wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 06:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=NrIS0+UC03hyimhy+k67+KNIiMfF12ZH4e8ua4q7z2Y=;
	b=DawnzJQKsljg5OtvmxFySdob/rVFNpKLegJzi8cpMrz89ows+EBzDO5YRj1AVLo3vJ
	wm+yY+E6dlgUyCsCD2HV1iwJMk6/ZJFwOr+ThB5d/33gmJajWF/HH1GIOErxkRjZftQ8
	pOSc/VC462ls/nObM/b+2An92CBYNuxARELvUjfiBfv+2a6zmJ0IG9ABykhR6NcjuXpC
	3ZDMXMgTCay5zKOhKg6V/c32B6aTrEXJYRUdXYzzoluv+9a5TdvuOJnJZOzVTfKdjCDJ
	S5Po5CNc3Fihl222ASlMKuJ2FMKJMzdvTs7u8vXWR/YZHmNBcbSYdIiNBYYI5qzOraXA
	Z+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=NrIS0+UC03hyimhy+k67+KNIiMfF12ZH4e8ua4q7z2Y=;
	b=LdIhvIK0pB3xpyh3FagM0qZ225DnDwg5H+RTFsW53Z/XG9/xXQcfzZ5sqbeIpBXELg
	zSn6gYl8AKPqfOU9ifEB/azD7L/r2gxSJx1AGJoHeqwRGGlO9y9iQWboveVHR2/d0S8R
	YP1wClWzd420ei41DXxnZ5ZaCN8s4CGwfOwsqkss5bLKVYJaHP4I4Dz+8ghe3bEozAhs
	QijF70Q8sfNNscicM9AbJNeKkgTWgEybqknNiHI7sb48YBIIIAQxStz0tW056d/fxNBK
	ngrWteGOIgxWss+7sATSRZ7eI7/R7B9kptmLMDVMceSy36HA7BvjSRFe95fij71BSTuN
	izZQ==
X-Gm-Message-State: AIVw111R5+psZqDsL0f4fkcEe3v0LZ/W5m9CteyPVJAHlLtHoy/xvdSJ
	WJ7A+RnLpQWAe9Xn4ac=
X-Received: by 10.28.113.214 with SMTP id d83mr11738658wmi.62.1499781473110;
	Tue, 11 Jul 2017 06:57:53 -0700 (PDT)
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com.
	[209.85.128.177])
	by smtp.gmail.com with ESMTPSA id m26sm36296wrm.4.2017.07.11.06.57.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 06:57:51 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f177.google.com with SMTP id 77so459990wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 06:57:51 -0700 (PDT)
X-Received: by 10.28.195.67 with SMTP id t64mr11670080wmf.41.1499781470922;
	Tue, 11 Jul 2017 06:57:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.73.84 with HTTP; Tue, 11 Jul 2017 06:57:50 -0700 (PDT)
In-Reply-To: <CBAEED2EB06BF94889E80B47A33FE329ED9C42@PGSMSX105.gar.corp.intel.com>
References: <cover.1499294682.git.wei.tee.ng@intel.com>
	<ee38977370db92520a2e0d81e76189be3661f787.1499294682.git.wei.tee.ng@intel.com>
	<CAP9ODKrfpfKumQpxZgyr46yZtNk08q12WfNYM73E+sn96CTx=w@mail.gmail.com>
	<CBAEED2EB06BF94889E80B47A33FE329ED9C42@PGSMSX105.gar.corp.intel.com>
Date: Tue, 11 Jul 2017 10:57:50 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo0mk-jtwPngRHyXWQHHbsbmWa_ktfAgzv-p7k9_eN3Hw@mail.gmail.com>
Message-ID: <CAP9ODKo0mk-jtwPngRHyXWQHHbsbmWa_ktfAgzv-p7k9_eN3Hw@mail.gmail.com>
To: "Ng, Wei Tee" <wei.tee.ng@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH v3 2/2] initramfs-framwork: module to support boot live image
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
X-List-Received-Date: Tue, 11 Jul 2017 13:57:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 11, 2017 at 2:36 AM, Ng, Wei Tee <wei.tee.ng@intel.com> wrote:
> Yes, I had squash the changes into a single commit and corrected the typo also. The changes is being submitted to the mailing list.
> Thanks a lot!

There are bad indents yet; please double check it all.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

