Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id BADCC608BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:11:55 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb1so2895609pad.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=gdBPQxnDRKBqiSeZ4rhj5QQ7AJ3s1k9LBuH0tCKfQfA=;
	b=GKBMKfpvXpROuhVZ0/biTw5TqQzIem35m6tG/pzKNrJyBqsOfO89puP+sIT5ZcO1m1
	75wbDFZ/Z5xgey767qeDM2Nv8vA+fwp1CjvX95USwTEFbhjmwrrTWCF1j5Vu8BoUcQhO
	JqN1I1VvC/XvULdUxdvLV7rw37YrnrVHq4+ZMaeSqOTdry5J28xTsfrlbucTASejqkSs
	lupjS+Ws3wJSu11hjC81P9topkAwELilKWkrU4l5u4vcaluP6YZb5BDoyNC1ycsfFsoh
	TDBEM8DbMB7U5enpf5/jL+XtU4meY2vBQuIgQCCrpS+pqsaFYsguLhRKb33mrI34AhSK
	VHKg==
X-Received: by 10.68.2.69 with SMTP id 5mr6374740pbs.124.1372457517097;
	Fri, 28 Jun 2013 15:11:57 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id qe10sm9905990pbb.2.2013.06.28.15.11.55
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:11:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1372447427-31750-2-git-send-email-sgw@linux.intel.com>
Date: Fri, 28 Jun 2013 15:11:54 -0700
Message-Id: <876ACD34-26AC-4670-8AAD-2FC9E52CBC81@gmail.com>
References: <1372447427-31750-1-git-send-email-sgw@linux.intel.com>
	<1372447427-31750-2-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2 v2] security_flags: Add the compiler and linker flags that enhance security
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
X-List-Received-Date: Fri, 28 Jun 2013 22:11:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Jun 28, 2013, at 12:23 PM, Saul Wold <sgw@linux.intel.com> wrote:

> +# These 2 have text relco errors with the pie options enabled

typo

