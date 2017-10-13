Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id DDFA671A74
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 09:08:49 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id l23so8808925lfk.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 02:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6ZdDuDUGPg2mhjO4eN4qWBpmnBcyIbUSrlE0828yM5Y=;
	b=DjXtqZ4/JF4RWSF/Z6W13g74dlyTOlBrppLEOUTfNR+rLr2qa4mktOSbQQBQA3nLZg
	z8nGSB9hcITSgfTQmpZ3rP74xgDVfnIv6TkGGvEWLbkR9ondfgwEdw0lMv8UXnvJExlI
	vYWsUyrsY4sjcvV3sltMYmDCrh4R4G+NdvE4opr4PAvJZwa8VBNpi6UqxP4bX3K0/OOy
	OUmW2mIPCRbVCZkzuApAAeWkgU2eVqXq5h5P69V4Ksdr107uRBx++tnwKu6eagk8/fb9
	8/cPcTvEevmhBo59SE1ZHSOEANyWUFSKQOIgUeH3N46+4/YauHokapA6XF4K3o5wJp6e
	aaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6ZdDuDUGPg2mhjO4eN4qWBpmnBcyIbUSrlE0828yM5Y=;
	b=s3kX1kNmw6G7BF9HyDP5+AmP73TixttWk7cWspL0VefIePL7CAn8/62/bb5OAdCrzo
	rNf+90WSIgspJctbshL55IZaIYZVrPCWWCn1BYDOQUwbEkD2S9MGoz4UMiDLJOwrCFy+
	NjaKfe9NRnSSlgNMEHY8mET/+Uz3mWyUegwqwrW8zCpWTyEshB4NQWhE/VtLrjYGMqc0
	RyqyJS2dc7FShJBo1Slqp5aQR9zOdmIj6uXxJAHbrBAtPt2sca9M25QDC2REJNdNZO3o
	iUrF1ovB0xRpSEx0EyzMR4Orwwd0fROWJGodncszXTADnmgzztNtovRVpopnTW/G+zjK
	ir7Q==
X-Gm-Message-State: AMCzsaXn3lftbUFRtqWkGuCwnlGj90udSGb2aMe9rv2iByYsKuFlPR5F
	tZxRcFL7mitwBUMFg6PjicLaEEklViU=
X-Google-Smtp-Source: ABhQp+QqHXtuOkYbQi5Ul7CTAjWwyqjf77XFJZ/ZLNUo6ZT70OS5oG//r/Spy9mcKuCNJ8OMEK3zTw==
X-Received: by 10.25.0.149 with SMTP id 143mr282081lfa.206.1507885730329;
	Fri, 13 Oct 2017 02:08:50 -0700 (PDT)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	k68sm126054lje.8.2017.10.13.02.08.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Oct 2017 02:08:49 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Oct 2017 11:08:31 +0200
Message-Id: <1507885712-31230-1-git-send-email-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <25961b50-eda5-5b7e-1bb0-01ef5c521d2e@northern.tech>
References: <25961b50-eda5-5b7e-1bb0-01ef5c521d2e@northern.tech>
Subject: Re: [PATCH v6] do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Fri, 13 Oct 2017 09:08:50 -0000

Rebased again.

Can we get this in please? It has been reviewed and rebased several times
already, and has lingered on the list for a long time.

Regards
Kristian Amlie

